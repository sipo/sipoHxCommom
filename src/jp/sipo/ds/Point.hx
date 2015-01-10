package jp.sipo.ds;
@:generic
class Point<T:(Float)> implements PointPeek<T>
{
	public var x:T;
	public var y:T;
	
	public function new(x:T, y:T)
	{
		this.x = x;
		this.y = y;
	}
	
	public function clone():Point<T>
	{
		return new Point<T>(x, y);
	}
	
	public function equal(point:PointPeek<T>):Bool
	{
		return point.x == x && point.y == y;
	}
	
	/**
	 * pointを代入
	 */
	public function copy(point:PointPeek<T>):Void
	{
		x = point.x;
		y = point.y;
	}
}
interface PointPeek<T:(Float)>
{
	public var x(default, null):T;
	public var y(default, null):T;
	
	
	public function clone():Point<T>;
	
	public function equal(point:PointPeek<T>):Bool;
}
