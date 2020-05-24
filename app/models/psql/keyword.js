/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('keyword', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(keyword_id_seq::regclass)',
      primaryKey: true
    },
    keyword: {
      type: DataTypes.STRING,
      allowNull: false
    },
    memo: {
      type: DataTypes.STRING,
      allowNull: false
    },
    hot: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    hits: {
      type: DataTypes.INTEGER,
      allowNull: false
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
