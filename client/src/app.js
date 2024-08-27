import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Header from './components/Header';
import Footer from './components/Footer';
import Home from './components/Home';
import BookList from './components/BookList';
import BookDetail from './components/BookDetail';
import BookClub from './components/BookClub';
import UserProfile from './components/UserProfile';
import Trade from './components/Trade';

function App() {
  return (
    <Router>
      <Header />
      <Switch>
        <Route path="/" exact component={Home} />
        <Route path="/books" exact component={BookList} />
        <Route path="/books/:id" component={BookDetail} />
        <Route path="/bookclubs" component={BookClub} />
        <Route path="/profile" component={UserProfile} />
        <Route path="/trade" component={Trade} />
      </Switch>
      <Footer />
    </Router>
  );
}

export default App;
