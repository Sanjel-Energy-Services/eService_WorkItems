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
| PRJ-01 | eService Work Items Management System | projects/01 - eService Work Items | I-01 |
| PRJ-02 | Multi-well Service Optimization | projects/02 - Multi-well Service Optimization | I-02 |
| PRJ-03 | Field Operations Digital Transformation | projects/03 - Field Operations Digital Transformation | I-03 |

## Project Details

### PRJ-01: eService Work Items Management System
- **Objective**: Digitalize and streamline work item management for energy services
- **Status**: In Development
- **Related Process**: Service delivery and work order management
- **Key Artifacts**: Requirements analysis, system design, user interface mockups

### PRJ-02: Multi-well Service Optimization
- **Objective**: Optimize service delivery for multi-well operations
- **Status**: Planning Phase
- **Related Process**: Field operations coordination and resource optimization
- **Key Artifacts**: Process analysis, optimization algorithms, performance metrics

### PRJ-03: Field Operations Digital Transformation
- **Objective**: Transform field operations through digital tools and processes
- **Status**: Requirements Gathering
- **Related Process**: Field management and digital workflow integration
- **Key Artifacts**: Current state analysis, digital transformation roadmap, technology assessment

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