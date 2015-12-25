import React from 'react';
import pureRender from 'pure-render-decorator';
import _ from 'lodash';

@pureRender
export default class EditCardForm extends React.Component {

    constructor(props, context) {
        super(props, context);
        // _.bindAll(this, 'handleChange');
    }

    static propTypes = {

    }

    render() {
        let { value } = this.state;
        const onChange = this.handleChange;

        return (<div></div>
        )
    }

}
