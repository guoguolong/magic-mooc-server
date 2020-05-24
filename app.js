const path = require('path');
const Koa = require('koa')
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

    const baseCtrllDir = './app/controllers/';
    const userCtrl = require(path.resolve(baseCtrllDir, 'user'))(config);
    const courseCtrl = require(path.resolve(baseCtrllDir, 'course'))(config);
    const articleCtrl = require(path.resolve(baseCtrllDir, 'article'))(config);

    router.get('/', (ctx, next) => {
        ctx.body = 'Hello Koa Router';
    }).all('/users', async (ctx, next) => {
        await userCtrl.list(ctx, next);
    }).all('user', '/user/:id', async (ctx, next) => {
        await userCtrl.detail(ctx, next);
    }).all('course', '/course/list', async (ctx, next) => {
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

    app.use(async (ctx, next) => {
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
    }).use(async (ctx, next) => {
        ctx.set("Access-Control-Allow-Origin", '*');
        ctx.set("Access-Control-Allow-Headers", '*');
        await next();
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