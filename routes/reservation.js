const dboperations = require("../controllers/reservationController");
var express = require("express");
var router = express.Router();

router.route("/all").get((request, response) => {
  dboperations.getReservations().then((result) => {
    response.json(result[0]);
  });
});

router.route("/getReservation/:id").get((request, response) => {
  dboperations.getReservation(request.params.id).then((result) => {
    response.json(result[0]);
  });
});

router.route("/addReservation").post((request, response) => {
  let reservation = { ...request.body };
  dboperations.addReservation(item).then((result) => {
    response.status(201).json(result);
  });
});

router.route("/updateReservation").post((request, response) => {
  let reservation = { ...request.body };
  dboperations.updateReservation(reservation).then((result) => {
    response.status(201).json(result);
  });
});

router.route("/updateReservation").post((request, response) => {
  let reservation = { ...request.body };
  dboperations.updateReservation(reservation).then((result) => {
    response.status(201).json(result);
  });
});

module.exports = router;
