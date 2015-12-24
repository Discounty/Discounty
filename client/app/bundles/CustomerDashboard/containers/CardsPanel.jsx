import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';

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
                <div className="card-controller-container">
                    <span id="big" className="controller">BIG</span>
                    <span id="medium" className="controller">MEDIUM</span>
                    <span id="small" className="controller is_current">SMALL</span>
                </div>
                <div className="cards-panel">
                    {this.props.children ? this.props.children : 'No cards yet'}
                </div>
            </div>
        );
    }
}
