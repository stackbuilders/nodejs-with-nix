import React, { useEffect, useState } from 'react';
import {
  BrowserRouter as Router,
  Redirect,
  Route
} from 'react-router-dom';

import * as client from './client';

function App() {
  return (
    <Router>
      <Route exact path="/" render={() => (
        <Redirect to="/users" />
      )} />
      <Route path="/users" component={Users} />
    </Router>
  );
}

function Users() {
  const [users, setUsers] = useState<client.User[]>([]);
  useEffect(() => {
    client.getUsers().then(setUsers);
  }, []);
  const listUsers = users.map(({ id, firstName, lastName }) => 
    <li key={id}>{firstName} {lastName}</li>
  );
  return (<ul>{listUsers}</ul>);
}

export default App;
