/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('groups', {
    id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING(200),
      allowNull: false,
      defaultValue: ''
    },
    avatar: {
      type: DataTypes.STRING(500),
      allowNull: false,
      defaultValue: ''
    },
    intro: {
      type: DataTypes.STRING(2000),
      allowNull: false,
      defaultValue: ''
    },
    type: {
      type: DataTypes.INTEGER(2),
      allowNull: false,
      defaultValue: '1'
    },
    creator_id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
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
    tableName: 'groups'
  });
};
