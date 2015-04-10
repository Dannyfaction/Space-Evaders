package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class MainScreen extends Sprite
	{
		private var asteroid:Asteroid;
		private var main:Main;
		private var startScreen:StartScreen;
		private var counter:Number = 0;
		//private var counter1:Number = 0;
		
		public function MainScreen():void
		{
			startScreen = new StartScreen();
			addChild(startScreen);
			//addEventListener(Event.ADDED_TO_STAGE, loop);
			//this.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function init(e:Event = null):void 
		{
			
		}
		
		/*
		private function loop (e:Event):void
		{
 			trace(asteroid.screenCounter);
			if (asteroid.screenCounter == 1)
			{
				trace("lel");
			}
			if ((counter == 1) && (counter1 == 1))
			{
				removeChild(main);
			}
		}
		*/
		
		//Starting the game
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				if (counter == 0)
				{
					counter = 1;
					//counter1 = 1;
					main = new Main();
					addChild(main);
				}

			}
		}
		
	}

}