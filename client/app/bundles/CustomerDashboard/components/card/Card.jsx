import React, { PropTypes } from 'react';
import { ModalContainer, ModalDialog } from 'react-modal-dialog';
import Please from 'pleasejs';
import pureRender from 'pure-render-decorator';
import _ from 'lodash';

const styles = {
  created_at: {
  },
  description: {
  },
  title: {
    margin: 0,
    color: '#C94E50',
    fontWeight: 400,
    textAlign: 'center',
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
    }

    state = {
      isShowingModal: false,
    }

    handleClick = () => {
        this.setState({ isShowingModal: true });
    }
    handleClose = () => this.setState({ isShowingModal: false })

    render() {
        const bgcolor = Please.make_color();
        return (
            <div>
                <div className="card card--small" onClick={this.handleClick}>
                    <div className="card__image" style={{'background': bgcolor}} />
                    <h2 className="card__title">{this.props.cardName}</h2>
                    <span className="card__subtitle">
                        {this.props.cardCreatedAtString + ' ' + this.props.cardCreatedAt}
                    </span>
                    <p className="card__text">{this.props.cardDescription}</p>
                    <div className="card__action-bar">
                        <button className="card__button">SHARE</button>
                        <button className="card__button">LEARN MORE</button>
                    </div>
                </div>
                {
                  this.state.isShowingModal &&
                  <ModalContainer onClose={this.handleClose}>
                      <ModalDialog onClose={this.handleClose}>
                        <div>
                             <h1 style={styles.title}>{this.props.cardName}</h1>
                             <br />
                             <span style={styles.created_at}>
                                {
                                    this.props.cardCreatedAtString + ' ' +
                                    this.props.cardCreatedAt
                                }
                            </span>
                             <hr />
                             <p style={styles.description}>
                                {this.props.cardDescription}
                             </p>
                         </div>
                      </ModalDialog>
                  </ModalContainer>
                }
            </div>
        );
    }
}
