package view;

import react.React;
import api.IRoot;
import mmvc.api.IViewContainer;
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

	public function new(props)
	{
		super(props);
		state = {};
	}

	public function isAdded(view:Dynamic):Bool
	{
		return _isAdded;
	}

	override function componentDidMount()
	{
		_isAdded = true;
	}

	override function componentWillUnmount()
	{
		_isAdded = false;
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

