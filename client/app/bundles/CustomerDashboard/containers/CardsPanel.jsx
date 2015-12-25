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

    state = {
        children: this.props.children,
        searchString: '',
    }

    componentDidMount() {
        this.subscription = global.Channel.subscribe({
            channel: 'Search',
            topic: 'search_field.change',
            callback: (data, envelope) => {
                this.setState({...this.state, searchString: data.value});
            },
        });

        this.deleteSubscription = global.UpdateChannel.subscribe({
            channel: 'Update',
            topic: 'card_item.delete',
            callback: (data, envelope) => {
                let cards = this.state.children;
                console.log(cards);
                for(let i = 0; i < cards.length; ++i) {
                    if (cards[i].props.children.props.cardId == data.id) {
                        cards.splice(i, 1);
                        break;
                    }
                }
                console.log(cards);
                this.setState({
                    ...this.state,
                    children: cards,
                });
                // console.log(this.state.children);
            }
        });
    }

    componentWillUnmount() {
        this.subscription.unsubscribe();
        this.deleteSubscription.unsubscribe();
    }

    searchStringInArray(str, strArray) {
        for (let i = 0; i < strArray.length; ++i) {
            if (strArray[i].match(str)) {
                return true;
            }
        }
        return false;
    }

    anyMatchInQuery(title, query) {
        const titleArr = title.split(/\s|\,|\.|\!|\?|\:|\;/i);
        const queryArr = query.split(/\s|\,|\.|\!|\?|\:|\;/i);

        let found = false;
        for (let i = 0; i < queryArr.length; ++i) {
            if ((titleArr.indexOf(queryArr[i]) > -1) ||
                (this.searchStringInArray(queryArr[i], titleArr))) {
                found = true;
                break;
            }
        }
        return found;
    }

    render() {
        const searchString = this.state.searchString.trim().toLowerCase();
        let cards = this.state.children;

        if (cards) {
            if (searchString.length) {
                cards = cards.filter( (c) => {
                    return this.anyMatchInQuery(c.props.children.props.cardName
                        .toLowerCase(), searchString);
                });
            }
        }

        return (
            <div>
                <div className="cards-controls-row">
                    <h2 className="cards-panel-title">Your discount cards</h2>
                    <CardsController />
                </div>
                <div className="cards-panel">
                    {cards}
                </div>
            </div>
        );
    }
}
