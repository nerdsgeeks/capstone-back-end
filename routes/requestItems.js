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
        
    router.route("/updateRequestItem").put((request, response) => {
      let requestItem = request.body ;   
      console.log(requestItem);
      requestItem.map((requestItem) => {     
          const requestItemId = requestItem.ID;      
      dboperations.updateRequestItem(requestItemId, requestItem).then((result) => {
          response.status(201).json(result);
      });
      }
  );  
  }
  );

    router.route("/updateAssignedSupervisorId").patch((request, response) => {
        let requestItem = { ...request.body };
        dboperations.updateAssignedSupervisorId(requestItem).then((result) => {
            response.status(201).json(result);
        });
        }
    );


    module.exports = router;