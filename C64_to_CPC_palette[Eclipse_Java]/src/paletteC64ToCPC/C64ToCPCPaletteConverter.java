package paletteC64ToCPC;

import java.awt.Graphics;
import java.lang.reflect.Array;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JPanel;

import java.awt.Color;
public class C64ToCPCPaletteConverter {
	
	
	// Tableau couleurs C64 + son mapping
public static final int[] C64_SCREEN_RED = new int[] {
		0x00,
		0x3F,
		0x2B,
		0x18,
		0x2C,
		0x12,
		0x0D,
		0x39,
		0x2D,
		0x1A,
		0x3A,
		0x13,
		0x21,
		0x29,
		0x1C,
		0x2D
};

//
//
//type T_C64 is array (0 to 15) --(15 downto 0)
//        of STD_LOGIC_VECTOR(5 downto 0);
//constant C64_SCREEN_RED:T_C64 :=
//("000000", --black 00
//"111111", --white 3F
//"101011", --red 2B
//"011000", --cyan 18
//"101100", --purple 2C
//"010010", --green 12
//"001101", --blue 0D
//"111001", --yellow 39
//"101101", --orange 2D
//"011010", --brown 1A
//"111010", --pink 3A
//"010011", --d. gray 13
//"100001", --gray 21
//"101001", --l. green 29
//"101001", --l. blue 1C
//"101101" --l. gray 2D
//);

public static final int[] C64_SCREEN_GREEN = new int[] {
		0x00,
		0x3F,
		0x0A,
		0x36,
		0x0F,
		0x31,
		0x0E,
		0x3B,
		0x16,
		0x0E,
		0x1D,
		0x13,
		0x21,
		0x3E,
		0x1F,
		0x2D
};

//constant C64_SCREEN_GREEN:T_C64 :=
//("000000", --black 00
//"111111", --white 3F
//"001010", --red 0A
//"110110", --cyan 36
//"001111", --purple 0F
//"110001", --green 31
//"001110", --blue 0E
//"111011", --yellow 3B
//"010110", --orange 16
//"001110", --brown 0E
//"011101", --pink 1D
//"010011", --d. gray 13
//"100001", --gray 21
//"111110", --l. green 3E
//"011111", --l. blue 1F
//"101101" --l. gray 2D
//);


public static final int[] C64_SCREEN_BLUE = new int[] {
	0x00,
	0x3F,
	0x0A,
	0x33,
	0x2D,
	0x12,
	0x31,
	0x13,
	0x07,
	0x02,
	0x1B,
	0x13,
	0x21,
	0x27,
	0x39,
	0x2D
};

//constant C64_SCREEN_BLUE:T_C64 :=
//("000000", --black 00
//"111111", --white 3F
//"001010", --red 0A
//"110011", --cyan 33
//"101101", --purple 2D
//"010010", --green 12
//"110001", --blue 31
//"010011", --yellow 13
//"000111", --orange 07
//"000010", --brown 02
//"011011", --pink 1B
//"010011", --d. gray 13
//"100001", --gray 21
//"100111", --l. green 27
//"111001", --l. blue 39
//"101101" --l. gray 2D
//);
	
	private Graphics g;
	List<RGB> paletteOrigine = new ArrayList<RGB>();
	List<YUV> paletteOrigineYUV = new ArrayList<YUV>();
	List<RGB> newPaletteGenerated = new ArrayList<RGB>();
	List<YUV> newPaletteGeneratedYUV = new ArrayList<YUV>();

