import React from 'react';
import pureRender from 'pure-render-decorator';
import classNames from 'classnames';
import _ from 'lodash';

@pureRender
export default class CardsController extends React.Component {

    constructor(props, context) {
        super(props, context);
        _.bindAll(this, 'handleClick');
    }

    state = {
        classNames: {
            big: 'controller',
            medium: 'controller',
            small: 'controller is_current',
        },
    }

    handleClick(e) {
        let id = e.currentTarget.id;
        this.setState({
            classNames: {
                big: classNames('controller', { is_current:  (id == 'big')}),
                medium: classNames('controller', { is_current:  (id == 'medium')}),
                small: classNames('controller', { is_current:  (id == 'small')}),
            },
        });
        $('.card').attr('class', 'card card--' + id);
    }

    render() {

        let big = this.state.classNames.big;
        let medium = this.state.classNames.medium;
        let small = this.state.classNames.small;

        return (
            <div className="card-controller-container">
                <span id="big" className={big} onClick={this.handleClick}>BIG</span>
                <span id="medium" className={medium} onClick={this.handleClick}>MEDIUM</span>
                <span id="small" className={small} onClick={this.handleClick}>SMALL</span>
            </div>
        );
    }
}
