/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('quiz', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(quiz_id_seq::regclass)',
      primaryKey: true
    },
    paper_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    min_score: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    max_score: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    evaluation: {
      type: DataTypes.TEXT,
      allowNull: true
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
    tableName: 'quiz'
  });
};
