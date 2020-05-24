/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('clazz', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(clazz_id_seq::regclass)',
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    start_date: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    end_date: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    master_name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    master_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    creator_id: {
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
    tableName: 'clazz'
  });
};
