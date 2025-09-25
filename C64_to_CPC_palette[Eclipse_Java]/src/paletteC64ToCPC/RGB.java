package paletteC64ToCPC;

public class RGB {
	public double r;
	public double g;
	public double b;
	public RGB() {
		
	}
	public RGB(double R, double G, double B) {
		this.r = R;
		this.g = G;
		this.b = B;
	}
			
			
			
	public double getR() {
		return r;
	}
	public void setR(double r) {
		this.r = r;
	}
	public double getG() {
		return g;
	}
	public void setG(double g) {
		this.g = g;
	}
	public double getB() {
		return b;
	}
	public void setB(double b) {
		this.b = b;
	}
	@Override
	public String toString() {
		return "RGB [R=" + String.format("%2x",(int)r) + ", G=" + String.format("%2x",(int)g) + ", B=" + String.format("%2x",(int)b) + "]";
	}
	
	
}
