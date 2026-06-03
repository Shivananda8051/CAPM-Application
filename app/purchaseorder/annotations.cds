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
    UI.LineItem: [
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
            $Type: 'UI.DataFieldForAction',
            Action: 'CatalogService.boost',
            Label : 'Boost',
            Inline: true,
        },

        {
            $Type: 'UI.DataField',
            Value: OverallStatusText,
            Criticality: ColorCoding,
        },

    ],
    UI.HeaderInfo: {
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
        ImageUrl: 'https://sap.github.io/ui5-webcomponents/assets/images/HT-1000.png'
    },

    UI.Facets: [{
        $Type : 'UI.ReferenceFacet',
        Label : 'General Information',
        Target: '@UI.FieldGroup#General'
    }],

    UI.FieldGroup #General: {
        $Type: 'UI.FieldGroupType',

        Data : [

            {
                $Type: 'UI.DataField',
                Label: 'Purchase Order',
                Value: PO_ID
            },

            {
                $Type: 'UI.DataField',
                Label: 'Company Name',
                Value: COMPANY_NAME
            },

            {
                $Type: 'UI.DataField',
                Label: 'Country',
                Value: COUNTRY
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
            },

            {
                $Type      : 'UI.DataField',
                Label      : 'Status',
                Value      : OverallStatusText,
                Criticality: ColorCoding
            }

        ]
    }
);