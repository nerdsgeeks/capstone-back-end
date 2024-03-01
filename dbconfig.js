require("dotenv").config();

const config = {
    user :'azim',
    password :process.env.DBPASS,
    server:'mylangaradb.database.windows.net',
    database:'CleanOpsDB',
    options:{
        trustedconnection: true,
        enableArithAbort : true, 
    },
    port : 1433
}

module.exports = config; 
