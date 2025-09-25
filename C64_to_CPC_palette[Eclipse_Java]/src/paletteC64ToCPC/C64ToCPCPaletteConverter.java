package paletteC64ToCPC;

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
				yuv = app.rgb2yuvFF(rgbFF);
				double u = yuv.U;
				double v = yuv.V;
				// on inverse U et V
				yuv.U = v;
				yuv.V = u;
				rgbFF=app.yuv2rgbFF(yuv);
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
	}

	private RGB convertToFF(RGB rgb3F) {
		// 3F -> FF
		// x  -> ?
		RGB result = new RGB();
		result.r = (rgb3F.r*0x3F)/0xFF;
		result.g = (rgb3F.g*0x3F)/0xFF;
		result.b = (rgb3F.b*0x3F)/0xFF;
		return result;
	}

	private RGB convertTo3F(RGB rgbFF) {
		// FF -> 3F
		// x  -> ?
		RGB result = new RGB();
		result.r = (rgbFF.r*0xFF)/0x3F;
		result.g = (rgbFF.g*0xFF)/0x3F;
		result.b = (rgbFF.b*0xFF)/0x3F;
		return result;
	}

	private RGB yuv2rgbFF(YUV yuv) {
		RGB rgb = new RGB();
		rgb.r = yuv.Y + 1.4075 * (yuv.V - 128);
		rgb.g = yuv.Y - 0.3455 * (yuv.U - 128) - (0.7169 * (yuv.V - 128));
		rgb.b = yuv.Y + 1.7790 * (yuv.U - 128);
		return rgb;
	}

	private YUV rgb2yuvFF(RGB rgb) {
		YUV yuv = new YUV();
		yuv.Y = rgb.r *  0.299000 + rgb.g *  .587000 + rgb.b *  0.114000;
		yuv.U = rgb.r * -.168736 + rgb.g * -.331264 + rgb.b *  0.500000 + 128;
		yuv.V = rgb.r *  0.500000 + rgb.g * -.418688 + rgb.b * -0.081312 + 128;
		return yuv;
	}
}
