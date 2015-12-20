import React, { PropTypes } from 'react';
import _ from 'lodash';

export default class Footer extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    render() {
        return (
            <div>
                <div className="customer-dashboard-footer">
                    <p>Copyright 2016</p>
                </div>
            </div>
        )
    }
}
