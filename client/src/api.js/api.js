const API_URL = 'https://www.googleapis.com/books/v1/volumes';

export const fetchBooks = async () => {
  try {
    const response = await fetch(`${API_URL}?q=search+terms`);
    const data = await response.json();
    return data.items;
  } catch (error) {
    console.error('Error fetching books:', error);
  }
};
