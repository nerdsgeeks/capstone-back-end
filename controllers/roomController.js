var config = require('../dbconfig');
const sql = require('mssql');

async function getRooms() {
    try {
        let pool = await sql.connect(config);
        let products = await pool.request().query("SELECT * from Rooms");
        return products.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function getRoom(orderId) {
    try {
        let pool = await sql.connect(config);
        let product = await pool.request()
            .input('input_parameter', sql.Int, orderId)
            .query("SELECT * from Rooms where Id = @input_parameter");
        return product.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function addRoom(room) {
    try {
        console.log(room);
        let pool = await sql.connect(config);
        let insertProduct = await pool.request()
            .input('RoomName', sql.NVarChar, room.RoomName)
            .input('RoomTypeID', sql.Int, room.RoomTypeID)
            .input('Floor', sql.Int, room.Floor)
            .input('RoomStatus', sql.NVarChar, room.RoomStatus)
            .input('RoomImageUrl', sql.NVarChar, room.RoomImageUrl)
           .execute('CreateRoom');
        return insertProduct.recordsets;
    }
    catch (err) {
        console.log(err);
    }
}

async function getRoomsWithTypes() {
    try {
        let pool = await sql.connect(config);
        let result = await pool.request().query(`
            SELECT r.ID, r.RoomName, r.RoomTypeID, r.Floor, r.RoomStatus, r.RoomImageUrl, rt.RoomTypeName
            FROM Rooms r
            JOIN RoomTypes rt ON r.RoomTypeID = rt.ID
        `);
        return result.recordsets;
    } catch (error) {
        console.log(error);
    }
}


module.exports = {
    getRooms: getRooms,
    getRoom : getRoom,
    addRoom : addRoom,
    getRoomsWithTypes: getRoomsWithTypes
}