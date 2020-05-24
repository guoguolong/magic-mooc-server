/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('user', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(user_id_seq::regclass)',
      primaryKey: true
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: false
    },
    username: {
      type: DataTypes.STRING,
      allowNull: false
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false
    },
    job_title: {
      type: DataTypes.STRING,
      allowNull: true
    },
    full_name: {
      type: DataTypes.STRING,
      allowNull: true
    },
    roles: {
      type: DataTypes.STRING,
      allowNull: true
    },
    avatar: {
      type: DataTypes.STRING,
      allowNull: true
    },
    homepage: {
      type: DataTypes.STRING,
      allowNull: true
    },
    gender: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    birthday: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    wx_unique_id: {
      type: DataTypes.STRING,
      allowNull: true
    },
    wx_openid: {
      type: DataTypes.STRING,
      allowNull: true
    },
    wx_sex: {
      type: DataTypes.STRING,
      allowNull: true
    },
    wx_city: {
      type: DataTypes.STRING,
      allowNull: true
    },
    wx_province: {
      type: DataTypes.STRING,
      allowNull: true
    },
    wx_country: {
      type: DataTypes.STRING,
      allowNull: true
    },
    register_ip: {
      type: DataTypes.STRING,
      allowNull: true
    },
    last_visited: {
      type: DataTypes.DATE,
      allowNull: true
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
      field: 'created_at'
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
      field: 'updated_at'      
    }
  }, {
    tableName: 'user'
  });
};
