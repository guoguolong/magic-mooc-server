/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('feed', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(feed_id_seq::regclass)',
      primaryKey: true
    },
    type: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    show_type: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    title: {
      type: DataTypes.STRING,
      allowNull: false
    },
    style: {
      type: DataTypes.STRING,
      allowNull: false
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
      type: DataTypes.INTEGER,
      allowNull: false
    },
    views: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    client_ip: {
      type: DataTypes.STRING,
      allowNull: false
    },
    group_id: {
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
    tableName: 'feed'
  });
};
