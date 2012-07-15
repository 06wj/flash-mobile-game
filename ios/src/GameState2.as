package 
{
	import flash.events.TimerEvent;
	import flash.utils.*;
	import flash.utils.Timer;
	import flash.utils.setTimeout;
	import org.flixel.FlxSound;
	
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
	import npc.*;
	
	/**
	 * ...
	 * @author 06wj
	 */
	public class  GameState2 extends FlxState
	{
		public var player:Player = new Player();
		public var enemys:FlxGroup = new FlxGroup(100);
		public var ground:Ground2 = new Ground2();
		public var cloud:Cloud = new Cloud();
		private var bullets:FlxGroup = new FlxGroup();
		private var enemyBullets:FlxGroup = new FlxGroup();
		private var bomb:FlxEmitter = new FlxEmitter(100);
		private var bgm:FlxSound = new FlxSound();
		private var enemyArr:Array = EnemyStage.enemyStages[0];
		private var bar:FlxBar;
		
		[Embed("images/enemy/zzbomb_putong.png")]
		private var imgEnemy:Class;
		
		[Embed("sound/sound15.mp3")]
		private var Bgm:Class;
		
		public function GameState2()
		{
			
		}
		
		public function createEnemys():void
		{
			if (!enemyArr.length) return;
			trace(ground.y)
			var e:Array = enemyArr[0];
			if (ground.y >= e[3] && ground.y <= e[3])
			{
				createEnemy(e[0], e[1], e[2]);
				enemyArr.shift();
				createEnemys();
			}
			else
			{
				return;
			}
		}
		
		function createEnemy(num:int, x:int = 0, y:int = 0):void
		{
			var e:*;
			switch(num)
			{
				case 0:e = new Putong();
				       break;
				case 1:e = new Bingdong();
						break;
				case 2:e = new Daodan();
						break;
				case 3:e = new Duqi();
						break;
				case 4:e = new Jiguang();
						break;
				case 5:e = new Lianfa();
						break;
				case 6:e = new Sandan();
						break;
				case 7:e = new Wanqudan(player);
						break;
				case 8:e = new Zhadan();
						break;
				case 9:e = new Boss(player);
						break;
				default:return;
			}
			
			e.x = x;
			e.y = y;
			e.bullets = enemyBullets;
			enemys.add(e);
		}
		
		override public function create():void
		{
			createEnemys()
			add(ground);
			add(bullets);
			add(enemyBullets);
			add(player);
			add(enemys);
			player.bullets = bullets;
			
			add(bomb);
		    bomb.makeParticles(imgEnemy, 81, 0, true);

			add(cloud);
			//bgm.loadEmbedded(Bgm, true);
			//bgm.play();
		}
		
		private function hit(bullet:FlxSprite, enemy:FlxSprite):void
		{
			bullets.remove(bullet);
			bullet.destroy();
			bullet.kill();
			
			enemy.play("hurt");
			enemy.hurt(1);
			setTimeout(function() {
				enemy.play("idle")
				}, 400);
			
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
				return;
			}
			
			FlxG.shake(0.008, 0.4);
		}
		
		private function playerHurt(bullet:FlxSprite, player:FlxSprite):void
		{
			bullets.remove(bullet);
			bullet.destroy();
			bullet.kill();
			
			if (player.flickering) return;
			
			player.play("hurt");
			
			player.hurt(1);
			player.flicker(.7);
			
			if (player.health <= 0)
			{
				FlxG.flash(0x88ffffff, .5);
				return;
			}
		}
		
		override public function update():void
		{			
			FlxG.overlap(bullets, enemys, hit, FlxCollision.pixelPerfectCheck);
			FlxG.overlap(enemyBullets, player, playerHurt, FlxCollision.pixelPerfectCheck);
			createEnemys();
			super.update();
		}
	}
	
}