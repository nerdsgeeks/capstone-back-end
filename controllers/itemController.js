var config = require("../dbconfig");
const sql = require("mssql");

async function getItems() {
  try {
    let pool = await sql.connect(config);
    let objects = await pool.request().query("SELECT * from Items");
    return objects.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function getItem(itemId) {
  try {
    let pool = await sql.connect(config);
    let object = await pool
      .request()
      .input("input_parameter", sql.Int, itemId)
      .query("SELECT * from Items where Id = @input_parameter");
    return object.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function addItem(item) {
  try {
    let pool = await sql.connect(config);
    let insertObject = await pool
      .request()
      .input("ItemName", sql.NVarChar, item.ItemName)
      .input("AvailableNum", sql.Int, item.AvailableNum)
      .input("Description", sql.NVarChar, item.Description)
      .input("ImageUrl", sql.NVarChar, item.ImageUrl)
      .input("GroupName", sql.NVarChar, item.GroupName)
      .input("ItemType", sql.NVarChar, item.ItemType)
      .execute("InsertItem");
    return insertObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

async function updateItem(item) {
  try {
    //    console.log(item);
    let pool = await sql.connect(config);
    let updateObject = await pool
      .request()
      .input("ItemID", sql.Int, item.ID)
      .input("ItemName", sql.NVarChar, item.ItemName)
      .input("AvailableNum", sql.Int, item.AvailableNum)
      .input("Description", sql.NVarChar, item.Description)
      .input("ImageUrl", sql.NVarChar, item.ImageUrl)
      .input("GroupName", sql.NVarChar, item.GroupName)
      .input("ItemType", sql.NVarChar, item.ItemType)
      .execute("UpdateItem");

    return updateObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

async function deleteItem(item) {
  try {
    let pool = await sql.connect(config);
    let deleteObject = await pool
      .request()
      .input("ItemID", sql.Int, item.ID)
      .execute("DeleteItem");
    return deleteObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

module.exports = {
  getItems: getItems,
  getItem: getItem,
  addItem: addItem,
  updateItem: updateItem,
  deleteItem: deleteItem,
};
