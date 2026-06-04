
using { shiva.db.master as master, shiva.db.tranasation } from '../db/data-model';
service CatalogService @(path:'CatalogService', requires: 'authenticated-user') {
    @Capabilities : { Deletable, }
    entity BusinesspatnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address; 
    entity EmployeeSet @(restrict:[
        {
            grant: 'READ',
            to: 'Viewer',
            where: 'bankName in $user.BankName'
            
        },
        {
            grant: ['READ', 'WRITE'],
            to:'Admin'
        }
    ]) as projection on master.Employee;
    entity ProductSet as projection on master.product;
    @cds.redirection.target
    entity POItems as projection on tranasation.poitems;
    function getDefaultValues() returns POs;
    entity POs @(
        odata.draft.enabled: true,
        Common.DefaultValuesFunction: 'getDefaultValues'
    ) as projection on tranasation.purchaseOrder {
        *,
        Items,
        PARTNER_GUID.COMPANY_NAME as COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY as COUNTRY,
        virtual null as OverallStatusText : String(20),
        virtual null as ColorCoding : Integer

    } actions {
        @cds.odata.bindingparameter.name:'_shiva'
        @Common.SideEffects: {
            TargetProperties: ['_shiva/GROSS_AMOUNT','_shiva/COMPANY_NAME', '_shiva/COUNTRY'],
        }
        action boost() returns POs;
        function largestOrder() returns POs;
    };

}
