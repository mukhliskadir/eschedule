module.exports = {
  development: {
    client: 'sqlite3',
    connection: {
      filename: './dev.sqlite3'
    }
  },
  staging: {
    client: 'pg',
    connection: {
      database: 'jdbc:postgresql://ec2-3-234-131-8.compute-1.amazonaws.com/d19mjejga32und',
      user:     'ocetdbspxioaak',
      password: '046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      tableName: 'knex_migrations'
    }
  },
  production: {
    client: 'pg',
    connection: {
      database: 'jdbc:postgresql://ec2-3-234-131-8.compute-1.amazonaws.com/d19mjejga32und',
      user:     'ocetdbspxioaak',
      password: '046d2c84c24f70b0f1b8cf071d97fe00efe0700a42909777604ad0298b5bec3e'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      tableName: 'knex_migrations'
    }
  }
};