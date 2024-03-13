const {uploadImageToS3} = require('./amazon-s3');

const imagePath = '../capstone-frontend/assets/request-help-modal-image.png';
const contentType = 'image/png';


const your_region = 'us-west-2';
const your_bucket_name = 'cleanops';

uploadImageToS3(imagePath,contentType).then((key) => {
    const imageUrl = `https://s3.${your_region}.amazonaws.com/${your_bucket_name}/${key}`;
    console.log(`Image URL: ${imageUrl}`);
  });
 


