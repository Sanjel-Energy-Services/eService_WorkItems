// @ts-ignore
import { appendFile, readFile } from 'node:fs/promises';
// @ts-ignore
import { join } from 'node:path';
import get_config from './002.config';

interface Attributes {
	Iteration: '172eb6ff';
	'Release Target': '6065bc6d';	// PRM 1.0
	'Estimate Hours': 0;
	'Remain Hours': 0;
	'Actual Hours': 0;
	Priority: '5f6f0883';	// Low
	Category: 'd137fe14' | 'a8334868' | '531f4986'; // Summary, Task, Misc
	Application: '2c62179d';	// eServiceCloud
	Budget: '';
}

interface GitHubIssue {
	title: string;
	body: string;
	pid?: number; // Parent issue ID
	attributes: Attributes;
	project: Attributes;
}

async function validateRepository(token: string, owner: string, repo: string): Promise<{ exists: boolean, hasIssues: boolean }> {
	console.log(`Validating repository: ${owner}/${repo}`);

	const url = `https://api.github.com/repos/${owner}/${repo}`;
	const response = await fetch(url, {
		method: 'GET',
		headers: {
			'Authorization': `Bearer ${token}`,
			'Accept': 'application/vnd.github.v3+json',
			'Content-Type': 'application/json'
		}
	});

	console.log(`Repository validation status: ${response.status}`);

	if (!response.ok) {
		const errorText = await response.text();
		console.log(`Repository validation error: ${errorText}`);
		return { exists: false, hasIssues: false };
	}

	const repoInfo = await response.json();
	console.log(`Repository visibility: ${repoInfo.private ? 'Private' : 'Public'}`);
	console.log(`Repository has_issues: ${repoInfo.has_issues}`);

	return { exists: true, hasIssues: repoInfo.has_issues };
}

async function createGitHubIssue(issue: GitHubIssue, token: string, owner: string, repo: string): Promise<any> {
	console.log('Creating issue:', issue.title);
	console.log(`Request URL: https://api.github.com/repos/${owner}/${repo}/issues`);

	// GitHub API endpoint for creating an issue
	const url = `https://api.github.com/repos/${owner}/${repo}/issues`;

	const response = await fetch(url, {
		method: 'POST',
		headers: {
			'Authorization': `Bearer ${token}`,
			'Accept': 'application/vnd.github.v3+json',
			'Content-Type': 'application/json',
			'User-Agent': 'bun-fetch'
		},
		body: JSON.stringify({
			title: issue.title,
			body: issue.body
		})
	});

	console.log(`Response Status: ${response.status}`);
	console.log(`Response Status Text: ${response.statusText}`);

	if (!response.ok) {
		const errorText = await response.text();
		console.log(`Response Body: ${errorText}`);
		console.log('WARNING: Failed to create issue on GitHub.');
		console.log('Possible causes:');
		console.log('  1. Repository does not exist');
		console.log('  2. Repository issues are disabled');
		console.log('  3. Insufficient permissions');
		console.log('Will proceed with project item creation only.');
		return null; // Return null to indicate failure
	}

	const result = await response.json();
	console.log('Issue created successfully! Issue number:', result.number);
	console.log('Issue URL:', result.html_url);

	// Save issue ID to log file
	try {
		// @ts-ignore
		await appendFile(join(__dirname, 'git.issues.log'), `bun ${join(__dirname, '003.delete-issues.ts')} ${result.number}\n`);
		console.log(`Issue ID ${result.number} saved to git.issues.log`);
	} catch (error) {
		console.error('Failed to save issue ID to log file:', error);
	}

	// Set parent issue if specified
	if (issue.pid) {
		console.log(`Setting parent issue ID: ${issue.pid}`);
		try {
			await setParentIssue(result.number, issue.pid, token, owner, repo);
			console.log(`Successfully set parent issue #${issue.pid} for issue #${result.number}`);
		} catch (error) {
			console.error(`Failed to set parent issue: ${error}`);
			// Continue even if parent setting fails
		}
	}

	return result;
}

