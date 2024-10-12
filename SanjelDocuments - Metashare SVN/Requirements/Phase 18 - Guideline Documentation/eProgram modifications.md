This document has not been detailed. Don't use it for now.



The following items should import to the eProgram

-   Multiwell -- Yes or No
-   Well Count -- a number
-   Bid Program -- Yes or No
-   Pilot Test -- Yes or No
-   Field Blend Test -- Yes or No
-   Risk Matrix -- A number
-   Wellbore Fluid
    -   Fluid Type
    -   Density
    -   Mud H2S Concentration

These values are currently located in the eProgram Header page:

![eprogram_import](https://user-images.githubusercontent.com/55812393/70360817-cb87cb00-183c-11ea-8cbf-02fbc1311f9c.png)

These items should be available in the eProgram and data warehouse for the BI.

The Risk Matrix Score will need to be visible in the Rig Board

***Revisions***

Currently when a revision is created, a new number is created and imported. In this way, the system does not know that this is a revision and causes confusion with the proper program number.

When a revision is created, the same PRG number should remain, and a revision number be added to this number.

There may be multiple revisions per PRG

When looking in the BI:

-   Number of revisions per PRG should be available for display

-   Number of PRG with and without Revisions should be countable

Creating a Call Sheet:

-   The call sheet should be created by PRG and not require revision number

-   If a call sheet is created for a PRG with a revision, the latest revision should be selected, with the option to select other revisions, if available

-   If a call sheet has already been started when a revision is made, a notification will be made to dispatch when they are working with the call sheet that they need to update the call sheet since a revision has been created

    -   They should be shown all the changes in a window

    -   They should maintain all the information that is entered and not imported

        -   Eg. Directions to location

    -   They should accept the changes

    -   They cannot ignore the changes, if they do not accept the changes the call sheet cannot move forward

    -   There needs to be a way that after a revision has modified a call sheet, that other revisions can be used to create the call sheet

        -   For example:

            -   A program is created

            -   A revision is created

            -   A call sheet is created

            -   A 2^nd^ revision is created

            -   A 3^rd^ revision is created

            -   The call sheet is updated to revision 3

            -   It is decided that revision 2 is the right design, so we revert the call sheet to the 2^nd^ revision
