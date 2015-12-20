import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import _ from 'lodash';

@pureRender
export default class Card extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        cardName: PropTypes.string.isRequired,
        cardDescription: PropTypes.string,
        cardBarcode: PropTypes.string.isRequired,
        cardShopName: PropTypes.string
    }


    render() {
        return (
            <div className="discount-card">
                <div className="discount-card-container">
                    <h3>{this.props.cardName}</h3>
                    (this.props.cardShopName && <h5>{this.props.cardShopName}</h5>)
                    <span>{this.props.cardBarcode}</span>
                </div>
            </div>
        )
    }
}
