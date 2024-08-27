import React from 'react';
import { useParams } from 'react-router-dom';

const BookDetail = () => {
  const { id } = useParams();
  // Fetch book details using id

  return (
    <div>
      <h2>Book Detail</h2>
      {/* Display book details */}
    </div>
  );
};

export default BookDetail;
