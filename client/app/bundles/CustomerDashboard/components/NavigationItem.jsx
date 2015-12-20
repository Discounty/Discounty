import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import _ from 'lodash';

@pureRender
export default class NavigationItem extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        linkName: PropTypes.string.isRequired,
    }

    render() {
        return (
            <div>
                <div className="navigation-item">
                    <a href="#" className="navigation-item-link">
                        {this.props.linkName}
                    </a>
                </div>
            </div>
        )
    }
}
