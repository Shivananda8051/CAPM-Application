namespace shiva.cds;

using { shiva.db.master as master, shiva.db.tranasation} from '../db/data-model';

context CDSViews {
    define view![POWorklist] as select from tranasation.purchaseOrder
    {
        key PO_ID as![PurchaseOrderNo],
        key Items.PO_ITEM_POS as![Position],
        PARTNER_GUID.BP_ID as![PatnerId],
        PARTNER_GUID.COMPANY_NAME as ![CompanyName],
        Items.GROSS_AMOUNT as ![GrossAmount],
        Items.NET_AMOUNT as ![NetAmount],
        Items.TAX_AMOUNT as ![TaxAmount],
        OVERALL_STATUS as ![Status],
        case OVERALL_STATUS
            when 'A' then 'Approved'
            when 'R' then 'Rejected'
            when 'N' then 'New'
            when 'D' then 'Delivered'
            when 'P' then 'Pending'
            else 'In Process'
        end as ![StatusText],

        Items.PRODUCT_GUID.DESCRIPTION as ![Product],
        PARTNER_GUID.ADDRESS_GUID.COUNTRY as ![Country],

        
    };
    define view![ProductSales] as 
        select from master.product {
            @EndUserText.label: [
                {
                    language: 'en',
                    text: 'Product ID'
                },
                {
                    language: 'de',
                    text: 'Produkt ID'
                },
                {
                    language: 'fr',
                    text: 'ID du produit'
                }
            ]
            PRODUCT_ID as ![ProductId],
            DESCRIPTION as ![Description],
        };

    define view![itemView] as 
        select from tranasation.poitems {
            PARTNER_KEY.PARTNER_GUID.NODE_KEY as ![vendorId],
            PRODUCT_GUID.NODE_KEY as ![productId],
            CURRENCY as ![Currency],
            GROSS_AMOUNT as ![GrossAmount],
            NET_AMOUNT as ![NetAmount],
            TAX_AMOUNT as ![TaxAmount],
            PARTNER_KEY.OVERALL_STATUS as ![overallStatus],
        }

    define view ProductOrders as select from master.product 
    mixin {
        ORDERS: Association[*] to itemView on ORDERS.productId = $projection.ProductKey
    } into {
         
        NODE_KEY as ![ProductKey],
        DESCRIPTION as ![ProductName],
        PRICE as ![Price],
        CURRENCY_CODE as ![Currency],
        ORDERS.GrossAmount as ![GrossAmount],
        SUPPLIER_GUID.ADDRESS_GUID.CITY as ![City],
        SUPPLIER_GUID.ADDRESS_GUID.COUNTRY as ![Country],   
        SUPPLIER_GUID.COMPANY_NAME as ![SupplierName],
        ORDERS as![ProductOrders]
    }

    define view![ProductAnalytics] as select from ProductOrders {
        ProductName as ![ProductName],
        City as ![City],
        round(sum(ProductOrders.GrossAmount), 2) as ![TotalGrossAmount],
        count(*) as ![TotalOrders],
    } group by ProductName, Country, ProductOrders.Currency;
}