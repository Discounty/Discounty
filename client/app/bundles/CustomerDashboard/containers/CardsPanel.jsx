import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import CardsController from '../components/card/CardsController';

@pureRender
export default class CardsPanel extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        children: PropTypes.arrayOf(PropTypes.object.isRequired),
    }

    render() {
        return (
            <div>
                <CardsController />
                <div className="cards-panel">
                    {this.props.children ? this.props.children : 'No cards yet'}
                </div>
            </div>
        );
    }
}
