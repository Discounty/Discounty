import React from 'react';
import Dashboard from '../containers/Dashboard';

const CustomerDashboardApp = props => {
    const reactComponent = (
        <Dashboard {...props} />
    );
    return reactComponent;
};

export default CustomerDashboardApp;
