const { S3Client, PutObjectCommand, GetObjectCommand } = require("@aws-sdk/client-s3");
const { createReadStream } = require("fs");
const { randomBytes } = require("crypto")
require("dotenv").config();

const { v4: uuidv4 } = require('uuid');



const s3Client = new S3Client({
  region: process.env.AWS_REGION,
  credentials: {
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
  },
});


const uploadImageToS3 = async (imagePath, contentType) => {
  const imageContent = createReadStream(imagePath);  
  const key = `image/${uuidv4()}`;

  const PutObject= new PutObjectCommand({
    Bucket: process.env.AWS_BUCKET,
    Key: key,
    Body: imageContent,
    ContentType: contentType, 
  });

  await s3Client.send(PutObject);
  return key;
};

  

module.exports = {
  uploadImageToS3,
};
