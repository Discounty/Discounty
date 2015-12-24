import React, { PropTypes } from 'react';
import Please from 'pleasejs';
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

    getContrastYIQ(hexcolor) {
        let r = parseInt(hexcolor.substr(0, 2), 16);
        let g = parseInt(hexcolor.substr(2, 2), 16);
        let b = parseInt(hexcolor.substr(4, 2), 16);
        let yiq = ((r * 299) + (g * 587) + (b * 144)) / 1000;
        return yiq >= 128 ? '#000' : '#fff';
    }

    render() {
        let bgcolor = Please.make_color();
        return (
            <div className="card card--small">
                <div className="card__image" style={{'background': bgcolor}} />
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
