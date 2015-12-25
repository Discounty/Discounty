import React, { PropTypes } from 'react';
import ReactDOM from 'react-dom';
import { ModalContainer, ModalDialog } from 'react-modal-dialog';
import Please from 'pleasejs';
import pureRender from 'pure-render-decorator';
import EditForm from './EditForm';
import _ from 'lodash';

const styles = {
  created_at: {
    color: 'rgba(64,64,64,.87) !important',
    fontSize: '12px !important',
    lineHeight: '18px !important',
    letterSpacing: '0 !important',
    margin: '0 0 10px !important',
  },
  description: {
    color: 'rgba(64,64,64,.87) !important',
    fontSize: '18px !important',
    lineHeight: '24px !important',
    letterSpacing: '0 !important',
    margin: '0 0 16px !important',
  },
  title: {
    color: 'rgba(21,21,21,.87) !important',
    borderBottom: '1px solid rgba(0,0,0,.27) !important',
    lineHeight: '48px !important',
    padding: '16px !important',
    fontSize: '45px !important',
    textAlign: 'center !important',
  },
  heading: {
    'fontSize': '18px !important',
    'textTransform': 'uppercase !important',
    'fontWeight': '300 !important',
    'textAlign': 'left !important',
    'color': '#506982 !important',
    'borderBottom': '1px solid #506982 !important',
    'paddingBottom': '3px !important',
    'marginBottom': '20px !important',

  },
};


@pureRender
export default class Card extends React.Component {

    constructor(props, context) {
        super(props, context);
        _.bindAll(this, 'handleClick', 'handleClose');
    }

    static propTypes = {
        cardName: PropTypes.string.isRequired,
        cardDescription: PropTypes.string.isRequired,
        cardLinkUrl: PropTypes.string.isRequired,
        cardCreatedAt: PropTypes.string.isRequired,
        cardCreatedAtString: PropTypes.string.isRequired,
        cardShopName: PropTypes.string,
        cardId: PropTypes.number.isRequired,
    }

    state = {
        isShowingModal: false,
        cardName: this.props.cardName,
        cardDescription: this.props.cardDescription,
        cardLinkUrl: this.props.cardLinkUrl,
        cardCreatedAt: this.props.cardCreatedAt,
        cardCreatedAtString: this.props.cardCreatedAtString,
        cardShopName: this.props.cardShopName,
        cardId: this.props.cardId,
    }

    componentDidMount() {
        this.updateSubscription = global.UpdateChannel.subscribe({
            channel: 'Update',
            topic: 'card_item.update',
            callback: (data, envelope) => {
                if (this.props.cardId == data.id) {
                    this.setState({
                        ...this.state,
                        cardName: data.name,
                        cardDescription: data.description,
                        cardShopName: ((data.shopName && data.shopName != '')
                                        ? data.shopName
                                        : this.state.cardShopName),
                    });
                }
            },
        });
    }

    componentWillUnmount() {
        this.updateSubscription.unsubscribe();
    }

    handleClick = () => {
        this.setState({ isShowingModal: true });
    }
    handleClose = () => this.setState({ isShowingModal: false })

    render() {
        const bgcolor = Please.make_color();
        return (
            <div className="card-element">
                <div className="card card--small" onClick={this.handleClick}>
                    <div className="card__image" style={{'background': bgcolor}} />
                    <h2 className="card__title">{this.state.cardName}</h2>
                    <span className="card__subtitle">
                        {this.state.cardCreatedAtString + ' ' + this.state.cardCreatedAt}
                    </span>
                    <p className="card__text">{this.state.cardDescription}</p>
                    <div className="card__action-bar">
                        <button className="card__button">LEARN MORE</button>
                    </div>
                </div>
                {
                  this.state.isShowingModal &&
                  <ModalContainer onClose={this.handleClose}>
                      <ModalDialog onClose={this.handleClose}>
                        <div className="card-element-modal">
                             <h1 style={styles.title}>{this.state.cardName}</h1>
                             <span style={styles.created_at}>
                                {
                                    this.state.cardCreatedAtString + ' ' +
                                    this.state.cardCreatedAt
                                }
                            </span>
                             <p style={styles.description}>
                                {this.state.cardDescription}
                             </p>
                             <br />
                             <h2 style={styles.heading}>Edit</h2>
                             <br />
                             <EditForm
                                  name={this.state.cardName}
                                  description={this.state.cardDescription}
                                  shopName={this.state.shopName}
                                  cardId={this.state.cardId}
                                  handleClose={this.handleClose} />
                         </div>
                      </ModalDialog>
                  </ModalContainer>
                }
            </div>
        );
    }
}
