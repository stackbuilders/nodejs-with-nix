import axios from 'axios';

export interface User {
  id: number;
  firstName: string;
  lastName: string;
}

const client = axios.create({
  baseURL: process.env['REACT_APP_CLIENT_BASE_URL']
});

export function getUsers(): Promise<User[]> {
  return client.get('/users').then(({ data }) => data);
}
