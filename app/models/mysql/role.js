/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('role', {
    id: {
      type: DataTypes.INTEGER(11).UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    code: {
      type: DataTypes.STRING(30),
      allowNull: false,
      defaultValue: ''
    },
    name: {
      type: DataTypes.STRING(30),
      allowNull: false,
      defaultValue: ''
    },
    config: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    memo: {
      type: DataTypes.STRING(200),
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
    tableName: 'role'
  });
};
