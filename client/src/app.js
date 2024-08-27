import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Container, Row, Col } from 'reactstrap';
import BookCard from './components/BookCard';

function App() {
  const [books, setBooks] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:5000/books')
      .then(response => setBooks(response.data))
      .catch(error => console.error('Error fetching data:', error));
  }, []);

  return (
    <Container>
      <Row>
        {books.map(book => (
          <Col key={book.id} md="4">
            <BookCard book={book} />
          </Col>
        ))}
      </Row>
    </Container>
  );
}

export default App;
