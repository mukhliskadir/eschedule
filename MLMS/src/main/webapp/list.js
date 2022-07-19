const pg = require('pg');
const R = require('ramda');

const cs = new Sequelize(

 'postgres://ocetdbspxioaak:046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e@ec2-3-234-131-8.compute-1.amazonaws.com:5432/d19mjejga32und',
{
    logging: false,
    ssl: { rejectUnauthorized: false } //solved the problem with self signed sertificate

})
const client = new pg.Client(cs);

client.connect();

client.query('SELECT * FROM speaker').then(res => {

    const data = res.rows;

    console.log('all data');
    data.forEach(row => {
        console.log(`Id: ${row.speakerid} Name: ${row.speakername} Price: ${row.speakerphoneno}`);
    })

    console.log('Sorted prices:');
    const prices = R.pluck('price', R.sortBy(R.prop('price'), data));
    console.log(prices);

}).finally(() => {
    client.end()
});/**
 * 
 */
 