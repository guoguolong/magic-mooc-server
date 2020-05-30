const path = require('path');
const Koa = require('koa')
const cors = require('@koa/cors');
const Router = require('@koa/router');
const { ApolloServer, gql } = require('apollo-server-koa');
const { Sequelize } = require('sequelize');
const bodyParser = require('koa-bodyparser');
const config = require('./app/config');
const app = new Koa();
const router = new Router();

(async function () {
    // initialize sequelize.
    const sequelize = new Sequelize(config.db.secret.name, config.db.secret.username, config.db.secret.password, config.db.options);
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
        // await next();
    } catch (error) {
        console.error = 'Error Catched: ' + error.message;
    }

    const appContext = {
        router: router,
        sequelize: sequelize,
        getEntity : (modelName) => {
            modelName = modelName.toLowerCase().trim();
            return sequelize.import(__dirname + '/app/models/psql/' + modelName);
        }    
    }

    // load gql schema & resolver
    const schema = require('./app/gql')(appContext, config);
    const server = new ApolloServer({ schema });
    server.applyMiddleware({ app });

    app.use(cors())

    const port = 4000;
    app.listen(port)

    let logo = '';
    logo += ' __  __             _      __  __                  ' + '\n';
    logo += '|  \\/  |           (_)    |  \\/  |                 ' + '\n';
    logo += '| \\  / | __ _  __ _ _  ___| \\  / | ___   ___   ___ ' + '\n';
    logo += '| |\\/| |/ _` |/ _` | |/ __| |\\/| |/ _ \\ / _ \\ / __|' + '\n';
    logo += '| |  | | (_| | (_| | | (__| |  | | (_) | (_) | (__ ' + '\n';
    logo += '|_|  |_|\\__,_|\\__, |_|\\___|_|  |_|\\___/ \\___/ \\___|' + '\n';
    logo += '               __/ |                               ' + '\n';
    logo += '              |___/                                ' + '\n';
    logo += `Started on port ${port}`
    console.log(logo)
})();