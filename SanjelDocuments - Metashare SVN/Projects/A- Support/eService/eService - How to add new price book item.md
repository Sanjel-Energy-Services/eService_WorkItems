# How to add new price book item

1. Price code request is send by Client Solutions manager.  Will give following details:
   - Category
   - Heading/Sub-heading
   - Price Book & E-Service Description
   - Invoice Printout description
   - UOM
   - Pricing for all pricing areas. Area 6 always POR.
   - Is Discountable
   - Is Travel Charge
   - Is Depth Charge
   - GL Code
   - Customer if customer specific code
2. Look through existing price codes under same header, find a not used candidate code. Since the price code was not assigned in certain pattern, so it is better use follow the printout and make database query.
3. Find a price code item which is similar to the new requested item.
4. Open eService, click menu "Admins->Price Items".
5. Search the similar code in eService and choose Area 1 item and click "Copy & Add"
6. Replace the values from new requested price item and click "Save".
7. Search the new code, the newly added record should show up.
8. Select and record, and click "Copy & Add".
9. Change Pricing Area, and fill in the price for the pricing area.
10. Repeat step 8 and 9 until all pricing area are processed.



If the new price code is for material, normally the corresponding blend need to be added to Blend Master Database.



Please refer to document "How to add a Blend/Additive".