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
	public class Duqi extends Enemy 
	{
		function Duqi()
		{
			num = 3;
			super();
		}
		
		override public function move():void
		{
			y += .7;
			if (_time == 55)
			{
				shoot();
				_time = 0;
			}
		}
		
		private function shoot():void
		{
			var b :BDuqi = new BDuqi(x, y + 10);
			bullets.add(b);
			b.x = x + origin.x - b.origin.x;
		}
	}
	
}