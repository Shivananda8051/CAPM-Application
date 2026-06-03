const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    const { POs, EmployeeSet } = this.entities;

    const statusMap = { 'NE': 'New', 'OK': 'Approved', 'CL': 'Closed' };
    const colorMap = { 'NE': 0, 'OK': 2, 'CL': 3 };

    this.after('READ', POs, (data) => {
        const items = Array.isArray(data) ? data : [data];
        for (const po of items) {
            if (po) {
                po.OverallStatusText = statusMap[po.OVERALL_STATUS] || 'In Process';
                po.ColorCoding = colorMap[po.OVERALL_STATUS] ?? 1;
            }
        }
    });

    this.before(['CREATE', 'PATCH'], EmployeeSet, (req) => {

        if (parseFloat(req.data.salaryAmount) >= 100000) {
            req.error(500, 'Hey you cant insert this much');
        }

    });

    this.on('boost', async (req) => {

        try {

            console.log('boost action called');

            const ID = req.params[0].ID;

            const { purchaseOrder } = cds.entities('shiva.db.tranasation');

            const po = await SELECT.one.from(purchaseOrder).where({ ID });
            if (!po) return req.error(404, 'Purchase order not found');

            await UPDATE(purchaseOrder)
                .set({ GROSS_AMOUNT: (po.GROSS_AMOUNT || 0) + 20000 })
                .where({ ID });

            const updated = await SELECT.one.from(purchaseOrder).where({ ID });
            updated.IsActiveEntity = true;
            return updated;

        } catch (error) {

            console.error('Error in boost action:', error);
            req.error(500, error.message);

        }

    });

    this.on('largestOrder', async (req) => {

        const { purchaseOrder } = cds.entities('shiva.db.tranasation');

        const myrecord = await SELECT.from(purchaseOrder)
            .orderBy({ GROSS_AMOUNT: 'desc' })
            .limit(1);

        return myrecord[0];

    });

    this.on('getDefaultValues', (req, res) => {
        return {
            "OVERALL_STATUS": "NE",
        }
    })

});
