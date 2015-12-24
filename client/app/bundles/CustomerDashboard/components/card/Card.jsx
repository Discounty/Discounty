import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';

@pureRender
export default class Card extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        cardName: PropTypes.string.isRequired,
        cardDescription: PropTypes.string.isRequired,
        cardLinkString: PropTypes.string.isRequired,
        cardLinkUrl: PropTypes.string.isRequired,
        cardCreatedAt: PropTypes.string.isRequired,
        cardCreatedAtString: PropTypes.string.isRequired,
    }

    render() {
        return (
            <div className="card card--medium">
                <div className="card__image" />
                <h2 className="card__title">{this.props.cardName}</h2>
                <span className="card__subtitle">
                    {this.props.cardCreatedAtString + this.props.cardCreatedAt}
                </span>
                <p className="card__text">{this.props.cardDescription}</p>
                <div className="card__action-bar">
                    <button className="card__button">SHARE</button>
                    <button className="card__button">LEARN MORE</button>
                </div>
            </div>
        );
    }
}
