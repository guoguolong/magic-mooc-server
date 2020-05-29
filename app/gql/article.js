const { buildSchema, GraphQLSchema, GraphQLObjectType, GraphQLNonNull, GraphQLString, GraphQLInt, GraphQLList } = require('graphql');
const graphqlHTTP = require('koa-graphql');
const graphqlSeq = require('graphql-sequelize');

module.exports = function(ctx, config) {
    const Article = ctx.getEntity('Article');
    const articleType = new GraphQLObjectType({
        name: 'Article',
        description: 'An article',
        fields: Object.assign(graphqlSeq.attributeFields(Article), {
            // name: {
            //     type: GraphQLString,
            //     description: 'The name of the article.',
            // }
        })
    });

    const schema = new GraphQLSchema({
        query: new GraphQLObjectType({
            name: 'RootQueryType',
            fields: {
                detail: {
                    type: articleType,
                    args: {
                        id: {
                            description: 'id of the article',
                            type: new GraphQLNonNull(GraphQLInt)
                        }
                    },
                    resolve: graphqlSeq.resolver(Article)
                },
                search: {
                    type: new GraphQLList(articleType),
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
        })
    });

    return graphqlHTTP({
        schema: schema,
        graphiql: true,
    })
};