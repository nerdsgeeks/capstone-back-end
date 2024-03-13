
const jwt = require('jsonwebtoken');

const secretKey = process.env.JWT_SECRET_KEY;

const jwtAuthMiddleware = (req, res, next) => {

    console.log('Get token from header');


     const token = req.headers['authorization'];

    if (!token) {
        return res.status(401).json({ message: 'Token not found' });
    }

    try {
        const decoded = jwt.verify(token, secretKey);
        req.user = decoded.user;
        next();
    } catch (error) {
        console.error('Error verifying token:', error.message);
        return res.status(401).json({ message: 'Invalid token' });
    }
};

module.exports = jwtAuthMiddleware;
