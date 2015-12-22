import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import SidebarItemsList from './SidebarItemsList';

@pureRender
export default class Sidebar extends React.Component {

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
        return (
            <nav className="cd-side-nav">
                <SidebarItemsList {...this.props} />
            </nav>
        );
    }
}
