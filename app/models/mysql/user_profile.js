/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('user_profile', {
    id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER(10).UNSIGNED,
      allowNull: false,
      defaultValue: '0'
    },
    full_name: {
      type: DataTypes.STRING(50),
      allowNull: false,
      defaultValue: ''
    },
    avatar: {
      type: DataTypes.STRING(300),
      allowNull: false,
      defaultValue: ''
    },
    homepage: {
      type: DataTypes.STRING(300),
      allowNull: false,
      defaultValue: ''
    },
    github: {
      type: DataTypes.STRING(300),
      allowNull: false,
      defaultValue: ''
    },
    gender: {
      type: DataTypes.INTEGER(1),
      allowNull: false,
      defaultValue: '0'
    },
    birthday: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    birth_year: {
      type: DataTypes.INTEGER(10),
      allowNull: false,
      defaultValue: '0'
    },
    birth_month: {
      type: DataTypes.INTEGER(10),
      allowNull: false,
      defaultValue: '0'
    },
    working_status: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: ''
    },
    expect_city: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: ''
    },
    expect_salary: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: ''
    },
    phone: {
      type: DataTypes.STRING(20),
      allowNull: false,
      defaultValue: ''
    },
    email: {
      type: DataTypes.STRING(50),
      allowNull: false,
      defaultValue: ''
    },
    intro: {
      type: DataTypes.STRING(500),
      allowNull: false,
      defaultValue: ''
    },
    school: {
      type: DataTypes.STRING(50),
      allowNull: false,
      defaultValue: ''
    },
    major: {
      type: DataTypes.STRING(50),
      allowNull: false,
      defaultValue: ''
    },
    admission_year: {
      type: DataTypes.STRING(50),
      allowNull: false,
      defaultValue: ''
    },
    graduation_year: {
      type: DataTypes.STRING(50),
      allowNull: false,
      defaultValue: ''
    },
    english_ability: {
      type: DataTypes.STRING(50),
      allowNull: false,
      defaultValue: ''
    },
    work_experience: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    project_experience: {
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
    education: {
      type: DataTypes.STRING(50),
      allowNull: false,
      defaultValue: ''
    },
    birthplace: {
      type: DataTypes.STRING(100),
      allowNull: false,
      defaultValue: ''
    }
  }, {
    tableName: 'user_profile'
  });
};
