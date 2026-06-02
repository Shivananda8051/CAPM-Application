const cds = require('@sap/cds');
const {Employee} = cds.entities('shiva.db.master');

module.exports = (srv) => {
    srv.on('shiva',req => `Hello ${req.data.name}`);
    
    srv.on('READ', 'ReadEmployeSrv',async (req)=> {
        // return {
        //     "Name": "Shiva",
        //     "age" : "22"
        // }
        // calling db and perform action 
        const tx = await cds.tx(req);
        var result =[];
        const data = await tx.run(SELECT.from(Employee).limit(5));
        console.log(data);
        for(let i=0;i<data.length;i++){
            const ele = data[i];
            ele.nameMiddle = 'Kumar';
            result.push(ele);

        }
        return result;
    });
}