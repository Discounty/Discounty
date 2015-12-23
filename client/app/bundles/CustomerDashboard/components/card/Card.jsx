import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';

@pureRender
export default class Card extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        cardName: PropTypes.string.isRequired,
        cardDescription: PropTypes.string,
        cardLinkString: PropTypes.string.isRequired,
        cardLinkUrl: PropTypes.string.isRequired,
    }

    render() {
        return (
            <div className="card transition">
                <h2 className="transition">{this.props.cardName}</h2>
                <p>{this.props.cardDescription}</p>
                <div className="cta-container transition">
                    <a href={this.props.cardLinkUrl} className="cta">
                        {this.props.cardLinkString}
                    </a>
                </div>
                <div className="card_circle transition"></div>
            </div>
        );
    }
}
