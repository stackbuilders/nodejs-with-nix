import * as express from 'express';

import User from './model';

const router = express.Router();

router.get('/', async (req, res, next) => {
  const users = await User.findAll();
  res.json(users);
});

router.get('/:id', async (req, res, next) => {
  const user = await User.findOne({ where: { id: req.params.id } });
  if (user === null) {
    return res.status(404).json({ message: 'User not found' });
  }
  res.json(user);
});

export default router;
