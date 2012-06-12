#include "ETHFramework/IncludeModules.angelscript"
#include "Menu.angelscript"
#include "Game.angelscript"

/*void main()
{
	LoadScene("empty", "preLoop", "loop");
}

void preLoop()
{
	AddEntity("line.ent", vector3(GetScreenSize() * 0.5f, 0.0f), 0.0f);
}

void loop()
{
	const vector3 accel(GetInputHandle().GetAccelerometerData());
	const vector3 norm(normalize(accel));
	const string output = vector3ToString(accel) + "\n" + vector3ToString(norm);
	DrawText(vector2(0,0), output, "Verdana20_shadow.fnt", 0xFFFFFFFF);
}

void ETHCallback_line(ETHEntity@ thisEntity)
{
	const vector3 accel(GetInputHandle().GetAccelerometerData());
	//const vector3 accel(0,-1,0);
	const float angle =-radianToDegree(getAngle(vector2(accel.x,-accel.y) * -1.0f));
	thisEntity.SetAngle(angle);
}*/
void main()
{
	g_scale.updateScaleFactor(DEFAULT_SCALE_HEIGHT);
	@g_gameStateFactory = SMyStateFactory();
	g_stateManager.setState(g_gameStateFactory.createMenuState());
	SetPersistentResources(true);
}

class MyChooser : ItemChooser
{
	bool performAction(const uint itemIdx)
	{
		g_stateManager.setState(g_gameStateFactory.createGameState(itemIdx));
		return true;
	}

	bool validateItem(const uint itemIdx)
	{
		return ((itemIdx > 15) ? false : true);
	}

	void itemDrawCallback(const uint index, const vector2 &in pos, const vector2 &in offset)
	{
	}
	void performDenialAction(const uint index)
	{
	}
}

class SMyStateFactory : SGameStateFactory
{
	State@ createMenuState()
	{
		return Menu();
	}

	State@ createLevelSelectState()
	{
		return createGameState(1);

	}

	State@ createGameState(const uint idx)
	{
		return Game(idx);
	}
}

void loop()
{
	g_stateManager.runCurrentLoopFunction();

	#if TESTING
		DrawText(V2_ZERO, "" + GetFPSRate(), "Verdana20_shadow.fnt", COLOR_WHITE);
	#endif
}

void preLoop()
{
	g_scale.updateScaleFactor(512,false);
	g_stateManager.runCurrentPreLoopFunction();

	SetZBuffer(false);
	SetPositionRoundUp(false);
	SetFastGarbageCollector(false);
	SetNumIterations(8, 3);
}

// called when the program is paused and then resumed (all resources were cleared, need reload)
void onResume()
{
	g_stateManager.runCurrentOnResumeFunction();
}
