const { Pool } = require('pg');
const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors());
const pool = new Pool({
    user: 'ocetdbspxioaak',
    host: 'ec2-3-234-131-8.compute-1.amazonaws.com',
    database: 'd19mjejga32und',
    password: '046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e',
    port: 5432,
    ssl: {
        rejectUnauthorized: false,
    },
});

pool.on('error', (err, client) => {
    console.error('Error:', err);
});

const query = `
SELECT *
FROM speaker
`;


app.get('/display', (req, res) => {
  var micro_username = req.query.username;

  console.log("username: " + micro_username);

  pool.connect(function (err, client) {
    if (err) { res.send('Error Database Connection'); }
    else {
      client.query(query, function (err, result) {
        if (err) { throw err; }
        else {
          res.send(result);
        }
      connection.release();
      });
    }
  });
});

app.listen(process.env.PORT ,() => {
  console.log('Example app listening to port 4005');
});
