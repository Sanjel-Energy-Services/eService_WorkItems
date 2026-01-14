Below is a **clear, assertive, high‑detail narrative** distilled from your transcript, focused specifically on the **test case writing process** for the QA team. I’ve removed informal talk and reorganized the content into a practical guide you can apply immediately.

***

# Test Case Authoring — Narrative Guidance for QA

*(Derived from the 2016‑01‑12 discussion; scope: process for writing test cases)*

## 1) Why the “Main Test Case” (Happy Path) Comes First

A well‑defined **main test case** is the backbone of all testing. It represents the **most common, ideal end‑to‑end path** through the feature, with correct data, no validation errors, and the expected UI behavior.  
**Rule:** Until the main test case is correct and complete, variant cases will be inconsistent and ambiguous.

**What the main case includes**

*   **Preconditions**: concrete, verified data setup (e.g., bins exist, capacities known, environment refreshed, program imported).
*   **Sequential steps**: every user action and system reaction from start to save.
*   **Expected results at each step**: what appears, what auto‑populates, what lists are populated, what remains unchanged.
*   **Postconditions**: where records should appear (grids, menus), what printed artifacts show (load/batch request), and any downstream integration footprints (e.g., lab).

***

## 2) Data Preparation and Preconditions

**A test is only as good as its input data.** Prepare and document preconditions **before** writing steps.

**Examples of preconditions for scheduling a blend request**

*   **Program ID + Revision exist** and are available in the current environment (TEST/UAT); if the program is imported, note the import as a precondition.
*   **Rig + Bin master data** exist and are **correct**. For bins:
    *   Capacity is **set and non‑zero** (if absent, the flow cannot proceed and this is a defect).
    *   For multi‑pod bins, pod information (names/volumes) is established or explicitly empty per scenario.
*   **Environment alignment**: database refresh applied to the target environment; scripts executed if a branch requires schema changes.
*   **Known test data identifiers** (e.g., PRG numbers) are listed so testers can reproduce.

**Assertive guidance**

*   If a precondition cannot be met (e.g., bin capacity reads zero due to a data/assign‑bin defect), **stop** the happy path, **log a bug**, and **do not workaround** in the main test case.

***

## 3) Writing Steps and Expected Results (Granular and Unambiguous)

**Principle:** Every step must have a **specific, observable expected result** tied to the system logic.

**Illustrative pattern for “Schedule Blend Request”**

1.  **Open the action** (e.g., context menu → *Schedule Blend Request*).  
    **Expected:** Modal opens with defined defaults:
    *   Program/Revision empty or defaulted per design.
    *   Bin auto-filled if launched from a specific bin context; otherwise not.
    *   Fields like “Blank Test” unchecked until user selection.
2.  **Enter Program ID + Revision**.  
    **Expected:**
    *   **Customer Name auto‑displays** based on Program.
    *   **Job Type list populates** (non‑empty if Program is valid).
    *   **Other sections remain unchanged** at this point.
3.  **Select Job Type**.  
    **Expected:**
    *   **Base Plan list populates** from Job Type.
    *   No other visible fields change yet.
4.  **Select Base Plan**.  
    **Expected:**
    *   Dependent fields populate (e.g., Blend details).
    *   Defaults like Base selection may appear.
5.  **Adjust quantities/times** (e.g., enter base tonnage, total time).  
    **Expected:**
    *   Calculations update predictably (e.g., base = 10 → derived field updates to 10.185).
    *   **Numeric formatting** enforces standard precision (e.g., 3 decimal places; detect/flag inconsistent 5‑decimal outputs as defects).
6.  **Optional comment** entry.  
    **Expected:** Persisted on save.
7.  **Save**.  
    **Expected:**
    *   Success confirmation.
    *   Record appears on the main grid with **total values** (e.g., total quantity vs. base).
    *   Postconditions (below) verify broader effects.

**Important:** Document **what populates automatically**, **what lists must be non‑empty**, and **what stays unchanged** at each step. Do **not** hard‑code transient numeric values into expected results; instead, describe **format rules, derivation logic, and relationships** (e.g., “derived quantity = function of base input; displays with 3 decimal places”).

