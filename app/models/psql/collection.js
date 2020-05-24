/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('collection', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(collection_id_seq::regclass)',
      primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    obj_type: {
      type: DataTypes.STRING,
      allowNull: false
    },
    obj_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    memo: {
      type: DataTypes.STRING,
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
    tableName: 'collection'
  });
};
