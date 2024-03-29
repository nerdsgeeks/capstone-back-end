var config = require("../dbconfig");
const sql = require("mssql");

async function getRooms() {
    try {
        let pool = await sql.connect(config);
        let products = await pool.request().query("SELECT * from view_room");
        return products.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function getRoom(orderId) {
  try {
    let pool = await sql.connect(config);
    let product = await pool
      .request()
      .input("input_parameter", sql.Int, orderId)
      .query("SELECT * from Rooms where Id = @input_parameter");
    return product.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function addRoom(room) {
  try {
    console.log(room);
    let pool = await sql.connect(config);
    let insertProduct = await pool
      .request()
      .input("RoomName", sql.NVarChar, room.RoomName)
      .input("RoomTypeID", sql.Int, room.RoomTypeID)
      .input("Floor", sql.Int, room.Floor)
      .input("RoomStatus", sql.NVarChar, room.RoomStatus)
      .input("RoomImageUrl", sql.NVarChar, room.RoomImageUrl)
      .execute("CreateRoom");
    return insertProduct.recordsets;
  } catch (err) {
    console.log(err);
  }
}

async function updateRoom(room) {
  try {
    console.log(room);
    let pool = await sql.connect(config);
    let insertProduct = await pool
      .request()
      .input("RoomID", sql.Int, room.ID)
      .input("RoomName", sql.NVarChar, room.RoomName)
      .input("RoomTypeID", sql.Int, room.RoomTypeID)
      .input("Floor", sql.Int, room.Floor)
      .input("RoomStatus", sql.NVarChar, room.RoomStatus)
      .input("RoomImageUrl", sql.NVarChar, room.RoomImageUrl)
      .input("RoomTier", sql.NVarChar, room.RoomTier)
      .execute("UpdateRoom");
    return insertProduct.recordsets;
  } catch (err) {
    console.log(err);
  }
}

module.exports = {
  getRooms: getRooms,
  getRoom: getRoom,
  addRoom: addRoom,
  updateRoom: updateRoom,
};
