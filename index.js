const express = require("express");
const cors = require('cors');
const corsOptions = require('./config/corsOptions');
// const { logger } = require('./middleware/logEvents');
// const errorHandler = require('./middleware/errorHandler');
const verifyJWT = require('./middleware/verifyJWT');
const cookieParser = require('cookie-parser');
const credentials = require('./middleware/credentials');


// const mongoose = require("mongoose");
const itemRoutes = require("./routes/items");
const roomRoutes = require("./routes/rooms");
const requestItems = require("./routes/requestItems");
const reservations = require("./routes/reservation");
const roomtypes = require("./routes/roomType");
const employees = require("./routes/employees");
const assignedrooms = require("./routes/assignedRoom");
const s3Routes = require("./routes/uploadS3");
const authentication = require("./routes/auth");
const logout =  require('./routes/logout');
const refresh = require('./routes/refresh');


const jwtAuthMiddleware = require("./middleware/jwtAuth");


const app = express();
app.use("/protectedRoute", jwtAuthMiddleware);


app.use(credentials);
app.use(cors(corsOptions));
app.use(express.json());
app.use(cookieParser());

app.use("/api/auth", authentication);
app.use('/api/refresh', refresh);
app.use('/api/logout',logout);

app.use(verifyJWT);

var bodyParser = require("body-parser");

var router = express.Router();

require("dotenv").config();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(cors());
app.use(express.json({ limit: "50mb" }));
app.use(express.urlencoded({ limit: "50mb" }));

app.use("/api/rooms", roomRoutes);
app.use("/api/items", itemRoutes);
app.use("/api/requestItems", requestItems);
app.use("/api/reservations", reservations);
app.use("/api/roomtypes", roomtypes);
app.use("/api/employees", employees);
app.use("/api/assignedrooms", assignedrooms);
app.use("/api/s3", s3Routes);


// router.use((request,response,next)=>{
//     console.log('middleware');
//     next();
//  })

// const server = app.listen(process.env.PORT, () =>
//   console.log(`Server started on ${process.env.PORT}`)
// );

var port = process.env.PORT;
app.listen(port);
console.log("API is runnning at " + port);
