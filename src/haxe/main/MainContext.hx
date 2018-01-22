package ;

import mmvc.impl.Context;

class MainContext extends Context
{
	override function startup():Void
	{
		trace("startup");
		mediatorMap.mapView(view.Root, framework.mediator.RootMediator, api.IRoot);
	}
}