***

## 4) Postconditions and Linked Verifications

After save, you must **verify the outcome beyond the modal**:

*   **Data Grid / Board**: The new record appears under the correct entity (e.g., bin, program, job). Document columns, totals, and statuses that must display.
*   **Menus / Navigation**: The item is accessible in all expected menu paths and levels.
*   **Print Artifacts** (e.g., load sheet / batch request): Assert the document renders with correct identifiers, derived numbers, and standard formatting.
*   **Integration Footprints**:
    *   If the request triggers downstream **lab test** creation (for “test‑flagged” scenarios with requirements), link to the **integrated test case** that validates creation and lab database state.

Structure postconditions as a checklist or table, and **link** to separate, focused test cases for grids, menus, printouts, and integrations.

***

## 5) Variants: Build from the Main Case, Don’t Rewrite

Variants inherit steps 1..N from the main case and **branch only where behavior diverges**. Copy the main case and **modify minimal steps**:

### A) UI Interaction Variants

*   **Tonnage Calculation toggle**: switch between *Base* and *Total Time*; verify recalculation, persistence, and formatting; **no save** needed if the variant’s goal is UI behavior only—end the case after verifying UI.
*   **Checkbox/Mode switches**:
    *   *Go with Crew*: Bin offloading fields disappear; travel/time fields governed by crew schedules; verify UI state changes and validation.
    *   *Load Existing Haul*: Main haul fields suppressed; selection constrained to existing hauls; verify pod availability constraints (occupied pods unavailable).
    *   *Third Party*: Only third‑party lists appear; verify role‑appropriate fields and validation.

### B) Data Availability Variants (Negative/Boundary)

*   **No Call Sheet list**: flow **must not proceed**; assert blocking validation.
*   **Rig without Bin**: **cannot schedule** (no destination); assert clear error messaging and blocked save.
*   **Multi‑pod bins**: verify distribution rules; sums across pods **equal** scheduled total; saving requires **all mandatory pod fields**.

### C) Test Flag / Requirements Variants

*   **No Test Flag**: identical to base scheduling; save with flag unset.
*   **Test Flag + No Requirements**: record saved with flag; no downstream creation.
*   **Test Flag + Requirements**: trigger integrated flow; schedule in the primary module, then **link** to lab test creation verification.

***

## 6) Assign Bin Use Case (as a Testing Precondition)

When a scenario depends on assigned bins, treat **Assign Bin** as either:

*   A separate **precondition test case** (preferred for repeatability), or
*   An **explicit data setup step** documented before the main case.

**Assertive checks**

*   **Capacity must be non‑zero** and visible (hover/tooltip or field); if capacity displays as zero while master data shows otherwise, **log a bug** (likely data propagation/side effect issue).
*   For **multi‑pod bins**, naming and per‑pod capacity must be established; distribution validation occurs in variants.

***

## 7) Formatting, Precision, and Consistency Rules

*   **Numeric precision**: enforce standard (e.g., 3 decimals). Mixed precision (e.g., grid shows 3 decimals, tooltip shows 5) is a **defect**.
*   **Status and format expectations**: Expected results should assert **formatting standards**, **states**, and **relationships**, not transient literal values.

***

## 8) Flowcharts: Ensure Coverage Before Writing Cases

Draw the **full decision flow** (e.g., Schedule Blend Request and Product Haul). Identify every branch:

*   With/without bin
*   Go with crew vs. load existing haul vs. third party
*   Haul all vs. partial distribution
*   Test flag with/without requirements
*   Program‑created vs. Call‑sheet‑created contexts (affects editable fields)

**Coverage directive:** Map each unique path to **at least one test case**. Use color‑coding to trace which cases cover which branches. Optimize for **minimal cases that cover all leaves**.

***

## 9) Naming, Structure, and Reuse Strategy

Adopt a consistent, hierarchical naming:

