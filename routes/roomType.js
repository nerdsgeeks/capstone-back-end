const dboperations = require("../controllers/roomTypeController");
var express = require("express");
var router = express.Router();

router.route("/all").get((request, response) => {
  dboperations.getRoomTypes().then((result) => {
    response.json(result[0]);
  });
});

router.route("/getRoomType/:id").get((request, response) => {
  dboperations.getRoomType(request.params.id).then((result) => {
    response.json(result[0]);
  });
});

router.route("/addRoomType").post((request, response) => {
  let roomType = { ...request.body };
  dboperations.addRoomType(roomType).then((result) => {
    response.status(201).json(result);
  });
});

router.route("/updateRoomType").post((request, response) => {
  let roomType = { ...request.body };
  dboperations.updateRoomType(roomType).then((result) => {
    response.status(201).json(result);
  });
});

router.route("/deleteRoomType").post((request, response) => {
  let roomType = { ...request.body };
  dboperations.deleteRoomType(roomType).then((result) => {
    response.status(201).json(result);
  });
});

module.exports = router;
