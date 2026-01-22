# Usage Examples

This document provides examples and use cases for using the organizational document structure effectively.

## Example 1: Creating a New Service Process

### Scenario
Adding a new "Customer Onboarding" process to the organizational model.

### Steps
1. **Identify the process number**: If this is the 6th main process, it would be numbered "06"
2. **Create the folder structure**:
   ```
   orgModel/06 - Customer Onboarding/
   ├── main.md (Identifier: I-06)
   ├── process.md (Identifier: P-06)
   ├── collaboration.md (Identifier: C-06)
   ├── domain-model.md (Identifier: D-06)
   ├── vocabulary.md (Identifier: V-06)
   ├── test-case-list.md (Identifier: T-06)
   └── test-cases/
   ```
3. **Create sub-processes based on collaboration analysis**
4. **Link from root collaboration.md** to include the new process

## Example 2: Adding a Project

### Scenario
Implementing a Customer Portal project related to Customer Onboarding.

### Steps
1. **Create project folder**:
   ```
   projects/01 - Customer Portal/
   ├── requirements/
   └── artifacts/
       ├── Analysis/
       ├── Requirements/
       ├── Sample Data/
       └── UI Mockup/
   ```
2. **Update projects.md**:
   ```
   PRJ-01, Customer Portal Implementation, projects/01 - Customer Portal, I-06
   ```
3. **Create artifact documents** with identifiers like `ART-01-Analysis`

## Example 3: Test Case Management

### Scenario
Creating test cases for the Customer Onboarding process.

### Steps
1. **Add to test-case-list.md** (Identifier: T-06):
   ```markdown
   | tc-06-001 | Successful Customer Registration | Process | High | Ready | Validates complete registration workflow | [tc-06-001.md](test-cases/tc-06-001.md) |
   ```
2. **Create test case file**: `test-cases/tc-06-001.md`
3. **Follow hierarchical numbering** for sub-process test cases

## Example 4: Cross-Reference Linking

### Linking Examples
- **Same folder**: `[Process Details](process.md)`
- **Parent folder**: `[Main Overview](../main.md)`
- **Sibling process**: `[Related Process](../07%20-%20Account%20Management/main.md)`
- **Project artifact**: `[Requirements](../../projects/01%20-%20Customer%20Portal/artifacts/Requirements/requirements.md)`

## Example 5: Identifier Usage

### Process Identifiers
- Root main: `I`
- First level: `I-06`
- Second level: `I-06-03`
- Third level: `I-06-03-01`

### Document Type Examples
- Main document: `I-06-03`
- Process diagram: `P-06-03`
- Collaboration: `C-06-03`
- Domain model: `D-06-03`
- Vocabulary: `V-06-03`
- Test cases list: `T-06-03`

## Best Practices

### Folder Naming
- Use descriptive names with sequential numbering
- Include spaces in folder names for readability
- Example: `06 - Customer Onboarding`

### File Naming
- Use lowercase with hyphens for files
- Follow the standard naming convention
- Example: `test-case-list.md`

### Documentation
- Always include identifier comments at the top
- Maintain consistent cross-referencing
- Update parent documents when adding new processes

### Version Control
- Use descriptive commit messages with type prefixes
- Example: `[DOC] Add customer onboarding process I-06`
- Create feature branches for new processes

## Common Patterns

### Process Decomposition
1. Start with collaboration diagram to identify sub-processes
2. Create numbered folders for each sub-process
3. Follow the standard file structure for each folder
4. Maintain hierarchical numbering

### Test Case Organization
1. Create master test-case-list.md at process level
2. Create individual test files in test-cases/ subfolder
3. Link master list to individual files
4. Use consistent numbering scheme

### Project Integration
1. Create project folders with requirements and artifacts
2. Update projects.md with mapping information
3. Link projects to related orgModel processes
4. Use consistent identifier schemes

This structure provides a comprehensive framework for organizing, documenting, and maintaining complex organizational processes and their associated projects and test cases.