import express from 'express';
import faker from 'faker';

const router = express.Router();

interface User {
  id: number;
  firstName: string;
  lastName: string;
}

const users: User[] = [{
  id: 1,
  firstName: faker.name.firstName(),
  lastName: faker.name.lastName()
}, {
  id: 2,
  firstName: faker.name.firstName(),
  lastName: faker.name.lastName()
}];

router.get('/', (req, res, next) => {
  res.json(users);
});

router.get('/:id', (req, res, next) => {
  const user = users.find(({ id }) => id == req.params['id']);
  if (user) {
    return res.json(user);
  }
  res.status(404).json({ message: 'User not found' });
});

export default router;
