module.exports = function (config) {
    return {
        list: async (ctx, next) => {
            const User = ctx.getEntity('user');
            const users = await User.findAll();

            const listTmpl = users.map(user => {
                return `<li>${user.username} | ${user.email}</li>`;
            })
            ctx.body = `<ul>${listTmpl.join('')}</ul>`;
        },
        detail: async (ctx, next) => {
            const url = ctx.router.url('user', 3);
            ctx.body = `<h1>[User View]</h1>Url: ${url}<br/>Id: ${ctx.params.id}`
        }
    }
}