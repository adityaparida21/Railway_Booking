import mysql from 'mysql2';
import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';

// Load environment variables from the .env file
dotenv.config();

const app = express();
app.use(cors());
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

//Loggin the Time
const now = new Date();

// Get current date in YYYY-MM-DD format
const date = now.toISOString().split("T")[0]; // YYYY-MM-DD

// Get current time in HH:MM:SS format
const time = now.toTimeString().split(" ")[0]; // HH:MM:SS

console.log(`Current Date: ${date}`);
console.log(`Current Time: ${time}`);

// Use the environment variables to create the database connection
const conn = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT
}).promise();

var sources, destinations;

async function trains(source, destination) {
    const [rows] = await conn.query(
        `SELECT * FROM train 
        INNER JOIN coaches ON train.TrainNo = coaches.TrainNo 
        WHERE train.Source = ? AND train.Destination = ?`, 
        [sources, destinations]
    );
    return rows;
}

async function availTrain(source, destination) {
    const [rows] = await conn.query(
        `SELECT * FROM train WHERE Source = ? AND Destination = ?`, 
        [source, destination]
    );
    return rows;
}

async function insertUser(name, email, password) {
    try {
        const insert = await conn.query(
            `INSERT INTO customers (ID, CustomerName, CustomerPassword, CustomerEmail) 
             VALUES(?, ?, ?, ?)`, 
            [null, name, password, email]
        );
        return true;
    } catch (err) {
        console.log(err);
        return 1;
    }
}

async function findUser(username, password) {
    try {
        const [rows] = await conn.query(
            `SELECT * FROM customers WHERE CustomerName = ?`, 
            [username]
        );
        return rows;
    } catch (err) {
        console.log(err);
    }
}

async function journey_details(train) {
    try {
        const [details] = await conn.query(
            `SELECT * FROM train WHERE TrainNo = ?`, 
            [train]
        );
        return details;
    } catch (Err) {
        console.log(Err);
    }
}

async function booking(seat, train) {
    try {
        // Convert seat type to uppercase to match DB columns
        const seatType = seat.toUpperCase();
        
        const [free_seat] = await conn.query(
            `SELECT ${seatType} FROM coaches WHERE TrainNo = ?`, 
            [train]
        );
        const [curr_seat] = await conn.query(
            `SELECT ${seatType} FROM berth WHERE TrainNo = ? AND ${seatType} IS NOT NULL`, 
            [train]
        );
        const [berth] = await conn.query(
            `SELECT Berth FROM berth WHERE TrainNo = ? AND ${seatType} IS NOT NULL`, 
            [train]
        );
        
        var coach = free_seat[0];
        var curr = curr_seat[0];
        var berthNo = berth[0];
        var new_freeSeat = 0;
        var new_CurSeat = 0;
        var ticket = 0;
        
        for (const key in coach) {
            new_freeSeat = coach[key];
        }
        
        if (new_freeSeat !== 0) {
            for (const key in curr) {
                new_CurSeat = curr[key];
            }
            for (const key in berthNo) {
                ticket = berthNo[key];
            }

            new_freeSeat = new_freeSeat - 1;
            new_CurSeat = new_CurSeat + 1;

            var log = ticket + "/" + new_CurSeat;
            console.log(log);
            
            const [update] = await conn.query(
                `UPDATE coaches SET ${seatType} = ? WHERE TrainNo = ?`, 
                [new_freeSeat, train]
            );
            const [update2] = await conn.query(
                `UPDATE berth SET ${seatType} = ? WHERE TrainNo = ? AND ${seatType} IS NOT NULL`, 
                [new_CurSeat, train]
            );
            return log;
        } else {
            return 0;
        }
    } catch (err) {
        console.log(err);
    }
}

app.post("/register", async (req, res) => {
    const { username, email, password } = req.body;
    var state = await insertUser(username, email, password);
    if (state === true) {
        return res.json({ status: true });
    } else {
        return res.json({ status: false });
    }
});

app.post("/login", async (req, res) => {
    const { username, password } = req.body;
    var data = await findUser(username, password);
    var user = {
        Id: data[0].ID,
        username: data[0].CustomerName,
        email: data[0].CustomerEmail
    }

    if (Object.keys(data).length !== 0) {
        res.json({ status: true, user })
    } else {
        res.status(404).json({ err: "Incorrect Credentials", status: false });
    }
});

app.post("/form", async (req, res) => {
    let s = req.body.from;
    let d = req.body.to;
    sources = s;
    destinations = d;
    const data = await availTrain(sources, destinations);
    if (Object.keys(data).length !== 0) {
        res.status(200).json({ msg: "Showing results", status: true });
    } else {
        res.status(404).json({ err: "No available train", status: false });
    }
});

app.get("/search", async (req, res) => {
    const data = await trains(sources, destinations);
    if (Object.keys(data).length !== 0) {
        res.send(data);
    } else {
        console.log("No available trains");
        res.status(400).json({ error: "No available trains", status: false });
    }
});

let x = {};
var berth;

app.post("/booking", async (req, res) => {
    try {
        console.log("Request body:", req.body);
        const { seat_type, tr, user_info } = req.body;
        console.log("Train number:", tr);
        berth = await booking(seat_type, tr);
        var journey = await journey_details(tr);

        if (journey.length === 0) {
            return res.status(404).json({ error: "Train not found" });
        }

        x = {
            name: user_info.username,
            email: user_info.email,
            train: tr,
            trainName: journey[0].TrainName,
            source: journey[0].Source,
            destination: journey[0].Destination,
            departure: journey[0].DepartureTime,
            arrival: journey[0].ArrivalTime,
            seat: seat_type,
            seatno: berth
        };

        // Insert transaction details into DB
        const [query] = await conn.query(
            `INSERT INTO transaction (CustomerID, CustomerEmail, Train, TrainName, Source, 
            Destination, Departure, Arrival, Coach, SeatNo, Date) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
            [user_info.Id, user_info.email, tr, journey[0].TrainName, journey[0].Source, 
            journey[0].Destination, journey[0].DepartureTime, journey[0].ArrivalTime, 
            seat_type, berth, date]
        );

        res.status(200).json(x);
    } catch (error) {
        console.error("Booking error:", error);
        res.status(500).json({ error: "Booking failed" });
    }
});

app.get("/get_booking", async (req, res) => {
    console.log(x);
    res.send(x);
});

app.post("/transaction", async (req, res) => {
    const { customer } = req.body;
    const userData = JSON.parse(customer);
    const ID = userData.Id;
    const [data] = await conn.query(`SELECT * FROM transaction WHERE CustomerID = ?`, [ID]);
    res.send(data);
});

app.listen(5000, () => {
    console.log("Server is up");
});