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

            const { NODE_KEY } = req.params[0];

            const tx = cds.tx(req);

            await tx.update(POs)
                .with({
                    GROSS_AMOUNT: { '+=': 20000 }
                })
                .where({ NODE_KEY });

            return 'Boost Success';

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

});