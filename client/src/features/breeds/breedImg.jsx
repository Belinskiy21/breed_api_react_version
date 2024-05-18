import React, { useState } from "react";

function BreedImg(props) {
    const { name, img } = props;

    return (
        <div>
            <h2>{name}</h2>
            <div>
                <img src={img} />
            </div>
        </div>
    )
}

export default BreedImg;