*   **Main**: `SBR-001 Main Happy Path (Program→Job Type→Base Plan→Save)`
*   **Variant UI**: `SBR-002 Toggle Total Time`
*   **Variant Data**: `SBR-003 Rig Without Bin (Negative)`
*   **Variant Multi‑Pod**: `SBR-004 Multi-Pod Distribution`
*   **Variant Test Flag**: `SBR-005 Test Flag (No Requirements)`
*   **Integrated**: `LAB-INT-001 Test Request Creation from SBR`

Each variant references the **main case up to the branch step**, then specifies only the differences.

***

## 10) Bug Logging — Evidence and Exact Failure Point

When a step fails:

*   Reference the **exact test case and step number**.
*   Provide **evidence** (screenshots, printouts, DB snapshots).
*   State the **expected rule** vs. **actual behavior** (e.g., “Job Type list must populate after Program+Revision; observed empty list”).
*   Avoid “easy/hard to fix” commentary; focus on reproducible failure and impact.

***

## 11) Common Pitfalls (Avoid Ambiguity)

*   **Mixing UI behavior with end‑to‑end save** in one case without purpose—separate **UI behavior** variants when the goal is interaction validation.
*   **Underspecified expected results** (“check load information”)—replace with concrete, observable statements tied to inputs and formatting.
*   **Skipping preconditions** (e.g., bin capacity) and compensating later—this undermines the main case; fix preconditions or log a defect.
*   **Hard‑coding transient numbers**—prefer **format/derivation assertions**.

***

## 12) Reusable Test Case Template (for QA)

```markdown
# [ID] Title
Module: [e.g., Schedule Blend Request]  
Purpose: [e.g., Validate main happy path with correct auto-population and save]

## Preconditions
- Environment: [TEST/UAT; DB refresh completed; scripts applied]
- Data:
  - Program: [ID, Revision] (imported/available)
  - Rig: [ID]
  - Bin: [ID], Capacity: [value], Pods: [list or none]
- User/Role: [permissions]

## Test Data (Inputs)
- Program ID: [value]
- Revision: [value]
- Job Type: [value]
- Base Plan: [value]
- Quantity/Time: [values]
- Flags: [e.g., Test Flag: On/Off]
- Comments: [text]

## Steps & Expected Results
1. Open [path/menu] → [action].
   - **Expected:** Modal opens with defaults [list].
2. Enter Program ID + Revision.
   - **Expected:** Customer auto-displays; Job Type list populates (non-empty).
3. Select Job Type.
   - **Expected:** Base Plan list populates; no other fields change.
4. Select Base Plan.
   - **Expected:** Blend details populate [fields]; defaults set.
5. Adjust quantity/time.
   - **Expected:** Derived fields recalc; **3-decimal precision** enforced.
6. Enter comments (optional).
   - **Expected:** Value retained.
7. Save.
   - **Expected:** Success; record created.

## Postconditions & Linked Checks
- Grid/Board: Record appears with totals/states [list]; link to `GRID-XXX`.
- Menus: Entry visible under [paths]; link to `MENU-XXX`.
- Print: Batch/Load sheet renders with IDs, numbers; link to `PRINT-XXX`.
- Integration (if applicable): Link to `LAB-INT-XXX`.

## Notes
- Validation messages: [if any]
- Known differences across environments: [if any]

## Result
- Pass/Fail
- Evidence: [attachments/paths]
```

***

## 13) Immediate Actions for QA

1.  **Draft the main happy path** for *Schedule Blend Request* using the template above and the rules in Sections 2–4.
2.  **Create targeted variants** for UI toggles, data negatives (no bin, empty lists), multi‑pod distribution, and test‑flag flows.
3.  **Define postcondition checks** as linked cases (grid, menu, print, integration) and reuse them across features.
4.  **Draw/update the flowchart** and confirm full branch coverage before adding new cases.
5.  **Standardize numeric precision assertions** (e.g., 3 decimals across UI/print/tooltips).

***

## Would you like me to:

*   Generate a **Word or Excel test case pack** using this template for *Schedule Blend Request* and the key variants?
*   Produce a **flowchart diagram** (and PNG) for the full branch coverage you can annotate?

If you want those, tell me your preferred format (Word, Excel, or both) and I’ll create the files for download.
