<!-- Identifier: project list -->

# Projects List

This file maintains a mapping between project identifiers and their descriptions, folder paths, and related organizational model processes.

## Format

Each project entry follows this format:
```
PRJ-NN, Project Description, Folder Path, Related OrgModel Process
```

## Active Projects

| Project ID | Description | Folder Path | Related OrgModel Process |
|------------|-------------|-------------|-------------------------|
| (No projects currently defined) | | | |

## Instructions for Adding Projects

1. Create a new numbered folder in the projects directory (e.g., `01 - Project Name`)
2. Add the project entry to this file using the format above
3. Create the required subfolders:
   - `requirements/` - for project requirements files
   - `artifacts/` - for analysis artifacts (can include subfolders like Analysis, Requirements, Sample Data, UI Mockup)
4. Link to related orgModel processes when applicable

## Notes

- Project identifiers use format: `PRJ-NN` where NN matches the project folder number
- Artifact files use: `ART-NN-[subfolder-type]` (e.g., `ART-01-Analysis`, `ART-01-Requirements`)
- Always use two-digit decimal numbers with leading zeros (01, 02, 10)