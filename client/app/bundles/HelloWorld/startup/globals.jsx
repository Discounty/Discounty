import HelloWorldApp from './HelloWorldApp';
import TestApp from './TestApp';

// This is how react_on_rails can see the HelloWorldApp in the browser.
window.HelloWorldApp = HelloWorldApp;
window.TestApp = TestApp;
