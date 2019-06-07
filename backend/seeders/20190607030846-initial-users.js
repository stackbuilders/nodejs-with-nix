'use strict';

const faker = require('faker');

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('Users', [{
      firstName: faker.name.firstName(),
      lastName: faker.name.lastName(),
      createdAt: new Date(),
      updatedAt: new Date()
    }, {
      firstName: faker.name.firstName(),
      lastName: faker.name.lastName(),
      createdAt: new Date(),
      updatedAt: new Date()
    }], {});
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('Users', null, {});
  }
};
