<!-- Identifier: I-04-09-05-10 -->
<!-- Name:  Program Update Process -->

## Overview
Program Update handles changes driven by lab test results for programs used across one or more wells. For Multi‑Well programs, job‑specific changes are applied via a Job‑Specific Program Build without revising the Master/Multi‑Well template.

## Key Concepts (Domain Model)
- Multi‑Well Program Template: Shared template used by multiple wells/jobs in a project.
- Master Template: Canonical source of the program; revisions affect all dependent call sheets.
- Job‑Specific Program Build: A scoped program instance identified by Call Sheet Number and Build Number.
- Call Sheet: Operational record for a specific job; references a program or job build.
- Build Number: Integer indicating the job‑specific variation; incremented per job when needed.
- Program Revision: Version of the shared template; bump only when changes impact multiple jobs.
- Lab Test Result: Outcome from field blend testing that may necessitate program changes.
- eProgram: System of record for program authoring/publishing.
- eService: Operations system where call sheets consume programs/builds.
- Rig Board: Operational view showing alerts/status on the rig.
- Roles: Engineering (author/publisher), Dispatch (operational visibility), Workflow (process orchestration).

## Rules
- Do not revise the Master/Multi‑Well template for job‑only changes; use a Job‑Specific Program Build.
- If the original program applies to the job, increment its Build Number by 1; otherwise, enter the job’s Call Sheet Number and set Build Number to 1.
- For changes affecting multiple jobs (or non‑Multi‑Well programs), clone the original template, increase Program Revision, and update accordingly.
- Publish Job‑Specific Program Builds to eProgram; import them to the specific Call Sheet in eService.
- Show “Program Updated” alerts on the affected Call Sheet in eService and on Rig Board.

## Workflow Summary
1. Receive lab test results and request Program Update in job context.
2. Decision: Is original program Multi‑Well?
	 - Yes → Is change job‑only?
		 - Yes → Is original program for this job?
			 - Yes: Increase Build Number by 1; update per lab results; publish/import to the specific Call Sheet.
			 - No: Enter Call Sheet Number; set Build Number to 1; update; publish/import to the specific Call Sheet.
		 - No: Clone template; increase Program Revision; update; publish; alerts across affected Call Sheets.
	 - No: Clone template; increase Program Revision; update; publish; alerts for the job’s Call Sheet.
3. Dispatch sees “Program Updated” in eService and on Rig Board; return to parent process.