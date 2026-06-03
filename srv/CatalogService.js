const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    const { POs, EmployeeSet } = this.entities;

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

            const po = await SELECT.one.from(purchaseOrder).where({ ID }).columns('GROSS_AMOUNT');
            const currentAmount = po?.GROSS_AMOUNT || 0;

            await UPDATE(purchaseOrder)
                .set({ GROSS_AMOUNT: currentAmount + 20000 })
                .where({ ID });

            return await SELECT.one.from(POs).where({ ID });

        } catch (error) {

            console.error('Error in boost action:', error);

            req.error(500, error.message);

        }

    });

    this.on('largestOrder', async (req) => {

        const tx = cds.tx(req);

        const myrecord = await tx.read(POs)
            .orderBy({ GROSS_AMOUNT: 'desc' })
            .limit(1);

        return myrecord[0];

    });

    this.on('getDefaultValues',(req,res)=>{
        return {
            "OVERALL_STATUS": "NE",
        }
    })

});