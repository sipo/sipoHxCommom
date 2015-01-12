package ;
/**
 * 
 * 
 * @auther apex
 */
import haxe.PosInfos;
import massive.munit.util.MathUtil;
import jp.sipo.ds.Angle.DeltaAngle;
import jp.sipo.ds.Angle;
import massive.munit.Assert;
class AngleTest
{
	public function new() { }
	
	/** 許容誤差桁数 */
	public static inline var PRECISION:Int = 11;
	
	@Test("AngleとDeltaAngleがFloatと同一であることのテスト")
	private function sameFloatTest():Void 
	{
		Assert.areSame(Angle.fromRadian(1), 1);
		Assert.areSame(Angle.fromRadian(-0.5), -0.5);
		roundDegreeSame(Angle.fromDegree(30), 30);
		roundDegreeSame(Angle.fromDegree(-120), -120);
		
		Assert.areSame(new DeltaAngle(Angle.fromRadian(1)), 1);
		Assert.areSame(new DeltaAngle(Angle.fromRadian(-0.5)), -0.5);
		roundDegreeSameDelta(new DeltaAngle(Angle.fromDegree(30)), 30);
		roundDegreeSameDelta(new DeltaAngle(Angle.fromDegree(-120)), -120);
	}
	
	@Test("AngleがAjustされることをテスト")
	private function ajustTest():Void 
	{
		roundDegreeSame(Angle.fromDegree(190), -170);
		roundDegreeSame(Angle.fromDegree(-200), 160);
		roundDegreeSame(Angle.fromDegree(360 + 5), 5);
		roundDegreeSame(Angle.fromDegree(360 * 3 + 50), 50);
		roundDegreeSame(Angle.fromDegree(-360 * 5 - 160), -160);
		roundDegreeSame(Angle.fromDegree(-360 * 99 + 10), 10);
	}
	
	/* 角度を一定誤差範囲でテスト */
	private function roundDegreeSame(expected:Angle, actualDegree:Float, ?info:PosInfos):Void
	{
		roundDegreeSame_(expected.getDegree(), actualDegree, info);
	}
	private function roundDegreeSameDelta(expected:DeltaAngle, actualDegree:Float, ?info:PosInfos):Void
	{
		roundDegreeSame_(expected.getDegree(), actualDegree, info);
	}
	private function roundDegreeSame_(expectedDegree:Float, actualDegree:Float, ?info:PosInfos):Void
	{
		Assert.areSame(MathUtil.round(expectedDegree, PRECISION), MathUtil.round(actualDegree, PRECISION), info);
	}
	
	@Test("演算テスト")
	private function calcTest():Void 
	{
		var angle_30:Angle = Angle.fromDegree(30);
		var angle_130:Angle = Angle.fromDegree(130);
		var angle_m170:Angle = Angle.fromDegree(-170);
		
	}
	
	
}
