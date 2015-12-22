import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import Header from '../components/header/Header';
import Sidebar from '../components/sidebar/Sidebar';

@pureRender
export default class Layout extends React.Component {

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
    }

    render() {
        return (
            <Header {...this.props} />

            <main className="cd-main-content">
                <Sidebar { ...this.props, searchAction: () => () } />

                <div className="content-wrapper">
                    {this.props.children}
                </div>
            </main>
        );
    }

}
