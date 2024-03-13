const express = require('express');
const router = express.Router();

const { uploadImageToS3  } = require('../amazon-s3');

//content type should be image/png, image/jpeg, image/jpg or something like the given examples
router.route('/upload').post(async (request, response) => {
    const { imagePath, contentType } = request.body;
    const key = await uploadImageToS3(imagePath, contentType);
    response.json({ key });
    }
);


module.exports = router;

