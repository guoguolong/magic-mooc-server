/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('collection', {
    id: {
      type: DataTypes.INTEGER(11).UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      defaultValue: '0'
    },
    obj_type: {
      type: DataTypes.ENUM('course','paper','question','feed'),
      allowNull: false,
      defaultValue: 'feed'
    },
    obj_id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      defaultValue: '0'
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
    }
  }, {
    tableName: 'collection'
  });
};
