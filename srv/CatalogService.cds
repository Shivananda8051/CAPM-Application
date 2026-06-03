using { shiva.db.master as master, shiva.db.tranasation} from '../db/data-model';


service CatalogService @(path:'CatalogService') {
    entity BusinesspatnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;
    entity EmployeeSet as projection on master.Employee;
    entity ProductSet as projection on master.product;
    entity Pos as projection on tranasation.poitems 
    actions  {
        action boost() returns Pos;
        function largestOrder() returns Pos;
    };
    entity POItems as projection on tranasation.poitems;
    entity POs as projection on tranasation.purchaseOrder;
}
