import * as dotenv from 'dotenv';
import { Sequelize } from 'sequelize';

dotenv.config();

const env = process.env.NODE_ENV || 'development';
const config = require('../config/database.json')[env];

const sequelize = (config => {
  if (config.use_env_variable) {
    return new Sequelize(process.env[config.use_env_variable] as string, config);
  }
  return new Sequelize(config.database, config.username, config.password, config);
})(config);

export default sequelize;
