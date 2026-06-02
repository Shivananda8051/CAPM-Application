using CatalogService as service from '../../srv/CatalogService';
// annotate service.Pos with @(
//     UI.FieldGroup #GeneratedGroup : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'CURRENCY_code',
//                 Value : CURRENCY_code,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : GROSS_AMOUNT,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : NET_AMOUNT,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : TAX_AMOUNT,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'NODE_KEY',
//                 Value : NODE_KEY,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'PO_ITEM_POS',
//                 Value : PO_ITEM_POS,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'PRODUCT_GUID_NODE_KEY',
//                 Value : PRODUCT_GUID_NODE_KEY,
//             },
//         ],
//     },
//     UI.Facets : [
//         {
//             $Type : 'UI.ReferenceFacet',
//             ID : 'GeneratedFacet1',
//             Label : 'General Information',
//             Target : '@UI.FieldGroup#GeneratedGroup',
//         },
//     ],
//     UI.LineItem : [
//         {
//             $Type : 'UI.DataField',
//             Label : 'NODE_KEY',
//             Value : NODE_KEY,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'CURRENCY_code',
//             Value : CURRENCY_code,
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : GROSS_AMOUNT,
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : NET_AMOUNT,
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : TAX_AMOUNT,
//         },
//     ],
// );

// annotate service.Pos with {
//     PRODUCT_GUID @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'ProductSet',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : PRODUCT_GUID_NODE_KEY,
//                 ValueListProperty : 'NODE_KEY',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'PRODUCT_ID',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'TYPE_CODE',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'CATEGORY',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'DESCRIPTION',
//             },
//         ],
//     }
// };

annotate service.Pos with @(UI.SelectionFields: [
    PO_ITEM_POS,
    PARTNER_KEY.PARTNER_GUID.COMPANY_NAME,
    PARTNER_KEY.PARTNER_GUID.ADDRESS_GUID.COUNTRY,
    GROSS_AMOUNT,
]);