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