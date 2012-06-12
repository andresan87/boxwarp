class Game : GameState
{
	
	Game(uint level)
	{
		GameStateProperties props;
		super(level, "scenes/start.esc", @props);
	}
	
	void preLoop()
	{
		GameState::preLoop();
		
	}
	
	void loop()
	{
		GameState::loop();
		
	}
}
