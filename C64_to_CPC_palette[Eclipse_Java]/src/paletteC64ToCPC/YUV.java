package paletteC64ToCPC;

public class YUV {
	public double Y;
	public double U;
	public double V;
	public YUV() {
		
	}
	public YUV(double Y, double U, double V) {
		this.Y = Y;
		this.U = U;
		this.V = V;
	}
	
	public YUV(YUV yuv) {
		this.Y = yuv.Y;
		this.U = yuv.U;
		this.V = yuv.V;
	}
	public double getY() {
		return Y;
	}
	public void setY(double y) {
		Y = y;
	}
	public double getU() {
		return U;
	}
	public void setU(double u) {
		U = u;
	}
	public double getV() {
		return V;
	}
	public void setV(double v) {
		V = v;
	}
	
	@Override
	public String toString() {
		return "YUV [Y=" + Y + ", U=" + U + ", V=" + V + "]";
	}
	
}
