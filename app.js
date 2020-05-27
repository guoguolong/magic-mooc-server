const path = require('path');
const Koa = require('koa')
const cors = require('@koa/cors');
const Router = require('@koa/router');
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

    const baseGqlDir = './app/gql/';
    const gqlCtrls = {
        user: require(path.resolve(baseGqlDir, 'user'))(appContext, config),
        article: require(path.resolve(baseGqlDir, 'article'))(appContext, config),
        course: require(path.resolve(baseGqlDir, 'course'))(appContext, config),
    }

    router.get('/', (ctx, next) => {
        ctx.body = 'Hello Koa Router';
    }).all('/users', gqlCtrls.user)
    .all('/article', gqlCtrls.article)
    .all('/course', gqlCtrls.course);
    
    app.use(cors())
    // app.use(async (ctx, next) => {
    //     ctx.set('Access-Control-Allow-Origin', '*');
    //     ctx.set('Access-Control-Allow-Methods', 'GET,HEAD,PUT,POST,DELETE,PATCH');
    //     ctx.set('Access-Control-Allow-Headers', '*');
    //     if (ctx.method == 'OPTIONS') {
    //         ctx.status = 204;
    //         return;
    //     }
    //     await next();
    // })
    .use(async (ctx, next) => {
        ctx.router = router;
        ctx.sequelize = sequelize;
        ctx.getEntity = (modelName) => {
            modelName = modelName.toLowerCase().trim();
            return sequelize.import(__dirname + '/app/models/psql/' + modelName);
        }
        try {
            // await sequelize.authenticate();
            // console.log('Connection has been established successfully.');
            await next();
        } catch (error) {
            // ctx.status = error.status || 500;
            ctx.body = {error: 999, message: error.message};
        }
    }).use(bodyParser())
        .use(router.routes())
        .use(router.allowedMethods());

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