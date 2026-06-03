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
            PARTNER_KEY.PO_ID as PO_ID,
            PARTNER_KEY.PARTNER_GUID.COMPANY_NAME as COMPANY_NAME,
    };
}
