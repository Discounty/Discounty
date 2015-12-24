$(document).ready(() => {
    if (Channel) {

        let search = document.getElementById('search-field');

        search.addEventListener('change', () => {
            Channel.publish({
                channel: 'Search',
                topic: 'search_field.change',
                data: {
                    value: search.value
                },
            });
        });

    } else {
        console.log('Channel is not accessible');
    }
});
