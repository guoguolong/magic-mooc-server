const graphqlHTTP = require('koa-graphql');
const { buildSchema } = require('graphql');

const UserSchema = buildSchema(`
  type Query {
    hello: String
    user(id: Float): User!
    friends: [User]
  },
  type User {
    id: ID
    name: String
  },
`)

const UserResolver = {
  user:  (params) => { 
    const {id} = params
    const users = {
        100: {id: 100, name: 'Allen'},
        200: {id: 200, name: 'Koda', weight: 140}
    }
    return users[id] || {alias: 'Judy', id: 999, name: 'Default'};
  },
  friends:  () => { 
    return [
        {id: 1, name: 'Xiami'},
        {id: 2, name: 'Pipiu'},
        {id: 3, name: 'Dude'},
    ] 
  },
  hello: () => 'Hello world!' 
};

module.exports = function(ctx, config) {
    return graphqlHTTP({
        schema: UserSchema,
        rootValue: UserResolver,
        graphiql: true,
    })
};