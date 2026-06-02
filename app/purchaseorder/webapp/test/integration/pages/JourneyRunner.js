sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/po/purchaseorder/test/integration/pages/PosList",
	"com/po/purchaseorder/test/integration/pages/PosObjectPage"
], function (JourneyRunner, PosList, PosObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/po/purchaseorder') + '/test/flp.html#app-preview',
        pages: {
			onThePosList: PosList,
			onThePosObjectPage: PosObjectPage
        },
        async: true
    });

    return runner;
});

