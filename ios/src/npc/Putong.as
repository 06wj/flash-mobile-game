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
	public class Putong extends Enemy 
	{
		function Putong()
		{
			super();
			y = 0;
		}
		
		override public function move():void
		{
			y += .7;
			if (_time%15 == 1 && _time < 32)
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
			var b :BPulan = new BPulan(x, y + 10);
			bullets.add(b);
			b.x = x + origin.x - b.origin.x;
		}
	}
	
}