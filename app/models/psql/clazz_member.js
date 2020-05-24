/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('clazz_member', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(clazz_member_id_seq::regclass)',
      primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    clazz_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    join_date: {
      type: DataTypes.DATEONLY,
      allowNull: true
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
    tableName: 'clazz_member'
  });
};
