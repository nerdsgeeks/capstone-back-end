
//const User = require("../models/userModel");
var config = require("../dbconfig");
const bcrypt = require("bcrypt");
const sql = require("mssql");

async function createEmployee(employee) {
  try {
      let pool = await sql.connect(config);
      const hashedPassword = await bcrypt.hash( employee.Password, 10);
      let insertObject = await pool.request()
          .input('FirstName', sql.VarChar, employee.FirstName)
          .input('LastName', sql.VarChar, employee.LastName)
          .input('Email', sql.VarChar, employee.Email)
          .input('PhoneNumber', sql.VarChar, employee.PhoneNumber)
          .input('ShiftSchadule', sql.VarChar, employee.ShiftSchadule)
          .input('EmployeeID', sql.VarChar, employee.EmployeeID)
          .input('Password', sql.VarChar,hashedPassword)
          .input('EmployeeType', sql.Int, employee.EmployeeType)
          .execute('CreateEmployee');
      return insertObject.recordsets;
  }
  catch (err) {
      console.log(err);
  }
}

async function getEmployees() {
  try {
      let pool = await sql.connect(config);
      let objects = await pool.request().execute('GetEmployees');
      return objects.recordsets;
  }
  catch (err) {
      console.log(err);
  }
}
async function getEmployee(ID ) {
  try {
    let pool = await sql.connect(config);
    let object = await pool
      .request()
      .input("input_parameter", sql.Int, ID)
      .query("SELECT * from Employee where Id = @input_parameter");
    return object.recordsets;
  } catch (error) {
    console.log(error);
  }
}
async function updateEmployee(employee) {
  try {
      let pool = await sql.connect(config);
      let updateObject = await pool.request()
          .input('EmployeeID', sql.Int, employee.EmployeeID)
          .input('FirstName', sql.VarChar, employee.FirstName)
          .input('LastName', sql.VarChar, employee.LastName)
          .input('Email', sql.VarChar, employee.Email)
          .input('PhoneNumber', sql.VarChar, employee.PhoneNumber)
          .input('ShiftSchadule', sql.VarChar, employee.ShiftSchadule)
          .input('EmployeeID', sql.VarChar, employee.EmployeeID)
          .input('Password', sql.VarBinary, employee.Password)
          .input('EmployeeType', sql.Int, employee.EmployeeType)
          .execute('UpdateEmployee');
      return updateObject.recordsets;
  }
  catch (err) {
      console.log(err);
  }
}

async function deleteEmployee(employeeID) {
  try {
      let pool = await sql.connect(config);
      let deleteObject = await pool.request()
          .input('EmployeeID', sql.Int, employeeID)
          .execute('DeleteEmployee');
      return deleteObject.recordsets;
  }
  catch (err) {
      console.log(err);
  }
}


module.exports = {
  createEmployee: createEmployee,
  updateEmployee: updateEmployee,
  getEmployees: getEmployees,
  deleteEmployee: deleteEmployee,
  getEmployee: getEmployee,
};
