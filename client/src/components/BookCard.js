import React from 'react';
import { Card, CardBody, CardTitle, CardText } from 'reactstrap';

const BookCard = ({ book }) => (
  <Card>
    <CardBody>
      <CardTitle tag="h5">{book.title}</CardTitle>
      <CardText>{book.author}</CardText>
    </CardBody>
  </Card>
);

export default BookCard;
