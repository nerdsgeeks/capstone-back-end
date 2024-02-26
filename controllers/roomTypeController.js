var config = require("../dbconfig");
const sql = require("mssql");

async function getRoomTypes() {
  try {
    let pool = await sql.connect(config);
    let objects = await pool.request().query("SELECT * from RoomTypes");
    return objects.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function getRoomType(roomTypeId) {
  try {
    let pool = await sql.connect(config);
    let object = await pool
      .request()
      .input("input_parameter", sql.Int, roomTypeId)
      .query("SELECT * from RoomTypes where Id = @input_parameter");
    return object.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function addRoomType(roomType) {
  try {
    let pool = await sql.connect(config);
    let insertObject = await pool
      .request()
      .input("RoomTypeName", sql.NVarChar, roomType.RoomTypeName)
      .input("RoomTasks", sql.Text, roomType.RoomTasks)
      .input("CleaningDuration", sql.NVarChar, v.CleaningDuration)
      .input("RoomTier", sql.NVarChar, roomType.RoomTier)
      .execute("InsertRoomType");
    return insertObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

async function updateRoomType(roomType) {
  try {
    //    console.log(item);
    let pool = await sql.connect(config);
    let updateObject = await pool
      .request()
      .input("RoomTypeName", sql.NVarChar, roomType.RoomTypeName)
      .input("RoomTasks", sql.Text, roomType.RoomTasks)
      .input("CleaningDuration", sql.NVarChar, roomType.CleaningDuration)
      .input("RoomTier", sql.NVarChar, roomType.RoomTier)
      .execute("UpdateRoomType");

    return updateObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

async function deleteRoomType(roomType) {
  try {
    let pool = await sql.connect(config);
    let deleteObject = await pool
      .request()
      .input("RoomTypeID", sql.Int, roomType.ID)
      .execute("DeleteRoomType");
    return deleteObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

module.exports = {
  getRoomTypes: getRoomTypes,
  getRoomType: getRoomType,
  addRoomType: addRoomType,
  updateRoomType: updateRoomType,
  deleteRoomType: deleteRoomType,
};
