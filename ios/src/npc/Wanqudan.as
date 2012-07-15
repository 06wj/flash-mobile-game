package npc
{
	import Enemy;
	import bul.*;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author 06wj
	 */
	public class Wanqudan extends Enemy 
	{
		public var t:FlxSprite;
		function Wanqudan(t:FlxSprite)
		{
			this.t = t;
			num = 7;
			super(20);
		}
		
		override public function move():void
		{
			y += .1;
			if (_time%10 == 1 && _time < 22)
			{
				shoot(x - 35, 90);
				shoot(x + 35, -90);
			}
			else if (_time > 270)
			{
				_time = 0;
			}
		}
		
		private function shoot(x:Number, ang:Number):void
		{
			var b :BWanqudan = new BWanqudan(x, y + 70, ang);
			b.t = t;
			bullets.add(b);
			b.x = x + origin.x - b.origin.x;
		}
	}
	
}