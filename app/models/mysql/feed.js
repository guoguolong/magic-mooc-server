/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('feed', {
    id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    type: {
      type: DataTypes.INTEGER(10),
      allowNull: false,
      defaultValue: '0'
    },
    show_type: {
      type: DataTypes.INTEGER(10),
      allowNull: false,
      defaultValue: '0'
    },
    title: {
      type: DataTypes.STRING(200),
      allowNull: false,
      defaultValue: ''
    },
    style: {
      type: DataTypes.ENUM('text','richtext','markdown'),
      allowNull: false,
      defaultValue: 'text'
    },
    content: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    img_urls: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    file_urls: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    is_deleted: {
      type: DataTypes.INTEGER(1),
      allowNull: false,
      defaultValue: '0'
    },
    views: {
      type: DataTypes.INTEGER(10),
      allowNull: false,
      defaultValue: '0'
    },
    client_ip: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: ''
    },
    group_id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      defaultValue: '0'
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
    tableName: 'feed'
  });
};
