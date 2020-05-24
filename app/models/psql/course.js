/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('course', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(course_id_seq::regclass)',
      primaryKey: true,
      autoIncrement: true      
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    summary: {
      type: DataTypes.STRING,
      allowNull: false
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    tag_ids: {
      type: DataTypes.STRING,
      allowNull: true
    },
    period: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    price: {
      type: DataTypes.INTEGER,
      allowNull: true,
      defaultValue: '0'
    },
    seq: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    start_article_id: {
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
    }
  }, {
    tableName: 'course'
  });
};
