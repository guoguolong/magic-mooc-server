const path = require('path')
const fs = require('fs')
const glob = require('glob')
const fsExtra = require('fs-extra');
const COURSE_DIR = '/Users/koda/private/allen-github/presentations/c/'
const COURSE_DIR2 = '/Users/koda/private/allen-github/presentations/foundation/'

const { Sequelize } = require('sequelize');
const sequelize = new Sequelize('moocdb', 'magicmooc', 'magicmooc', {
    host: 'localhost',
    dialect: 'postgres',
    pool: {
        max: 5,
        min: 0,
        acquire: 30000,
        idle: 10000
    },
    logging: false
});

const Course = sequelize.import(__dirname + "/../models/psql/course");
const Article = sequelize.import(__dirname + "/../models/psql/article");

(async function () {
    try {
        await sequelize.authenticate();
        await main();
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
    process.exit(0)
})();

function isDir(filePath) {
    return fsExtra.lstatSync(filePath).isDirectory()
}

const isSaved = {}
async function createRow(courseId, filePath, parentId, level) {
    let seq, name, content = '';
    level = level || 1;

    const pathMeta = filePath.split('/').pop();
    const pathInfo = pathMeta.split('.');

    // pathInfo[0] - 编号
    seq = parseInt(pathInfo[0]);

    if (!Number.isInteger(seq)
        || (!isDir(filePath) && !(/\.md/.test(pathMeta)))
        || (isDir(filePath) && pathInfo.length < 2)
        || (!isDir(filePath) && pathInfo.length < 3)
    ) {
        return 0;
    }

    // pathInfo[1] - 文档名称
    name = pathInfo[1].trim();

    if (!fsExtra.lstatSync(filePath).isDirectory()) {
        content = fs.readFileSync(filePath, 'utf-8')
    }
    parentId = parentId || 0;
    const course = await Course.findByPk(courseId);
    const article = await Article.create({
        course_id: course.id,
        seq,
        name,
        content,
        parent_id: parentId,
        level
    })
    if (!isSaved[course.id]) {
        course.start_article_id = article.id;
        await course.save();
        isSaved[course.id] = true;
    }
    return article.id;
}

async function buildCourse(courseId, dir, level, parentArticleId) {
    // function space(level) {
    //     indent = '';
    //     for (let index = 0; index < level; index++) {
    //         indent += ' ';
    //     }
    //     return indent;
    // }
    // function getItem(item) {
    //     return item.split('/').pop()
    // }
    // console.log(space(level * 4), getItem(dir))

    level = level || 0;
    const articleId = await createRow(courseId, dir, parentArticleId, level);

    if (fsExtra.lstatSync(dir).isDirectory()) {
        const dirObj = glob.sync(dir + '/*', {});
        for (const item of dirObj) {
            await buildCourse(courseId, item, level + 1, articleId);
        }
    }
}

async function main() {
    sequelize.query('DELETE FROM article')
    await buildCourse(10, COURSE_DIR);
    await buildCourse(20, COURSE_DIR2);
}