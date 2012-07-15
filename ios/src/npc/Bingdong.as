package npc
{
	import bul.BBingdong;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author 06wj
	 */
	public class Bingdong extends Enemy 
	{
		function Bingdong()
		{
			num = 1;
			super();
		}
		
		override public function move():void
		{
			y += .7;
			if (_time%35 == 1 && _time < 46)
			{
				shoot();
			}
			else if (_time > 170)
			{
				_time = 0;
			}
		}
		
		private function shoot():void
		{
			var b :BBingdong = new BBingdong(x, y + 10);
			bullets.add(b);
			b.x = x + origin.x - b.origin.x;	
		}
	}
	
}