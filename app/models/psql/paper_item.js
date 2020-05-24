/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('paper_item', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(paper_item_id_seq::regclass)',
      primaryKey: true
    },
    seq: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    paper_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    question_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    score: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    rate: {
      type: DataTypes.DOUBLE,
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
    tableName: 'paper_item'
  });
};
