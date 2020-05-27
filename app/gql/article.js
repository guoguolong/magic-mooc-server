const { buildSchema, GraphQLSchema, GraphQLObjectType, GraphQLNonNull, GraphQLString, GraphQLInt } = require('graphql');
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
                }                
            }
        })
    });

    return graphqlHTTP({
        schema: schema,
        graphiql: true,
    })
};