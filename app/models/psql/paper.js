/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('paper', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(paper_id_seq::regclass)',
      primaryKey: true
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    content: {
      type: DataTypes.STRING,
      allowNull: false
    },
    tag_ids: {
      type: DataTypes.STRING,
      allowNull: false
    },
    mode: {
      type: DataTypes.STRING,
      allowNull: false
    },
    is_survey: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    is_official: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    is_draft: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    passed_score: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    score: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    subjective: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    objective: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    questions: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    difficulty: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    minutes_limited: {
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
    tableName: 'paper'
  });
};
