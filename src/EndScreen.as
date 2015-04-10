package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class EndScreen extends Sprite
	{		
		private var main:Main;
		private var counter:Number = 0;
		private var bool:Boolean = true;
		private var gameOverScreen:GameOverScreen;
		
		public function EndScreen():void
		{
			//this.addEventListener(Event.ADDED_TO_STAGE, init);
			
			gameOverScreen = new GameOverScreen();
			addChild(gameOverScreen);
			
			//addEventListener(Event.ADDED_TO_STAGE, loop);
		}
		
		/*
		private function init(e:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		
		private function loop (e:Event):void
		{
			
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				if (bool = true)
				{
					bool = false;
				}

			}
		}
		*/
		
		

		
	}

}