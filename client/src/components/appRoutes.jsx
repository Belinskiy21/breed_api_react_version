import React, { useState } from "react";
import { Route, Routes } from 'react-router-dom';
import BreedForm from '../features/breeds/breedForm';

function AppRoutes() {
    return (
        <Routes>
            <Route path="/" element={<BreedForm />} />
        </Routes>
    )
}

export default AppRoutes;
