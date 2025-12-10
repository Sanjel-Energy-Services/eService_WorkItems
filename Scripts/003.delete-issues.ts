import get_config from './002.config';

async function deleteGitHubIssue(issueNumber: number, token: string, owner: string, repo: string): Promise<boolean> {
	console.log(`Deleting issue #${issueNumber} from ${owner}/${repo}`);

	// 首先通过REST API获取issue的node_id
	const getUrl = `https://api.github.com/repos/${owner}/${repo}/issues/${issueNumber}`;
	const getResponse = await fetch(getUrl, {
		method: 'GET',
		headers: {
			'Authorization': `Bearer ${token}`,
			'Accept': 'application/vnd.github.v3+json',
			'Content-Type': 'application/json',
			'User-Agent': 'bun-fetch'
		}
	});

	if (!getResponse.ok) {
		const errorText = await getResponse.text();
		console.log(`Failed to get issue #${issueNumber}: ${errorText}`);
		return false;
	}

	const issueData = await getResponse.json();
	const nodeId = issueData.node_id;

	// 使用GraphQL API删除issue
	const graphqlUrl = `https://api.github.com/graphql`;
	const graphqlQuery = `
	mutation($input: DeleteIssueInput!) {
		deleteIssue(input: $input) {
			clientMutationId
		}
	}
	`;

	const graphqlVariables = {
		input: {
			clientMutationId: "delete-issue-script",
			issueId: nodeId
		}
	};

	const response = await fetch(graphqlUrl, {
		method: 'POST',
		headers: {
			'Authorization': `Bearer ${token}`,
			'Content-Type': 'application/json',
			'User-Agent': 'bun-fetch'
		},
		body: JSON.stringify({
			query: graphqlQuery,
			variables: graphqlVariables
		})
	});

	console.log(`Response Status: ${response.status}`);

	if (response.ok) {
		const responseData = await response.json();
		if (responseData.data && responseData.data.deleteIssue) {
			console.log(`Successfully deleted issue #${issueNumber}`);
			return true;
		} else {
			console.log(`Failed to delete issue #${issueNumber}: ${JSON.stringify(responseData)}`);
			return false;
		}
	} else {
		const errorText = await response.text();
		console.log(`Failed to delete issue #${issueNumber}: ${errorText}`);
		return false;
	}
}

async function main() {
	// @ts-ignore
	const args = process.argv.slice(2);

	const [id] = args;

	const config = await get_config();

	if (!id) {
		console.error('Error: ID is required');
		// @ts-ignore
		process.exit(1);
	}

	// For automation, we'll proceed without interactive confirmation
	// In a real scenario, you might want to add readline for interactive confirmation
	console.log('Proceeding with deletion...');

	let successCount = 0;
	let failCount = 0;

	try {
		const success = await deleteGitHubIssue(parseInt(id), config.token, config.owner, config.repo);
		if (success) {
			successCount++;
		} else {
			failCount++;
		}
	} catch (error) {
		failCount++;
		console.error(`Error deleting issue #${id}:`, error);
	}

	console.log(`\nDeletion complete: ${successCount} succeeded, ${failCount} failed`);
}

// Run the script
main();