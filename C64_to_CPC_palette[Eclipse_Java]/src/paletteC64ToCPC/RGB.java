package paletteC64ToCPC;

import java.awt.Color;

public class RGB {
	public int r;
	public int g;
	public int b;
	public RGB() {
		
	}
	public RGB(int r, int g, int b) {
		this.r = r;
		this.g = g;
		this.b = b;
	}
			
			
			
	public double getR() {
		return r;
	}
	public void setR(int r) {
		this.r = r;
	}
	public double getG() {
		return g;
	}
	public void setG(int g) {
		this.g = g;
	}
	public double getB() {
		return b;
	}
	public void setB(int b) {
		this.b = b;
	}
	@Override
	public String toString() {
		return "RGB [R=" + String.format("%2x",(int)r) + ", G=" + String.format("%2x",(int)g) + ", B=" + String.format("%2x",(int)b) + "]";
	}
	
	public Color getColor() {
		return new Color((int)r%256,(int)g%256,(int)b%256);
	}
	
	
}
