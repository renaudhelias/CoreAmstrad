package paletteC64ToCPC;

import static org.junit.Assert.*;

import org.junit.Test;

public class C64ToCPCPaletteConverterTest {

	@Test
	public void testConvertTo3F() {
		// https://how.dev/answers/how-to-convert-a-double-to-int-in-java OK
		double DoubleValue = 3.6987;
        int IntValue = (int) DoubleValue;
        System.out.println(DoubleValue + " is now " + IntValue);
		
		// FF -> 3F
		// x  -> ?
        int x = 0x7F;
		int r = ((x+1)*(0x3F+1))/(0xFF+1)-1;
		//expected 31(1F) but was 33(21)
		assertEquals(0x1F, r);
		
		
		
		C64ToCPCPaletteConverter app = new C64ToCPCPaletteConverter();
		RGB test =app.convertTo3F(new RGB(0xFF,0x7F,0x00));
		assertEquals(0x3F, test.getR(), 0.0);
		assertEquals(0x1F, test.getG(), 0.0);
		assertEquals(0x0, test.getB(), 0.0);
	}

	@Test
	public void testConvertToFF() {
		// diviser par deux dans le domaine des entier : 4/2=2
		// diviser par 2 dans le domaine hexa : FF=255 et non 256, faut ajouter 1, et retirer 1 après l'opération
		
		// 3F -> FF
		// x  -> ?
		int x=0x1F;
		assertEquals(0x1F, x);
		assertEquals(0xFF, 255);
		float a = x +1;
		float b = 0xFF +1;
		float c = 0x3F +1;
		float d = (a*b)/c -1;
		//int r = (x*0xFF)/0x3F;
		//expected 127(7F=01111111) but was 125(7D=0111 1101)
		// même résultat avec des float ou des double
		assertEquals(0x7F, (int)d);
		int r = ((x+1)*(0xFF+1))/(0x3F+1) -1;
		//expected 127(7F=01111111) but was 125(7D=0111 1101)
		assertEquals(0x7F, r);
		//r = ((0x00+1)*(0xFF+1))/(0x3F+1) -1;
		//System.out.println("0.00 =>"+(1*(0xFF+1)));
		//assertEquals(0x00, r);
		
		C64ToCPCPaletteConverter app = new C64ToCPCPaletteConverter();
		RGB test =app.convertToFF(new RGB(0x3F,0x1F,0x00));
		assertEquals(0xFF, test.getR(), 0.0);
		assertEquals(0x7F, test.getG(), 0.0);
		assertEquals(0x0,  test.getB(), 0.0);
	}

	@Test
	public void testModulo() {
		assertEquals(255, 255%256);
		assertEquals(4, 260%256);
	}
}
