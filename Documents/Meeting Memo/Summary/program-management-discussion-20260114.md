> Date & Time:  2026-01-14 10:33:51
> Location: [Insert Location]
> Attendees: [Insert Names]
## Overview
This document summarizes two related meetings held on January 14, 2026, concerning the development of new workflows. The first part details the lifecycle of a new ticketing system, covering statuses from creation ("Open") to final approval, including assignment, review, and various approval types (Conditional, Technical, Commercial). The second part focuses on the approval workflow for a program request, distinguishing between conditional and final approvals, outlining the sales pricing process using a new tool, and defining how design adjustment requests are handled.
## Key Topics
- A new ticket is automatically created with a status of "Open" when a request email is received.
- When assigned to an engineer, the ticket status changes to "Assigned."
    - The team discussed whether the ticket should then enter an "Unacknowledged" state until the assigned engineer accepts it. The overlap between "Assigned" and "Unacknowledged" was identified as a point of confusion.
- The notification for an assigned ticket will be sent to the entire team, but only the assigned engineer will receive buttons to "Accept," "Decline," or "Reassign."
    - Other team members will receive a read-only notification.
- If an engineer accepts the ticket, the status changes to "Acknowledged."
- If an engineer declines the ticket, it goes back to an "Open" status or is reassigned to a manager like Jeremy for manual handling.
- An engineer can also "Reassign" the ticket to someone else, such as an on-call team member.
- The team agreed that the "In-Progress" status should be triggered automatically.
- This will occur when the assigned engineer opens the "data auditor" tool to begin the first step of their work, which is to validate the imported data against the state diagram.
- A button labelled "Send for Review" will trigger the review process, changing the ticket status to "Awaiting Review." "Send for Review" is an action, not a status itself.
- The review request is sent to a group, not an individual.
- The team considered adding more granular statuses like "Review Started" but decided to keep it simple for now.
- The outcome of the review will result in one of two statuses: "Review Passed" or "Review Failed."
    - If the review fails, the ticket is returned to the assigned engineer to continue work. The assignee of the ticket does not change during the review process.
- The approval process is similar to the review process, where an action ("Send for Approval") changes the status to "Awaiting Approval."
- The discussion highlighted three types of approval: Conditional, Technical, and Commercial.
    - It was noted that this is similar to existing multi-level job approval processes and can be managed with sequential or skippable steps.
- There is a need to differentiate between these approval types, as access rights may be restricted based on the approval status (e.g., conditional approval may limit who can view the item).
- The team discussed how to handle approvals when there is missing information from the client (CLAN). Even if a program is approved, any subsequent changes from the client will require the process to be restarted.
- A distinction was made between "conditional" and "final" approval to prevent call sheets from being created for programs that are not finalized.
- A "conditional" flag will be used instead of a separate status. This flag will be visible as a question mark icon, while a final approval will be a checkmark.
- Only the engineering department approver (e.g., Jeremy or Warren's role) will have the ability to set the approval type to conditional. Other stakeholders will be able to see the conditional status and understand the associated risk of potential changes.
- Once engineering completes the job design and approves the program, it is sent to Sales for pricing. The status will change to "Awaiting Pricing."
- Sales will use a new pricing tool to review and adjust the pricing. When a sales user opens this tool, the status will change to "Pricing."
- The pricing tool should allow sales to calculate the price based on PCPR (Price-Cost-Profit Ratio) or calculate the PCPR based on a desired price. Sales will adjust the blend cost to meet price expectations.
- After adjusting the price, Sales will have two options:
    - **Save:** This action finalizes the pricing.
    - **Request for Adjustment:** This sends the program back to the engineering team for a redesign, typically to lower costs by using different materials or methods.
- If Sales requests an adjustment, the program goes back to the engineering team.
- Any adjustment, such as a change to the blend, will require the entire approval process to be restarted from the beginning, as it impacts cost, materials, and labour. All previous approvals will be wiped.
- The immediate goal is to define the workflow up to the "Program Ready" status, which is achieved after Sales saves the pricing. This scope is targeted for the engineering group and Phase 1.
- Further steps, such as "Release to Client" and "Release to Operations," were discussed but ultimately deferred to a later phase to avoid scope creep.
- There is a need to improve customer-facing documents like the service report and service ticket. A new, better-designed layout was suggested.
- The team also mentioned the need to integrate the creation and saving of documents, like call sheets and service tickets, into SharePoint automatically.
## Open Issues & Risks
- The exact wording for the "Acknowledged" status needs to be finalized with the engineering team.
- The logic for handling a ticket when the assigned person does nothing for an extended period remains unclear. A timeout rule based on priority was mentioned but not defined.
- It is unclear how the system will handle a scenario where a ticket is sent to a group, one person is assigned, that person does nothing, and the other four decline it.
- It is unclear how a "conditional" approval status will trigger notifications for follow-up with the client to confirm final details.
- The workflow becomes "muddy" once the program moves from engineering to sales, indicating a need for clear process definition in this handoff area.
- There is a risk associated with how a program is split into a "job design" piece and a "pricing" piece, and then merged back together into a single client-facing document.
## Action Items
- [ ] Draw up the interface and logic for the sales pricing tool.
- [ ] Talk to Kevin to determine if the sales process requires its own approval step.
- [ ] Talk to Melanie to get a budget for the proposed workflow and tool development.

> **AI Suggestion**
> AI has identified the following issues that were not concluded in the meeting or lack clear action items; please pay attention:
> 1.  **Significant Project Risk with "Conditional" Approvals:** The proposed "conditional" approval process introduces a major risk of project rework. If a client provides final details after a conditional approval, the entire approval chain is wiped, and the process must restart from the beginning. This fundamental flaw could cause significant delays and wasted effort, and a clear mitigation strategy or alternative workflow needs to be defined.
> 2.  **Undefined Sales Pricing Tool and Handoff Process:** The project's success is critically dependent on a new sales pricing tool and a clear handoff process from engineering to sales, yet both are completely undefined. The interface, logic, and timeline for the tool are unknown, and the workflow for how sales manages pricing separately before merging it back with the engineering design is described as "muddy." This ambiguity puts the entire engineering-to-sales transition at risk.
> 3.  **Unclear Ticket Assignment and Inactivity Logic:** The core workflow for ticket management is unresolved. There is no clear process for handling what happens when a ticket is assigned to a group but not acted upon, or when an individual assignee is inactive. The lack of defined timeout rules and the ambiguity between an "Assigned" and a potential "Unacknowledged" status could lead to dropped tickets and missed service-level agreements (SLAs).