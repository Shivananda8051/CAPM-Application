namespace shiva.db;

using { cuid,Currency  } from '@sap/cds/common';

using {shivadb.commons } from './commons';

context master {
    entity businesspartner {
        key NODE_KEY: commons.id_type;
        BP_ROLE: String(2);
        EMAIL_ADDRESS: String(25);
        PHONE_NUMBER : String(25);
        FAX_NUMBER: String(25);
        WEB_ADDRESS: String(25); 
        ADDRESS_GUID : Association to address;
        BP_ID: String(42);
        COMPANY_NAME: String(50) @title : '{i18n>COMPANY_NAME}';
    }
    entity address{
        key NODE_KEY: commons.id_type;
        CITY : String(32);
        POSTAL_CODE: String(32);
        STREET : String(32);
        BUILDING: String(32);
        COUNTRY: String(35) @title: '{i18n>COUNTRY}';
        ADDRESS_TYPE : String(32);
        VAL_START_DATE: Date;
        VAL_END_DATE : Date;
        LATTITUDE : Decimal;
        LANGITUDE: Decimal;
        businesspartner : Association to one businesspartner on businesspartner.ADDRESS_GUID = $self;
    }
    entity product {
        key NODE_KEY: commons.id_type;
        PRODUCT_ID: String(25);
        TYPE_CODE: String(22);
        CATEGORY : String(32);
        DESCRIPTION: localized String(200) @title: '{i18n > PRODUCT_NAME}';
        SUPPLIER_GUID: Association to master.businesspartner;
        TAX_TARFIC_CODE: Integer;
        MEASURE_UNIT : String(32);
        WEIGHT_UNIT : String(5);
        WEIGHT_MEASURE: Decimal(5,2);
        CURRENCY_CODE : String(4);
        PRICE : Decimal(15,2);
        WIDTH: Decimal(5,2);
        HEIGHT : Decimal(5,2);
        DEPTH: Decimal(5,2);
        DIM_UNIT : String(5);

    }
    entity Employee : cuid{
        nameFirst : String(40);
        nameMiddle : String(40);
        nameLast : String(40);
        nameInitials: String(40);
        sex: commons.gender;
        language : String(2);
        phoneNumber: commons.PhoneNumber;
        email: commons.EmailAddress;
        loginName: String(40);
        Currency : Currency;
        salaryAmount: commons.AmountT;
        accountNumber: String(12);
        bandId: String(8);
        bankName:String(64);
    }
} 
context tranasation {
    entity purchaseOrder : commons.Amount {
        key NODE_KEY : commons.id_type @title: '{i18n>NODE_KEY}';
        PO_ID : String(10) @title: '{i18n>PO_ID}';
        PARTNER_GUID: Association to master.businesspartner @title: '{i18n>PARTNER_GUID}';
        LIFECYCLE_STATUS: String(1);
        OVERALL_STATUS: String(2) @title: '{i18n>OVERALL_STATUS}';
        Items:Association to many poitems on Items.PARTNER_KEY=$self;
    }
    entity poitems : commons.Amount {
        key NODE_KEY:commons.id_type @title : '{i18n>NODE_KEY}';
        PARTNER_KEY : Association to purchaseOrder;
        PO_ITEM_POS: Integer @title: '{i18n>PO_ITEM_POS}';
        PRODUCT_GUID: Association to master.product @title: '{i18n>PRODUCT_GUID}';
    }
}