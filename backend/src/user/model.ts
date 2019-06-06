import { DataTypes, Model } from 'sequelize';

import sequelize from '../db';

class User extends Model {
  public firstName!: string;
  public lastName!: string;
}

User.init({
  firstName: {
    type: DataTypes.STRING,
    allowNull: false
  },
  lastName: {
    type: DataTypes.STRING,
    allowNull: false
  }
}, {
  sequelize
});

export default User;
