#!/usr/bin/env bun
import { readText, writeFileAtomic } from './000-util';

interface PropertyMatch {
	visibility: string;
	type: string;
	name: string;
	original: string;
}

/**
 * 判断是否为类型
 */
function isType(word: string, classNames: string[]): boolean {
	// 基础类型
	const commonTypes = ['int', 'double', 'string', 'bool', 'boolean', 'float', 'long', 'short', 'byte', 'char', 'decimal'];
	if (commonTypes.includes(word.toLowerCase())) {
		return true;
	}
	// 类图中的类名（大写开头）
	if (classNames.includes(word)) {
		return true;
	}
	// 小写开头的自定义类型
	if (/^[a-z][a-zA-Z0-9]*$/.test(word)) {
		return true;
	}
	// 大写开头但不是类名的，可能是类型名（如自定义类）
	if (/^[A-Z][a-zA-Z0-9]*$/.test(word)) {
		return true;
	}
	// Mermaid 泛型类型，如 List~Contact~、List<BlendSection> 等
	if (/^[A-Z][a-zA-Z0-9]*[~<].*[>~]$/.test(word)) {
		return true;
	}
	// 其他泛型类型格式
	if (word.includes('~') || (word.includes('<') && word.includes('>'))) {
		return true;
	}
	return false;
}

/**
 * 判断是否为属性名
 */
function isPropertyName(word: string): boolean {
	// 属性名通常是大写开头的（PascalCase）或驼峰命名
	return /^[A-Z][a-zA-Z0-9]*$/.test(word) || /^[a-z][a-zA-Z0-9]*$/.test(word);
}

/**
 * 解析属性行，提取可见性、类型和名称
 */
function parseProperty(line: string, classNames: string[] = []): PropertyMatch | null {
	// 支持 Mermaid 可见性: + public, - private, # protected, ~ package/internal
	const trimmed = line.trim();
	if (!trimmed) return null;

	let visibilityChar = trimmed[0];
	const allowedVisibility = ['+', '-', '#', '~'];
	let content: string;
	let parts: string[];
	if (!allowedVisibility.includes(visibilityChar)) {
		// 没有显式可见性标识，尝试作为属性解析并默认可见性为 '+'
		visibilityChar = '+';
		content = trimmed;
		parts = content.split(/\s+/);
	} else {
		// 移除可见性符号并按空格分割
		content = trimmed.substring(1).trim();
		parts = content.split(/\s+/);
	}

	if (parts.length < 2) {
		return null;
	}

	// 检测当前格式：名称 类型 或 类型 名称
	const first = parts[0];
	const second = parts[1];

	let name: string;
	let type: string;

	// 优先判断：如果第一个是类型，第二个是属性名，则格式正确
	if (isType(first, classNames) && isPropertyName(second)) {
		// 格式：+ 类型 名称 (正确)
		type = first;
		name = second;
	} 
	// 如果第一个是属性名，第二个是类型，则需要修正
	else if (isPropertyName(first) && isType(second, classNames)) {
		// 格式：+ 名称 类型 (需要修正)
		name = first;
		type = second;
	}
	// 如果两者都是类型，假设第二个是属性名（属性名可能看起来像类型）
	else if (isType(first, classNames) && isType(second, classNames)) {
		// 默认假设第一个是类型，第二个是属性名
		type = first;
		name = second;
		console.warn(`⚠️  模糊判断: "${first}" "${second}" - 假设为 + ${type} ${name}`);
	}
	// 如果两者都是属性名，假设第一个是属性名，第二个是类型
	else if (isPropertyName(first) && isPropertyName(second)) {
		name = first;
		type = second;
		console.warn(`⚠️  模糊判断: "${first}" "${second}" - 假设为 + ${type} ${name}`);
	}
	// 无法确定的情况
	else {
		console.warn(`⚠️  无法解析: "${first}" "${second}" - 保持原样`);
		return null;
	}

	return {
		visibility: visibilityChar,
		type,
		name,
		original: trimmed
	};
}

