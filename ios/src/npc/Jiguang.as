package npc
{
	import Enemy;
	import bul.*;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author 06wj
	 */
	public class Jiguang extends Enemy 
	{
		function Jiguang()
		{
			num = 4;
			super(3);
		}
		
		override public function move():void
		{
			y += .7;
			if (_time%10 == 1 && _time < 151)
			{
				shoot();
			}
			else if (_time > 270)
			{
				_time = 0;
			}
		}
		
		private function shoot():void
		{
			var b :BJiguang = new BJiguang(x, y + 80);
			bullets.add(b);
			b.x = x + origin.x - b.origin.x;
		}
	}
	
}