package 
{
	import flash.events.TimerEvent;
	import flash.utils.*;
	import flash.utils.Timer;
	import flash.utils.setTimeout;
	
	import org.flixel.FlxBasic;
	import org.flixel.FlxCamera;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTileblock;
	import org.flixel.FlxTilemap;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxCollision;
	/**
	 * ...
	 * @author 06wj
	 */
	public class  GameState extends FlxState
	{
		public var player:Player = new Player();
		public var enemys:FlxGroup = new FlxGroup(18);
		public var ground:Ground = new Ground();
		private var bullets:FlxGroup = new FlxGroup(10);
		private var bomb:FlxEmitter = new FlxEmitter(100);
		private var a:Number;
		private var timeout;
		
		private var bar:FlxBar;
		
		[Embed("images/enemy/zzbomb_putong.png")]
		private var imgEnemy:Class;
		
		public function GameState()
		{
			
		}
		
		override public function create():void
		{
			add(ground);
			add(bullets);
			add(player);
			add(enemys);
			player.bullets = bullets;
			trace(ground)
			add(bomb);
		    bomb.makeParticles(imgEnemy, 81, 0, true);

			var n = 3;
			while (n--)
			{
				enemys.add(new Enemy())
			}
		}
		
		private function hit(bullet:FlxSprite, enemy:FlxSprite):void
		{
			if (timeout) 
			{
				clearTimeout(timeout);
			}
			
			bullet.kill();
			
			enemy.play("hurt");
			enemy.hurt(4);
			
			if (enemy.health <= 0)
			{
				bomb.x = enemy.x + enemy.origin.x;
				bomb.y = enemy.y + enemy.origin.y;
				bomb.gravity = 570;
				bomb.setXSpeed( -250, 250);
				bomb.setYSpeed( -500, 0);
				
				bomb.start(true, 10);
				
				FlxG.flash(0x88ffffff, .5);
				enemy.kill();
				setTimeout(function(){
					(enemys.recycle(Enemy) as Enemy).init();
									}, 1000);
				
				return;
			}
			
			FlxG.shake(0.008, 0.4);
			timeout = setTimeout(function(){enemy.play("idle");}, 200);
		}
		
		override public function update():void
		{			
			FlxG.overlap(bullets, enemys, hit, FlxCollision.pixelPerfectCheck);
			super.update();
		}
	}
	
}