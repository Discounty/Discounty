import React, { PropTypes } from 'react';

export default class TestComponent extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        first_name: PropTypes.string.isRequired,
        last_name: PropTypes.string,
        email: PropTypes.string.isRequired,
    }


    render() {
        return (
            <div>
                <h3>Hello, {this.props.first_name}!</h3>
                <span>{this.props.email}</span>
            </div>
        );
    }
}
