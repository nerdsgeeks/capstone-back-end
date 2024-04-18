require("dotenv").config();

const config = {
    user :'cleanopsuser',
    password :process.env.DBPASS,
    server:'185.141.134.185',
    database:'CleanOpsDB',
    options:{
        trustedconnection: true,
        enableArithAbort : true, 
        trustServerCertificate : true,
    },
    port : 1433
}

module.exports = config; 
