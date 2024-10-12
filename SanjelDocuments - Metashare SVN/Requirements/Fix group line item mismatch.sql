--Find the ticket details
select * from SERVICE_TICKETS where SERVICE_TICKET_NUMBER = 466317;
-- Find call sheet id
select top(1) * from CALLSHEET_HEADERS where CALL_SHEET_NUMBER = 1098280;

-- Find pricing details in service ticket
select * from STKT_LINE_ITEM_SCTNS where ROOT_ID = 1117670;
select * from STKT_GROUP_LINE_ITEM_SCTNS where ROOT_ID = 1117670;
-- Find pricing details in original call sheet
select * from CSH_LINE_ITEM_SCTNS where ROOT_ID = 1098285;
select * from CSH_GROUP_LINE_ITEM_SCTNS where ROOT_ID = 1098285;
-- Match the line item was overwriten down field.
-- align following columns call sheet vs ticket
SELECT [ID]
      ,[ROOT_ID]
      ,[PARENT_ID]
      ,[LINE_ITEM_CODE]
      ,[SECTION_ID]
      ,[LINE_ORDINAL]
      ,[IS_DISCOUNTABLE]
      ,[IS_COMPOSITE_UNIT]
      ,[PRICE_ITEM_ID]
      ,[PRICE_ITEM_NAME]
      ,[UNIT_OF_MEASURE_ID]
      ,[PRICE_ITEM_UNIT]
      ,[DESCRIPTION]
      ,[QUANTITY]
      ,[UNIT_PRICE]
      ,[PERCENT_DISCOUNT]
      ,[AMOUNT]
      ,[TRAVEL_BASE_CHARGE]
      ,[DEPTH_BASE_CHARGE]
      ,[APPLIED_TMA]
      ,[UNITS]
      ,[PER_UNITS]
      ,[ADJUSTED_DESCRIPTION]
      ,[ADJUSTED_QUANTITY]
      ,[ADJUSTED_UNIT_PRICE]
      ,[ADJUSTED_PERCENT_DISCOUNT]
      ,[ADJUSTED_AMOUNT]
      ,[ADJUSTED_TRAVEL_BASE_CHARGE]
      ,[ADJUSTED_DEPTH_BASE_CHARGE]
      ,[ADJUSTED_APPLIED_TMA]
      ,[ADJUSTED_UNITS]
      ,[ADJUSTED_PER_UNITS]
      ,[SERVICE_LINE_ID]
      ,[DISTRICT_ID]
      ,[IS_CUSTOMER_ITEM]
      ,[CREATED_STAGE]
      ,[VERSION]
      ,[LINE_ITEM_TYPE]
      ,[DISCOUNT_AMOUNT]
      ,[AFTER_DISCOUNT_AMOUNT]
      ,[TMA_AMOUNT]
      ,[NET_AMOUNT]
      ,[ADJUSTED_DISCOUNT_AMOUNT]
      ,[ADJUSTED_AFTER_DISCOUNT_AMOUNT]
      ,[ADJUSTED_TMA_AMOUNT]
      ,[ADJUSTED_NET_AMOUNT]
      ,[PARENT_SECTION_ID]
      ,[ADJUSTED_NET_PRICE]
      ,[NET_PRICE]
  FROM [dbo].[CSH_LINE_ITEM_SCTNS]
 CSH_LINE_ITEM_SCTNS where id = 469853;
SELECT [ID]
      ,[ROOT_ID]
      ,[PARENT_ID]
      ,[LINE_ITEM_CODE]
      ,[SECTION_ID]
      ,[LINE_ORDINAL]
      ,[IS_DISCOUNTABLE]
      ,[IS_COMPOSITE_UNIT]
      ,[PRICE_ITEM_ID]
      ,[PRICE_ITEM_NAME]
      ,[UNIT_OF_MEASURE_ID]
      ,[PRICE_ITEM_UNIT]
      ,[DESCRIPTION]
      ,[QUANTITY]
      ,[UNIT_PRICE]
      ,[PERCENT_DISCOUNT]
      ,[AMOUNT]
      ,[TRAVEL_BASE_CHARGE]
      ,[DEPTH_BASE_CHARGE]
      ,[APPLIED_TMA]
      ,[UNITS]
      ,[PER_UNITS]
      ,[ADJUSTED_DESCRIPTION]
      ,[ADJUSTED_QUANTITY]
      ,[ADJUSTED_UNIT_PRICE]
      ,[ADJUSTED_PERCENT_DISCOUNT]
      ,[ADJUSTED_AMOUNT]
      ,[ADJUSTED_TRAVEL_BASE_CHARGE]
      ,[ADJUSTED_DEPTH_BASE_CHARGE]
      ,[ADJUSTED_APPLIED_TMA]
      ,[ADJUSTED_UNITS]
      ,[ADJUSTED_PER_UNITS]
      ,[SERVICE_LINE_ID]
      ,[DISTRICT_ID]
      ,[IS_CUSTOMER_ITEM]
      ,[CREATED_STAGE]
      ,[VERSION]
      ,[LINE_ITEM_TYPE]
      ,[DISCOUNT_AMOUNT]
      ,[AFTER_DISCOUNT_AMOUNT]
      ,[TMA_AMOUNT]
      ,[NET_AMOUNT]
      ,[ADJUSTED_DISCOUNT_AMOUNT]
      ,[ADJUSTED_AFTER_DISCOUNT_AMOUNT]
      ,[ADJUSTED_TMA_AMOUNT]
      ,[ADJUSTED_NET_AMOUNT]
      ,[PARENT_SECTION_ID]
      ,[ADJUSTED_NET_PRICE]
      ,[NET_PRICE]
  FROM [dbo].STKT_LINE_ITEM_SCTNS where ID = 2628486;

  -- copy value back to service ticket line item
  -- in this example, Indicate Dye line item was overwritten by SURFACEmix Pro + Additives bundle item.
  -- Move value back to original, make adjusted values as 0
  -- Then go back to approval to update the ticket again
  Update STKT_LINE_ITEM_SCTNS set SECTION_ID = 0,
  IS_DISCOUNTABLE = 1,
  PRICE_ITEM_ID = 1025651,
  price_item_name = 113197,
  UNIT_OF_MEASURE_ID=10,
  PRICE_ITEM_UNIT='m3',
  DESCRIPTION='Indicator Dye',
  QUANTITY=1,
  UNIT_PRICE=186,
  PERCENT_DISCOUNT=72.12,
  amount=186,
  [ADJUSTED_PERCENT_DISCOUNT]=0,
  ADJUSTED_AMOUNT = 0,
  LINE_ITEM_TYPE = 1,
  DISCOUNT_AMOUNT = 116,
  AFTER_DISCOUNT_AMOUNT = 70,
  NET_AMOUNT = 70, 
  ADJUSTED_DISCOUNT_AMOUNT = 0,
  ADJUSTED_AFTER_DISCOUNT_AMOUNT = 0,
  ADJUSTED_NET_AMOUNT = 0,
  NET_PRICE = 70
   where id=2628486;

   Update STKT_GROUP_LINE_ITEM_SCTNS set NET_AMOUNT = 22391.25, AFTER_DISCOUNT_AMOUNT=22391.25 where id = 293182;

   update SERVICE_TICKETS set FIELD_ESTIMATE = 22391.25 where id = 1117670;
    