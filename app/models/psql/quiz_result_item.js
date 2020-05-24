/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('quiz_result_item', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(quiz_result_item_id_seq::regclass)',
      primaryKey: true
    },
    paper_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    quiz_result_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    question_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    score: {
      type: DataTypes.DOUBLE,
      allowNull: false
    },
    duration: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    success: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    answer: {
      type: DataTypes.TEXT,
      allowNull: true
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
    lang: {
      type: DataTypes.STRING,
      allowNull: false
    }
  }, {
    tableName: 'quiz_result_item'
  });
};
