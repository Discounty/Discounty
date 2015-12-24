import React, { PropTypes } from 'react';
import pureRender from 'pure-render-decorator';

@pureRender
export default class SearchField extends React.Component {

    constructor(props, context) {
        super(props, context);
    }

    static propTypes = {
        searchPlaceholder: PropTypes.string.isRequired,
        searchAction: PropTypes.func,
    }

    state = {
        value: ''
    }

    render() {
        const placeholder = this.props.searchPlaceholder;
        const action = this.props.searchAction;

        return (
            <div className="cd-search">
                <form action={action}>
                    <input type="search" id="search-field"
                           placeholder={placeholder + '...'} />
                </form>
            </div>
        );
    }
}
