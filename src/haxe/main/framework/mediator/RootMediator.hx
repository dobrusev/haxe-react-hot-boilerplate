package framework.mediator;

import api.IRoot;
import mmvc.impl.TriggerMediator;

class RootMediator extends TriggerMediator<IRoot>
{
	override public function onRegister()
	{
		trace("RootMediator.onRegister");
	}
}
