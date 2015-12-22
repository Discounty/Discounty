import React, { PropTypes } from 'react';
import TopNavigationDropdown from './TopNavigationDropdown';
import pureRender from 'pure-render-decorator';

@pureRender
export default class TopNavigationBar extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
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
        const topNavLinks = this.props.topNavigationLinks.map((link, index) => {
            return (
                <li key={index}>
                    <a href={link.linkUrl}>{link.linkName}</a>
                </li>
            );
        });

        const account = this.props.topNavigationAccount;
        const links = this.props.topNavigationDropdownLinks;

        return (
            <nav className="cd-nav">
                <ul class="cd-top-nav">
                    {topNavLinks}
                    <li class="has-children account">
                        <a href={account.url}>
                            <img src={topNavigationAvatarLink} alt="avatar" />
                            {account.string}
                        </a>
                        <TopNavigationDropdown dropdownLinks={links} />
                    </li>
                </ul>
            </nav>
        );
    }
}
