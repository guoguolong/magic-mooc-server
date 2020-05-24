/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('message', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(message_id_seq::regclass)',
      primaryKey: true
    },
    sender_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    receiver_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    sender_name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    receiver_name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    content: {
      type: DataTypes.STRING,
      allowNull: false
    },
    type: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    obj_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    struct: {
      type: DataTypes.STRING,
      allowNull: false
    },
    has_read: {
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
    tableName: 'message'
  });
};
