import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import Card from '../components/Card';
import _ from 'lodash';

@pureRender
export default class CardsPanel extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        children: PropTypes.arrayOf(PropTypes.instanceOf(Card))
    }

    render() {
        return (
            <div>
                <div className="cards-panel">
                    {this.props.children}
                </div>
            </div>
        )
    }
}
