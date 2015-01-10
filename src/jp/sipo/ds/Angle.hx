package jp.sipo.ds;
/**
 * 角度をDegreeとRadianに安全に交換するためのクラス
 * 全てinlineでFloatに展開されるので一応最速になっているはず。
 * -180～180変換などはされていない（今後付け加えたいところ）
 * 内部値はradianなので、degree状態でFloatと入れ替えが多いと無駄な計算が起こりうる
 * 
 * @auther sipo
 */
abstract Angle(Float)
{
	/* Math.PIはinlineではないので、以下の値をinline化するために必要 */
	private static inline var PI_INLINE = 3.141592653589793;
	/** DegreeからRadianへの変換定数 */
	public static inline var DEGREE_TO_RADIAN:Float = PI_INLINE / 180;
	/** RadianからDegreeへの変換定数 */
	public static inline var RADIAN_TO_DEGREE:Float = 180 / PI_INLINE;
	
	/**
	 * コンストラクタは、元の値がRadianかDegreeか明確にするためにprivateで隠す。
	 */
	inline private function new(a:Float)
	{
		this = a;
	}
	
	static public inline function fromRadian(radian:Float) {
		return new Angle(radian);
	}
	
	static public inline function fromDegree(degree:Float) {
		return new Angle(degree * DEGREE_TO_RADIAN);
	}
	
	public inline function getRadian():Float
	{
		return this;
	}
	
	public inline function getDegree():Float
	{
		return this * RADIAN_TO_DEGREE;
	}
}
