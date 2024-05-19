import { BrowserRouter as Router } from 'react-router-dom';
import './App.css';
import BreedForm from './features/breeds/breedForm';
import AppRoutes from './components/appRoutes';

function App() {
  return (
    <Router>
      <div className='app'>
        <AppRoutes />
      </div>
    </Router>
  )
}

export default App;
