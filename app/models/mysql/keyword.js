/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('keyword', {
    id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    keyword: {
      type: DataTypes.STRING(100),
      allowNull: false,
      defaultValue: ''
    },
    memo: {
      type: DataTypes.STRING(500),
      allowNull: false,
      defaultValue: ''
    },
    hot: {
      type: DataTypes.INTEGER(10),
      allowNull: false,
      defaultValue: '0'
    },
    hits: {
      type: DataTypes.INTEGER(10),
      allowNull: false,
      defaultValue: '0'
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
    tableName: 'keyword'
  });
};