/**
 * 提取类图中的所有类名
 */
function extractClassNames(content: string): string[] {
	const classNames: string[] = [];
	const lines = content.split('\n');

	for (const line of lines) {
		const trimmed = line.trim();
		if (trimmed.startsWith('class ')) {
			const classPart = trimmed.replace('class ', '').split(' ')[0];
			// 移除可能的花括号
			const className = classPart.replace(/[{}]/g, '');
			if (className && !classNames.includes(className)) {
				classNames.push(className);
			}
		}
	}

	return classNames;
}

/**
 * 修复类图属性格式
 */
function fixClassDiagram(content: string): string {
	// 首先提取所有类名
	const classNames = extractClassNames(content);
	console.log(`📋 发现类名: ${classNames.join(', ')}`);

	const lines = content.split('\n');
	const fixedLines: string[] = [];
	let inClassDefinition = false;
	let currentClassName = '';

	for (let line of lines) {
		const trimmed = line.trim();

		// 检测类定义开始
		if (trimmed.startsWith('class ')) {
			// 如果当前已经在类定义中，先结束上一个类
			if (inClassDefinition) {
				inClassDefinition = false;
			}
			inClassDefinition = true;
			currentClassName = trimmed.replace('class ', '').split(' ')[0];
			fixedLines.push(line);
			continue;
		}

		// 检测类定义结束
		if (inClassDefinition && (trimmed === '}' || (trimmed.startsWith('class ') && trimmed !== currentClassName))) {
			inClassDefinition = false;
			fixedLines.push(line);
			continue;
		}

		// 在类定义内，处理属性
		if (inClassDefinition && trimmed && !trimmed.startsWith('%%') && !trimmed.startsWith('<<') && !trimmed.startsWith('class ') && trimmed !== '}') {
			const parsed = parseProperty(trimmed, classNames);

			if (parsed) {
				// 重新格式化为：可见性 类型 名称
				const fixedProperty = `${parsed.visibility}${parsed.type} ${parsed.name}`;

				// 检查是否需要修正
				if (parsed.original !== fixedProperty) {
					console.log(`[${currentClassName}] 修正: "${parsed.original}" -> "${fixedProperty}"`);
					fixedLines.push(line.replace(parsed.original, `    ${fixedProperty}`));
				} else {
					console.log(`[${currentClassName}] 正确: "${parsed.original}"`);
					fixedLines.push(line);
				}
			} else {
				// 不匹配属性格式，保持原样
				fixedLines.push(line);
			}
		} else {
			fixedLines.push(line);
		}
	}

	return fixedLines.join('\n');
}

/**
 * 检查行是否为类定义
 */
function isClassDefinition(line: string): boolean {
	return line.trim().startsWith('class ');
}

/**
 * 检查行是否为关系连接线
 */
function isRelationshipLine(line: string): boolean {
	const trimmed = line.trim();
	// 匹配各种关系连接模式
	return trimmed.includes('-->') || trimmed.includes('*-->') || trimmed.includes('o-->') || 
		trimmed.includes('--|>') || trimmed.includes('..>') || trimmed.includes('*.');
}

/**
 * 格式化 Mermaid 类图缩进
 */
