const dboperations = require("../controllers/assignedRoomController");
var express = require("express");
var router = express.Router();

router.route("/all").get((request, response) => {
  dboperations.getAssignedRooms().then((result) => {
    response.json(result[0]);
  });
});

router.route("/assignedRoomTblAll").get((request, response) => {
  dboperations.getAssignedRoomTblAll().then((result) => {
    response.json(result[0]);
  });
});

router.route("/getAssignedRoom/:id").get((request, response) => {
  dboperations.getAssignedRoom(request.params.id).then((result) => {
    response.json(result[0]);
  });
});

router
  .route("/getAssignedRoomView/:assignedEmployeeID/:currenDate")
  .get((request, response) => {
    dboperations
      .getAssignedRoomView(
        request.params.assignedEmployeeID,
        request.params.currenDate,
      )
      .then((result) => {
        response.json(result[0]);
      });
  });

router.route("/addAssignedRoom").post((request, response) => {
  let assignedRoom = { ...request.body };
  dboperations.addAssignedRoom(assignedRoom).then((result) => {
    response.status(201).json(result);
  });
});

router.route("/updateAssignedRoom").put((request, response) => {
  let assignedRoom = { ...request.body };
  console.log(assignedRoom);
  dboperations.updateAssignedRoom(assignedRoom).then((result) => {
    response.status(201).json(result);
  });
});


router.route("/updateAssignedRoomIsCompleted").put(async (request, response) => {
  let updateAssignedRoom = []
  const requestRoom = request.body;
  for (request of requestRoom) {
   const result = await dboperations.updateAssignedRoom(request);
   updateAssignedRoom.push(result);
  }
   response.status(201).json(updateAssignedRoom);
 }
 );
 

router.route("/deleteAssignedRoom").post((request, response) => {
  let assignedRoom = { ...request.body };
  dboperations.deleteAssignedRoom(assignedRoom).then((result) => {
    response.status(201).json(result);
  });
});

router.route("/getAssignedRoomsInfo").get((request, response) => {
  dboperations.getAssignedRoomsInfo().then((result) => {
    response.json(result);
  });
});

module.exports = router;
