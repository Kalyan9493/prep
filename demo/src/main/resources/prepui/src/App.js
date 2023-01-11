import './App.css';
import Header from './components/header';
import { BrowserRouter as Router } from 'react-router-dom';
import Home from './components/home';
import Footer from './components/footer';

function App() {
  return (
    <div className="App">
      <Router>
        <Header />
        <Home />
        <Footer />
      </Router>
    </div>
  );
}

export default App;
