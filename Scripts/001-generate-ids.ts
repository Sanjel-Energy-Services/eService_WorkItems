import { existsSync, readdirSync, statSync } from 'fs';
import { join, extname, dirname, basename, relative, sep } from 'path';
import {
	readText,
	writeFileAtomic } from './000-util';

// 特殊文件名与固定顺序索引（两位编号）
const SPECIAL_FILE_INDEX: Readonly<Record<string, number>> = {
	'instructions.md': 1,
	'process.md': 2,
	'collaboration.md': 3,
};

// 需要排除生成ID的文件与目录
const EXCLUDED_FILES: Readonly<Set<string>> = new Set<string>(['main.md']);
const EXCLUDED_DIRS: Readonly<Set<string>> = new Set<string>(['Artifacts']);

/**
 * 递归获取目录中所有markdown文件
 */
function getAllMarkdownFiles(dir: string): string[] {
	const results: string[] = [];
	const entries = readdirSync(dir);

	for (const entry of entries) {
		const entryPath = join(dir, entry);
		const stat = statSync(entryPath);

		if (stat.isDirectory()) {
			if (EXCLUDED_DIRS.has(entry)) continue;
			results.push(...getAllMarkdownFiles(entryPath));
		} else if (extname(entry).toLowerCase() === '.md') {
			if (EXCLUDED_FILES.has(entry)) continue;
			results.push(entryPath);
		}
	}

	return results;
}

/**
 * 提取目录名中的编号
 */
function getDirectoryCode(dirName: string): string {
	const dashIndex = dirName.indexOf('-');
	if (dashIndex !== -1) {
		const beforeDash = dirName.substring(0, dashIndex).replace(/\s+/g, '');
		return beforeDash.length > 0 ? beforeDash : '00';
	}
	// 无 "-"，使用首字母（去除前导空格）
	const trimmed = dirName.trim();
	if (trimmed.length > 0) {
		return trimmed[0].toUpperCase();
	}
	return '00';
}

function sortLex(a: string, b: string): number {
	return a.localeCompare(b);
}

/**
 * 为特定目录生成文件索引映射
 */
function generateFileIndexMap(dir: string): Map<string, number> {
	const fileIndexMap = new Map<string, number>();
	const files = readdirSync(dir)
		.filter((file: string) => extname(file).toLowerCase() === '.md')
		.filter((file: string) => !EXCLUDED_FILES.has(file))
		.sort(sortLex);

	// 固定顺序：01, 02, 03
	for (const [name, fixedIndex] of Object.entries(SPECIAL_FILE_INDEX)) {
		if (files.includes(name)) {
			fileIndexMap.set(name, fixedIndex);
		}
	}

	// 其他文件从 04 开始
	let idx = 4;
	for (const file of files) {
		if (!(file in SPECIAL_FILE_INDEX)) {
			fileIndexMap.set(file, idx);
			idx += 1;
		}
	}

	return fileIndexMap;
}

function getBaseNameWithoutExt(fileName: string): string {
	const base = basename(fileName, extname(fileName));
	return base;
}

function isLetterOrDigit(ch: string): boolean {
	return /[\p{L}\p{N}]/u.test(ch);
}

function buildUniquePrefixes(dir: string): Map<string, string> {
	const files = readdirSync(dir)
		.filter((file: string) => extname(file).toLowerCase() === '.md')
		.filter((file: string) => !EXCLUDED_FILES.has(file))
		.sort(sortLex);

	const used: Set<string> = new Set<string>();
	const result: Map<string, string> = new Map<string, string>();

	for (const file of files) {
		const base = getBaseNameWithoutExt(file).replace(/\s+/g, '');
		let prefixLen = 1;
		let candidate = '';
		if (base.length === 0) {
			candidate = 'X';
		} else {
			// 取首个有效字符开始递增长度
			const normalized = base;
			while (prefixLen <= normalized.length) {
				const raw = normalized.substring(0, prefixLen);
				// 规范化前缀：保留字母数字，转大写
				const cleaned = Array.from(raw)
					.filter(isLetterOrDigit)
					.join('')
					.toUpperCase();
				candidate = cleaned.length > 0 ? cleaned : raw.toUpperCase();
				if (!used.has(candidate.toLowerCase())) break;
				prefixLen += 1;
			}
			if (prefixLen > normalized.length) {
				// 若全部占用，追加数字序以避免冲突
				let suffix = 1;
				let temp = (candidate || normalized.toUpperCase()) + String(suffix);
				while (used.has(temp.toLowerCase())) {
					suffix += 1;
					temp = (candidate || normalized.toUpperCase()) + String(suffix);
				}
				candidate = temp;
			}
		}
		used.add(candidate.toLowerCase());
		result.set(file, candidate);
	}

	return result;
}

/**
 * 生成完整的ID标识
 */
function generateIdentifier(filePath: string): string {
	const rel = relative('Documents', filePath);
	const parts = rel.split(sep);
	const fileName = parts.pop() as string;
	const dirParts = parts;

	const fileDir = dirname(filePath);
	const indexMap = generateFileIndexMap(fileDir);
	const prefixMap = buildUniquePrefixes(fileDir);

	const fileIndex = indexMap.get(fileName);
	const filePrefix = prefixMap.get(fileName);
	if (fileIndex === undefined || filePrefix === undefined) {
		throw new Error(`无法为文件 ${fileName} 生成索引或前缀`);
	}

	const idParts: string[] = [];
	idParts.push(filePrefix);
	for (const dir of dirParts) {
		idParts.push(getDirectoryCode(dir));
	}
	idParts.push(String(fileIndex).padStart(2, '0'));

	return idParts.join('-');
}

/**
 * 为文件添加或更新ID标识
 */
function processIdentifierInFile(filePath: string): void {
	const name = basename(filePath);
	if (EXCLUDED_FILES.has(name)) {
		return; // 跳过 main.md
	}
	try {
		let content = readText(filePath);

		const identifier = generateIdentifier(filePath);
		const identifierComment = `<!-- Identifier: ${identifier} -->\n`;

		const reg = /^<!--\s*Identifier:\s*.*?-->\s*\n?/i;
		if (reg.test(content)) {
			content = content.replace(reg, identifierComment);
			console.log(`更新ID ${identifier} -> ${filePath}`);
		} else {
			content = identifierComment + content;
			console.log(`添加ID ${identifier} -> ${filePath}`);
		}

		writeFileAtomic(filePath, content);
	} catch (error) {
		console.error(`处理文件 ${filePath} 时出错:`, error);
	}
}

/**
 * 主函数
 */
function main(): void {
	const documentsDir = './Documents';
	if (!existsSync(documentsDir)) {
		console.error('Documents目录不存在');
		return;
	}

	const markdownFiles = getAllMarkdownFiles(documentsDir);
	console.log(`找到 ${markdownFiles.length} 个 markdown 文件（已排除 main.md 与 Artifacts）`);

	for (const filePath of markdownFiles) {
		processIdentifierInFile(filePath);
	}

	console.log('处理完成');
}

// 运行主函数
main();