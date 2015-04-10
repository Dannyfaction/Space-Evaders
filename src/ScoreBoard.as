package  
{
	import flash.text.*;
	import flash.events.Event;
	public class ScoreBoard extends TextField
	{  
		private var _score:Number = 0;
		public function set score(s:Number):void
		{
			_score = s;
			this.text = "Score : " + _score;
		}
		public function get score():Number
		{
			return _score;
		}
		public function ScoreBoard() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			this.defaultTextFormat = new TextFormat("verdana", 20, 0xff0000, true);
			this.x = stage.height / 2;
			this.width = stage.stageWidth;
			this.text = "Score : " + _score;
		}
	}
}