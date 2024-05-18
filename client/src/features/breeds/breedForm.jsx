import React, { useState } from "react";
import { API_URL } from "../../constants";
import BreedImg from "./breedImg"
import BreedError from "./breedError";

function BreedForm() {
    const [breedValue, setBreedValue] = useState("");
    const [response, setResponse] = useState(null);
    const [img, setImage] = useState('');
    const [breedName, setBreedName] = useState('');
    const [message, setError] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();

        const response = await fetch(API_URL, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body:  JSON.stringify({ breedValue }),
        })

        if (response.ok)  {
            const { img, breed } = await response.json();
            setImage(img);
            setBreedName(breed);
        } else {
            const { message } = await response.json();
            setError(message);
        }
        setResponse(response);
        return response;
    };

    return (
        <div>
            <h2>Breed Form</h2>
            <form onSubmit={handleSubmit}>
                <div>
                    <label htmlFor="breedInput">Breed:</label>
                    <input
                        id="breedInput"
                        type="text"
                        value={breedValue}
                        onChange={(e) => setBreedValue(e.target.value)}
                        required
                    />
                </div>
                <div>
                    <button type="submit">Submit</button>
                </div>
            </form>
            <div>
                { response && response.ok ? <BreedImg img={img} name={breedName}/> : null }
            </div>
            <div>
                { response && !response.ok ? <BreedError message={message}/> : null}
            </div>
        </div>
    )
}
export default BreedForm;
