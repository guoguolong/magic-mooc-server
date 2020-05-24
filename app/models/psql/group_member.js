/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('group_member', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(group_member_id_seq::regclass)',
      primaryKey: true
    },
    group_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    is_receive: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    role_type: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    is_deleted: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    created_at: {
      type: DataTypes.DATE,
      allowNull: false
    },
    updated_at: {
      type: DataTypes.DATE,
      allowNull: false
    }
  }, {
    tableName: 'group_member'
  });
};
