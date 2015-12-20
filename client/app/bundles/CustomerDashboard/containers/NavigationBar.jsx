import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';
import NavigationItem from '../components/NavigationItem';

@pureRender
export default class NavigationBar extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        navigationLinks: PropTypes.arrayOf(PropTypes.shape({
            linkName: PropTypes.string.isRequired,
        })),
    }

    render() {
        const links = this.props.navigationLinks.map((item, index) => {
            return (
                <div key={index}>
                    <NavigationItem {...item} />
                </div>
            );
        });

        return (
            <div>
                <nav className="navigation-bar">
                    {links}
                </nav>
            </div>
        );
    }
}
