namespace shivadb.commons;
using { Currency } from '@sap/cds/common';


type gender : String(1) enum {
    male = 'M';
    female = 'F';
    notdisclosed = 'U'
};

type AmountT : Decimal(10,2)@(
    Semantic.amount.currencyCode: 'currency_code',
    sap.unit: 'currency_code'
);

aspect Amount : {
    CURRENCY : Currency;
    GROSS_AMOUNT : AmountT @(title: 'Gross Amount');
    NET_AMOUNT: AmountT @(title: 'Gross Amount');
    TAX_AMOUNT : AmountT @(title: 'Tax Amount');
}; 

type id_type : String(32);

type PhoneNumber : String(32)@assert.format: '^[6-9]\d{9}$';

type EmailAddress: String(30)@assert.format : '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';

aspect address {
    HOUSENO : Int16;
    STREET : String(35);
    CITY : String(25);
    COUNTRY : String(12);
};
