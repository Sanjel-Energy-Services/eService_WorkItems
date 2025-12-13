#!/usr/bin/env bun
// @ts-ignore
import { mkdirSync, readFileSync, writeFileSync, statSync, readdirSync, existsSync } from 'node:fs';
// @ts-ignore
import { dirname, resolve, join } from 'node:path';

export function readJSON<T = any>(file: string): T {
	if (!fileExists(file)) {
		throw new Error(`File not found: ${file}`);
	}
	try {
		const content = readFileSync(file, 'utf8');
		return JSON.parse(content) as T;
	} catch (error) {
		throw new Error(`Failed to parse JSON from ${file}: ${error instanceof Error ? error.message : String(error)}`);
	}
}

export function fileExists(p: string): boolean {
	return existsSync(p);
}

export function listJsonFiles(inputPath: string): string[] {
	if (!fileExists(inputPath)) {
		throw new Error(`Path does not exist: ${inputPath}`);
	}
	
	const stats = statSync(inputPath);
	if (stats.isDirectory()) {
		const files = readdirSync(inputPath);
		const jsonFiles = files.filter((f: string) => f.endsWith('.json'));
		if (jsonFiles.length === 0) {
			throw new Error(`No JSON files found in directory: ${inputPath}`);
		}
		return jsonFiles.map((f: string) => resolve(inputPath, f));
	}
	
	if (!inputPath.endsWith('.json')) {
		throw new Error(`File is not a JSON file: ${inputPath}`);
	}
	
	return [resolve(inputPath)];
}

export function esc(str: string) {
	// Escape characters dangerous in shell contexts and JSON strings
	return str.replace(/[\\/&$"'`()\[\]{}<>|*?;~#]/g, s => `\\${s}`);
}

export function ensure(value: any, message: string): asserts value {
	if (!value) {
		console.error(message);
		throw new Error(message);
	}
}

export function readText(file: string): string {
	return readFileSync(file, 'utf8');
}

export function writeFileAtomic(file: string, content: string) {
	mkdirSync(dirname(file), { recursive: true });
	writeFileSync(file, content, 'utf8');
}

export function writePrettyJSON(file: string, obj: any) {
	writeFileAtomic(file, JSON.stringify(obj, null, '\t'));
}

export function pascalCase(name: string) {
	return name.split(/[_-]/).filter(Boolean).map(s => s.charAt(0).toUpperCase() + s.slice(1)).join('');
}

export function tsNow() {
	return new Date().toISOString();
}

export function uniq<T>(arr: T[]): T[] { return Array.from(new Set(arr)); }

export function pick<T extends object, K extends keyof T>(obj: T, keys: K[]): Pick<T, K> {
	const result = {} as Pick<T, K>;
	for (const key of keys) {
		if (key in obj) {
			result[key] = obj[key];
		}
	}
	return result;
}

export function toUnion(arr: string[]) {
	return arr.map(a => `'${a}'`).join(' | ');
}

export interface FieldMeta {
	name: string;
	rawType: string;
	tsType: string;
	description: string;
	isPrimary?: boolean;
}

export interface EntityMeta {
	name: string;
	alias: string;
	pascalName: string;
	description: string;
	table: string;
	primaryKey: string[];
	fields: FieldMeta[];
}

export function loadEntity(file: string) {
	return readJSON<EntityMeta>(file);
}

export function getRootDir(): string {
	// @ts-ignore
	return resolve(__dirname, '..');
}
