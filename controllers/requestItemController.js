var config = require("../dbconfig");
var sql = require("mssql");

async function getRequestItems() {
  try {
    let pool = await sql.connect(config);
    let objects = await pool.request().query("SELECT * from View_RequestItems");
    return objects.recordsets;   
  } catch (error) {
    console.log(error);
  }
}

async function getRequestItemsTblAll() {
  try {
    let pool = await sql.connect(config);
    let objects = await pool.request().query("SELECT * from RequestItem");
    return objects.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function getRequestItem(requestItemId) {
  try {
    let pool = await sql.connect(config);
    let object = await pool
      .request()
      .input("input_parameter", sql.Int, requestItemId)
      .query("SELECT * from RequestItem where Id = @input_parameter");
    return object.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function getRequestItemView(assignedRoomID) {
  try {
    let pool = await sql.connect(config);
    let object = await pool
      .request()
      .input("assignedRoomID", sql.Int, assignedRoomID)
      .query(
        "SELECT * from View_RequestItems where assignedRoomID = @assignedRoomID",
      );
    return object.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function addRequestItem(requestItem) {
  try {
    console.log(requestItem);
    let pool = await sql.connect(config);
    let insertObject = await pool
      .request()
      .input("assignedRoomID", sql.Int, requestItem.assignedRoomID)
      .input("RequestedItemID", sql.Int, requestItem.RequestedItemID)
      .input("Quantity", sql.Int, requestItem.Quantity)
      .input("Note", sql.NVarChar, requestItem.Note)
      .input("RequestedDateTime", sql.DateTime, requestItem.RequestedDateTime)
      .input("isCompleted", sql.Bit, requestItem.isCompleted)
      .input(
        "approvedBySupervisorID",
        sql.Int,
        requestItem.approvedBySupervisorID,
      )
      .execute("CreateRequestItem");
    return insertObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

async function updateRequestItem(requestItemId, requestItem) {
  try {
    let pool = await sql.connect(config);
    let updateObject = await pool
      .request()
      .input("RequestItemID", sql.Int, requestItemId)
      .input(
        "RequestedDateTime",sql.DateTime,requestItem.RequestedDateTime,
      )
      .input("assignedRoomID", sql.Int, requestItem.assignedRoomID)
      .input("RequestedItemID", sql.Int, requestItem.RequestedItemID)
      .input("Quantity", sql.Int, requestItem.Quantity)
      .input("IsCompleted", sql.Bit, requestItem.isCompleted)
      .input("Note", sql.NVarChar, requestItem.Note)
      .input(
        "ApprovedBySupervisorId",
        sql.Int,
        requestItem.approvedBySupervisorID,
      )
      .execute("UpdateRequestItem");
    return updateObject.recordsets;
  } catch (err) {
    console.log(err);
  }
} 


async function deleteRequestItem(requestItemId) {
  try {
    let pool = await sql.connect(config);
    let deleteObject = await pool
      .request()
      .input("Id", sql.Int, requestItemId)
      .execute("DeleteRequestItem");
    return deleteObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

module.exports = {
    getRequestItems: getRequestItems,
    getRequestItem: getRequestItem,
    addRequestItem: addRequestItem,
    updateRequestItem: updateRequestItem,
    deleteRequestItem: deleteRequestItem,
    getRequestItemView: getRequestItemView,
    getRequestItemsTblAll: getRequestItemsTblAll
};