async function setParentIssue(childIssueNumber: number, parentIssueNumber: number, token: string, owner: string, repo: string): Promise<void> {
	// Use GitHub GraphQL API to create parent-child relationship
	const getParentIssueIdQuery = `
		query($owner: String!, $repo: String!, $issueNumber: Int!) {
			repository(owner: $owner, name: $repo) {
				issue(number: $issueNumber) {
					id
				}
			}
		}
	`;

	// Get parent issue ID
	const parentResponse = await fetch('https://api.github.com/graphql', {
		method: 'POST',
		headers: {
			'Authorization': `Bearer ${token}`,
			'Content-Type': 'application/json',
			'GraphQL-Features': 'sub_issues'
		},
		body: JSON.stringify({
			query: getParentIssueIdQuery,
			variables: {
				owner,
				repo,
				issueNumber: parentIssueNumber
			}
		})
	});

	if (!parentResponse.ok) {
		const errorText = await parentResponse.text();
		throw new Error(`Failed to get parent issue ID: ${parentResponse.status} ${errorText}`);
	}

	const parentData = await parentResponse.json();

	if (parentData.errors) {
		throw new Error('GraphQL errors: ' + JSON.stringify(parentData.errors));
	}

	const parentIssueId = parentData.data.repository.issue.id;
	if (!parentIssueId) {
		throw new Error(`Parent issue #${parentIssueNumber} not found`);
	}

	// Get child issue ID
	const childResponse = await fetch('https://api.github.com/graphql', {
		method: 'POST',
		headers: {
			'Authorization': `Bearer ${token}`,
			'Content-Type': 'application/json',
			'GraphQL-Features': 'sub_issues'
		},
		body: JSON.stringify({
			query: getParentIssueIdQuery,
			variables: {
				owner,
				repo,
				issueNumber: childIssueNumber
			}
		})
	});

	if (!childResponse.ok) {
		const errorText = await childResponse.text();
		throw new Error(`Failed to get child issue ID: ${childResponse.status} ${errorText}`);
	}

	const childData = await childResponse.json();

	if (childData.errors) {
		throw new Error('GraphQL errors: ' + JSON.stringify(childData.errors));
	}

	const childIssueId = childData.data.repository.issue.id;
	if (!childIssueId) {
		throw new Error(`Child issue #${childIssueNumber} not found`);
	}

	// Create parent-child relationship using addSubIssue mutation
	const addSubIssueMutation = `
		mutation($issueId: ID!, $subIssueId: ID!) {
			addSubIssue(input: {
				issueId: $issueId,
				subIssueId: $subIssueId
			}) {
				issue {
					title
				}
				subIssue {
					title
				}
			}
		}
	`;

	const relationshipResponse = await fetch('https://api.github.com/graphql', {
		method: 'POST',
		headers: {
			'Authorization': `Bearer ${token}`,
			'Content-Type': 'application/json',
			'GraphQL-Features': 'sub_issues'
		},
		body: JSON.stringify({
			query: addSubIssueMutation,
			variables: {
				issueId: parentIssueId,
				subIssueId: childIssueId
			}
		})
	});

	if (!relationshipResponse.ok) {
		const errorText = await relationshipResponse.text();
		throw new Error(`Failed to create parent-child relationship: ${relationshipResponse.status} ${errorText}`);
	}

	const relationshipData = await relationshipResponse.json();

	if (relationshipData.errors) {
		throw new Error('GraphQL errors: ' + JSON.stringify(relationshipData.errors));
	}

	console.log(`Successfully created parent-child relationship between #${parentIssueNumber} and #${childIssueNumber}`);
}

async function getProjectIdByNumber(owner: string, projectNumber: number, token: string): Promise<string> {
	console.log(`Getting project global ID for owner=${owner} number=${projectNumber}`);

	const query = `
	  query($owner: String!, $number: Int!) {
	    organization(login: $owner) {
	      projectV2(number: $number) {
	        id
	      }
	    }
	  }
	`;

	const response = await fetch('https://api.github.com/graphql', {
		method: 'POST',
		headers: {
			'Authorization': `Bearer ${token}`,
			'Content-Type': 'application/json'
		},
		body: JSON.stringify({
			query,
			variables: { owner, number: projectNumber }
		})
	});

	if (!response.ok) {
		const errorText = await response.text();
		throw new Error(`Failed to get project ID: ${response.status} ${response.statusText}\n${errorText}`);
	}

	const data = await response.json();

	if (data.errors) {
		throw new Error('GraphQL errors: ' + JSON.stringify(data.errors));
	}

	const projectId = data.data.organization?.projectV2?.id;
	if (!projectId) {
		throw new Error('Project not found');
	}

	console.log(`Project global ID: ${projectId}`);
	return projectId;
}

