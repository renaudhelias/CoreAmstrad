package paletteC64ToCPC;

import java.awt.Color;

public class RGB {
	public int r;
	public int g;
	public int b;
	public RGB() {
		
	}
	public RGB(int r, int g, int b) {
		this.r = Math.min(255, r);
		this.g = Math.min(255, g);
		this.b = Math.min(255, b);
	}
			
			
			/*
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
	}*/
	@Override
	public String toString() {
		return "RGB [R=" + String.format("%2x",r) + ", G=" + String.format("%2x",g) + ", B=" + String.format("%2x",b) + "]";
	}
	
	public Color getColor() {
		return new Color(r,g,b);
	}
	
	
}
