import get_config from './002.config';

async function getSingleSelectFieldOptionsByNumber(owner: string, projectNumber: number, token: string, fieldName: string) {
	console.log(`Getting single select field options for owner=${owner} number=${projectNumber} field='${fieldName}'`);

	const query = `
	  query($owner: String!, $number: Int!) {
	    organization(login: $owner) { projectV2(number: $number) { id title fields(first: 100) { nodes { __typename ... on ProjectV2SingleSelectField { id name options { id name } } } } } }
	    user(login: $owner) { projectV2(number: $number) { id title fields(first: 100) { nodes { __typename ... on ProjectV2SingleSelectField { id name options { id name } } } } } }
	  }
	`;

	const response = await fetch('https://api.github.com/graphql', {
		method: 'POST',
		headers: {
			'Authorization': `Bearer ${token}`,
			'Content-Type': 'application/json'
		},
		body: JSON.stringify({ query, variables: { owner, number: projectNumber } })
	});

	if (!response.ok) {
		const errorText = await response.text();
		throw new Error(`Failed to get project field options: ${response.status} ${response.statusText}\n${errorText}`);
	}

	const data = await response.json();
	if (data.errors) {
		console.warn('GraphQL partial errors:', JSON.stringify(data.errors));
	}

	const project = data.data.organization?.projectV2 || data.data.user?.projectV2;
	if (!project) {
		console.error('Project not found');
		return;
	}

	const field = project.fields.nodes.find((f: any) => f.__typename === 'ProjectV2SingleSelectField' && f.name === fieldName);
	if (!field) {
		console.error(`Single select field '${fieldName}' not found.`);
		console.log('Available single select fields:');
		for (const f of project.fields.nodes.filter((x: any) => x.__typename === 'ProjectV2SingleSelectField')) {
			console.log('  - ' + f.name);
		}
		return;
	}

	console.log(`Project: ${project.title}`);
	console.log(`## ${fieldName}\n`);
	if (field.options && field.options.length) {
		for (const opt of field.options) {
			console.log(`  - ${opt.name} (${opt.id})`);
		}
	} else {
		console.log('  (no options)');
	}
}

async function main() {
	try {
		const config = await get_config();

		// 命令行参数解析（支持覆盖 config）
		const owner = config.owner;
		const number = config.projectid;
		// console.log('args:', process.argv);
		// @ts-ignore
		const [_bun, _tsfilename, fieldName] = process.argv;

		// 如果通过命令行提供 number 和 owner 仍可查询
		if (owner && number) {
			await getSingleSelectFieldOptionsByNumber(owner, number, config.token, fieldName);
		} else {
			console.log('No project info found in config and no CLI overrides provided');
		}
	} catch (error) {
		console.error('Error:', error);
	}
}

main();