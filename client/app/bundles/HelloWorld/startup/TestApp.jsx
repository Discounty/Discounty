import React from 'react';
import TestContainer from '../containers/TestContainer';

const TestApp = props => {
    const reactComponent = (
        <TestContainer {...props} />
    );
    return reactComponent;
};

export default TestApp;
