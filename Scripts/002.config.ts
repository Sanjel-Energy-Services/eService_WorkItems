// import { readFile } from 'node:fs/promises';
// import { join } from 'node:path';
import config from './git.config.json';

export interface GitConfig {
	token: string;
	owner: 'Sanjel-Energy-Services';
	repo: 'eServiceCloud';
	projectid: 22;
	Iteration: '172eb6ff';
	'Release Target': '6065bc6d';
	"Estimate Hours": number;
	"Remain Hours": number;
	"Actual Hours": number;
	Priority: '5f6f0883';
	Category: 'd137fe14';
	Application: '2c62179d';
	Budget: string;
}

export default async function get_config() {
	return config as GitConfig;
}
