/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('question', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(question_id_seq::regclass)',
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    tag_ids: {
      type: DataTypes.STRING,
      allowNull: false
    },
    content_is_md: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    content: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    is_survey: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    type: {
      type: DataTypes.STRING,
      allowNull: false
    },
    answer_is_md: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    answer: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    difficulty: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    score: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    hots: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    complexity_time: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    complexity_space: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    input: {
      type: DataTypes.STRING,
      allowNull: false
    },
    output: {
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
    },
    course_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    chapter_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    article_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    enable: {
      type: DataTypes.INTEGER,
      allowNull: false
    }
  }, {
    tableName: 'question'
  });
};
