import { existsSync, readFileSync, writeFileSync, readdirSync, statSync } from 'fs';
import { join, extname, dirname, basename, relative, sep } from 'path';

// 特殊文件名及其对应的固定ID后缀
const SPECIAL_FILES: { [key: string]: string } = {
	'instructions.md': '00',
	'main.md': '01',
	'process.md': '02',
	'collaboration.md': '03'
};

/**
 * 递归获取目录中所有markdown文件
 */
function getAllMarkdownFiles(dir: string): string[] {
	let results: string[] = [];
	const files = readdirSync(dir);

	files.forEach(file => {
		const filePath = join(dir, file);
		const stat = statSync(filePath);

		if (stat.isDirectory()) {
			results = results.concat(getAllMarkdownFiles(filePath));
		} else if (extname(file).toLowerCase() === '.md') {
			results.push(filePath);
		}
	});

	return results;
}

/**
 * 检查文件是否已有旧格式的ID标识（纯文本格式）
 */
function hasOldIdentifierFormat(content: string): boolean {
	return content.startsWith('Identifier:') || content.includes('Identifier:');
}

/**
 * 提取目录名中的编号
 */
function getDirectoryNumber(dirName: string): string {
	// 查找第一个"-"之前的部分
	const match = dirName.match(/^.*s(.*?)\s*-.*/);
	if (match) {
		return match[1].padStart(2, '0').toUpperCase();
	}

	// 如果没有"-"，使用前两位首字母作为编号
	if (dirName.length > 0) {
		return dirName.replace(/\s/g, '').substring(0, 2).padStart(2, '0').toUpperCase();
	}

	return '00'; // 默认值
}

/**
 * 为特定目录生成文件索引映射
 */
function generateFileIndexMap(dir: string): Map<string, number> {
	const fileIndexMap = new Map<string, number>();
	const files = readdirSync(dir).filter(file => extname(file).toLowerCase() === '.md');

	// 先处理特殊文件
	const specialFilesProcessed: string[] = [];

	// 按照指定顺序处理特殊文件
	Object.keys(SPECIAL_FILES).forEach(specialFile => {
		if (files.includes(specialFile)) {
			fileIndexMap.set(specialFile, parseInt(SPECIAL_FILES[specialFile]));
			specialFilesProcessed.push(specialFile);
		}
	});

	// 处理非特殊文件，索引从04开始
	let regularFileIndex = 4;
	files.forEach(file => {
		if (!SPECIAL_FILES.hasOwnProperty(file)) {
			fileIndexMap.set(file, regularFileIndex);
			regularFileIndex++;
		}
	});

	return fileIndexMap;
}

/**
 * 生成完整的ID标识
 */
function generateIdentifier(filePath: string): string {
	// 获取相对于Documents目录的路径
	const relativePath = relative('Documents', filePath);
	const parts = relativePath.split(sep);
	const fileName = parts.pop() || ''; // 最后一个是文件名
	const dirParts = parts; // 剩下的是目录部分

	// 构建ID的前缀部分
	const idParts: string[] = [];

	// 处理目录层级
	dirParts.forEach(dir => {
		idParts.push(getDirectoryNumber(dir));
	});

	// 处理文件部分
	const fileDir = dirname(filePath);
	const fileIndexMap = generateFileIndexMap(fileDir);
	const fileIndex = fileIndexMap.get(fileName);

	if (fileIndex === undefined) {
		throw new Error(`无法为文件 ${fileName} 生成索引`);
	}

	idParts.push(String(fileIndex).padStart(2, '0'));

	return `I-${idParts.join('-')}`;
}

/**
 * 为文件添加或更新ID标识
 */
function processIdentifierInFile(filePath: string): void {
	try {
		let content = readFileSync(filePath, 'utf-8');

		// 生成ID标识
		const identifier = generateIdentifier(filePath);
		const identifierComment = `<!-- Identifier: ${identifier} -->\n`;

		const reg = /<!--\s*Identifier:\s*.*?\s*-->\n/i;
		// 如果已经有注释格式的ID标识，则替换
		if (reg.test(content)) {
			// 替换现有的ID注释
			content = content.replace(reg, identifierComment);
			console.log(`成功更新文件 ${filePath} 的ID标识: ${identifier}`);
		}
		// 没有ID标识，添加新的
		else {
			content = identifierComment + content;
			console.log(`为文件 ${filePath} 添加ID标识: ${identifier}`);
		}

		// 写入新内容
		writeFileSync(filePath, content, 'utf-8');
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

	// 获取所有markdown文件
	const markdownFiles = getAllMarkdownFiles(documentsDir);

	console.log(`找到 ${markdownFiles.length} 个markdown文件`);

	// 为每个文件添加或更新ID标识
	markdownFiles.forEach(filePath => {
		processIdentifierInFile(filePath);
	});

	console.log('处理完成');
}

// 运行主函数
main();