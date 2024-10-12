Release script

--2. Add Water based blend recipe to database, create script --????
1. Add Cubic Meters and Tonnes to BlendAdditiveMeasureUnit database - Manually
	Cubic Meters - m3 - Volume -  Metric
	Tonnes - t - Weight - Metric
2. Add BVOB to Addition Method - Manually
3. Add WaterBase to AdditiveBlendMethod - Manually
1. Add Wellseal PRO + Additives for whole set blend data
	- Add Product
	- Add BlendRecipe
	- Add BlendChemical
Update Fake IIN number for Visweep DM/Visweep DM IS -- manually FIINVDMIS / FIINVDM
6. Add Fake  product for Visweep DM IS and water based product -- "Add price for fake iin items.sql"
-- 7. Modify Liquid based blend recipe to be BVOB -- this taske is done by next step
	- Visweep DM IS + Additives 
	- Visweep DM + Additives 
	- Fresh Water + Additives 
	- Wellseal PRO + Additives 
	- Invert Spacer + Additives 
	- Water Wet Max + Additives    
	- Visweep + Additives 
	- Base Oil + Additives 
	- Indicator Dye  + Additives 
8. Update Recipe units -- ChangeBaseSectionUnitInRecipe.sql -- verify system_id first
9. UPdate Blend Bulk Density -- UPdate Blend Bulk Density.sql
10.Update Additives Bulk Density -- Update Additives Bulk Density.sql