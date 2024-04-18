  
const dboperations = require('../controllers/itemController');
var express = require('express');
var router = express.Router();

router.route('/all').get((request,response)=>{
   console.log("Getting all items");
    dboperations.getItems().then(result => {
       response.json(result[0]);
    })
})

router.route('/getroom/:id').get((request,response)=>{
    dboperations.getItem(request.params.id).then(result => {
       response.json(result[0]);
    })
})

router.route('/additem').post((request,response)=>{
    let item = {...request.body}
    dboperations.addItem(item).then(result => {
       response.status(201).json(result);
    })
})

router.route('/updateitem').post((request,response)=>{
  let item = {...request.body}
  dboperations.updateItem(item).then(result => {
     response.status(201).json(result);
  })
})

router.route('/deleteitem').post((request,response)=>{
  let item = {...request.body}
  dboperations.deleteItem(item).then(result => {
     response.status(201).json(result);
  })
})


module.exports = router;