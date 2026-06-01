module.exports = cds.service.impl(async function() {

    const {Pos} = this.entities;

    this.on('boost', async (req) => {
       try {
            const {ID} = req.params[0];
            console.log('boost action called');
            const tx = cds.tx(req);
            await tx.update(Pos).with({
                GROSS_AMOUNT : {'+=': 20000}
            }).where(ID);
       } catch (error) {
        console.error('Error in boost action:', error);
       }
    });

    this.on('largestOrder', async (req) => {
       const tx = cds.tx(req);
       const myrecord = await tx.read(Pos).orderBy({GROSS_AMOUNT: 'desc'}).limit(1);
       return myrecord[0];
    });
});