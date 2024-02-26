const express = require("express");
const cors = require("cors");
// const mongoose = require("mongoose");
const itemRoutes = require("./routes/items");
const roomRoutes = require("./routes/rooms");
const requestItems = require("./routes/requestItems");

const app = express();

var bodyParser = require('body-parser');
//var app = express();
var router = express.Router();
require("dotenv").config();
//app.use(cors());
//app.use('/api', router);




require("dotenv").config();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(cors());
app.use(express.json({limit: '50mb'}));
app.use(express.urlencoded({limit: '50mb'}));

app.use("/api/rooms", roomRoutes);
app.use("/api/items", itemRoutes);
app.use("/api/requestItems", requestItems);

router.use((request,response,next)=>{
    console.log('middleware');
    next();
 })

// const server = app.listen(process.env.PORT, () =>
//   console.log(`Server started on ${process.env.PORT}`)
// );


var port = process.env.PORT;
app.listen(port);
console.log('API is runnning at ' + port);