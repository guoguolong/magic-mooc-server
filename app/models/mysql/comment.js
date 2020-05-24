/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('comment', {
    id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    obj_type: {
      type: DataTypes.ENUM('feed','question','article','quiz_result_item'),
      allowNull: false,
      defaultValue: 'feed'
    },
    obj_id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      defaultValue: '0'
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
    creator_id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      defaultValue: '0'
    },
    receiver_id: {
      type: DataTypes.INTEGER(10),
      allowNull: false,
      defaultValue: '0'
    },
    client_ip: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: ''
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
