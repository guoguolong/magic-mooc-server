/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('user_file', {
    id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    url: {
      type: DataTypes.STRING(500),
      allowNull: false,
      defaultValue: ''
    },
    name: {
      type: DataTypes.STRING(100),
      allowNull: false,
      defaultValue: ''
    },
    origin_name: {
      type: DataTypes.STRING(200),
      allowNull: false,
      defaultValue: ''
    },
    description: {
      type: DataTypes.STRING(500),
      allowNull: false,
      defaultValue: ''
    },
    user_id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      defaultValue: '0'
    },
    obj_id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      defaultValue: '0'
    },
    obj_type: {
      type: DataTypes.ENUM('default','course','article','paper','question','feed'),
      allowNull: false,
      defaultValue: 'feed'
    },
    type: {
      type: DataTypes.ENUM('img','file'),
      allowNull: false,
      defaultValue: 'img'
    },
    size: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      defaultValue: '0'
    },
    created_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    tableName: 'user_file'
  });
};
