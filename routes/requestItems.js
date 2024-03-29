    const dboperations = require("../controllers/requestItemController");
    var express = require("express");
    var router = express.Router();

    router.route("/all").get((request, response) => {
        dboperations.getRequestItems().then((result) => {
            response.json(result[0]);
        });
        }
    );

    router.route("/getRequestItem/:id").get((request, response) => {
        dboperations.getRequestItem(request.params.id).then((result) => {
            response.json(result[0]);
        });
        }   
    );

    router.route("/addRequestItem").post((request, response) => {

        let requestItem = { ...request.body };
        dboperations.addRequestItem(requestItem).then((result) => {
            response.status(201).json(result);
        });
        }

    );
        
    router.route("/updateRequestItem").post((request, response) => {
        let requestItem = { ...request.body };
        dboperations.updateRequestItem(requestItem).then((result) => {
            response.status(201).json(result);
        });
        }
    );  

    module.exports = router;