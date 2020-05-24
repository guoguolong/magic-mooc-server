/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('message', {
    id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    sender_id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      defaultValue: '0'
    },
    receiver_id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      defaultValue: '0'
    },
    sender_name: {
      type: DataTypes.STRING(128),
      allowNull: false,
      defaultValue: '0'
    },
    receiver_name: {
      type: DataTypes.STRING(128),
      allowNull: false,
      defaultValue: '0'
    },
    content: {
      type: DataTypes.STRING(500),
      allowNull: false,
      defaultValue: '0'
    },
    type: {
      type: DataTypes.INTEGER(10),
      allowNull: false,
      defaultValue: '0'
    },
    obj_id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      defaultValue: '0'
    },
    struct: {
      type: DataTypes.STRING(500),
      allowNull: false,
      defaultValue: '0'
    },
    has_read: {
      type: DataTypes.INTEGER(1),
      allowNull: false,
      defaultValue: '0'
    },
    created_at: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP')
    }
  }, {
    tableName: 'message'
  });
};
