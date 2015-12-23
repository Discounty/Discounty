import React from 'react';
import SearchField from '../components/SearchField';

const SearchFieldComponent = props => {
    const reactComponent = (
        <SearchField {...props} />
    );
    return reactComponent;
};

export default SearchFieldComponent;
