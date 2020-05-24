/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('question_option', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(question_option_id_seq::regclass)',
      primaryKey: true
    },
    question_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    no: {
      type: DataTypes.STRING,
      allowNull: false
    },
    lang: {
      type: DataTypes.STRING,
      allowNull: false
    },
    content_is_md: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    content: {
      type: DataTypes.STRING,
      allowNull: false
    },
    answer_is_md: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    answer: {
      type: DataTypes.STRING,
      allowNull: false
    },
    score: {
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
    tableName: 'question_option'
  });
};
