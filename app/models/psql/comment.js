/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('comment', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(comment_id_seq::regclass)',
      primaryKey: true
    },
    obj_type: {
      type: DataTypes.STRING,
      allowNull: false
    },
    obj_id: {
      type: DataTypes.INTEGER,
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
    creator_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    receiver_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    client_ip: {
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
    tableName: 'comment'
  });
};