function formatMermaidIndentation(content: string): string {
	const lines = content.split('\n');
	const formattedLines: string[] = [];
	let inClassDefinition = false;
	let currentClassHasBraces = false;

	for (let line of lines) {
		const trimmed = line.trim();

		// 空行直接保留
		if (!trimmed) {
			formattedLines.push('');
			continue;
		}

		// 注释行保持原样
		if (trimmed.startsWith('%%')) {
			formattedLines.push(trimmed);
			continue;
		}

		// class 行不缩进
		if (isClassDefinition(trimmed)) {
			// 如果当前已经在类定义中，结束上一个类
			if (inClassDefinition) {
				inClassDefinition = false;
				currentClassHasBraces = false;
			}
			
			inClassDefinition = true;
			// 检查这个类是否有花括号
			const nextLines = content.split('\n').slice(lines.indexOf(line) + 1, lines.indexOf(line) + 5);
			currentClassHasBraces = nextLines.some(l => l.trim() === '}');
			
			formattedLines.push(trimmed);
			continue;
		}

		// 检查类定义结束
		if (inClassDefinition && trimmed === '}') {
			inClassDefinition = false;
			currentClassHasBraces = false;
			formattedLines.push(trimmed);
			continue;
		}

		// 关系连接线处理
		if (isRelationshipLine(trimmed)) {
			if (inClassDefinition && !currentClassHasBraces) {
				// 在没有花括号的类定义内，关系线应该缩进
				formattedLines.push('\t' + trimmed);
			} else {
				// 在其他情况下，关系线不缩进
				formattedLines.push(trimmed);
			}
			continue;
		}

		// 在类定义内，处理属性等
		if (inClassDefinition) {
			if (currentClassHasBraces) {
				// 有花括号的类，内部内容缩进
				if (trimmed !== '}') {
					formattedLines.push('\t' + trimmed);
				} else {
					formattedLines.push(trimmed);
				}
			} else {
				// 没有花括号的类，下一行遇到新类就结束
				if (isClassDefinition(trimmed)) {
					// 遇到新类，结束当前类
					inClassDefinition = false;
					currentClassHasBraces = false;
					formattedLines.push(trimmed);
				} else {
					// 类内容缩进
					formattedLines.push('\t' + trimmed);
				}
			}
			continue;
		}

		// 其他情况不缩进
		formattedLines.push(trimmed);
	}

	return formattedLines.join('\n');
}

/**
 * 提取并修复 Mermaid 类图
 */
function extractAndFixMermaidDiagram(content: string): string {
	// 查找 Mermaid 代码块
	const mermaidRegex = /```mermaid\n([\s\S]*?)\n```/g;
	let match: RegExpExecArray | null;
	let fixedContent = content;

	while ((match = mermaidRegex.exec(content)) !== null) {
		const fullMatch = match[0];
		const diagramContent = match[1];

		console.log('\n=== 修复类图 ===');
		const fixedDiagram = fixClassDiagram(diagramContent);
		console.log('\n=== 格式化缩进 ===');
		const formattedDiagram = formatMermaidIndentation(fixedDiagram);

		// 替换原代码块
		fixedContent = fixedContent.replace(fullMatch, `\`\`\`mermaid\n${formattedDiagram}\n\`\`\``);
	}

	return fixedContent;
}

/**
 * 修复 Mermaid 类图属性格式的默认导出函数
 */
export default async function fixMermaidClassDiagram(filePath: string): Promise<void> {
	try {
		console.log(`读取文件: ${filePath}`);
		const content = readText(filePath);

		const fixedContent = extractAndFixMermaidDiagram(content);

		// 检查是否有修改
		if (content !== fixedContent) {
			writeFileAtomic(filePath, fixedContent);
			console.log('\n✅ 修复完成，文件已更新');
		} else {
			console.log('\n✅ 格式正确，无需修改');
		}
	} catch (error) {
		console.error('❌ 修复失败:', error);
		throw new Error('修复失败');
	}
}

/**
 * 主函数
 */
async function main() {
	// @ts-ignore
	const args: string[] = process.argv.slice(2);

	if (args.length === 0) {
		console.log('用法: bun 004-fix-md.ts <markdown文件路径>');
		console.log('示例: bun 004-fix-md.ts docs/bin-structure-analysis.md');
		return;
	}

	const filePath = args[0];
	// 使用默认导出函数
	await fixMermaidClassDiagram(filePath);
}

// 如果直接运行此脚本
// @ts-ignore
if (import.meta.main) {
	main().catch(console.error);
}
