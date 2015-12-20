import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import Dashboard from './Dashboard';

@pureRender
export default class Layout extends React.Component {

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
        return (
            <div>
                <div className="dashboard-layout">
                    <Dashboard {...this.props} />
                </div>
            </div>
        );
    }

}
