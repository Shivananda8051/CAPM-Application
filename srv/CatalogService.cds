using { shiva.db.master as master, shiva.db.tranasation} from '../db/data-model';


service CatalogService {
    entity BusinesspatnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;
    entity employeSet as projection on master.employees;
    entity ProductSet as projection on master.product;
    entity Pos as projection on tranasation.poitems;
    entity POItems as projection on tranasation.poitems;
}