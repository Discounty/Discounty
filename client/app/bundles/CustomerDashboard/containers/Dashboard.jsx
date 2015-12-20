import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import Card from '../components/Card';
import CardsPanel from './CardsPanel';
import NavigationBar from './NavigationBar';
import Footer from '../components/Footer';

@pureRender
export default class Dashboard extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        cards: PropTypes.arrayOf(PropTypes.shape({
            cardName: PropTypes.string.isRequired,
            cardDescription: PropTypes.string,
            cardBarcode: PropTypes.string.isRequired,
            cardShopName: PropTypes.string,
        })),
        navigationLinks: PropTypes.arrayOf(PropTypes.shape({
            linkName: PropTypes.string.isRequired,
        })),
    }

    render() {
        const cards = this.props.cards.map((item, index) => {
            return (
                <div key={index}>
                    <Card {...item} />
                </div>
            );
        });

        return (
            <div>
                <div className="dashboard">
                    <NavigationBar navigationLinks={this.props.navigationLinks} />
                    <CardsPanel>
                        {cards}
                    </CardsPanel>
                    <Footer />
                </div>
            </div>
        );
    }

}
