/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('user', {
    id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    phone: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: '',
      unique: true
    },
    username: {
      type: DataTypes.STRING(30),
      allowNull: false,
      defaultValue: '',
      unique: true
    },
    email: {
      type: DataTypes.STRING(50),
      allowNull: false,
      defaultValue: ''
    },
    password: {
      type: DataTypes.STRING(255),
      allowNull: false,
      defaultValue: ''
    },
    full_name: {
      type: DataTypes.STRING(50),
      allowNull: false,
      defaultValue: ''
    },
    roles: {
      type: DataTypes.STRING(200),
      allowNull: false,
      defaultValue: ''
    },
    avatar: {
      type: DataTypes.STRING(300),
      allowNull: false,
      defaultValue: ''
    },
    homepage: {
      type: DataTypes.STRING(300),
      allowNull: false,
      defaultValue: ''
    },
    gender: {
      type: DataTypes.INTEGER(1),
      allowNull: false,
      defaultValue: '0'
    },
    birthday: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    wx_unique_id: {
      type: DataTypes.STRING(100),
      allowNull: false,
      defaultValue: ''
    },
    wx_openid: {
      type: DataTypes.STRING(100),
      allowNull: false,
      defaultValue: ''
    },
    wx_sex: {
      type: DataTypes.STRING(10),
      allowNull: false,
      defaultValue: ''
    },
    wx_city: {
      type: DataTypes.STRING(30),
      allowNull: false,
      defaultValue: ''
    },
    wx_province: {
      type: DataTypes.STRING(30),
      allowNull: false,
      defaultValue: ''
    },
    wx_country: {
      type: DataTypes.STRING(30),
      allowNull: false,
      defaultValue: ''
    },
    register_ip: {
      type: DataTypes.STRING(30),
      allowNull: false,
      defaultValue: ''
    },
    last_visited: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP')
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
      field: 'created_at'
    },
    job_title: {
      type: DataTypes.STRING(100),
      allowNull: false,
      defaultValue: ''
    }
  }, {
    tableName: 'user'
  });
};
