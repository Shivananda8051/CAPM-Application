using { shiva.db.master as master, shiva.db.tranasation} from '../db/data-model';


service CatalogService @(path:'CatalogService') {
    entity BusinesspatnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;
    entity EmployeeSet as projection on master.Employee;
    entity ProductSet as projection on master.product;
    entity POItems as projection on tranasation.poitems 
    actions  {
        action boost() returns POs;
        function largestOrder() returns POs;
    }; 
    entity POs as projection on tranasation.poitems {
            *,
            PARTNER_KEY,
            PRODUCT_GUID,
            PARTNER_KEY.PO_ID as PO_ID,
            PARTNER_KEY.OVERALL_STATUS as OVERALL_STATUS,
            PARTNER_KEY.PARTNER_GUID.COMPANY_NAME as COMPANY_NAME,
            PARTNER_KEY.PARTNER_GUID.ADDRESS_GUID.COUNTRY as COUNTRY,

            case PARTNER_KEY.OVERALL_STATUS
                when 'NE' then 'New'
                when 'OK' then 'Approved'
                when 'CL' then 'Closed'
            else 'In Process'
            end as OverallStatusText : String(20),

             case PARTNER_KEY.OVERALL_STATUS
                when 'NE' then 0
                when 'OK' then 2
                when 'CL' then 3
                else 1
            end as ColorCoding : Integer,
    } actions {
        @cds.odata.bindingparameter.name:'_shiva'
        @Common.SideEffects: {
            TargetProperties: [ '_shiva.GROSS_AMOUNT']
        }
        action boost() returns POs;
        function largestOrder() returns POs;
    }
}
