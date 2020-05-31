const { buildSchema, GraphQLBoolean, GraphQLSchema, GraphQLInputObjectType, GraphQLInterfaceType, GraphQLObjectType, GraphQLNonNull, GraphQLString, GraphQLInt, GraphQLList } = require('graphql');
const graphqlSeq = require('graphql-sequelize');

module.exports = function(ctx, config) {
    const { CourseType, CourseInputType, MutationResponse } = require('./basic_type')(ctx, config)

    const Course = ctx.getEntity('Course');
    const Article = ctx.getEntity('Article');

    return {
        query: {
            detail: {
                type: CourseType,
                args: {
                    id: {
                        description: 'id of the course',
                        type: new GraphQLNonNull(GraphQLInt)
                    }
                },
                resolve: graphqlSeq.resolver(Course),
            },
            summary: {
                type: CourseType,
                args: {
                    id: {
                        description: 'id of the course',
                        type: new GraphQLNonNull(GraphQLInt)
                    }
                },
                resolve: graphqlSeq.resolver(Course, {
                    before: (findOptions, args, context) => {
                        findOptions.where = {
                            id: args.id
                        };
                        findOptions.order = [
                            ['articles', 'seq', 'ASC']
                        ]
                        findOptions.include = Article;

                        return findOptions;
                    },
                    after: async (result, args, context) => {
                        const course = result;
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
                                    parent['children'] = parent['children'] || [];
                                    parent['children'].push(item);
                                }
                            })
                        })

                        // 获取默认文章
                        article = await Article.findByPk(course.start_article_id);

                        const courseObj = course.toJSON();
                        
                        // articlesByLevel 第一层对象就是完整的目录树
                        courseObj.articles = Object.values(articlesByLevel[1]);
                        courseObj.activeArticle = article.toJSON() || {};
                        return courseObj;
                    }
                })
            },
            list: {
                type: new GraphQLList(CourseType),
                args: {
                    pageNo: {
                        description: 'Page no',
                        type: GraphQLInt
                    }
                },
                resolve: graphqlSeq.resolver(Course, {
                    after: (result, args, context) => {
                        result = result.map(item => {
                            return item;
                        })
                        // result.sort(/* Custom sort function */);
                        return result;
                    },                        
                })
            }                
        },
        mutation: {
            save: {
                type: CourseType,
                args: {
                    data: {
                        type: CourseInputType
                    }                        
                },
                resolve: async (root, {data}, info) => {
                    const Course = ctx.getEntity('Course');
                    data.price = parseInt(data.price, 10)
                    if (data.price <=0) {
                        throw new Error('Price must be greater than 0.')
                    }
                    let course = await Course.findByPk(data.id);
                    if (!course) {
                        course = await Course.create(data)
                    } else {
                        course.name = data.name;
                        course.summary = data.summary;
                        course.price = data.price;
                        await course.save();
                    }

                    return course;
                }
            },
            remove: {
                type: MutationResponse,
                args: {
                    id: {
                        type: GraphQLInt
                    }
                },
                resolve: async (root, {id}, info) => {
                    const Course = ctx.getEntity('Course');
                    const resp = {
                        message: '操作成功',
                        error: 0
                    }
                    const result = await Course.destroy({
                      where: {
                        id: id,
                      }
                    })
                    if (!result) {
                        resp.error = 100;
                        resp.message = '操作失败';
                    }
                    return resp;
                }
            },
        }
    }
};