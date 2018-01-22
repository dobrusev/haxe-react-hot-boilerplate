package view;

import react.React;
import react.ReactComponent;

class Button extends ReactComponent
{
	public static function create(onClicked:Void->Void):ReactElement
	{
		return React.createElement(Button,({onClicked:onClicked}));
	}

	override function render()
	{
		return React.createElement("button",{onClick:props.onClicked}, "Click Me");
	}
}