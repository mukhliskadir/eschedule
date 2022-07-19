module.exports = {
  development: {
    client: 'pg',
    connection: 'jdbc:postgresql://ec2-3-234-131-8.compute-1.amazonaws.com/d19mjejga32und'
  },
  production: {
    client: 'pg',
    connection: process.env.DATABASE_URL
  }
};