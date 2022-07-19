const Pool = require("pg").Pool;
const cors = require('cors');
const express = require('express');


const app = express();
app.use(cors())
require("dotenv").config();
const isProduction = process.env.NODE_ENV === "production";
const connectionString = `postgresql://${process.env.PG_USER}:${process.env.PG_PASSWORD}@${process.env.PG_HOST}:${process.env.PG_PORT}/${process.env.PG_DATABASE}`;
const connect = new Pool({
    connectionString: isProduction ? process.env.DATABASE_URL : connectionString,
    ssl: {
        rejectUnauthorized: false,
    },
});

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(cors())

const getBooks = (request, response) => {
  connect.query('SELECT * FROM books', (error, results) => {
    if (error) {
      throw error
    }
    response.status(200).json(results.rows)
  })
}

app
  .route('/books')
  // GET endpoint
  .get(getBooks)
  
  app.listen(process.env.PORT || 3002, () => {
  console.log(`Server listening`)
})