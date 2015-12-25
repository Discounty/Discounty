import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import { Form, Text, Message, TextArea } from 'react-formalize';
import { ModalContainer, ModalDialog } from 'react-modal-dialog';
import _ from 'lodash';
import $ from 'jquery';

const styles = {
    validationErr: {
        color: '#f44336 !important',
    },
};

@pureRender
export default class EditCardForm extends React.Component {

    constructor(props, context) {
        super(props, context);
        _.bindAll(this, 'handleSubmit', 'handleChange',
                        'handleClick', 'handleClose',
                        'handleDelete');
    }

    static propTypes = {
        name: PropTypes.string.isRequired,
        description: PropTypes.string.isRequired,
        shopName: PropTypes.string,
        cardId: PropTypes.number.isRequired,
        handleClose: PropTypes.func.isRequired,
    }

    state = {
        validations: null,
        name: this.props.name,
        description: this.props.description,
        shopName: this.props.shopName,
        isShowingModal: false,
    }

    handleDelete(e) {
        global.UpdateChannel.publish({
            channel: 'Update',
            topic: 'card_item.delete',
            data: {
                id: this.props.cardId,
            },
        });

        $.ajax({
            type: 'POST',
            url: `/delete_card/${this.props.cardId}.json`,
            data: {
                id: this.props.cardId,
            },
            success: (msg) => {
                console.log('Card deleted: ' + msg);
            },
        });

        this.handleClose();
        this.props.handleClose();
    }

    handleSubmit(values) {
        const { name, description, shopName } = values;
        const errors = {
            name: !name && name === '' ? 'error' : null,
            description: !description && description === '' ? 'error' : null,
            shopName: !shopName && shopName === '' ? 'error' : null,
        };
        this.setState({
            ...this.state,
            validations: errors,
        });
        if (Object.keys(errors).length === 3 &&
            errors.name === null &&
            errors.description === null &&
            errors.shopName === null) {
            console.log('Start ajax call to the server');

            const newName = this.state.name;
            const newDesc = this.state.description;
            const newShopName = this.state.shopName;

            global.UpdateChannel.publish({
                channel: 'Update',
                topic: 'card_item.update',
                data: {
                    name: newName,
                    description: newDesc,
                    shopName: newShopName,
                    id: this.props.cardId,
                },
            });

            $.ajax({
                type: 'POST',
                url: `/update_card/${this.props.cardId}.json`,
                data: {
                    name: newName,
                    description: newDesc,
                    shopName: newShopName,
                },
                success: (msg) => {
                    console.log('Data Saved: ' + msg);
                },
            });

            this.props.handleClose();
        }
    }

    handleChange(values) {
        this.setState({
            ...this.state,
            name: values.name,
            description: values.description,
            shopName: values.shopName,
        });
    }

    handleClick = () => {
        this.setState({ isShowingModal: true });
    }
    handleClose = () => {
        this.setState({ isShowingModal: false });
    }


    render() {
        const card = {
            name: this.state.name,
            description: this.state.description,
            shopName: this.state.shopName,
        };

        const messages = {
            name: 'Name must not be empty',
            description: 'Description must not be empty',
            shopName: 'Shop name must not be empty',
        };

        const validations = this.state.validations;

        return (
            <Form
                values={card} messages={messages}
                onSubmit={this.handleSubmit}
                onChange={this.handleChange}
                className="edit-form" >
                <div className="form-group">
                <div className="controls">
                    <span>Card name:</span>
                    {
                        validations && validations.name &&
                        <Message name="name">
                            {message => <p style={styles.validationErr}>{message}</p>}
                        </Message>
                    }
                    <Text name="name" id="name" className="floatLabel"
                          placeholder="Enter card name" />
                </div>
                <div className="controls">
                    <span>Card info:</span>
                    {
                        validations && validations.description &&
                        <Message name="description">
                            {message => <p style={styles.validationErr}>{message}</p>}
                        </Message>
                    }
                    <TextArea name="description" className="floatLabel" id="description"
                              placeholder="Enter card description" />
                </div>
                {
                    this.props.shopName &&
                    <div className="controls">
                        <span>Shop name:</span>
                        {
                            validations && validations.shopName &&
                            <Message name="shopName">
                                {message => <p style={styles.validationErr}>{message}</p>}
                            </Message>
                        }
                        <Text name="shopName" id="shopName" className="floatLabel"
                              placeholder="Enter shop name" />
                    </div>
                }
                <div>
                    <button type="submit" className="col-1-4">Save</button>
                </div>
                <div>
                    <button type="button" className="col-1-4 delete"
                            onClick={this.handleClick}>Delete</button>
                    {
                      this.state.isShowingModal &&
                      <ModalContainer onClose={this.handleClose}>
                          <ModalDialog onClose={this.handleClose}>
                            <div className="card-element-modal">
                                <h2 className="confirm-heading">Are you sure?</h2>
                                <div>
                                    <button type="button" className="col-1-4 confirm-delete"
                                            onClick={this.handleDelete}>
                                        Yes
                                    </button>
                                </div>
                                <div>
                                    <button type="button" className="col-1-4 confirm-cancel"
                                            onClick={this.handleClose}>
                                            Cancel
                                    </button>
                                </div>
                            </div>
                          </ModalDialog>
                      </ModalContainer>
                    }
                </div>
                </div>
            </Form>
        );
    }

}
