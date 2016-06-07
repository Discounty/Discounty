import React, { PropTypes } from 'react';
import Test from '../components/TestComponent';

export default class TestContainer extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        first_name: PropTypes.string.isRequired,
        last_name: PropTypes.string,
        email: PropTypes.string.isRequired,
    }

    state = {
        first_name: this.props.first_name,
        last_name: this.props.last_name,
        email: this.props.email,
    }

    render() {
        return (
            <div>
                <Test {...this.state} />
            </div>
        );
    }
}
