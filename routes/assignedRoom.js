const dboperations = require("../controllers/assignedRoomController");
var express = require("express");
var router = express.Router();

router.route("/all").get((request, response) => {
  dboperations.getAssignedRooms().then((result) => {
    response.json(result[0]);
  });
});

router.route("/getAssignedRoom/:id").get((request, response) => {
  dboperations.getAssignedRoom(request.params.id).then((result) => {
    response.json(result[0]);
  });
});

router.route("/addAssignedRoom").post((request, response) => {
  let assignedRoom = { ...request.body };
  dboperations.addAssignedRoom(assignedRoom).then((result) => {
    response.status(201).json(result);
  });
});

router.route("/updateAssignedRoom").post((request, response) => {
  let assignedRoom = { ...request.body };
  dboperations.updateAssignedRoom(assignedRoom).then((result) => {
    response.status(201).json(result);
  });
});

router.route("/deleteAssignedRoom").post((request, response) => {
  let assignedRoom = { ...request.body };
  dboperations.deleteAssignedRoom(assignedRoom).then((result) => {
    response.status(201).json(result);
  });
});

module.exports = router;
