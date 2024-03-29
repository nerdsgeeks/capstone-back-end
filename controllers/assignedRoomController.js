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

async function getAssignedRoomsCount() {
  try {
    let pool = await sql.connect(config);
    let objects = await pool.request().query("SELECT * from View_assignedRoomCount");
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
  console.log(assignedRoom);
  console.log(assignedRoom.isCompleted);
  try {
    let pool = await sql.connect(config);
    let insertObject = await pool
      .request()
      .input("RoomId", sql.Int, assignedRoom.RoomID)
      .input("RoomStatus", sql.NVarChar, assignedRoom.RoomStatus)
      .input("AssignedDateTime", sql.DateTime, assignedRoom.assignedDateTime)
      .input("assignedEmployeeID", sql.Int, assignedRoom.assignedEmployeeID)
      .input("CleaningStatus", sql.NVarChar, assignedRoom.cleaningStatus)
      .input("IsCompleted", sql.Bit, assignedRoom.isCompleted)
      .input("VerifiedPhotoUrl", sql.NVarChar, assignedRoom.verifiedPhotoUrl)
      .input("StartTime", sql.DateTime, assignedRoom.startTime)
      .input("EndTime", sql.DateTime, assignedRoom.endTime)
      .input("CleaningDuration", sql.Time, assignedRoom.cleaningDuration)
      .input("IsHelperRequested", sql.Bit, assignedRoom.isHelperRequested)
      .input("RequestedHelperId", sql.Int, assignedRoom.reguestedHelperID)
      .input("AdditionalNotes", sql.NVarChar, assignedRoom.AdditionalNotes)
      .input(
        "inspectionFeedback",
        sql.NVarChar,
        assignedRoom.inspectionFeedback,
      )
      .input("rating", sql.Int, assignedRoom.rating)
      .input("inspectionPhotos", sql.NVarChar, assignedRoom.inspectionPhotos)
      .input("inspectionNotes", sql.NVarChar, assignedRoom.inspectionNotes)
      .execute("InsertAssignedRoom");
    return insertObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

async function updateAssignedRoom(assignedRoom) {
  console.log(assignedRoom);
  try {
    //    console.log(item);
    let pool = await sql.connect(config);
    let updateObject = await pool
      .request()
      .input("ID", sql.Int, assignedRoom.ID)
      .input("RoomID", sql.Int, assignedRoom.roomID)
      .input("AssignedDateTime", sql.DateTime, assignedRoom.assignedDateTime)
      .input("AssignedEmployeeID", sql.Int, assignedRoom.assignedEmployeeID)
      .input("CleaningStatus", sql.NVarChar, assignedRoom.cleaningStatus)
      .input("IsCompleted", sql.Bit, assignedRoom.isCompleted)
      .input("VerifiedPhotoUrl", sql.NVarChar, assignedRoom.verifiedPhotoUrl)
      .input("StartTime", sql.DateTime, assignedRoom.startTime)
      .input("EndTime", sql.DateTime, assignedRoom.endTime)
      .input("CleaningDuration", sql.Time, assignedRoom.cleaningDuration)
      .input("IsHelperRequested", sql.Bit, assignedRoom.isHelperRequested)
      .input("RequestedHelperID", sql.Int, assignedRoom.reguestedHelperID)
      .input("AdditionalNotes", sql.NVarChar, assignedRoom.AdditionalNotes)
      .input(
        "InspectionFeedback",
        sql.NVarChar,
        assignedRoom.inspectionFeedback,
      )
      .input("Rating", sql.Int, assignedRoom.rating)
      .input("InspectionPhotos", sql.NVarChar, assignedRoom.inspectionPhotos)
      .input("InspectionNotes", sql.NVarChar, assignedRoom.inspectionNotes)
      .input(
        "IsHelperRequestedApproved",
        sql.Bit,
        assignedRoom.isHelperRequestedApproved,
      )
      .input(
        "HelperRequestedAdditionalNotes",
        sql.NVarChar,
        assignedRoom.helperRequestedAdditionalNotes,
      )
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
  getAssignedRoomTblAll: getAssignedRoomTblAll,
};
