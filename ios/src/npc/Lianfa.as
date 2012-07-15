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
	public class Lianfa extends Enemy 
	{
		private var _ang:Number = .2;
		private var _angv:Number = .3;
		function Lianfa()
		{
			num = 5;
			super();
		}
		
		override public function move():void
		{
			y += .2;
			if (_time == 40)
			{
				shoot(x - 14, -_ang);
				shoot(x + 14, _ang);
				_time = 0;
				
				_ang += _angv;
				if (_ang > .7 || _ang < 0) _angv*=-1;
			}
		}
		
		private function shoot(x:Number, ang:Number = 0):void
		{
			var b :BPuhong = new BPuhong(x, y + 70);
			bullets.add(b);
			b.velocity.x = 200 * Math.sin(ang);
			b.velocity.y = 200 * Math.cos(ang);
			b.x = x + origin.x - b.origin.x;
		}
	}
	
}