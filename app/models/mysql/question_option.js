/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('question_option', {
    id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    question_id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      defaultValue: '0'
    },
    no: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: ''
    },
    lang: {
      type: DataTypes.ENUM('java','c','js'),
      allowNull: false,
      defaultValue: 'java'
    },
    content_is_md: {
      type: DataTypes.INTEGER(1),
      allowNull: false,
      defaultValue: '0'
    },
    content: {
      type: DataTypes.STRING(2000),
      allowNull: false,
      defaultValue: ''
    },
    answer_is_md: {
      type: DataTypes.INTEGER(1),
      allowNull: false,
      defaultValue: '0'
    },
    answer: {
      type: DataTypes.STRING(2000),
      allowNull: false,
      defaultValue: ''
    },
    score: {
      type: DataTypes.INTEGER(10),
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
    tableName: 'question_option'
  });
};
