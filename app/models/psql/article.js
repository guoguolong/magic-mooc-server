/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('article', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      // defaultValue: 'nextval(article_id_seq::regclass)',
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    period: {
      type: DataTypes.STRING,
      allowNull: true
    },
    course_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    style: {
      type: DataTypes.STRING,
      allowNull: true
    },
    html: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    content: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    seq: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    level: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    creator_id: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    createdAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
      field: 'created_at'
    },
    updatedAt: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
      field: 'updated_at'      
    },
    parent_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
  }, {
    tableName: 'article'
  });
};
