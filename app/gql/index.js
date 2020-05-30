const { GraphQLSchema, GraphQLObjectType, GraphQLString} = require('graphql');

module.exports = function(ctx, config) {
    const article = require('./article')(ctx, config);
    const course = require('./course')(ctx, config);

    const ArticleData = new GraphQLObjectType({
        name: 'ArticleData',
        fields: () => (article.query)
    })

    const CourseData = new GraphQLObjectType({
        name: 'CourseData',
        fields: () => (course.query)
    })

    const CourseMutationData = new GraphQLObjectType({
        name: 'CourseMutationData',
        fields: () => (course.mutation)
    })

    const schema = new GraphQLSchema({
        query: new GraphQLObjectType({
            name: 'Query',
            fields: () => ({
                article: {
                    type: ArticleData,
                    resolve: () => {
                        return true;
                    }
                },
                course: {
                    type: CourseData,
                    resolve: () => {
                        return true;
                    }
                },
                hello: {
                    type: GraphQLString,
                    resolve: () => {
                        return 'Hello GraphQL';
                    }
                }
            })
        }),
        mutation: new GraphQLObjectType({
            name: 'Mutation',
            fields: () => ({
                course: {
                    type: CourseMutationData,
                    resolve: () => {
                        return true;
                    }
                },
            })
        })
    })

    return schema
}