async function addIssueToProject(issueNodeId: string, project: Attributes, token: string, projectNumber: number, owner: string) {
	console.log('Adding issue to project and setting properties...');

	// First get the project global ID
	const projectId = await getProjectIdByNumber(owner, projectNumber, token);

	// Then, we need to get the project data to find the right fields
	const projectQuery = `
    query($projectId: ID!) {
      node(id: $projectId) {
        ... on ProjectV2 {
          id
          fields(first: 20) {
            nodes {
              ... on ProjectV2Field {
                id
                name
                dataType
              }
              ... on ProjectV2SingleSelectField {
                id
                name
                dataType
                options {
                  id
                  name
                }
              }
              ... on ProjectV2IterationField {
                id
                name
                dataType
                configuration {
                  iterations {
                    id
                    title
                    startDate
                    duration
                  }
                }
              }
            }
          }
        }
      }
    }
  `;

	const projectResponse = await fetch('https://api.github.com/graphql', {
		method: 'POST',
		headers: {
			'Authorization': `Bearer ${token}`,
			'Content-Type': 'application/json'
		},
		body: JSON.stringify({
			query: projectQuery,
			variables: {
				projectId: projectId
			}
		})
	});

	if (!projectResponse.ok) {
		const errorText = await projectResponse.text();
		throw new Error(`Failed to get project data: ${projectResponse.status} ${projectResponse.statusText}\n${errorText}`);
	}

	const projectData = await projectResponse.json();

	if (!projectData.data || !projectData.data.node) {
		throw new Error('Failed to get project data: ' + JSON.stringify(projectData));
	}

	const fields = projectData.data.node.fields.nodes;

	// Now add the issue to the project
	const addIssueQuery = `
    mutation($projectId: ID!, $contentId: ID!) {
      addProjectV2ItemById(input: {projectId: $projectId, contentId: $contentId}) {
        item {
          id
        }
      }
    }
  `;

	const addItemResponse = await fetch('https://api.github.com/graphql', {
		method: 'POST',
		headers: {
			'Authorization': `Bearer ${token}`,
			'Content-Type': 'application/json'
		},
		body: JSON.stringify({
			query: addIssueQuery,
			variables: {
				projectId: projectId,
				contentId: issueNodeId
			}
		})
	});

	if (!addItemResponse.ok) {
		const errorText = await addItemResponse.text();
		throw new Error(`Failed to add item to project: ${addItemResponse.status} ${addItemResponse.statusText}\n${errorText}`);
	}

	const addItemResult = await addItemResponse.json();

	if (!addItemResult.data || !addItemResult.data.addProjectV2ItemById) {
		throw new Error('Failed to add item to project: ' + JSON.stringify(addItemResult));
	}

	const itemId = addItemResult.data.addProjectV2ItemById.item.id;

	console.log('Issue added to project. Item ID:', itemId);

	// Update the project item with field values
	for (const [key, value] of Object.entries(project)) {
		if (key === 'id' || value === null || value === undefined) continue; // Skip the project ID itself and null values

		const field = fields.find((f: any) => f.name === key);
		if (!field) {
			continue; // Skip if field not found
		}

		let updateValue: any = null;

		// Use dataType to determine field type
		const fieldType = field.dataType;

		// Handle different field types
		switch (fieldType) {
			case 'SINGLE_SELECT':
				updateValue = { singleSelectOptionId: value };
				break;

			case 'TEXT':
				updateValue = { text: String(value) };
				break;

			case 'NUMBER':
				updateValue = { number: Number(value) };
				break;

			case 'DATE':
				updateValue = { date: value };
				break;

			case 'ITERATION':
				updateValue = { iterationId: value };
				break;

			default:
				// Generic handling - infer from value type
				if (typeof value === 'number' || !isNaN(Number(value))) {
					updateValue = { number: Number(value) };
				} else {
					updateValue = { text: String(value) };
				}
				break;
		}

		// Update the field value
		const updateFieldQuery = `
      mutation($projectId: ID!, $itemId: ID!, $fieldId: ID!, $value: ProjectV2FieldValue!) {
        updateProjectV2ItemFieldValue(input: {
          projectId: $projectId,
          itemId: $itemId,
          fieldId: $fieldId,
          value: $value
        }) {
          projectV2Item {
            id
          }
        }
      }
    `;

		const updateResponse = await fetch('https://api.github.com/graphql', {
			method: 'POST',
			headers: {
				'Authorization': `Bearer ${token}`,
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({
				query: updateFieldQuery,
				variables: {
					projectId: projectId,
					itemId: itemId,
					fieldId: field.id,
					value: updateValue
				}
			})
		});

		if (!updateResponse.ok) {
			const errorText = await updateResponse.text();
			console.error(`Failed to update field "${key}": ${updateResponse.status} ${updateResponse.statusText}\n${errorText}`);
		}
	}
}

async function main() {
	try {
		const config = await get_config();
		// @ts-ignore
		const [_bun, _tsfilename, issues_json_file] = process.argv;

		const issues = JSON.parse(await readFile(issues_json_file, 'utf-8')) as GitHubIssue[];

		console.log(`Loaded config with ${issues.length} issues to create for ${config.owner}/${config.repo}`);

		// Validate repository first
		const repoStatus = await validateRepository(config.token, config.owner, config.repo);
		if (!repoStatus.exists) {
			console.log(`WARNING: Repository ${config.owner}/${config.repo} not found or inaccessible.`);
			console.log('Will proceed with project item creation only.');
			return;
		} else if (!repoStatus.hasIssues) {
			console.log(`WARNING: Issues are disabled for repository ${config.owner}/${config.repo}.`);
			console.log('Will proceed with project item creation only.');
			return;
		}

		for (const issue of issues) {
			const createdIssue = await createGitHubIssue(issue, config.token, config.owner, config.repo);

			// Add the issue to the project and set field values only if we have a valid project
			if (createdIssue) {
				await addIssueToProject(createdIssue.node_id, issue.project, config.token, config.projectid, config.owner);
			} else {
				console.log('Skipping adding issue to project since issue creation was skipped or failed');
			}
		}

		console.log('All issues processed!');
	} catch (error) {
		console.error('Error:', error);
	}
}

// Run the script
main();