	public static void main(String [] args) throws Exception {
		
		if (C64_SCREEN_RED.length != 16) throw new Exception("C64_SCREEN_RED");
		if (C64_SCREEN_GREEN.length != 16) throw new Exception("C64_SCREEN_GREEN");
		if (C64_SCREEN_BLUE.length != 16) throw new Exception("C64_SCREEN_BLUE");
		
		
		C64ToCPCPaletteConverter app = new C64ToCPCPaletteConverter();
		//C64 3F RGB to FF RGB
		RGB rgb = new RGB(0xFF,0x00,0x00);
		RGB rgb3F = app.convertTo3F(rgb);
		rgb = app.convertToFF(rgb3F);
		//FF RGB to FF YUV
		YUV yuv = app.rgb2yuvFF(rgb);
		// new FF YUV to RGD FF
		rgb = app.yuv2rgbFF(yuv);
		// RGB FF to RGB 3F
		System.out.println("RGB result : "+ rgb);
		System.out.println("--------------------------------------------");
		//app.openBoite();
		//app.show(rgb,2);
		for (int j = 0;j<3;j++) {
			System.out.println("");
			if (j==0) {
				System.out.println("C64_SCREEN_RED");
			} else if (j == 1) {
				System.out.println("C64_SCREEN_GREEN");
			} else {
				System.out.println("C64_SCREEN_BLUE");
			}
			for (int i=0;i<16;i++) {
				RGB rbg3F = new RGB(C64_SCREEN_RED[i],C64_SCREEN_GREEN[i],C64_SCREEN_BLUE[i]);
				RGB rgbFF = app.convertToFF(rbg3F);
				app.paletteOrigine.add(rgbFF);
				yuv = app.rgb2yuvFF(rgbFF);
				app.paletteOrigineYUV.add(yuv);
				double u = yuv.U;
				double v = yuv.V;
				// on inverse U et V FIXMEs
				yuv.U = v;
				yuv.V = u;
				app.newPaletteGeneratedYUV.add(yuv);
				rgbFF=app.yuv2rgbFF(yuv);
				
				app.newPaletteGenerated.add(rgbFF);
				
				RGB result3F = app.convertTo3F(rgbFF);
				if (j==0) {
					System.out.println("\""+Integer.toBinaryString((int)result3F.r)+"\",");
				} else if (j == 1) {
					System.out.println("\""+Integer.toBinaryString((int)result3F.g)+"\",");
				} else {
					System.out.println("\""+Integer.toBinaryString((int)result3F.b)+"\",");
				}
			}
		}
		
		// Y distincts
		List<Double> discoverY= new ArrayList<Double>();
		for (int i = 0;i<16;i++) {
			YUV yuvY = app.paletteOrigineYUV.get(i);
			if (!discoverY.contains(yuvY.Y)) {
				discoverY.add(yuvY.Y);
			}
		}
		//FIXME
		// discoverY pas 3 : [0.0, 1.0, 0.3, 0.7, 0.4, 0.6, 0.9, 0.5, 0.8]
		// [0.3:0.9] + blanc 1.0 et noir 0.0
		//  \\=> c'est une palette compatible noir et blanc !
		//   \\=> près à parier que le step est de 0.05 ^^'
		if (discoverY.size() != 3) System.out.println("discoverY pas 3 : "+discoverY);
		
		app.openBoite();
	}

