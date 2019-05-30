import React, { useEffect, useState } from 'react';

import * as client from './client';

const App: React.FC = () => {
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
