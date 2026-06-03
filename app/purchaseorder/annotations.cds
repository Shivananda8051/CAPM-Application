using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(

    UI.SelectionFields: [
        NODE_KEY,
        PO_ID,
        COMPANY_NAME,
        GROSS_AMOUNT,
        NET_AMOUNT,
        TAX_AMOUNT
    ],
);