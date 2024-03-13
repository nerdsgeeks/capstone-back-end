
const dboperations = require('../controllers/roomController');
var express = require('express');
var router = express.Router();

router.route('/all').get((request,response)=>{
console.log("getting all rooms");
    dboperations.getRooms().then(result => {
       response.json(result[0]);
    })
})

router.route('/getroom/:id').get((request,response)=>{
    dboperations.getRoom(request.params.id).then(result => {
       response.json(result[0]);
    })
})

router.route('/addroom').post((request,response)=>{
    let order = {...request.body}
    dboperations.addRoom(order).then(result => {
       response.status(201).json(result);
    })
})

router.route('/getroombytype').get((request,response)=>{
    dboperations.getRoomsWithTypes().then(result => {
       response.json(result[0]);
    })
}
)

module.exports = router;