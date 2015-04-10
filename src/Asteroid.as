package  {
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class Asteroid extends MovieClip
	{
		//Declaring
		[Embed(source = "../lib/asteroid.png")]
		public var asteroidArt: Class;
		private var spaceShip:SpaceShip;
		private var endScreen:EndScreen;
		private var art:Bitmap;
		private var _posShip:Point;
		private var asteroidSpeed:Number = 0;
		public var isSpawner:Number = 0;
		public var laps:Number = 1;
		public var screenCounter:Number = 0;
		public var gameIsRunning:Boolean = true;
		
		[Embed(source = "../lib/Crash.mp3")]
		private var crashSoundClass:Class;
		private var crashSound:Sound;
		private var crashSoundChannel:SoundChannel;
		
		public function set positionShip(pos:Point):void
		{
			_posShip = pos;
		}
		public function Asteroid() 
		{
			//Scaling, adding objects
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			art = new asteroidArt();
			addChild(art);
			this.scaleX = this.scaleY = 0.075;
		}
		
		private function init(e:Event):void
		{
			//Event + sound
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(Event.ENTER_FRAME, loop);
			crashSound = new crashSoundClass as Sound;
		}
		
		private function loop (e:Event):void
		{
			stage.frameRate = 70;
			//Asteroid Movement
			this.x += asteroidSpeed;
			if (isSpawner == 0) {
				this.x = 550;
				asteroidSpeed = -1 * laps;
				this.y = Math.round(Math.random() * 80);
				isSpawner = 1;
			}
			//Hitting the walls
			if (this.x < -55)
			{
				this.x = 550;
			}			
			if (this.x > 555)
			{
				this.x = -50;
			}
			//Locating the spaceship
			if (_posShip.x > 475 || _posShip.x < -3) {
				isSpawner = 2;
			}
			if (_posShip.y < 96 && isSpawner == 2) {
				this.x = -50
				laps += 1;
				asteroidSpeed = +1 * laps;
				this.y = Math.round(Math.random()*80+120);
				isSpawner = 1;
			}
			if (_posShip.y > 95  && _posShip.y < 216 && isSpawner == 2) {
				this.x = 550;
				laps += 1;
				asteroidSpeed = -1 * laps;
				this.y = Math.round(Math.random()*80+240);
				isSpawner = 1;
			}
			if (_posShip.y > 241  && isSpawner == 2) {
				this.x = 500;
				laps += 1;
				asteroidSpeed = -1 * laps;
				this.y = Math.round(Math.random()*80);
				isSpawner = 1;
			}
			
			//Ending the game
			if (this.hitTestPoint(_posShip.x,_posShip.y,true))
			{
				crashSoundChannel = crashSound.play(2, 1);
				screenCounter = 1;
				gameIsRunning = false;
				this.removeEventListener(Event.ADDED_TO_STAGE, init);
				this.removeEventListener(Event.ENTER_FRAME, loop);
			}
			if (this.hitTestPoint(_posShip.x+25,_posShip.y+25,true))
			{
				crashSoundChannel = crashSound.play(2, 1);
				screenCounter = 1;
				gameIsRunning = false;
				this.removeEventListener(Event.ADDED_TO_STAGE, init);
				this.removeEventListener(Event.ENTER_FRAME, loop);
			}
		}
	}
		
}