/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('tag', {
    id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    code: {
      type: DataTypes.STRING(100),
      allowNull: false,
      defaultValue: ''
    },
    name: {
      type: DataTypes.STRING(100),
      allowNull: false,
      defaultValue: ''
    },
    type: {
      type: DataTypes.ENUM('course','paper','question','feed'),
      allowNull: false,
      defaultValue: 'feed'
    },
    memo: {
      type: DataTypes.STRING(500),
      allowNull: false,
      defaultValue: ''
    },
    created_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP')
    },
    updated_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    tableName: 'tag'
  });
};
