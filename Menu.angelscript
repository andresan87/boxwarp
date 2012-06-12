class Menu : MainMenu
{
	Menu()
	{
		MainMenuProperties props;
		props.showMusicSwitch = true;
		props.showSoundSwitch = true;
		//props.titleSprite = "";
		//props.playButton = "";
		props.buttonNormPos = vector2(0.5f,0.5f);
		props.titlePos = vector2(0.5f, 0.25f);
		super("empty",@props);
	}
	
	void preLoop()
	{
		MainMenu::preLoop();

	}
	
	void loop()
	{
		MainMenu::loop();
		
	}
}
