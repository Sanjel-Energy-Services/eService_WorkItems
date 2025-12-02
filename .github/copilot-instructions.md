# Copilot Instructions for eService_WorkItems

This workspace is a documentation-first repository with process and domain knowledge for Sanjel eService. It includes structured Markdown under `Documents/`, supporting assets, historical guides, and a small set of scripts to maintain consistency.

## Big Picture
- **Structure:**
  - `Documents/`: Canonical process and domain docs organized by phases (e.g., `01 - Cementing Service Invitation/`, `04 - Cementing Service Request/`). Each folder typically contains `main.md`, `process.md`, and `collaboration.md`.
  - `Newly createed document/`: Work-in-progress additions (e.g., `Phase 73 - Blend Approval Workflow/`). Treat as drafts to be refined and moved into `Documents/` once stable.
  - `Projects/`: Project planning and architecture docs (e.g., `Program Request Management`).
  - `SanjelDocuments - Metashare SVN/`: Legacy and reference materials (PDF4NET samples, guides, API notes). Do not modify unless explicitly requested.
  - `Scripts/`: Maintenance utilities (currently for generating identifiers in Markdown).
  - `Icons/`: Visual assets.
- **Conventions:** Each `Documents/` subfolder uses consistent filenames and a numbering scheme. Files may include an HTML comment at the top that carries a stable identifier (e.g., `<!-- Identifier: I-01-04-02 -->`).

## Identifier Maintenance
- **Purpose:** Ensure every Markdown under `Documents/` has a stable, structured identifier comment for cross-referencing.
- **Script:** `Scripts/001-generate-ids.ts`
  - Walks `Documents/` recursively and prepends/updates `<!-- Identifier: I-... -->` to `.md` files.
  - Special file index mapping inside a folder:
    - `instructions.md` → `00`, `main.md` → `01`, `process.md` → `02`, `collaboration.md` → `03`
    - Other `.md` files index from `04` in directory order.
  - Directory segment number derives from the folder name via `getDirectoryNumber(dirName)`:
    - If folder name matches `^.*s(.*?)\s*-.+` (intended for names like `01 - ...`), the captured part is zero-padded to 2 characters.
    - Otherwise, uses the first two non-space characters of the folder name, uppercased and zero-padded.
- **Run (nu shell):**
  ```nu
  bun ./Scripts/001-generate-ids.ts
  ```
  - Requires `bun` and Node APIs available. The script reads and writes files in place.
  - If the command fails, verify `bun` is installed and that `Documents/` exists.

## Editing Patterns
- **Markdown headers:** Keep the identifier comment as the very first line. Example:
  ```md
  <!-- Identifier: I-01-04-01 -->
  # Cementing Service Request
  ```
- **File naming:** Prefer the canonical `main.md`, `process.md`, `collaboration.md` for core docs inside each phase directory. Additional docs should be named descriptively and will auto-index from `04`.
- **Phase directories:** Follow existing numbering + hyphen convention (e.g., `01 - Some Phase/`). This ensures `getDirectoryNumber` produces stable segments.
- **Drafts:** New content under `Newly createed document/` should eventually be moved into the correct `Documents/` phase directory to inherit proper identifiers.

## Developer Workflows
- **Identifier generation:** Use the script before commits to keep IDs current after renames/additions.
- **Troubleshooting IDs:**
  - If a file lacks an identifier, the script will insert one.
  - If an identifier comment exists, the script replaces it, keeping it at the top.
  - Errors like `无法为文件 X 生成索引` indicate the file is not recognized in its directory map; ensure the file has `.md` extension and lives under `Documents/`.

## Integration & References
- **Legacy guides:** Many operational guides live under `SanjelDocuments - Metashare SVN/GuideLines/` and related subdirectories. Cite but avoid refactoring unless asked.
- **PDF4NET samples:** Under `SanjelDocuments - Metashare SVN/PrintingService/...` – informational only.

## Project-Specific Notes
- The repo is content-heavy; no build/test pipeline is defined here. The primary automation is the `bun`-run script for identifiers.
- Respect existing Chinese/English bilingual naming and comments; preserve language as-is when editing.
- When creating new phases or documents, mirror the directory and filename conventions so identifiers remain predictable.

## Examples
- Identifiers in `Documents/04 - Cementing Service Request/`:
  - `main.md` → `I-04-01`
  - `process.md` → `I-04-02`
  - `collaboration.md` → `I-04-03`
  - `0a - Deliver Material/` subfolder files will append their own two-character derived segment, then file index.

---
Feedback welcome: If any workflow (e.g., identifier derivation rules, phase numbering, or draft-to-canonical movement) is unclear or incomplete, tell me which directories/patterns need more detail and I’ll refine these instructions.