import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import Sidebar from '../components/sidebar/Sidebar';
import _ from 'lodash';

@pureRender
export default class Layout extends React.Component {

    constructor(props, context) {
        super(props, context);
        _.bindAll(this, 'testHandleSearch');
    }

    static propTypes = {
        sidebarNavItems: PropTypes.arrayOf(PropTypes.shape({
            itemString: PropTypes.string.isRequired,
            itemUrl: PropTypes.string,
            counter: PropTypes.integer,
        })).isRequired,

        sidebarLabelString: PropTypes.string,
        headerLogo: PropTypes.shape({
            hrefUrl: PropTypes.string,
            imgUrl: PropTypes.string.isRequired,
        }),

        menuString: PropTypes.string,
        searchPlaceholder: PropTypes.string.isRequired,
        searchAction: PropTypes.func,

        topNavigationLinks: PropTypes.arrayOf(PropTypes.shape({
            linkUrl: PropTypes.string,
            linkName: PropTypes.string.isRequired,
        })).isRequired,

        topNavigationDropdownLinks: PropTypes.arrayOf(PropTypes.shape({
            linkUrl: PropTypes.string,
            linkName: PropTypes.string.isRequired,
        })).isRequired,

        topNavigationAvatarLink: PropTypes.string.isRequired,

        topNavigationAccount: PropTypes.shape({
            string: PropTypes.string.isRequired,
            url: PropTypes.string.isRequired,
        }).isRequired,

        children: PropTypes.oneOfType([
            PropTypes.arrayOf(PropTypes.object.isRequired),
            PropTypes.object,
        ]),
    }

    testHandleSearch(e) {
        // console.log(e);
    }

    render() {
        const children = this.props.children;
        return (
            <main className="cd-main-content">
                <Sidebar { ...this.props} searchAction={this.testHandleSearch} />

                <div className="content-wrapper">
                    {children ? this.props.children : <h3>No cards just yet</h3>}
                </div>
            </main>
        );
    }

}
