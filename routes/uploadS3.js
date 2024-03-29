const express = require('express');
const router = express.Router();

const your_region = 'us-west-2';
const your_bucket_name = 'cleanops';
const { uploadbase64ToS3 } = require('../amazon-s3');

//content type should be image/png, image/jpeg, image/jpg or something like the given examples
router.route('/upload').post(async (request, response) => {
    try {
        console.log('request.body:', request.body);
        const { images } = request.body;
        const uploadedUrls = [];

        for (const image of images) {
            const key = await uploadbase64ToS3(image, "image/jpeg");
            const imageUrl = `https://s3.${your_region}.amazonaws.com/${your_bucket_name}/${key}`;
            uploadedUrls.push(imageUrl);
        }

        console.log('uploadedUrls:', uploadedUrls);
        response.json({ uploadedUrls });
    } catch (error) {
        console.error('Error while uploading images:', error);
        response.status(500).json({ error: 'Internal server error' });
    }
});

module.exports = router;
