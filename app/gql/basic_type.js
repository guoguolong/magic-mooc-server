const { buildSchema, GraphQLSchema, GraphQLObjectType, GraphQLNonNull, GraphQLString, GraphQLInt, GraphQLList, GraphQLInputObjectType } = require('graphql');
const graphqlSeq = require('graphql-sequelize');

module.exports = function(ctx, config) {
    const Article = ctx.getEntity('Article');

    const Course = ctx.getEntity('Course');
    // const Article = ctx.getEntity('Article');
    Course.Articles = Course.hasMany(Article, { foreignKey: 'course_id' });
    Article.belongsTo(Course, { foreignKey: 'course_id' });
    
    const ArticleType = new GraphQLObjectType({
        name: 'ArticleType',
        description: 'An article',
        fields: Object.assign(graphqlSeq.attributeFields(Article))
    });

    const ArticleTreeType= new GraphQLObjectType({
        name: 'ArticleTreeType',
        description: 'An article tree',
        fields: () => {
            return Object.assign(graphqlSeq.attributeFields(Article), {
                children: {
                    type: new GraphQLList(ArticleTreeType)
                }
            });
        }
    });


    const MutationResponse = new GraphQLObjectType({
        name: 'Response',
        description: 'Response Information.',
        fields: {
            error: {
                type: GraphQLInt,
                description: '0 Failed, 1 Success.',
            },
            message: {
                type: GraphQLString,
                description: 'Error or success message.',
            }
        }
    });

    const CourseType = new GraphQLObjectType({
        name: 'Course',
        description: 'An course',
        fields: Object.assign(graphqlSeq.attributeFields(Course), {
            start_article_id: {
                type: GraphQLInt,
            },
            activeArticle: {
                type: ArticleTreeType,
            },
            articles: {
                type: new GraphQLList(ArticleTreeType),
                resolve: graphqlSeq.resolver(Course.Articles)
            }
        })
    });

    const CourseInputType = new GraphQLInputObjectType({
        name: 'CourseInputType',
        description: 'Course input type',
        fields: () => ({
            id: {
                type: GraphQLInt
            },
            name: {
                type: GraphQLString
            },
            summary: {
                type: GraphQLString
            },
            price: {
                type: GraphQLInt
            }
        })
    });

    return {
        MutationResponse,
        ArticleType,
        ArticleTreeType,
        CourseType,
        CourseInputType
    }
}