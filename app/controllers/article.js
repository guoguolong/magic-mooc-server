
module.exports = function (config) {
    return {
        list: async (ctx, next) => {
            const Article = ctx.getEntity('article');
            const articles = await Article.findAll({
                where:  {
                    course_id: ctx.params.courseId
                },
                order: ['seq']
            });

            const body = articles.map(item => {
                return {
                    id: item.id,
                    name: item.name,
                    parent_id: item.parent_id
                }
            })
            ctx.body = body;
        },
        detail: async (ctx, next) => {
            const Article = ctx.getEntity('article');
            const article = await Article.findByPk(ctx.params.id);
            if (!article) {
                return ctx.body = {error: -1}
            }
            ctx.body = article;
        }
    }
}