import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import { Form, Text, Message, TextArea } from 'react-formalize';
import _ from 'lodash';

const styles = {
    validationErr: {
        color: '#f44336 !important',
    },
};

@pureRender
export default class EditCardForm extends React.Component {

    constructor(props, context) {
        super(props, context);
        _.bindAll(this, 'handleSubmit', 'handleChange');
    }

    static propTypes = {
        name: PropTypes.string.isRequired,
        description: PropTypes.string.isRequired,
        shopName: PropTypes.string,
    }

    state = {
        validations: null,
    }

    handleSubmit(values) {
        console.info('Submit\n', values);
        this.setState({
            validations: {
                name: 'error',
            },
        });
    }

    handleChange(values) {
        console.info('Change: ', values);
    }

    render() {
        const card = {
            name: this.props.name,
            description: this.props.description,
            shopName: this.props.shopName,
        };

        const messages = {
            name: 'Name must be filled in!',
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
                    <Text name="name" id="name" className="floatLabel"
                          placeholder="Enter card name" />
                    {
                        validations && validations.name &&
                        <Message name="name">
                            {message => <p style={styles.validationErr}>{message}</p>}
                        </Message>
                    }
                </div>
                <div className="controls">
                    <span>Card info:</span>
                    <TextArea name="description" className="floatLabel" id="description"
                              placeholder="Enter card description" />
                    {
                        validations && validations.description &&
                        <Message name="description">
                            {message => <p style={styles.validationErr}>{message}</p>}
                        </Message>
                    }
                </div>
                {
                    this.props.shopName &&
                    <div className="controls">
                        <span>Shop name:</span>
                        <Text name="shopName" id="shopName" className="floatLabel"
                              placeholder="Enter shop name" />
                        {
                            validations && validations.shopName &&
                            <Message name="shopName">
                                {message => <p style={styles.validationErr}>{message}</p>}
                            </Message>
                        }
                    </div>
                }
                <div>
                    <button type="submit" className="col-1-4">Save</button>
                </div>
                </div>
            </Form>
        );
    }

}
