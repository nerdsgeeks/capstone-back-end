
const express = require('express');
const router = express.Router();
const dboperations = require('../controllers/authController');
//console.log("router login is working");
router.post('/login', dboperations.login);

// router.route('/login').post((request,response)=>{
//     let employee = {...request.body}
//     console.log(request.body);
//     dboperations.login(employee).then(result => {
//        response.status(201).json(result);
//     })
// })


module.exports = router;