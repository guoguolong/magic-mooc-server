/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('user_profile', {
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      defaultValue: 'nextval(user_profile_id_seq::regclass)',
      primaryKey: true
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    full_name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    avatar: {
      type: DataTypes.STRING,
      allowNull: false
    },
    homepage: {
      type: DataTypes.STRING,
      allowNull: false
    },
    github: {
      type: DataTypes.STRING,
      allowNull: false
    },
    gender: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    birthday: {
      type: DataTypes.DATEONLY,
      allowNull: true
    },
    birth_year: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    birth_month: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    working_status: {
      type: DataTypes.STRING,
      allowNull: false
    },
    expect_city: {
      type: DataTypes.STRING,
      allowNull: false
    },
    expect_salary: {
      type: DataTypes.STRING,
      allowNull: false
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: false
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false
    },
    intro: {
      type: DataTypes.STRING,
      allowNull: false
    },
    school: {
      type: DataTypes.STRING,
      allowNull: false
    },
    major: {
      type: DataTypes.STRING,
      allowNull: false
    },
    admission_year: {
      type: DataTypes.STRING,
      allowNull: false
    },
    graduation_year: {
      type: DataTypes.STRING,
      allowNull: false
    },
    english_ability: {
      type: DataTypes.STRING,
      allowNull: false
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
      type: DataTypes.STRING,
      allowNull: false
    },
    birthplace: {
      type: DataTypes.STRING,
      allowNull: false
    }
  }, {
    tableName: 'user_profile'
  });
};
