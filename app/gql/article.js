const { buildSchema, GraphQLSchema, GraphQLObjectType, GraphQLNonNull, GraphQLString, GraphQLInt, GraphQLList } = require('graphql');
const graphqlSeq = require('graphql-sequelize');

module.exports = function(ctx, config) {
    const Article = ctx.getEntity('Article');
    const { ArticleType } = require('./basic_type')(ctx, config)

    return {
        query: {
            detail: {
                type: ArticleType,
                args: {
                    id: {
                        description: 'id of the article',
                        type: new GraphQLNonNull(GraphQLInt)
                    }
                },
                resolve: graphqlSeq.resolver(Article)
            },
            search: {
                type: new GraphQLList(ArticleType),
                args: {
                    course_id: {
                        description: 'id of the course',
                        type: GraphQLInt
                    },
                    offset: {
                        description: 'offset the record',
                        type: GraphQLInt
                    },
                    limit: {
                        description: 'limit total records fetched',
                        type: GraphQLInt
                    }
                },
                resolve: async (root, {course_id, offset, limit}, info) => {
                    course_id = course_id || 0;
                    offset = offset || 0;
                    limit = limit || 10;
                    const Article = ctx.getEntity('Article');
                    const articles = Article.findAll({
                        where: {
                            course_id
                        },
                        limit,
                        offset,
                    });
                    return articles;
                }
            }
        }
    };
};