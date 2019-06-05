import { DataTypes, Model, Sequelize } from 'sequelize';

const env = process.env.NODE_ENV || 'development';
const config = require('./config/config.json')[env];

const sequelize = (config => {
  if (config.use_env_variable) {
    return new Sequelize(process.env[config.use_env_variable], config);
  }
  return new Sequelize(config.database, config.username, config.password, config);
})(config);

export class User extends Model {
  public firstName: string;
  public lastName: string;

  public readonly createdAt: Date;
  public readonly updatedAt: Date;
}

User.init({
  firstName: DataTypes.STRING,
  lastName: DataTypes.STRING
}, {
  sequelize
});
