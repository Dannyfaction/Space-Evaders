package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	
	public class Main extends Sprite 
	{
		//Declaring
		private var endScreen:EndScreen;
		[Embed(source = "../lib/Music.mp3")]
		private var SoundClass:Class;
		private var BackgroundMusic:Sound;
		private var soundChannel:SoundChannel;
		private var bool:Boolean = true;
		
		private var asteroid:Asteroid;
		private var spaceShip:SpaceShip;
		private var scoreboard:ScoreBoard;
		
		private var level: Level;
		
		private var playerPos:Point;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			//Events + adding objects, sound
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(Event.ENTER_FRAME, loop);
			level = new Level();
			addChild(level);
			
			asteroid = new Asteroid();
			addChild(asteroid);
			spaceShip = new SpaceShip();
			addChild(spaceShip);
			scoreboard = new ScoreBoard();
			addChild(scoreboard);
			
			playerPos = new Point();
			BackgroundMusic = new SoundClass as Sound;
			soundChannel = BackgroundMusic.play(2, 1);
		}
		
		private function loop (e:Event):void
		{
			//Endscreen
			if ((asteroid.screenCounter == 1) && (bool == true))
			{
				bool = false;
				soundChannel.stop();
				endScreen = new EndScreen();
				addChild(endScreen);
				addChild(scoreboard);
			}
			//Score counter
			if(asteroid.gameIsRunning == true){
				scoreboard.score += Math.floor(1);
			}	
			
			//Pos
			playerPos.x = spaceShip.x;
			playerPos.y = spaceShip.y;
			asteroid.positionShip = playerPos; 
		}
	}
}