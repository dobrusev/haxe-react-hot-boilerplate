package view;

import react.React;
import haxe.Timer;
import react.ReactComponent;

class Counter extends ReactComponent
{
	public static function create():ReactElement
	{
		return React.createElement(Counter);
	}

	var interval:Timer;
	
	public function new(props)
	{
		super(props);
		trace('new Counter()');
		state = { counter: 0 };
	}
	
	override function componentDidMount()
	{
		trace('mount counter');
		interval = new Timer(1000);
		interval.run = tick;
	}
	
	function tick() 
	{
		setState({ counter: state.counter + 1 });
	}
	
	override function componentWillUnmount()
	{
		trace('unmount counter');
		interval.stop();
	}
	
	override function render()
	{
		var styles = {
			background:'yellow',
			padding:'10px'
		};

		return React.createElement("h2", {style:styles}, 'Counter: ${state.counter}',
			React.createElement("hr"),
			Button.create(click)
		);
	}
	
	function click() 
	{
		trace('clicked');
		setState({ counter: state.counter + 100 });
	}
}
