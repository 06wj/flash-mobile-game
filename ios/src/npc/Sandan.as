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
	public class Sandan extends Enemy 
	{
		function Sandan()
		{
			num = 6;
			super(7);
		}
		
		override public function move():void
		{
			y += .3;
			if (_time == 55)
			{
				shoot(.2);
				shoot(.4);
				shoot(.6);
				shoot(.8);
				shoot( -.2);
				shoot(-.4);
				shoot( -.6);
				shoot( -.8);
				
				_time = 0;
			}
		}
		
		private function shoot(ang:Number):void
		{
			var b :BPulan = new BPulan(x, y + 10);
			bullets.add(b);
			b.velocity.x = 300 * Math.sin(ang);
			b.velocity.y = 300 * Math.cos(ang);
			b.x = x + origin.x - b.origin.x;
		}
	}
	
}