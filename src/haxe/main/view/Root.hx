package view;

import api.IRoot;
import mmvc.api.IViewContainer;
import react.React;
import react.ReactComponent;

@:expose
class Root extends ReactComponent implements IRoot implements IViewContainer
{
	public static function create():ReactElement
	{
		return React.createElement(Root);
	}

	public var viewAdded:Dynamic->Void;
	public var viewRemoved:Dynamic->Void;

	var _isAdded:Bool;
	var mainContext:MainContext;

	public function new(props)
	{
		super(props);
		state = {};
		mainContext = new MainContext(this, false);
	}

	public function isAdded(view:Dynamic):Bool
	{
		return _isAdded;
	}

	override function componentWillMount()
	{
		mainContext.startup();
	}

	override function componentDidMount()
	{
		_isAdded = true;
	}

	override function componentWillUnmount()
	{
		_isAdded = false;
	}

	override function render()
	{
		return React.createElement("div", {}, renderTitle(), Counter.create());
	}

	function renderTitle()
	{
		return React.createElement("h1", {}, "Hello, world!");
	}

	public function onViewAdded(view:Dynamic):Void
	{
		viewAdded(view);
	}

	public function onViewRemoved(view:Dynamic):Void
	{
		viewRemoved(view);
	}
}

