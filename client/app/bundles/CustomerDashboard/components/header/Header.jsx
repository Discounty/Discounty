import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import SearchField from './SearchField';
import TopNavigationBar from './TopNavigationBar';

@pureRender
export default class Header extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
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
        const logo = this.const.headerLogo;
        const topNav = this.props.topNavigationLinks;
        const dropdown = this.props.topNavigationDropdownLinks;
        const avatar = this.props.topNavigationAvatarLink;
        const account = this.props.topNavigationAccount;

        return (
            <header className="cs-main-header">
                <a href={logo.hrefUrl} className="cd-logo">
                    <img src={logo.imgUrl} alt="Logo" />
                </a>

                <SearchField
                    searchAction={this.props.searchAction}
                    searchPlaceholder={this.props.searchPlaceholder} />

                <a href="#0" className="cd-nav-trigger">
                    {this.props.menuString}
                    <span></span>
                </a>

                <TopNavigationBar
                    topNavigationLinks={topNav}
                    topNavigationDropdownLinks={dropdown}
                    topNavigationAvatarLink={avatar}
                    topNavigationAccount={account} />
            </header>
        );
    }
}
