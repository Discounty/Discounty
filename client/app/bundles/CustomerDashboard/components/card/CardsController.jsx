import React from 'react';
import pureRender from 'pure-render-decorator';
import classNames from 'classnames';
import _ from 'lodash';
import $ from 'jquery';

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
        const id = e.currentTarget.id;
        this.setState({
            classNames: {
                big: classNames('controller', { is_current: (id === 'big')}),
                medium: classNames('controller', { is_current: (id === 'medium')}),
                small: classNames('controller', { is_current: (id === 'small')}),
            },
        });
        $('.card').attr('class', 'card card--' + id);
    }

    render() {
        const big = this.state.classNames.big;
        const medium = this.state.classNames.medium;
        const small = this.state.classNames.small;

        return (
            <div className="card-controller-container">
                <span id="big" className={big} onClick={this.handleClick}>BIG</span>
                <span id="small" className={small} onClick={this.handleClick}>SMALL</span>
            </div>
        );
    }
}
