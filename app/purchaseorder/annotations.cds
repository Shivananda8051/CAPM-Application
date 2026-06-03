using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(

    UI.SelectionFields    : [
        PO_ID,
        COMPANY_NAME,
        GROSS_AMOUNT,
        NET_AMOUNT,
        TAX_AMOUNT,
        CURRENCY_code
    ],

    UI.LineItem           : [

        {
            $Type: 'UI.DataField',
            Value: PO_ID
        },

        {
            $Type: 'UI.DataField',
            Value: COMPANY_NAME,
        },

        {
            $Type: 'UI.DataField',
            Value: COUNTRY,
        },

        {
            $Type: 'UI.DataField',
            Value: GROSS_AMOUNT,
        },

        {
            $Type : 'UI.DataFieldForAction',
            Action: 'CatalogService.boost',
            Label : 'Boost',
            Inline: true,
        },

        {
            $Type      : 'UI.DataField',
            Value      : OverallStatusText,
            Criticality: ColorCoding,
        }

    ],

    UI.HeaderInfo         : {

        TypeName      : 'Purchase Order',
        TypeNamePlural: 'Purchase Orders',

        Title         : {
            $Type: 'UI.DataField',
            Value: PO_ID,
        },

        Description   : {
            $Type: 'UI.DataField',
            Value: COMPANY_NAME,
        },

        ImageUrl      : 'https://sap.github.io/ui5-webcomponents/assets/images/HT-1000.png'
    },

    UI.Facets                : [

        {
            $Type : 'UI.CollectionFacet',
            Label : 'General Information',
            Facets: [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Addional Data',
                    Target: '@UI.FieldGroup#AdditionalData'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Pricing Data',
                    Target: '@UI.FieldGroup#PricingData'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Statuses',
                    Target: '@UI.FieldGroup#Statuses'
                }
            ]
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Items',
            Target: 'Items/@UI.LineItem'
        }

    ],

    UI.FieldGroup #AdditionalData: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Purchase Order No',
                Value: PO_ID
            },
            {
                $Type: 'UI.DataField',
                Label: 'Vendor Id',
                Value: PARTNER_GUID_NODE_KEY
            }
        ]
    },

    UI.FieldGroup #PricingData   : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Gross Amount',
                Value: GROSS_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Label: 'Net Amount',
                Value: NET_AMOUNT
            },
            {
                $Type: 'UI.DataField',
                Label: 'Tax Amount',
                Value: TAX_AMOUNT
            }
        ]
    },

    UI.FieldGroup #Statuses      : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Currency',
                Value: CURRENCY_code
            },
            {
                $Type: 'UI.DataField',
                Label: 'Order Status',
                Value: OVERALL_STATUS
            }
        ]
    }


);

annotate service.POItems with @(

    UI.LineItem               : [

        {
            $Type: 'UI.DataField',
            Label: 'Item Position',
            Value: PO_ITEM_POS
        },

        {
            $Type: 'UI.DataField',
            Label: 'Product',
            Value: PRODUCT_GUID.DESCRIPTION
        },

        {
            $Type: 'UI.DataField',
            Label: 'Gross Amount',
            Value: GROSS_AMOUNT
        },

        {
            $Type: 'UI.DataField',
            Label: 'Net Amount',
            Value: NET_AMOUNT
        },

        {
            $Type: 'UI.DataField',
            Label: 'Tax Amount',
            Value: TAX_AMOUNT
        }

    ],

    UI.Identification         : [

    {
        $Type: 'UI.DataField',
        Value: PO_ITEM_POS
    }

    ],

    UI.HeaderInfo             : {

        TypeName      : 'Purchase Order Item',
        TypeNamePlural: 'Purchase Order Items',

        Title         : {
            $Type: 'UI.DataField',
            Value: PO_ITEM_POS,
        },

        Description   : {
            $Type: 'UI.DataField',
            Value: PRODUCT_GUID.DESCRIPTION,
        },

        ImageUrl      : 'https://sap.github.io/ui5-webcomponents/assets/images/HT-1000.png'
    },

    UI.Facets                 : [

    {
        $Type : 'UI.CollectionFacet',
        Label : 'Item Information',

        Facets: [

            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Details',
                Target: '@UI.FieldGroup#ItemDetails'
            },

            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Pricing',
                Target: '@UI.FieldGroup#Pricing'
            },

            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Product Details',
                Target: '@UI.FieldGroup#Product'
            }

        ]
    }

    ],

    UI.FieldGroup #ItemDetails: {

        $Type: 'UI.FieldGroupType',

        Data : [

            {
                $Type: 'UI.DataField',
                Label: 'Item Position',
                Value: PO_ITEM_POS,
            },

            {
                $Type: 'UI.DataField',
                Label: 'Product',
                Value: PRODUCT_GUID.DESCRIPTION,
            }

        ]
    },

    UI.FieldGroup #Pricing    : {

        $Type: 'UI.FieldGroupType',

        Data : [

            {
                $Type: 'UI.DataField',
                Label: 'Gross Amount',
                Value: GROSS_AMOUNT,
            },

            {
                $Type: 'UI.DataField',
                Label: 'Net Amount',
                Value: NET_AMOUNT,
            },

            {
                $Type: 'UI.DataField',
                Label: 'Tax Amount',
                Value: TAX_AMOUNT,
            }

        ]
    },

    UI.FieldGroup #Product    : {

        $Type: 'UI.FieldGroupType',

        Data : [

            {
                $Type: 'UI.DataField',
                Label: 'Product Name',
                Value: PRODUCT_GUID.DESCRIPTION,
            },

            {
                $Type: 'UI.DataField',
                Label: 'Product ID',
                Value: PRODUCT_GUID.PRODUCT_ID,
            },

            {
                $Type: 'UI.DataField',
                Label: 'Category',
                Value: PRODUCT_GUID.CATEGORY,
            }

        ]
    }

);


annotate service.POs with {

    PARTNER_GUID @(
        Common.Text     : COMPANY_NAME,

        Common.ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'BusinesspatnerSet',

            Parameters    : [

                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: PARTNER_GUID_NODE_KEY,
                    ValueListProperty: 'NODE_KEY'
                },

                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'COMPANY_NAME'
                },

                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'BP_ID'
                }

            ]
        }
    );

};

annotate service.POItems with {

    PRODUCT_GUID @(

        Common.Text     : PRODUCT_GUID.DESCRIPTION,

        Common.ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ProductSet',

            Parameters    : [

                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: PRODUCT_GUID_NODE_KEY,
                    ValueListProperty: 'NODE_KEY'
                },

                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'DESCRIPTION'
                },

                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'PRODUCT_ID'
                }

            ]
        }
    );

};
