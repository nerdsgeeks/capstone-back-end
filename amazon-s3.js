const AWS = require('aws-sdk');
const crypto = require('crypto');

AWS.config.credentials ={
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
}
AWS.config.update({
    region: process.env.AWS_REGION
});
const s3 = new AWS.S3()

const generateRadomName = () => {
    return crypto.randomBytes(32).toString('hex')
}

const putToS3 = async (content, isVectorStore) => {
    if(isVectorStore) {
        content = JSON.stringify(content)
    }
    const key = generateRadomName();
    const response = await s3.putObject({
        Body: content,
        Bucket: process.env.AWS_BUCKET,
        Key: key
    }).promise();

    console.log(response);
    return key;
};

const getSingleObject = async (key, isVectorStore) => {
    const response = await s3.getObject({
        Bucket: process.env.AWS_BUCKET,
        Key: key
    }).promise()

    console.log(response);
    if(isVectorStore) {
        return JSON.parse(response.Body.toString())
    } else {
        return response.Body
    }
}

module.exports = {
    putToS3,
    getSingleObject
}

/// to use this module, you can do the following:
// const content = 'Hello, World!';

// s3Functions.putToS3(content, false)
//     .then(key => {
//         console.log('Object uploaded successfully with key:', key);
//         // Example usage of getSingleObject
//         s3Functions.getSingleObject(key, false)
//             .then(data => {
//                 console.log('Retrieved content:', data.toString());
//             })
//             .catch(error => {
//                 console.error('Error retrieving content:', error);
//             });
//     })
//     .catch(error => {
//         console.error('Error uploading object:', error);
//     });