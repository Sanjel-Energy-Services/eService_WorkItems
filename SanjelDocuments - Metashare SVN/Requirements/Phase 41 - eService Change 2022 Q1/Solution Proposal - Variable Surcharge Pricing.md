## Variable Surcharge Pricing

When the oil price is changing largely and frequently, the fuel gas price may led to a big loss to us. Sales would like to implement a surcharge approach to be flexible to the market change.

- Surcharge pricing will be added in program level.
- The surcharge rate can be updated by sales based on current market anytime.
- The surcharge can be carried over through whole business process from program to the service ticket.
- The surcharge rate can be updated to latest price in price book in any stage.



### Proposed solution

- Implement a flag "IsVariableItem" in price item in price book, default is false.

- Add Pumper surcharge and Deliver & Handling surcharge price items for all pricing area in Price Book which "IsVarialeItem" is true, and non-discountable.

- Surcharge price can be updated by sales manually in eService admin UI.

- The surcharge pricing line will be added in program if applicable, it will be imported to eProgram as is.

- When dispatch is creating a call sheet from a program, eService will carry over the surcharge price in program to Est. Net Price as normal. If the price item is a variable item, eService will get the latest price from price book and fill it it in "Adj. Net Price" automatically.

- The "Adj .Net Price" is always editable to allow dispatch/supervisor to revise if needed.

   

## Necessary Operation Practice 

- eService needs a restart to load up the latest price book change. We suggest a toughbook reboot to be a mandatory pre-job action.



## UI Mock up

