module.exports = function (config) {
    return {
        list: async (ctx, next) => {
            const Course = ctx.getEntity('Course');
            const courses = await Course.findAll();
            ctx.body = courses;
        },
        detail: async (ctx, next) => {
            const Course = ctx.getEntity('Course');
            // Course.sync({ force: true })
            // Course.sync({ alter: true })
            const course = await Course.findByPk(ctx.params.id);
            ctx.body = course;
        },
        delete: async (ctx, next) => {
            const Course = ctx.getEntity('Course');
            const result = await Course.destroy({
              where: {
                id: ctx.params.id,
              }
            })
            ctx.body = {
                error: 0,
                message: '成功删除'
            }
        },
        save: async (ctx, next) => {
            const Course = ctx.getEntity('Course');
            const data = ctx.request.body
            data.price = parseInt(data.price, 10)
            console.error('data.price:::', data.price)
            if (data.price <=0) {
                throw new Error('Price must be greater than 0.')
            }
            let course = await Course.findByPk(ctx.params.id);
            if (!course) {
                course = await Course.create(data)
            } else {
                course.name = data.name;
                course.summary = data.summary;
                course.price = data.price;
                await course.save();
            }
            ctx.body = course;
        },
        summary: async (ctx, next) => {
            const Course = ctx.getEntity('Course');
            const Article = ctx.getEntity('Article');
            Course.hasMany(Article, { foreignKey: 'course_id' });
            Article.belongsTo(Course, { foreignKey: 'course_id' });

            const course = await Course.findOne({
                where: {
                    id: ctx.params.id
                },
                include: Article,
                order: [
                    ['articles', 'seq', 'ASC']
                ]
            });
            
            // 现在数据按level分组
            const articlesByLevel = {};
            course.articles.map(itemObj => {
                const level = itemObj.level;
                articlesByLevel[level] = articlesByLevel[level] || {};
                articlesByLevel[level][itemObj.id] = {
                    id: itemObj.id,
                    name: itemObj.name,
                    parent_id: itemObj.parent_id,
                    seq: itemObj.seq,
                    level,
                };
            })

            // 第一层以下的 article 对象都塞到第一层对象里
            Object.keys(articlesByLevel).forEach((level) => {
                const articles = Object.values(articlesByLevel[level]);
                articles.forEach(item => {
                    if (level != 1) {
                        const parent = Object.values(articlesByLevel[level - 1]).find(element => element.id ==  item.parent_id);
                        if (!parent) {
                            throw new Error('Parent node not found for item: ', item)
                        }
                        parent['children'] = parent['children'] || {};
                        parent['children'][item.id] = item;
                    }
                })
            })

            // 获取默认文章
            article = await Article.findByPk(course.start_article_id);

            const courseObj = course.toJSON();
            
            // articlesByLevel 第一层对象就是完整的目录树
            courseObj.articles = articlesByLevel[1];
            courseObj.activeArticle = article || {};
            ctx.body = courseObj
        }
    }
}