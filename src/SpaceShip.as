package  
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class SpaceShip extends MovieClip
	{
		//Declaring
		[Embed(source="../lib/PortalLoud.mp3")]
		private var SoundClass:Class;
		private var portalSound:Sound;
		private var soundChannel:SoundChannel;
		
		[Embed(source = "../lib/spaceship.png")]
		public var SpaceShipArt: Class;
		private var art:Bitmap;
		private var control:Number = 0;
		private var asteroid:Asteroid;
		public var test:Boolean = true;
		
		public var spaceShipX:Number;
		public var spaceShipY:Number;
		
		//Speed
		private var speed:Number = 4;
		private var jumpSpeed:Number = 0;
		public var isMovingRight:Boolean = true;
		
		public function SpaceShip() 
		{
			asteroid = new Asteroid();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			art = new SpaceShipArt();
			addChild(art);
			
			//Start Position
			isMovingRight = true;
			this.y = 95;
			spaceShipY = this.y;
			//Scaling
			this.scaleX = this.scaleY = 0.05;
		}
		
		private function init(e:Event):void
		{
			//Events + sound
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			this.addEventListener(Event.ENTER_FRAME, loop);
			
			portalSound = new SoundClass as Sound;
		}
		
		private function loop (e:Event):void
		{
			var radian:Number = this.rotation * Math.PI / 180;
			jumpSpeed = control * 4;
			//Jumping
			if(this.y > 4 && this.y < 96){
				this.y += 1 * jumpSpeed;
			}
			if (this.y > 123 && this.y < 216) {
				this.y += 1 * jumpSpeed;
			}
			if (this.y > 243 && this.y < 350) {
				this.y += 1 * jumpSpeed;
			}
			//Walls
			if (this.x > 475 && this.y > 0 && this.y < 121) {
				isMovingRight = false;
				soundChannel = portalSound.play(2, 1);
				this.y += 120;
				//this.y = 215;
			}
			if (this.x < 0) {
				isMovingRight = true;
				soundChannel =portalSound.play(2, 1);
				this.y += 120;
				//this.y = 333;
			}
			if (this.x > 475 && this.y > 241) {
				this.x = 0;
				soundChannel =portalSound.play(2, 1);
				this.y -= 240;
			}
			//Movement
			if (isMovingRight == true) {
				this.x += speed;
			}
			if (isMovingRight == false) {
				this.x -= speed;
			}
			//Falling
			if (control == 0 && this.y > 0 && this.y < 95) {
				this.y += 4;
			}
			if (control == 0 && this.y > 95 && this.y < 215) {
				this.y += 4;
			}			
			if (control == 0 && this.y > 215 && this.y < 334) {
				this.y += 4;
			}
			
			//if (this.hitTestObject(asteroid))
			//{
			//	trace("Hoe");
			//}
		}
		
		//Key Event
		private function onKeyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				control = -1;
			}
		}
		private function onKeyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				control = 0;
			}
		}
	}

}