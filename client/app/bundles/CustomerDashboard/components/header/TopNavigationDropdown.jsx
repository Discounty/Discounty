import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';

@pureRender
export default class TopNavigationDropdown extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        dropdownLinks: PropTypes.arrayOf(PropTypes.shape({
            linkUrl: PropTypes.string,
            linkName: PropTypes.string.isRequired,
        })).isRequired,
    }

    render() {
        const linksList = this.props.dropdownLinks.map((link, index) => {
            return (
                <li key={index}>
                    <a href={link.linkUrl}>{link.linkName}</a>
                </li>
            );
        });

        return (
            <ul>
                {linksList}
            </ul>
        );
    }
}
