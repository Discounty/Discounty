import Postal from 'postal';
import CustomerDashboardApp from './CustomerDashboardApp';
import SearchFieldComponent from './SearchFieldComponent';

// Postal channel for inter-component communication
global.Channel = Postal.channel('Search');
global.UpdateChannel = Postal.channel('Update');

window.CustomerDashboardApp = CustomerDashboardApp;
window.SearchFieldComponent = SearchFieldComponent;