	private void openBoite() {
		JFrame f = new JFrame();
		f.setTitle("C64 to CPC palette");
		f.setSize(50*16+16,(50*4-10)+(480));
		JPanel p = new JPanel() {
	       

			@Override
			public void paint(Graphics g) {
	            super.paintComponent(g);
	            C64ToCPCPaletteConverter.this.g = g;
	            g.setColor(Color.BLACK);
	            g.drawOval(0, (50*4-10), 400, 400);
	            for (int j = 0;j<2;j++) {
		            for (int i = 0;i<16;i++) {
		            	RGB al;
		            	YUV yuv;
		            	if (j==0) {
				            al = paletteOrigine.get(i);
				            yuv = paletteOrigineYUV.get(i);
				            C64ToCPCPaletteConverter.this.show(yuv,al.getColor());
		            	} else {
				            al = newPaletteGenerated.get(i);
				            yuv = newPaletteGeneratedYUV.get(i);
		            	}
		            	
		            	System.out.println(j+" "+al);
			            C64ToCPCPaletteConverter.this.show(al,i,j);
//			            C64ToCPCPaletteConverter.this.show(new RGB(100,200,254),4);
		            	
		            }
	            }
	        }
	    };
	    f.add(p);
	    f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	    f.getContentPane().add(p);
	    f.setVisible(true);
	}
	private void show(RGB rgb, int ligne, int colonne) {
	            //g.drawLine(0, 0, 100, 100);
	            
//	            g.drawRect(25, 25, 50, 50);
	            g.setColor(rgb.getColor());
	            g.fillRect(25*(ligne*2),25*(colonne*4), 50, 50);
	}
	private final static double CIRCLE_CENTER=200.0;
	private final static double RATIO=500.0;
	private void show(YUV yuv, Color color) {
        //g.drawLine(0, 0, 100, 100);
        
//        g.drawRect(25, 25, 50, 50);
        g.setColor(color);
        g.fillRect((int)(CIRCLE_CENTER+RATIO*yuv.U) -10,(50*4-10)+(int)(CIRCLE_CENTER+RATIO*yuv.V) -10, 20, 20);
        // 5 niveau de gris + 9 couleurs
}

	protected RGB convertToFF(RGB rgb3F) {
		// 3F -> FF
		// x  -> ?
		
		//r = (x*0xFF)/0x3F; FAUX
		//r = ((x+1)*(0xFF+1))/(0x3F+1) -1; OK
		
		RGB result = new RGB();
		result.r = Math.min(255,rgb3F.r == 0 ? 0 : ((rgb3F.r+1)*(0xFF+1))/(0x3F+1)-1);
		result.g = Math.min(255,rgb3F.g == 0 ? 0 : ((rgb3F.g+1)*(0xFF+1))/(0x3F+1)-1);
		result.b = Math.min(255,rgb3F.b == 0 ? 0 : ((rgb3F.b+1)*(0xFF+1))/(0x3F+1)-1);
		return result;
	}

	protected RGB convertTo3F(RGB rgbFF) {
		// FF -> 3F
		// x  -> ?
		RGB result = new RGB();
		result.r = Math.min(255,rgbFF.r == 0 ? 0 : ((rgbFF.r+1)*(0x3F+1))/(0xFF+1)-1);
		result.g = Math.min(255,rgbFF.g == 0 ? 0 : ((rgbFF.g+1)*(0x3F+1))/(0xFF+1)-1);
		result.b = Math.min(255,rgbFF.b == 0 ? 0 : ((rgbFF.b+1)*(0x3F+1))/(0xFF+1)-1);
		return result;
	}

	protected RGB yuv2rgbFF(YUV yuv) {
		RGB rgb = new RGB();
		
		double r = yuv.Y + 1.13983*yuv.V;
		double g = yuv.Y - 0.39465*yuv.U - 0.58060*yuv.V;
		double b = yuv.Y + 2.03211*yuv.U;
		
		rgb.r = Math.min(255,(int)(r*256.0));
		rgb.g = Math.min(255,(int)(g*256.0));
		rgb.b = Math.min(255,(int)(b*256.0));
		
		return rgb;
	}

	protected YUV rgb2yuvFF(RGB rgb) {
		double r=((double)rgb.r)/256.0;
		double g=((double)rgb.g)/256.0;
		double b=((double)rgb.b)/256.0;
		
		YUV yuv = new YUV();
		yuv.Y = r *  0.299000 + g *  0.587000 + b *  0.114000;
		yuv.U =  -0.14713*r - 0.28886*g + 0.436*b;
		yuv.V = 0.615*r - 0.51498*g - 0.10001*b;

		yuv.Y = Math.round(yuv.Y*10)/10d;
		yuv.U = Math.round(yuv.U*10)/10d;
		yuv.V = Math.round(yuv.V*10)/10d;
		
		return yuv;
	}
}
