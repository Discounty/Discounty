$(document).ready(() => {

    document.querySelector('.cd-search form').addEventListener('submit', (e) => {
        e.preventDefault();
        return false;
    });

    if (Channel) {
        let lastValue = '';
        $('.cd-search form input').on('change keyup paste mouseup', function() {
            if ($(this).val() != lastValue) {
                lastValue = $(this).val();
                Channel.publish({
                    channel: 'Search',
                    topic: 'search_field.change',
                    data: {
                        value: $(this).val(),
                    },
                });
            }
        });

    } else {
        console.log('Channel is not accessible');
    }
});
