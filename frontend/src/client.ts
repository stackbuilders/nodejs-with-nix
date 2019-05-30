import axios from 'axios';

export interface User {
  id: number;
  firstName: string;
  lastName: string;
}

const client = axios.create({
  baseURL: 'http://localhost:3000'
});

export function getUsers(): Promise<User[]> {
  return client.get('/users').then(({ data }) => data);
}
