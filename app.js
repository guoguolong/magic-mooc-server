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

    const baseCtrllDir = './app/controllers/';
    const userCtrl = require(path.resolve(baseCtrllDir, 'user'))(config);
    const courseCtrl = require(path.resolve(baseCtrllDir, 'course'))(config);
    const articleCtrl = require(path.resolve(baseCtrllDir, 'article'))(config);

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
    .all('/lession', gqlCtrls.course)
    .all('course', '/course/list', async (ctx, next) => {
        await courseCtrl.list(ctx, next);
    }).all('course', '/course/detail/:id', async (ctx, next) => {
        await courseCtrl.detail(ctx, next);
    }).all('course', '/course/summary/:id', async (ctx, next) => {
        await courseCtrl.summary(ctx, next);
    }).post('course', '/course/save/:id', async (ctx, next) => {
        await courseCtrl.save(ctx, next);
    }).get('course', '/course/delete/:id', async (ctx, next) => {
        await courseCtrl.delete(ctx, next);
    }).all('article', '/article/list/:courseId', async (ctx, next) => {
        await articleCtrl.list(ctx, next);
    }).all('article', '/article/:id', async (ctx, next) => {
        await articleCtrl.detail(ctx, next);
    });
    
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