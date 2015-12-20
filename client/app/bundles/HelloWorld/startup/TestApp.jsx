import React from 'react';
import { Route } from 'react-router';
import TestContainer from '../containers/TestContainer';
import HelloWorld from '../containers/HelloWorld';

const TestApp = props => {
    const reactComponent = (
        <TestContainer {...props} />
    );
    return reactComponent;
};

export default TestApp;
