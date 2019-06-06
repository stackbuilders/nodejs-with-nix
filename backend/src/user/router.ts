import * as express from 'express';

import User from './model';

const router = express.Router();

router.get('/', async (req, res, next) => {
  const users = await User.findAll();
  res.json(users);
});

router.get('/:id', async (req, res, next) => {
  const user = await User.findByPk(req.params.id);
  res.json(user);
});

export default router;
