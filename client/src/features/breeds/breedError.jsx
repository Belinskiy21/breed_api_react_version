import React, { useState } from "react";

function BreedError(props) {
    const { message } = props;
    return (
        <div>{message}</div>
    )
}

export default BreedError;
