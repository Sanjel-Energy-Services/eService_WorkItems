# Document Tree Building Guidelines

This workspace organizes documents for eService WorkItems using a hierarchical folder structure. Follow these guidelines to maintain consistency and clarity:

## 1. Folder Structure
- Top-level folders represent major process phases (e.g., "01 - Cementing Service Invitation", "03 - Bidding Result").
- Each phase folder contains subfolders for specific activities (e.g., "01 - Credit Checking", "03 - Request Job Design").
- Subfolders may contain further nested folders for artifacts, analysis, requirements, sample data, and mockups.

## 2. File Naming
- Use `main.md` for the main documentation of each folder or process.
- Use `process.md` for process-specific details.
- Use `collaboration.md` for collaboration notes or records.
- Artifacts and supporting documents (e.g., .pptx, .docx) should be placed in relevant subfolders (e.g., `Artifacts/Requirement/`).

## 3. Content Organization
- Each `main.md` should provide an overview of the folder's purpose and link to related documents or subfolders.
- `process.md` files should describe step-by-step procedures, workflows, or business logic.
- `collaboration.md` files should capture meeting notes, decisions, and communication records.
- Artifacts folders (e.g., `Analysis`, `Requirement`, `Sample Data`, `UI Mockup`) are for storing supporting materials and references.

## 4. Naming Conventions
- Use clear, descriptive folder and file names. Prefix folders with numbers to indicate sequence/order.
- Avoid spaces in file names; use spaces in folder names only for clarity.
- For versioned documents, append version info (e.g., `Job Design Tool - Basic Parts R2.pptx`).

## 5. Adding New Content
- Create a new numbered folder for each new process phase or activity.
- Add `main.md`, `process.md`, and `collaboration.md` as needed.
- Store supporting documents in appropriate artifact subfolders.

## 6. Example Structure
```
01 - Cementing Service Invitation/
  main.md
  process.md
  collaboration.md
  01 - Credit Checking/
    main.md
    process.md
    collaboration.md
    Artifacts/
  03 - Request Job Design/
    main.md
    Artifacts/
      Analysis/
      Requirement/
        Program_Request_Management_FRD 1.docx
      Sample Data/
      UI Mockup/
        Mock up Document 1.docx
        Job Design Tool - Basic Parts R2.pptx
  ...
```

## 7. General Tips
- Keep documentation up to date and well-linked.
- Use Markdown for all documentation files for easy readability and version control.
- Store all process-related files within their respective folders for easy navigation.

---

For questions or updates to these guidelines, edit this `instructions.md` file.

## 8. Document Identifier Numbering
- Purpose: Standardize the `Identifier` comment at the top of each Markdown file so it encodes document type and hierarchical location consistently.
- Format: `<Type>-NN[-NN[-NN[...]]]` where each `NN` is a two‑digit decimal segment taken from the folder prefixes in the document's path.
- Type Prefix:
  - `I`: Main document (`main.md`)
  - `P`: Process document (`process.md`)
  - `C`: Collaboration document (`collaboration.md`)
  - `D`: Domain model (`domain-model.md`)
  - `V`: Vocabulary (`vocabulary.md`)
- Segment Source: Use the numeric prefixes from ancestor folders, in order from root to leaf. Always use decimal with leading zeros (e.g., `01`, `02`, `10`), never hexadecimal (avoid `0a`).

### Examples
- Top level phase:
  - File: [Documents/04 - Cementing Service Request/main.md](Documents/04%20-%20Cementing%20Service%20Request/main.md)
  - Identifier: `I-04`
- Second level activity:
  - File: [Documents/04 - Cementing Service Request/09 - Prepare Material/main.md](Documents/04%20-%20Cementing%20Service%20Request/09%20-%20Prepare%20Material/main.md)
  - Identifier: `I-04-09`
- Third level activity:
  - File: [Documents/04 - Cementing Service Request/09 - Prepare Material/05 - Blend Approval Process/main.md](Documents/04%20-%20Cementing%20Service%20Request/09%20-%20Prepare%20Material/05%20-%20Blend%20Approval%20Process/main.md)
  - Identifier: `I-04-09-05`
- Deep leaf process:
  - File: [Documents/04 - Cementing Service Request/09 - Prepare Material/05 - Blend Approval Process/11 - Document Update/process.md](Documents/04%20-%20Cementing%20Service%20Request/09%20-%20Prepare%20Material/05%20-%20Blend%20Approval%20Process/11%20-%20Document%20Update/process.md)
  - Identifier: `P-04-09-05-11`

### Special Cases
- Root overview files (no numbered folder):
  - [Documents/main.md](Documents/main.md) → `I`
  - [Documents/process.md](Documents/process.md) → `P`
  - [Documents/collaboration.md](Documents/collaboration.md) → `C`
  - [Documents/domain-model.md](Documents/domain-model.md) → `D`
  - [Documents/vocabulary.md](Documents/vocabulary.md) → `V`
- Multiple leaf documents in the same folder: If a folder contains more than one `main.md`-like document that must be distinguished, append a final two‑digit sequence: `I-XX-YY-01`, `I-XX-YY-02`, etc. Prefer a single `main.md` per folder when possible.

### Consistency Rules
- Always derive identifier segments directly from folder number prefixes.
- Use hyphens between type and segments, and between segments.
- Keep segments decimal with leading zeros; do not mix formats (`10` not `0a`).
- Update any legacy identifiers to match these rules when editing affected files.