import cors from 'cors';
import express from 'express';
import logger from 'morgan';

import usersRouter from './user/router';

const app = express();

app.use(logger('dev'));
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use('/users', usersRouter);

export default app;
