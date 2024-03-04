  
const dboperations = require('../controllers/employeeController');
var express = require('express');
var router = express.Router();

router.route('/all').get((request,response)=>{
    dboperations.getEmployees().then(result => {
       response.json(result[0]);
    })
})

router.route('/getemployee/:id').get((request,response)=>{
    dboperations.getEmployee(request.params.id).then(result => {
       response.json(result[0]);
    })
})

router.route('/addemployee').post((request,response)=>{
    let employee = {...request.body}
    dboperations.addEmployee(employee).then(result => {
       response.status(201).json(result);
    })
})

router.route('/updateemployee').post((request,response)=>{
  let employee = {...request.body}
  dboperations.updateEmployee(employee).then(result => {
     response.status(201).json(result);
  })
})

router.route('/deleteemployee').post((request,response)=>{
  let employee = {...request.body}
  dboperations.deleteEmployee(employee).then(result => {
     response.status(201).json(result);
  })
})


module.exports = router;