module.exports = {
    db: {
        secret: {
            name: 'moocdb',
            username: 'magicmooc',
            password: 'magicmooc',
        },
        options: {
            host: 'localhost',
            // dialect: 'mysql',
            dialect: 'postgres',
            pool: {
                max: 5,
                min: 0,
                acquire: 30000,
                idle: 10000
            }
        }
    }
}