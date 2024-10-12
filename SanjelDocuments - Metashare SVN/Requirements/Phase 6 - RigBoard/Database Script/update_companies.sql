-----20171102  Oliver
alter table companies add (SHORT_NAME VARCHAR2(200));


-----20171124  Oliver
update companies set SHORT_NAME='' where SHORT_NAME='#N/A';