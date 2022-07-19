const express = require('express');
const morgan = require('morgan');
const bodyParser = require('body-parser');
const PORT = process.env.PORT || 5432;
const speakerDatabase = require('./connection');
const app = express();

app.use(morgan(process.env.NODE_ENV !== 'production' ? 'dev' : 'combined'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));


app.get('/api/v1/speaker', (req, res) => {
  speakerDatabase('speaker')
    .select('*')
    .then(speaker => res.status(200).json(speaker))
    .catch(error => {
      res.status(500).json({ error: error.message, stack: error.stack });
    });
});

app.get('/api/v1/speaker/:speakerid', (req, res) => {
  speakerDatabase('speaker')
    .select('*')
    .limit(1)
    .where({ speaekerid: req.params.speakerid })
    .then(speaker => res.status(200).json(speaker))
    .catch(error => {
      res.status(500).json({ error: error.message, stack: error.stack });
    });
});

app.post('/api/v1/speaker', (req, res) => {
  speakerDatabase('speaker')
    .insert(req.body)
    .then(() => res.status(201).json({ data: req.body }))
    .catch(error => {
      res.status(500).json({ error: error.message, stack: error.stack });
    });
});

app.listen(PORT, () => console.log('Example app is listening!'));