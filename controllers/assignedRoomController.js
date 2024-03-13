var config = require("../dbconfig");
const sql = require("mssql");

async function getAssignedRooms() {
  try {
    let pool = await sql.connect(config);
    let objects = await pool.request().query("SELECT * from View_AssignedRoom");
    return objects.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function getAssignedRoom(assignedRoomId) {
  try {
    let pool = await sql.connect(config);
    let object = await pool
      .request()
      .input("input_parameter", sql.Int, assignedRoomId)
      .query("SELECT * from AssignedRoom where Id = @input_parameter");
    return object.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function addAssignedRoom(assignedRoom) {
  try {
    let pool = await sql.connect(config);
    let insertObject = await pool
      .request()
      .input("RoomId", sql.Int, assignedRoom.RoomId)
      .input("RoomStatus", sql.NVarChar, assignedRoom.RoomStatus)
      .input("AssignedDateTime", sql.DateTime, assignedRoom.AssignedDateTime)
      .input(
        "AssignedHousekeeperId",
        sql.Int,
        assignedRoom.AssignedHousekeeperId,
      )
      .input("CleaningStatus", sql.NVarChar, assignedRoom.CleaningStatus)
      .input("IsCompleted", sql.Binary, assignedRoom.IsCompleted)
      .input("VerifiedPhotoUrl", sql.NVarChar, assignedRoom.VerifiedPhotoUrl)
      .input("StartTime", sql.DateTime, assignedRoom.StartTime)
      .input("EndTime", sql.DateTime, assignedRoom.EndTime)
      .input("CleaningDuration", sql.Time, assignedRoom.CleaningDuration)
      .input("IsHelperRequested", sql.Binary, assignedRoom.IsHelperRequested)
      .input("RequestedHelperId", sql.Int, assignedRoom.RequestedHelperId)
      .input("AdditionalNotes", sql.NVarChar, assignedRoom.AdditionalNotes)
      .execute("InsertAssignedRoom");
    return insertObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

async function updateAssignedRoom(assignedRoom) {
  try {
    //    console.log(item);
    let pool = await sql.connect(config);
    let updateObject = await pool
      .request()
      .input("RoomId", sql.Int, assignedRoom.RoomId)
      .input("RoomStatus", sql.NVarChar, assignedRoom.RoomStatus)
      .input("AssignedDateTime", sql.DateTime, assignedRoom.AssignedDateTime)
      .input(
        "AssignedHousekeeperId",
        sql.Int,
        assignedRoom.AssignedHousekeeperId,
      )
      .input("CleaningStatus", sql.NVarChar, assignedRoom.CleaningStatus)
      .input("IsCompleted", sql.Binary, assignedRoom.IsCompleted)
      .input("VerifiedPhotoUrl", sql.NVarChar, assignedRoom.VerifiedPhotoUrl)
      .input("StartTime", sql.DateTime, assignedRoom.StartTime)
      .input("EndTime", sql.DateTime, assignedRoom.EndTime)
      .input("CleaningDuration", sql.Time, assignedRoom.CleaningDuration)
      .input("IsHelperRequested", sql.Binary, assignedRoom.IsHelperRequested)
      .input("RequestedHelperId", sql.Int, assignedRoom.RequestedHelperId)
      .input("AdditionalNotes", sql.NVarChar, assignedRoom.AdditionalNotes)
      .execute("UpdateAssignedRoom");

    return updateObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

async function deleteAssignedRoom(assignedRoom) {
  try {
    let pool = await sql.connect(config);
    let deleteObject = await pool
      .request()
      .input("AssignedRoomId", sql.Int, assignedRoom.Id)
      .execute("DeleteAssignedRoom");
    return deleteObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}



async function getAssignedRoomsInfo() {
  try {
    let pool = await sql.connect(config);
    let result = await pool.request().query(`
    SELECT 
    ar.ID AS assignedRoomID,
    ar.*,
    r.RoomName,
    r.Floor,
    r.RoomImageUrl,
    rt.RoomTypeName,
    res.GuestName AS guestName,
    res.AdditionalNotes AS reservationNotes,
    res.CheckinDate AS checkIn,
    res.CheckoutDate AS checkOut,
    res.noOfGuest AS noOfGuest,
    e.FirstName,
    e.LastName,
    e.EmployeeType
FROM 
    AssignedRoom ar
LEFT JOIN 
    Rooms r ON ar.RoomID = r.ID
JOIN 
    RoomTypes rt ON r.RoomTypeID = rt.ID
LEFT JOIN
    Reservation res ON ar.ID = res.ID
LEFT JOIN
    Employee e ON ar.assignedEmployeeID = e.ID`);
    return result.recordset;
  } catch (error) {
    console.error("Error fetching assigned rooms information:", error);
    throw error;
  }
}

module.exports = {
  getAssignedRooms: getAssignedRooms,
  getAssignedRoom: getAssignedRoom,
  addAssignedRoom: addAssignedRoom,
  updateAssignedRoom: updateAssignedRoom,
  deleteAssignedRoom: deleteAssignedRoom,
  getAssignedRoomsInfo: getAssignedRoomsInfo,
};
