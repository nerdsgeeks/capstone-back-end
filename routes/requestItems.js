const dboperations = require("../controllers/requestItemController");
var express = require("express");
var router = express.Router();

router.route("/all").get((request, response) => {
  dboperations.getRequestItems().then((result) => {
    response.json(result[0]);
  });
});

router.route("/requestItemsTblAll").get((request, response) => {
  dboperations.getRequestItemsTblAll().then((result) => {
    response.json(result[0]);
  });
});

router.route("/getRequestItem/:id").get((request, response) => {
  dboperations.getRequestItem(request.params.id).then((result) => {
    response.json(result[0]);
  });
});

router.route("/getRequestItemView/:assignedRoomID").get((request, response) => {
  dboperations
    .getRequestItemView(request.params.assignedRoomID)
    .then((result) => {
      response.json(result[0]);
    });
});

    router.route("/addRequestItem").post((request, response) => {

        let requestItem = { ...request.body };
        dboperations.addRequestItem(requestItem).then((result) => {
            response.status(201).json(result);
        });
        }

    );
        
    router.route("/updateRequestItem").put(async (request, response) => {
      try {
          const requestItems = request.body;
          const updateResults = [];
          for (const requestItem of requestItems) {
              const result = await dboperations.updateRequestItem(requestItem);
              updateResults.push(result);
          }

          // Send a single response with the results of all updates
          response.status(201).json(updateResults);
      } catch (error) {
          console.error("Error updating request items:", error);
          response.status(500).json({ error: "An error occurred while updating request items" });
      }
  });
  

    router.route("/updateAssignedSupervisorId").patch((request, response) => {
        let requestItem = { ...request.body };
        dboperations.updateAssignedSupervisorId(requestItem).then((result) => {
            response.status(201).json(result);
        });
        }
    );


    module.exports = router;