var config = require("../dbconfig");
const sql = require("mssql");

async function getReservations() {
  try {
    let pool = await sql.connect(config);
    let objects = await pool.request().query("SELECT * from Reservation");
    return objects.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function getReservation(reservationId) {
  try {
    let pool = await sql.connect(config);
    let object = await pool
      .request()
      .input("input_parameter", sql.Int, reservationId)
      .query("SELECT * from Reservation where Id = @input_parameter");
    return object.recordsets;
  } catch (error) {
    console.log(error);
  }
}

async function addReservation(reservation) {
  try {
    let pool = await sql.connect(config);
    let insertObject = await pool
      .request()
      .input("RoomId", sql.Int, reservation.RoomId)
      .input("CheckIn", sql.DateTime, reservation.CheckIn)
      .input("CheckOut", sql.DateTime, reservation.CheckOut)
      .input("GuestName", sql.NVarChar, reservation.GuestName)
      .input("NoOfGuest", sql.Int, reservation.NoOfGuest)
      .input("AdditionalNotes", sql.NVarChar, reservation.AdditionalNotes)
      .input("IsCompleted", sql.Bit, reservation.IsCompleted)
      .execute("InsertReservation");
    return insertObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

async function updateReservation(reservation) {
  try {
    //    console.log(item);
    let pool = await sql.connect(config);
    let updateObject = await pool
      .request()
      .input("RoomId", sql.Int, reservation.RoomId)
      .input("CheckIn", sql.DateTime, reservation.CheckIn)
      .input("CheckOut", sql.DateTime, reservation.CheckOut)
      .input("GuestName", sql.NVarChar, reservation.GuestName)
      .input("NoOfGuest", sql.Int, reservation.NoOfGuest)
      .input("AdditionalNotes", sql.NVarChar, reservation.AdditionalNotes)
      .input("IsCompleted", sql.Bit, reservation.IsCompleted)
      .execute("UpdateReservation");

    return updateObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

async function deleteReservation(reservation) {
  try {
    let pool = await sql.connect(config);
    let deleteObject = await pool
      .request()
      .input("ReservationID", sql.Int, reservation.ID)
      .execute("DeleteReservation");
    return deleteObject.recordsets;
  } catch (err) {
    console.log(err);
  }
}

module.exports = {
  getReservations: getReservations,
  getReservation: getReservation,
  addReservation: addReservation,
  updateReservation: updateReservation,
  deleteReservation: deleteReservation,
};
