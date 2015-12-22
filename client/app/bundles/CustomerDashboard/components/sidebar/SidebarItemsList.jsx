import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';

@pureRender
export default class SidebarItemsList extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        sidebarNavItems: PropTypes.arrayOf(PropTypes.shape({
            itemString: PropTypes.string.isRequired,
            itemUrl: PropTypes.string,
            counter: PropTypes.integer,
        })).isRequired,
        sidebarLabelString: PropTypes.string,
    }

    render() {
        const links = this.props.sidebarNavItems.map((link, index) => {
            return (
                <li key={index} className="has-children overview">
                    <a href={link.itemUrl}>
                        {link.itemString}
                        {link.coutner && <span className="counter">{link.coutner}</span>}
                    </a>
                </li>
            );
        });

        return (
            <ul>
                <li class="cd-label">{this.props.sidebarLabelString}</li>
                {links}
            </ul>
        );
    }
}
