const jwt = require("jsonwebtoken");
require("dotenv").config();
const bcrypt = require("bcrypt");
const sql = require("mssql");
var config = require("../dbconfig");
const login = async (req, res) => {
  try {
    const { employeeid, password } = req.body;

    //  const hashedPassword = await bcrypt.hash( password, 10);
    const pool = await sql.connect(config);
    const result = await pool
      .request()
      .input("Username", sql.VarChar, employeeid)
      .execute("Getuser");

    console.log(result.recordset[0].Password);

    const match = await bcrypt.compare(password, result.recordset[0].Password);

    //   const status = result.recordsets[0][0].Status;
    //   const userID = result.recordsets[0][0].UserID;

    console.log(result.recordset[0]);
    const userID = result.recordset[0].ID;
    const FirstName = result.recordset[0].FirstName;
    const LastName = result.recordset[0].LastName;
    const EmployeeType = result.recordset[0].EmployeeType;
    const imageURL = result.recordset[0].imageURL;

    // console.log(userID);

    if (match) {
      const accessToken = jwt.sign(
        { userid: userID },
        process.env.ACCESS_TOKEN_SECRET,
        { expiresIn: "1h" },
      );
      const refreshToken = jwt.sign(
        { userid: userID },
        process.env.REFRESH_TOKEN_SECRET,
        { expiresIn: "24h" },
      );

      let updaterefreshToken = await pool
        .request()
        .input("ID", sql.Int, userID)
        .input("refreshToken", sql.VarChar, refreshToken)
        .execute("UpdateToken");

      res.cookie("jwt", refreshToken, {
        httpOnly: true,
        sameSite: "None",
        secure: true,
        maxAge: 24 * 60 * 60 * 1000,
      });
      res.json({
        accessToken,
        userID,
        FirstName,
        LastName,
        EmployeeType,
        imageURL,
      });
    } else {
      res
        .status(401)
        .json({ success: false, message: "Invalid username or password" });
    }
  } catch (err) {
    console.log(err);
    res.status(500).json({ success: false, message: "Internal server error" });
  }
};

module.exports = { login };
