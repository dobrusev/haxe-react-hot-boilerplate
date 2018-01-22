package ;

import js.Browser;
import react.React;
import react.ReactComponent;
import react.ReactDOM;
import view.Root;
import webpack.Webpack;

class Main
{
	static function main() 
	{
		renderDOM();
		Webpack.hotReload('./view', renderDOM);
	}

	static function renderDOM()
	{
		var container = Browser.document.getElementById('root');
		Webpack.ensure(['./view'], function() {
			ReactDOM.render(React.createElement(AppContainer, {}, Root.create()), container);
		});
	}
}

@:jsRequire('react-hot-loader', 'AppContainer')
extern class AppContainer extends ReactComponent { }
