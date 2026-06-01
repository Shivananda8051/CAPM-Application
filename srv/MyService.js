module.exports = (srv) => {
    srv.on('shiva',req => {
        return `Hello ${req.data.name}`;
    }
)}