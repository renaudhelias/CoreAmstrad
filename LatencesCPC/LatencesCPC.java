package latencesCPC;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class LatencesCPC {
	public static void main(String[] args) {
		new LatencesCPC().go();
	}

	private final static String[] ABCDEHL = new String[] { "111", "000", "001", "010", "011", "100", "101" };

	public void go() {
		// on ne peux pas se fier au testbench
		// un tableau de temps, peut avoir deux variantes
		// deux operands, c'est le second MCycle en fait
		// Si prefix, alors il y a un M1 ensuite => à checker le moment de
		// lecture d'un prefix... il est supposé en dehors de l'instruction,
		// donc a son propre M1
		// latence normales
		// latence("00000000", 4, 4, "NOP");

		// selon doc UM0080.pdf
		// 8-Bit Load Group (p84)
		for (String r1 : ABCDEHL) {
			for (String r2 : ABCDEHL) {
				latence("01" + r1 + r2, 4, null, "LD r,r'");
			}
		}
		for (String r1 : ABCDEHL) {
			latence("00" + r1 + "110", 4 + 3, null, "LD r,n");
			latence("01" + r1 + "110", 4 + 3, null, "LD r, (HL)");
			latenceDD("01" + r1 + "110", 4 + 4 + 3 + 5 + 3, null, "LD r, (IX+d)");
			latenceFD("01" + r1 + "110", 4 + 4 + 3 + 5 + 3, null, "LD r, (IY+d)");
			latence("01110" + r1, 4 + 3, null, "LD (HL), r");
			latenceDD("01110" + r1, 4 + 4 + 3 + 5 + 3, null, "LD (IX+d), r");
			latenceFD("01110" + r1, 4 + 4 + 3 + 5 + 3, null, "LD (IY+d), r");
		}
		latence("00110110", 4 + 3 + 3, null, "LD (HL), n");
		latenceDD("00110110", 4 + 4 + 3 + 5 + 3, null, "LD (IX+d), n");
		latenceFD("00110110", 4 + 4 + 3 + 5 + 3, null, "LD (IY+d), n");
		latence("00001010", 4 + 3, null, "LD A, (BC)");
		latence("00011010", 4 + 3, null, "LD A, (DE)");
		latence("00111010", 4 + 3 + 3 + 3, null, "LD A, (nn)");
		latence("00000010", 4 + 3, null, "LD (BC), A");
		latence("00010010", 4 + 3, null, "LD (DE), A");
		latence("00110010", 4 + 3 + 3 + 3, null, "LD (nn), A");
		latenceED("01010111", 4 + 5, null, "LD A, I");
		latenceED("01011111", 4 + 5, null, "LD A, R");
		latenceED("01000111", 4 + 5, null, "LD I, A");
		latenceED("01001111", 4 + 5, null, "LD R, A");
		// 16-Bit Load Group (p112)
		latence("00XX0001", 4 + 3 + 3, null, "LD dd, nn");
		latenceDD("00100001", 4 + 4 + 3 + 3, null, "LD IX, nn");
		latenceFD("00100001", 4 + 4 + 3 + 3, null, "LD IY, nn");
		latence("00101010", 4 + 3 + 3 + 3 + 3, null, "LD HL, (nn)");
		latenceED("01XX1011", 4 + 4 + 3 + 3 + 3 + 3, null, "LD dd, (nn)");
		latenceDD("00101010", 4 + 4 + 3 + 3 + 3 + 3, null, "LD IX, (nn)");
		latenceFD("00101010", 4 + 4 + 3 + 3 + 3 + 3, null, "LD IY, (nn)");
		latence("00100010", 4 + 3 + 3 + 3 + 3, null, "LD (nn), HL");
		latenceED("01XX0011", 4 + 4 + 3 + 3 + 3 + 3, null, "LD (nn), dd");
		latenceDD("00100010", 4 + 4 + 3 + 3 + 3 + 3, null, "LD (nn), IX");
		latenceFD("00100010", 4 + 4 + 3 + 3 + 3 + 3, null, "LD (nn), IY");
		latence("11111001", 6, null, "LD SP, HL");
		latenceDD("11111001", 4 + 6, null, "LD SP, IX");
		latenceFD("11111001", 4 + 6, null, "LD SP, IY");
		latence("11XX0101", 5 + 3 + 3, null, "PUSH qq");
		latenceDD("11100101", 4 + 5 + 3 + 3, null, "PUSH IX");
		latenceFD("11100101", 4 + 5 + 3 + 3, null, "PUSH IY");
		latence("11XX0001", 4 + 3 + 3, null, "POP qq");
		latenceDD("11100001", 4 + 4 + 3 + 3, null, "POP IX");
		latenceFD("11100001", 4 + 4 + 3 + 3, null, "POP IY");
		// Exchange, Block Transfer, and Search Group (page 137)
		latence("11101011", 4, null, "EX DE, HL");
		latence("00001000", 4, null, "EX AF, AF'");
		latence("11011001", 4, null, "EXX");
		latence("11100011", 4 + 3 + 4 + 3 + 5, null, "EX (SP), HL");
		latenceDD("11100011", 4 + 4 + 3 + 4 + 3 + 5, null, "EX (SP), IX");
		latenceFD("11100011", 4 + 4 + 3 + 4 + 3 + 5, null, "EX (SP), IY");
		latenceED("10100000", 4 + 4 + 3 + 5, null, "LDI");
		latenceED("10110000", 4 + 4 + 3 + 5 + 5, 4 + 4 + 3 + 5, "LDIR");
		latenceED("10101000", 4 + 4 + 3 + 5, null, "LDD");
		latenceED("10111000", 4 + 4 + 3 + 5 + 5, 4 + 4 + 3 + 5, "LDDR");
		latenceED("10100001", 4 + 4 + 3 + 5, null, "CPI");
		latenceED("10110001", 4 + 4 + 3 + 5 + 5, 4 + 4 + 3 + 5, "CPIR");
		latenceED("10101001", 4 + 4 + 3 + 5, null, "CPD");
		latenceED("10111001", 4 + 4 + 3 + 5 + 5, 4 + 4 + 3 + 5, "CPDR");
		// 8-Bit Arithmetic Group (page 158)
		for (String r1 : ABCDEHL) {
			latence("10000" + r1, 4, null, "ADD A, r");
		}
		latence("11000110", 4 + 3, null, "ADD A, n");
		latence("10000110", 4 + 3, null, "ADD A, (HL)");
		latenceDD("10000110", 4 + 4 + 3 + 5 + 3, null, "ADD A, (IX + d)");
		latenceFD("10000110", 4 + 4 + 3 + 5 + 3, null, "ADD A, (IY + d)");
		// ADC A, s
		for (String r1 : ABCDEHL) {
			latence("10001" + r1, 4, null, "ADC A, r");
		}
		latence("11001110", 4 + 3, null, "ADC A, n");
		latence("10001110", 4 + 3, null, "ADC A, (HL)");
		latenceDD("10001110", 4 + 4 + 3 + 5 + 3, null, "ADC A, (IX+d)");
		latenceFD("10001110", 4 + 4 + 3 + 5 + 3, null, "ADC A, (IY+d)");
		// SUB s
		for (String r1 : ABCDEHL) {
			latence("10010" + r1, 4, null, "SUB r");
		}
		latence("11010110", 4 + 3, null, "SUB n");
		latence("10010110", 4 + 3, null, "SUB (HL)");
		latenceDD("10010110", 4 + 4 + 3 + 5 + 3, null, "SUB (IX+d)");
		latenceFD("10010110", 4 + 4 + 3 + 5 + 3, null, "SUB (IY+d)");
		// SBC A, s
		for (String r1 : ABCDEHL) {
			latence("10011" + r1, 4, null, "SBC A, r");
		}
		latence("11011110", 4 + 3, null, "SBC A, n");
		latence("10011110", 4 + 3, null, "SBC A, (HL)");
		latenceDD("10011110", 4 + 4 + 3 + 5 + 3, null, "SBC A, (IX+d)");
		latenceFD("10011110", 4 + 4 + 3 + 5 + 3, null, "SBC A, (IY+d)");
		// AND s
		for (String r1 : ABCDEHL) {
			latence("10100" + r1, 4, null, "AND r");
		}
		latence("11100110", 4 + 3, null, "AND n");
		latence("10100110", 4 + 3, null, "AND (HL)");
		latenceDD("10100110", 4 + 4 + 3 + 5 + 3, null, "AND (IX+d)");
		latenceFD("10100110", 4 + 4 + 3 + 5 + 3, null, "AND (IY+d)");
		// OR s
		for (String r1 : ABCDEHL) {
			latence("10110" + r1, 4, null, "OR r");
		}
		latence("11110110", 4 + 3, null, "OR n");
		latence("10110110", 4 + 3, null, "OR (HL)");
		latenceDD("10110110", 4 + 4 + 3 + 5 + 3, null, "OR (IX+d)");
		latenceFD("10110110", 4 + 4 + 3 + 5 + 3, null, "OR (IY+d)");
		// XOR s
		for (String r1 : ABCDEHL) {
			latence("10101" + r1, 4, null, "XOR r");
		}
		latence("11101110", 4 + 3, null, "XOR n");
		latence("10101110", 4 + 3, null, "XOR (HL)");
		latenceDD("10101110", 4 + 4 + 3 + 5 + 3, null, "XOR (IX+d)");
		latenceFD("10101110", 4 + 4 + 3 + 5 + 3, null, "XOR (IY+d)");
		// CP s
		for (String r1 : ABCDEHL) {
			latence("10111" + r1, 4, null, "CP r");
		}
		latence("11111110", 4 + 3, null, "CP n");
		latence("10111110", 4 + 3, null, "CP (HL)");
		latenceDD("10111110", 4 + 4 + 3 + 5 + 3, null, "CP (IX+d)");
		latenceFD("10111110", 4 + 4 + 3 + 5 + 3, null, "CP (IY+d)");
		latence("00110100", 4 + 4 + 3, null, "INC (HL)");
		latenceDD("00110100", 4 + 4 + 3 + 5 + 4 + 3, null, "INC (IX+d)");
		latenceFD("00110100", 4 + 4 + 3 + 5 + 4 + 3, null, "INC (IY+d)");
		// DEC m
		for (String r1 : ABCDEHL) {
			latence("00" + r1 + "101", 4, null, "DEC r");
		}
		latence("00110101", 4 + 4 + 3, null, "DEC (HL)");
		latenceDD("00110101", 4 + 4 + 3 + 5 + 4 + 3, null, "DEC (IX+d)");
		latenceFD("00110101", 4 + 4 + 3 + 5 + 4 + 3, null, "DEC (IY+d)");
		// General-Purpose Arithmetic and CPU Control Groups (page 186)
		latence("00100111", 4, null, "DAA");
		latence("00101111", 4, null, "CPL");
		latenceED("01000100", 4 + 4, null, "NEG");
		latence("00111111", 4, null, "CCF");
		latence("00110111", 4, null, "SCF");
		latence("00000000", 4, null, "NOP");
		latence("01110110", 4, null, "HALT");
		latence("11110011", 4, null, "DI");
		latence("11111011", 4, null, "EI");
		latenceED("01000110", 4 + 4, null, "IM 0");
		latenceED("01010110", 4 + 4, null, "IM 1");
		latenceED("01011110", 4 + 4, null, "IM 2");
		// 16-Bit Arithmetic Group (page 201)
		latence("00XX1001", 4 + 4 + 3, null, "ADD HL, ss");
		latenceED("01XX1010", 4 + 4 + 4 + 3, null, "ADC HL, ss");
		latenceED("01XX0010", 4 + 4 + 4 + 3, null, "SBC HL, ss");
		latenceDD("00XX1001", 4 + 4 + 4 + 3, null, "ADD IX, pp");
		latenceFD("00XX1001", 4 + 4 + 4 + 3, null, "ADD IY, pp");
		latence("00XX0011", 6, null, "INC ss");
		latenceDD("00100011", 4 + 6, null, "INC IX");
		latenceFD("00100011", 4 + 6, null, "INC IY");
		latence("00XX1011", 6, null, "DEC ss");
		latenceDD("00101011", 4 + 6, null, "DEC IX");
		latenceFD("00101011", 4 + 6, null, "DEC IY");
		// Rotate and Shift Group (page 218)
		latence("00000111", 4, null, "RLCA");
		latence("00010111", 4, null, "RLA");
		latence("00001111", 4, null, "RRCA");
		latence("00011111", 4, null, "RRA");
		// RLC r
		latenceCB("00000000", 4 + 4, null, "RLC B");
		latenceCB("00000001", 4 + 4, null, "RLC C");
		latenceCB("00000010", 4 + 4, null, "RLC D");
		latenceCB("00000011", 4 + 4, null, "RLC E");
		latenceCB("00000100", 4 + 4, null, "RLC H");
		latenceCB("00000101", 4 + 4, null, "RLC L");
		latenceCB("00000111", 4 + 4, null, "RLC A");
		latenceCB("00000110", 4 + 4 + 4 + 3, null, "RLC (HL)");
		latenceDDCB("XXXXXXXX", "00000110", 4 + 4 + 3 + 5 + 4 + 3, null, "RLC (IX+d)");
		latenceFDCB("XXXXXXXX", "00000110", 4 + 4 + 3 + 5 + 4 + 3, null, "RLC (IY+d)");
		// RL m
		// RL r*
		latenceCB("00010000", 4 + 4, null, "RL B");
		latenceCB("00010001", 4 + 4, null, "RL C");
		latenceCB("00010010", 4 + 4, null, "RL D");
		latenceCB("00010011", 4 + 4, null, "RL E");
		latenceCB("00010100", 4 + 4, null, "RL H");
		latenceCB("00010101", 4 + 4, null, "RL L");
		latenceCB("00010111", 4 + 4, null, "RL A");
		latenceCB("00010110", 4 + 4 + 4 + 3, null, "RL (HL)");
		latenceDDCB("XXXXXXXX", "00010110", 4 + 4 + 3 + 5 + 4 + 3, null, "RL (IX+d)");
		latenceFDCB("XXXXXXXX", "00010110", 4 + 4 + 3 + 5 + 4 + 3, null, "RL (IY+d)");
		// RRC m
		// RRC r*
		latenceCB("00001000", 4 + 4, null, "RRC B");
		latenceCB("00001001", 4 + 4, null, "RRC C");
		latenceCB("00001010", 4 + 4, null, "RRC D");
		latenceCB("00001011", 4 + 4, null, "RRC E");
		latenceCB("00001100", 4 + 4, null, "RRC H");
		latenceCB("00001101", 4 + 4, null, "RRC L");
		latenceCB("00001111", 4 + 4, null, "RRC A");
		latenceCB("00001110", 4 + 4 + 4 + 3, null, "RRC (HL)");
		latenceDDCB("XXXXXXXX", "00001110", 4 + 4 + 3 + 5 + 4 + 3, null, "RRC (IX+d)");
		latenceFDCB("XXXXXXXX", "00001110", 4 + 4 + 3 + 5 + 4 + 3, null, "RRC (IY+d)");
		// RR m
		// RR r* (doc erratum)
		latenceCB("00011000", 4 + 4, null, "RR B");
		latenceCB("00011001", 4 + 4, null, "RR C");
		latenceCB("00011010", 4 + 4, null, "RR D");
		latenceCB("00011011", 4 + 4, null, "RR E");
		latenceCB("00011100", 4 + 4, null, "RR H");
		latenceCB("00011101", 4 + 4, null, "RR L");
		latenceCB("00011111", 4 + 4, null, "RR A");
		latenceCB("00011110", 4 + 4 + 4 + 3, null, "RR (HL)");
		latenceDDCB("XXXXXXXX", "00011110", 4 + 4 + 3 + 5 + 4 + 3, null, "RR (IX+d)");
		latenceFDCB("XXXXXXXX", "00011110", 4 + 4 + 3 + 5 + 4 + 3, null, "RR (IY+d)");
		// SLA m
		// SLA r*
		for (String r1 : ABCDEHL) {
			latenceCB("00100"+r1, 4 + 4, null, "SLA r");
		}
		latenceCB("00100110", 4 + 4 + 4 + 3, null, "SLA (HL)");
		latenceDDCB("XXXXXXXX", "00100110", 4 + 4 + 3 + 5 + 4 + 3, null, "SLA (IX+d)");
		latenceFDCB("XXXXXXXX", "00100110", 4 + 4 + 3 + 5 + 4 + 3, null, "SLA (IY+d)");
		// SRA m
		// SRA r*
		latenceCB("00101000", 4 + 4, null, "SRA B");
		latenceCB("00101001", 4 + 4, null, "SRA C");
		latenceCB("00101010", 4 + 4, null, "SRA D");
		latenceCB("00101011", 4 + 4, null, "SRA E");
		latenceCB("00101100", 4 + 4, null, "SRA H");
		latenceCB("00101101", 4 + 4, null, "SRA L");
		latenceCB("00101111", 4 + 4, null, "SRA A");
		latenceCB("00101110", 4 + 4 + 4 + 3, null, "SRA (HL)");
		latenceDDCB("XXXXXXXX", "00101110", 4 + 4 + 3 + 5 + 4 + 3, null, "SRA (IX+d)");
		latenceFDCB("XXXXXXXX", "00101110", 4 + 4 + 3 + 5 + 4 + 3, null, "SRA (IY+d)");
		// SRL m
		// SRL r*
		latenceCB("00111000", 4 + 4, null, "SRL B");
		latenceCB("00111001", 4 + 4, null, "SRL C");
		latenceCB("00111010", 4 + 4, null, "SRL D");
		latenceCB("00111011", 4 + 4, null, "SRL E");
		latenceCB("00111100", 4 + 4, null, "SRL H");
		latenceCB("00111101", 4 + 4, null, "SRL L");
		latenceCB("00111111", 4 + 4, null, "SRL A");
		latenceCB("00111110", 4 + 4 + 4 + 3, null, "SRL (HL)");
		latenceDDCB("XXXXXXXX", "00111110", 4 + 4 + 3 + 5 + 4 + 3, null, "SRL (IX+d)");
		latenceFDCB("XXXXXXXX", "00111110", 4 + 4 + 3 + 5 + 4 + 3, null, "SRL (IY+d)");
		latenceED("01101111", 4 + 4 + 3 + 4 + 3, null, "RLD");
		latenceED("01100111", 4 + 4 + 3 + 4 + 3, null, "RRD");
		// Bit Set, Reset, and Test Group (page 256)
		// BIT b,r
		latenceCB("01XXX000", 4 + 4, null, "BIT b,B");
		latenceCB("01XXX001", 4 + 4, null, "BIT b,C");
		latenceCB("01XXX010", 4 + 4, null, "BIT b,D");
		latenceCB("01XXX011", 4 + 4, null, "BIT b,E");
		latenceCB("01XXX100", 4 + 4, null, "BIT b,H");
		latenceCB("01XXX101", 4 + 4, null, "BIT b,L");
		latenceCB("01XXX111", 4 + 4, null, "BIT b,A");
		latenceCB("01XXX110", 4 + 4 + 4, null, "BIT b, (HL)"); // doc erratum :
																// T States 12
																// (4, 4, 4) 4
		latenceDDCB("XXXXXXXX", "01XXX110", 4 + 4 + 3 + 5 + 4, null, "BIT b, (IX+d)");
		latenceFDCB("XXXXXXXX", "01XXX110", 4 + 4 + 3 + 5 + 4, null, "BIT b, (IY+d)");
		// SET b, r
		latenceCB("11XXX000", 4 + 4, null, "SET b,B");
		latenceCB("11XXX001", 4 + 4, null, "SET b,C");
		latenceCB("11XXX010", 4 + 4, null, "SET b,D");
		latenceCB("11XXX011", 4 + 4, null, "SET b,E");
		latenceCB("11XXX100", 4 + 4, null, "SET b,H");
		latenceCB("11XXX101", 4 + 4, null, "SET b,L");
		latenceCB("11XXX111", 4 + 4, null, "SET b,A");
		latenceCB("11XXX110", 4 + 4 + 4 + 3, null, "SET b, (HL)");
		latenceDDCB("XXXXXXXX", "11XXX110", 4 + 4 + 3 + 5 + 4 + 3, null, "SET b, (IX+d)");
		latenceFDCB("XXXXXXXX", "11XXX110", 4 + 4 + 3 + 5 + 4 + 3, null, "SET b, (IY+d)");
		// RES b, m
		latenceCB("10XXX000", 4 + 4, null, "SET b,B");
		latenceCB("10XXX001", 4 + 4, null, "SET b,C");
		latenceCB("10XXX010", 4 + 4, null, "SET b,D");
		latenceCB("10XXX011", 4 + 4, null, "SET b,E");
		latenceCB("10XXX100", 4 + 4, null, "SET b,H");
		latenceCB("10XXX101", 4 + 4, null, "SET b,L");
		latenceCB("10XXX111", 4 + 4, null, "SET b,A");
		latenceCB("10XXX110", 4 + 4 + 4 + 3, null, "SET b, (HL)");
		latenceDDCB("XXXXXXXX", "10XXX110", 4 + 4 + 3 + 5 + 4 + 3, null, "SET b, (IX+d)");
		latenceFDCB("XXXXXXXX", "10XXX110", 4 + 4 + 3 + 5 + 4 + 3, null, "SET b, (IY+d)");
		// Jump Group (page 275)
		latence("11000011", 4 + 3 + 3, null, "JP nn");
		latence("11XXX010", 4 + 3 + 3, null, "JP cc, nn");
		latence("00011000", 4 + 3 + 5, null, "JR e");
		latence("00111000", 4 + 3 + 5, 4 + 3, "JR C, e");
		latence("00110000", 4 + 3 + 5, 4 + 3, "JP NC, e");
		latence("00101000", 4 + 3 + 5, 4 + 3, "JR Z, e");
		latence("00100000", 4 + 3 + 5, 4 + 3, "JR NZ, e");
		latence("11101001", 4, null, "JP (HL)");
		latenceDD("11101001", 4 + 4, null, "JP (IX)");
		latenceFD("11101001", 4 + 4, null, "JP (IY)");
		latence("00010000", 5 + 3 + 5, 5 + 3, "DJNZ, e");
		// Call and Return Group (page 294)

		// selon plustest.dsk
		plustest("00", 1, null);
		plustest("01", 3, null);
		plustest("02", 2, null);
		plustest("03", 2, null);
		plustest("04", 1, null);
		plustest("05", 1, null);
		plustest("06", 2, null);
		plustest("07", 1, null);
		plustest("08", 1, null);
		plustest("09", 3, null);
		plustest("0A", 2, null);
		plustest("0B", 2, null);
		plustest("0C", 1, null);
		plustest("0D", 1, null);
		plustest("0E", 2, null);
		plustest("0F", 1, null);
		plustest("10", 4, 3);
		plustest("11", 3, null);
		plustest("12", 2, null);
		plustest("13", 2, null);
		plustest("14", 1, null);
		plustest("15", 1, null);
		plustest("16", 2, null);
		plustest("17", 1, null);
		plustest("18", 3, null);
		plustest("19", 3, null);
		plustest("1A", 2, null);
		plustest("1B", 2, null);
		plustest("1C", 1, null);
		plustest("1D", 1, null);
		plustest("1E", 2, null);
		plustest("1F", 1, null);
		plustest("20", 2, 3);
		plustest("21", 3, null);
		plustest("22", 5, null);
		plustest("23", 2, null);
		plustest("24", 1, null);
		plustest("25", 1, null);
		plustest("26", 2, null);
		plustest("27", 1, null);
		plustest("28", 3, 2);
		plustest("29", 3, null);
		plustest("2A", 5, null);
		plustest("2B", 2, null);
		plustest("2C", 1, null);
		plustest("2D", 1, null);
		plustest("2E", 2, null);
		plustest("2F", 1, null);
		plustest("30", 2, 3);
		plustest("31", 3, null);
		plustest("32", 4, null);
		plustest("33", 2, null);
		plustest("34", 3, null);
		plustest("35", 3, null);
		plustest("36", 3, null);
		plustest("37", 1, null);
		plustest("38", 3, 2);
		plustest("39", 3, null);
		plustest("3A", 4, null);
		plustest("3B", 2, null);
		plustest("3C", 1, null);
		plustest("3D", 1, null);
		plustest("3E", 2, null);
		plustest("3F", 1, null);
		plustest("40", 1, null);
		plustest("41", 1, null);
		plustest("42", 1, null);
		plustest("43", 1, null);
		plustest("44", 1, null);
		plustest("45", 1, null);
		plustest("46", 2, null);
		plustest("47", 1, null);
		plustest("48", 1, null);
		plustest("49", 1, null);
		plustest("4A", 1, null);
		plustest("4B", 1, null);
		plustest("4C", 1, null);
		plustest("4D", 1, null);
		plustest("4E", 2, null);
		plustest("4F", 1, null);
		plustest("50", 1, null);
		plustest("51", 1, null);
		plustest("52", 1, null);
		plustest("53", 1, null);
		plustest("54", 1, null);
		plustest("55", 1, null);
		plustest("56", 2, null);
		plustest("57", 1, null);
		plustest("58", 1, null);
		plustest("59", 1, null);
		plustest("5A", 1, null);
		plustest("5B", 1, null);
		plustest("5C", 1, null);
		plustest("5D", 1, null);
		plustest("5E", 2, null);
		plustest("5F", 1, null);
		plustest("60", 1, null);
		plustest("61", 1, null);
		plustest("62", 1, null);
		plustest("63", 1, null);
		plustest("64", 1, null);
		plustest("65", 1, null);
		plustest("66", 2, null);
		plustest("67", 1, null);
		plustest("68", 1, null);
		plustest("69", 1, null);
		plustest("6A", 1, null);
		plustest("6B", 1, null);
		plustest("6C", 1, null);
		plustest("6D", 1, null);
		plustest("6E", 2, null);
		plustest("6F", 1, null);
		plustest("70", 2, null);
		plustest("71", 2, null);
		plustest("72", 2, null);
		plustest("73", 2, null);
		plustest("74", 2, null);
		plustest("75", 2, null);
		plustest("76", 1, null);
		plustest("77", 2, null);
		plustest("78", 1, null);
		plustest("79", 1, null);
		plustest("7A", 1, null);
		plustest("7B", 1, null);
		plustest("7C", 1, null);
		plustest("7D", 1, null);
		plustest("7E", 2, null);
		plustest("7F", 1, null);
		plustest("80", 1, null);
		plustest("81", 1, null);
		plustest("82", 1, null);
		plustest("83", 1, null);
		plustest("84", 1, null);
		plustest("85", 1, null);
		plustest("86", 2, null);
		plustest("87", 1, null);
		plustest("88", 1, null);
		plustest("89", 1, null);
		plustest("8A", 1, null);
		plustest("8B", 1, null);
		plustest("8C", 1, null);
		plustest("8D", 1, null);
		plustest("8E", 2, null);
		plustest("8F", 1, null);
		plustest("90", 1, null);
		plustest("91", 1, null);
		plustest("92", 1, null);
		plustest("93", 1, null);
		plustest("94", 1, null);
		plustest("95", 1, null);
		plustest("96", 2, null);
		plustest("97", 1, null);
		plustest("98", 1, null);
		plustest("99", 1, null);
		plustest("9A", 1, null);
		plustest("9B", 1, null);
		plustest("9C", 1, null);
		plustest("9D", 1, null);
		plustest("9E", 2, null);
		plustest("9F", 1, null);
		plustest("A0", 1, null);
		plustest("A1", 1, null);
		plustest("A2", 1, null);
		plustest("A3", 1, null);
		plustest("A4", 1, null);
		plustest("A5", 1, null);
		plustest("A6", 2, null);
		plustest("A7", 1, null);
		plustest("A8", 1, null);
		plustest("A9", 1, null);
		plustest("AA", 1, null);
		plustest("AB", 1, null);
		plustest("AC", 1, null);
		plustest("AD", 1, null);
		plustest("AE", 2, null);
		plustest("AF", 1, null);
		plustest("B0", 1, null);
		plustest("B1", 1, null);
		plustest("B2", 1, null);
		plustest("B3", 1, null);
		plustest("B4", 1, null);
		plustest("B5", 1, null);
		plustest("B6", 2, null);
		plustest("B7", 1, null);
		plustest("B8", 1, null);
		plustest("B9", 1, null);
		plustest("BA", 1, null);
		plustest("BB", 1, null);
		plustest("BC", 1, null);
		plustest("BD", 1, null);
		plustest("BE", 2, null);
		plustest("BF", 1, null);
		plustest("C0", 2, 4);
		plustest("C1", 3, null);
		plustest("C2", 3, null);
		plustest("C3", 3, null);
		plustest("C4", 3, 5);
		plustest("C5", 4, null);
		plustest("C6", 2, null);
		plustest("C7", 4, null);
		plustest("C8", 4, 2);
		plustest("C9", 3, null);
		plustest("CA", 3, null);
		plustest("CB", null, null); // manquant
		plustest("CC", 5, 3);
		plustest("CD", 5, null);
		plustest("CE", 2, null);
		plustest("CF", 4, null);
		plustest("D0", 2, 4);
		plustest("D1", 3, null);
		plustest("D2", 3, null);
		plustest("D3", 3, null);
		plustest("D4", 3, 5);
		plustest("D5", 4, null);
		plustest("D6", 2, null);
		plustest("D7", 4, null);
		plustest("D8", 4, 2);
		plustest("D9", 1, null);
		plustest("DA", 3, null);
		plustest("DB", 3, null);
		plustest("DC", 5, 3);
		plustest("DD", null, null); // manquant
		plustest("DE", 2, null);
		plustest("DF", 4, null);
		plustest("E0", 2, 4);
		plustest("E1", 3, null);
		plustest("E2", 3, null);
		plustest("E3", 6, null);
		plustest("E4", 3, 5);
		plustest("E5", 4, null);
		plustest("E6", 2, null);
		plustest("E7", 4, null);
		plustest("E8", 4, 2);
		plustest("E9", 1, null);
		plustest("EA", 3, null);
		plustest("EB", 1, null);
		plustest("EC", 5, 3);
		plustest("ED", null, null); // manquant
		plustest("EE", 2, null);
		plustest("EF", 4, null);
		plustest("F0", 2, 4);
		plustest("F1", 3, null);
		plustest("F2", 3, null);
		plustest("F3", 1, null);
		plustest("F4", 3, 5);
		plustest("F5", 4, null);
		plustest("F6", 2, null);
		plustest("F7", 4, null);
		plustest("F8", 4, 2);
		plustest("F9", 2, null);
		plustest("FA", 3, null);
		plustest("FB", 1, null);
		plustest("FC", 5, 3);
		plustest("FD", null, null); // manquant
		plustest("FE", 2, null);
		plustest("FF", 4, null);
		// CB Codes
		plustestCB("00", 2, null);
		plustestCB("01", 2, null);
		plustestCB("02", 2, null);
		plustestCB("03", 2, null);
		plustestCB("04", 2, null);
		plustestCB("05", 2, null);
		plustestCB("06", 4, null);
		plustestCB("07", 2, null);
		plustestCB("08", 2, null);
		plustestCB("09", 2, null);
		plustestCB("0A", 2, null);
		plustestCB("0B", 2, null);
		plustestCB("0C", 2, null);
		plustestCB("0D", 2, null);
		plustestCB("0E", 4, null);
		plustestCB("0F", 2, null);
		plustestCB("10", 2, null);
		plustestCB("11", 2, null);
		plustestCB("12", 2, null);
		plustestCB("13", 2, null);
		plustestCB("14", 2, null);
		plustestCB("15", 2, null);
		plustestCB("16", 4, null);
		plustestCB("17", 2, null);
		plustestCB("18", 2, null);
		plustestCB("19", 2, null);
		plustestCB("1A", 2, null);
		plustestCB("1B", 2, null);
		plustestCB("1C", 2, null);
		plustestCB("1D", 2, null);
		plustestCB("1E", 4, null);
		plustestCB("1F", 2, null);
		plustestCB("20", 2, null);
		plustestCB("21", 2, null);
		plustestCB("22", 2, null);
		plustestCB("23", 2, null);
		plustestCB("24", 2, null);
		plustestCB("25", 2, null);
		plustestCB("26", 4, null);
		plustestCB("27", 2, null);
		plustestCB("28", 2, null);
		plustestCB("29", 2, null);
		plustestCB("2A", 2, null);
		plustestCB("2B", 2, null);
		plustestCB("2C", 2, null);
		plustestCB("2D", 2, null);
		plustestCB("2E", 4, null);
		plustestCB("2F", 2, null);
		plustestCB("30", 2, null);
		plustestCB("31", 2, null);
		plustestCB("32", 2, null);
		plustestCB("33", 2, null);
		plustestCB("34", 2, null);
		plustestCB("35", 2, null);
		plustestCB("36", 4, null);
		plustestCB("37", 2, null);
		plustestCB("38", 2, null);
		plustestCB("39", 2, null);
		plustestCB("3A", 2, null);
		plustestCB("3B", 2, null);
		plustestCB("3C", 2, null);
		plustestCB("3D", 2, null);
		plustestCB("3E", 4, null);
		plustestCB("3F", 2, null);
		plustestCB("40", 2, null);
		plustestCB("41", 2, null);
		plustestCB("42", 2, null);
		plustestCB("43", 2, null);
		plustestCB("44", 2, null);
		plustestCB("45", 2, null);
		plustestCB("46", 3, null);
		plustestCB("47", 2, null);
		plustestCB("48", 2, null);
		plustestCB("49", 2, null);
		plustestCB("4A", 2, null);
		plustestCB("4B", 2, null);
		plustestCB("4C", 2, null);
		plustestCB("4D", 2, null);
		plustestCB("4E", 3, null);
		plustestCB("4F", 2, null);
		plustestCB("50", 2, null);
		plustestCB("51", 2, null);
		plustestCB("52", 2, null);
		plustestCB("53", 2, null);
		plustestCB("54", 2, null);
		plustestCB("55", 2, null);
		plustestCB("56", 3, null);
		plustestCB("57", 2, null);
		plustestCB("58", 2, null);
		plustestCB("59", 2, null);
		plustestCB("5A", 2, null);
		plustestCB("5B", 2, null);
		plustestCB("5C", 2, null);
		plustestCB("5D", 2, null);
		plustestCB("5E", 3, null);
		plustestCB("5F", 2, null);
		plustestCB("60", 2, null);
		plustestCB("61", 2, null);
		plustestCB("62", 2, null);
		plustestCB("63", 2, null);
		plustestCB("64", 2, null);
		plustestCB("65", 2, null);
		plustestCB("66", 3, null);
		plustestCB("67", 2, null);
		plustestCB("68", 2, null);
		plustestCB("69", 2, null);
		plustestCB("6A", 2, null);
		plustestCB("6B", 2, null);
		plustestCB("6C", 2, null);
		plustestCB("6D", 2, null);
		plustestCB("6E", 3, null);
		plustestCB("6F", 2, null);
		plustestCB("70", 2, null);
		plustestCB("71", 2, null);
		plustestCB("72", 2, null);
		plustestCB("73", 2, null);
		plustestCB("74", 2, null);
		plustestCB("75", 2, null);
		plustestCB("76", 3, null);
		plustestCB("77", 2, null);
		plustestCB("78", 2, null);
		plustestCB("79", 2, null);
		plustestCB("7A", 2, null);
		plustestCB("7B", 2, null);
		plustestCB("7C", 2, null);
		plustestCB("7D", 2, null);
		plustestCB("7E", 3, null);
		plustestCB("7F", 2, null);
		plustestCB("80", 2, null);
		plustestCB("81", 2, null);
		plustestCB("82", 2, null);
		plustestCB("83", 2, null);
		plustestCB("84", 2, null);
		plustestCB("85", 2, null);
		plustestCB("86", 4, null);
		plustestCB("87", 2, null);
		plustestCB("88", 2, null);
		plustestCB("89", 2, null);
		plustestCB("8A", 2, null);
		plustestCB("8B", 2, null);
		plustestCB("8C", 2, null);
		plustestCB("8D", 2, null);
		plustestCB("8E", 4, null);
		plustestCB("8F", 2, null);
		plustestCB("90", 2, null);
		plustestCB("91", 2, null);
		plustestCB("92", 2, null);
		plustestCB("93", 2, null);
		plustestCB("94", 2, null);
		plustestCB("95", 2, null);
		plustestCB("96", 4, null);
		plustestCB("97", 2, null);
		plustestCB("98", 2, null);
		plustestCB("99", 2, null);
		plustestCB("9A", 2, null);
		plustestCB("9B", 2, null);
		plustestCB("9C", 2, null);
		plustestCB("9D", 2, null);
		plustestCB("9E", 4, null);
		plustestCB("9F", 2, null);
		plustestCB("A0", 2, null);
		plustestCB("A1", 2, null);
		plustestCB("A2", 2, null);
		plustestCB("A3", 2, null);
		plustestCB("A4", 2, null);
		plustestCB("A5", 2, null);
		plustestCB("A6", 4, null);
		plustestCB("A7", 2, null);
		plustestCB("A8", 2, null);
		plustestCB("A9", 2, null);
		plustestCB("AA", 2, null);
		plustestCB("AB", 2, null);
		plustestCB("AC", 2, null);
		plustestCB("AD", 2, null);
		plustestCB("AE", 4, null);
		plustestCB("AF", 2, null);
		plustestCB("B0", 2, null);
		plustestCB("B1", 2, null);
		plustestCB("B2", 2, null);
		plustestCB("B3", 2, null);
		plustestCB("B4", 2, null);
		plustestCB("B5", 2, null);
		plustestCB("B6", 4, null);
		plustestCB("B7", 2, null);
		plustestCB("B8", 2, null);
		plustestCB("B9", 2, null);
		plustestCB("BA", 2, null);
		plustestCB("BB", 2, null);
		plustestCB("BC", 2, null);
		plustestCB("BD", 2, null);
		plustestCB("BE", 4, null);
		plustestCB("BF", 2, null);
		plustestCB("C0", 2, null);
		plustestCB("C1", 2, null);
		plustestCB("C2", 2, null);
		plustestCB("C3", 2, null);
		plustestCB("C4", 2, null);
		plustestCB("C5", 2, null);
		plustestCB("C6", 4, null);
		plustestCB("C7", 2, null);
		plustestCB("C8", 2, null);
		plustestCB("C9", 2, null);
		plustestCB("CA", 2, null);
		plustestCB("CB", 2, null);
		plustestCB("CC", 2, null);
		plustestCB("CD", 2, null);
		plustestCB("CE", 4, null);
		plustestCB("CF", 2, null);
		plustestCB("D0", 2, null);
		plustestCB("D1", 2, null);
		plustestCB("D2", 2, null);
		plustestCB("D3", 2, null);
		plustestCB("D4", 2, null);
		plustestCB("D5", 2, null);
		plustestCB("D6", 4, null);
		plustestCB("D7", 2, null);
		plustestCB("D8", 2, null);
		plustestCB("D9", 2, null);
		plustestCB("DA", 2, null);
		plustestCB("DB", 2, null);
		plustestCB("DC", 2, null);
		plustestCB("DD", 2, null);
		plustestCB("DE", 4, null);
		plustestCB("DF", 2, null);
		plustestCB("E0", 2, null);
		plustestCB("E1", 2, null);
		plustestCB("E2", 2, null);
		plustestCB("E3", 2, null);
		plustestCB("E4", 2, null);
		plustestCB("E5", 2, null);
		plustestCB("E6", 4, null);
		plustestCB("E7", 2, null);
		plustestCB("E8", 2, null);
		plustestCB("E9", 2, null);
		plustestCB("EA", 2, null);
		plustestCB("EB", 2, null);
		plustestCB("EC", 2, null);
		plustestCB("ED", 2, null);
		plustestCB("EE", 4, null);
		plustestCB("EF", 2, null);
		plustestCB("F0", 2, null);
		plustestCB("F1", 2, null);
		plustestCB("F2", 2, null);
		plustestCB("F3", 2, null);
		plustestCB("F4", 2, null);
		plustestCB("F5", 2, null);
		plustestCB("F6", 4, null);
		plustestCB("F7", 2, null);
		plustestCB("F8", 2, null);
		plustestCB("F9", 2, null);
		plustestCB("FA", 2, null);
		plustestCB("FB", 2, null);
		plustestCB("FC", 2, null);
		plustestCB("FD", 2, null);
		plustestCB("FE", 4, null);
		plustestCB("FF", 2, null);
		// DD Codes
		plustestDD("00", 2, null);
		plustestDD("01", 4, null);
		plustestDD("02", 3, null);
		plustestDD("03", 3, null);
		plustestDD("04", 2, null);
		plustestDD("05", 2, null);
		plustestDD("06", 3, null);
		plustestDD("07", 2, null);
		plustestDD("08", 2, null);
		plustestDD("09", 4, null);
		plustestDD("0A", 3, null);
		plustestDD("0B", 3, null);
		plustestDD("0C", 2, null);
		plustestDD("0D", 2, null);
		plustestDD("0E", 3, null);
		plustestDD("0F", 2, null);
		plustestDD("10", 5, 4);
		plustestDD("11", 4, null);
		plustestDD("12", 3, null);
		plustestDD("13", 3, null);
		plustestDD("14", 2, null);
		plustestDD("15", 2, null);
		plustestDD("16", 3, null);
		plustestDD("17", 2, null);
		plustestDD("18", 4, null);
		plustestDD("19", 4, null);
		plustestDD("1A", 3, null);
		plustestDD("1B", 3, null);
		plustestDD("1C", 2, null);
		plustestDD("1D", 2, null);
		plustestDD("1E", 3, null);
		plustestDD("1F", 2, null);
		plustestDD("20", 3, 4);
		plustestDD("21", 4, null);
		plustestDD("22", 6, null);
		plustestDD("23", 3, null);
		plustestDD("24", 2, null);
		plustestDD("25", 2, null);
		plustestDD("26", 3, null);
		plustestDD("27", 2, null);
		plustestDD("28", 4, 3);
		plustestDD("29", 4, null);
		plustestDD("2A", 6, null);
		plustestDD("2B", 3, null);
		plustestDD("2C", 2, null);
		plustestDD("2D", 2, null);
		plustestDD("2E", 3, null);
		plustestDD("2F", 2, null);
		plustestDD("30", 3, 4);
		plustestDD("31", 4, null);
		plustestDD("32", 5, null);
		plustestDD("33", 3, null);
		plustestDD("34", 6, null);
		plustestDD("35", 6, null);
		plustestDD("36", 6, null);
		plustestDD("37", 2, null);
		plustestDD("38", 4, 3);
		plustestDD("39", 4, null);
		plustestDD("3A", 5, null);
		plustestDD("3B", 3, null);
		plustestDD("3C", 2, null);
		plustestDD("3D", 2, null);
		plustestDD("3E", 3, null);
		plustestDD("3F", 2, null);
		plustestDD("40", 2, null);
		plustestDD("41", 2, null);
		plustestDD("42", 2, null);
		plustestDD("43", 2, null);
		plustestDD("44", 2, null);
		plustestDD("45", 2, null);
		plustestDD("46", 5, null);
		plustestDD("47", 2, null);
		plustestDD("48", 2, null);
		plustestDD("49", 2, null);
		plustestDD("4A", 2, null);
		plustestDD("4B", 2, null);
		plustestDD("4C", 2, null);
		plustestDD("4D", 2, null);
		plustestDD("4E", 5, null);
		plustestDD("4F", 2, null);
		plustestDD("50", 2, null);
		plustestDD("51", 2, null);
		plustestDD("52", 2, null);
		plustestDD("53", 2, null);
		plustestDD("54", 2, null);
		plustestDD("55", 2, null);
		plustestDD("56", 5, null);
		plustestDD("57", 2, null);
		plustestDD("58", 2, null);
		plustestDD("59", 2, null);
		plustestDD("5A", 2, null);
		plustestDD("5B", 2, null);
		plustestDD("5C", 2, null);
		plustestDD("5D", 2, null);
		plustestDD("5E", 5, null);
		plustestDD("5F", 2, null);
		plustestDD("60", 2, null);
		plustestDD("61", 2, null);
		plustestDD("62", 2, null);
		plustestDD("63", 2, null);
		plustestDD("64", 2, null);
		plustestDD("65", 2, null);
		plustestDD("66", 5, null);
		plustestDD("67", 2, null);
		plustestDD("68", 2, null);
		plustestDD("69", 2, null);
		plustestDD("6A", 2, null);
		plustestDD("6B", 2, null);
		plustestDD("6C", 2, null);
		plustestDD("6D", 2, null);
		plustestDD("6E", 5, null);
		plustestDD("6F", 2, null);
		plustestDD("70", 5, null);
		plustestDD("71", 5, null);
		plustestDD("72", 5, null);
		plustestDD("73", 5, null);
		plustestDD("74", 5, null);
		plustestDD("75", 5, null);
		plustestDD("76", 1, null);
		plustestDD("77", 5, null);
		plustestDD("78", 2, null);
		plustestDD("79", 2, null);
		plustestDD("7A", 2, null);
		plustestDD("7B", 2, null);
		plustestDD("7C", 2, null);
		plustestDD("7D", 2, null);
		plustestDD("7E", 5, null);
		plustestDD("7F", 2, null);
		plustestDD("80", 2, null);
		plustestDD("81", 2, null);
		plustestDD("82", 2, null);
		plustestDD("83", 2, null);
		plustestDD("84", 2, null);
		plustestDD("85", 2, null);
		plustestDD("86", 5, null);
		plustestDD("87", 2, null);
		plustestDD("88", 2, null);
		plustestDD("89", 2, null);
		plustestDD("8A", 2, null);
		plustestDD("8B", 2, null);
		plustestDD("8C", 2, null);
		plustestDD("8D", 2, null);
		plustestDD("8E", 5, null);
		plustestDD("8F", 2, null);
		plustestDD("90", 2, null);
		plustestDD("91", 2, null);
		plustestDD("92", 2, null);
		plustestDD("93", 2, null);
		plustestDD("94", 2, null);
		plustestDD("95", 2, null);
		plustestDD("96", 5, null);
		plustestDD("97", 2, null);
		plustestDD("98", 2, null);
		plustestDD("99", 2, null);
		plustestDD("9A", 2, null);
		plustestDD("9B", 2, null);
		plustestDD("9C", 2, null);
		plustestDD("9D", 2, null);
		plustestDD("9E", 5, null);
		plustestDD("9F", 2, null);
		plustestDD("A0", 2, null);
		plustestDD("A1", 2, null);
		plustestDD("A2", 2, null);
		plustestDD("A3", 2, null);
		plustestDD("A4", 2, null);
		plustestDD("A5", 2, null);
		plustestDD("A6", 5, null);
		plustestDD("A7", 2, null);
		plustestDD("A8", 2, null);
		plustestDD("A9", 2, null);
		plustestDD("AA", 2, null);
		plustestDD("AB", 2, null);
		plustestDD("AC", 2, null);
		plustestDD("AD", 2, null);
		plustestDD("AE", 5, null);
		plustestDD("AF", 2, null);
		plustestDD("B0", 2, null);
		plustestDD("B1", 2, null);
		plustestDD("B2", 2, null);
		plustestDD("B3", 2, null);
		plustestDD("B4", 2, null);
		plustestDD("B5", 2, null);
		plustestDD("B6", 5, null);
		plustestDD("B7", 2, null);
		plustestDD("B8", 2, null);
		plustestDD("B9", 2, null);
		plustestDD("BA", 2, null);
		plustestDD("BB", 2, null);
		plustestDD("BC", 2, null);
		plustestDD("BD", 2, null);
		plustestDD("BE", 5, null);
		plustestDD("BF", 2, null);
		plustestDD("C0", 3, 5);
		plustestDD("C1", 4, null);
		plustestDD("C2", 4, null);
		plustestDD("C3", 4, null);
		plustestDD("C4", 4, 6);
		plustestDD("C5", 5, null);
		plustestDD("C6", 3, null);
		plustestDD("C7", 5, null);
		plustestDD("C8", 5, 3);
		plustestDD("C9", 4, null);
		plustestDD("CA", 4, null);
		plustestDD("CB", null, null); // manquant
		plustestDD("CC", 6, 4);
		plustestDD("CD", 6, null);
		plustestDD("CE", 3, null);
		plustestDD("CF", 5, null);
		plustestDD("D0", 3, 5);
		plustestDD("D1", 4, null);
		plustestDD("D2", 4, null);
		plustestDD("D3", 4, null);
		plustestDD("D4", 4, 6);
		plustestDD("D5", 5, null);
		plustestDD("D6", 3, null);
		plustestDD("D7", 5, null);
		plustestDD("D8", 5, 3);
		plustestDD("D9", 2, null);
		plustestDD("DA", 4, null);
		plustestDD("DB", 4, null);
		plustestDD("DC", 6, 4);
		plustestDD("DD", null, null); // manquant
		plustestDD("DE", 3, null);
		plustestDD("DF", 5, null);
		plustestDD("E0", 3, 5);
		plustestDD("E1", 4, null);
		plustestDD("E2", 4, null);
		plustestDD("E3", 7, null);
		plustestDD("E4", 4, 6);
		plustestDD("E5", 5, null);
		plustestDD("E6", 3, null);
		plustestDD("E7", 5, null);
		plustestDD("E8", 5, 3);
		plustestDD("E9", 2, null);
		plustestDD("EA", 4, null);
		plustestDD("EB", 2, null);
		plustestDD("EC", 6, 4);
		plustestDD("ED", null, null); // manquant
		plustestDD("EE", 3, null);
		plustestDD("EF", 5, null);
		plustestDD("F0", 3, 5);
		plustestDD("F1", 4, null);
		plustestDD("F2", 4, null);
		plustestDD("F3", 2, null);
		plustestDD("F4", 4, 6);
		plustestDD("F5", 5, null);
		plustestDD("F6", 3, null);
		plustestDD("F7", 5, null);
		plustestDD("F8", 5, 3);
		plustestDD("F9", 3, null);
		plustestDD("FA", 4, null);
		plustestDD("FB", 2, null);
		plustestDD("FC", 6, 4);
		plustestDD("FD", null, null); // manquant
		plustestDD("FE", 3, null);
		plustestDD("FF", 5, null);
		// ED Codes
		plustestED("00", 2, null);
		plustestED("01", 2, null);
		plustestED("02", 2, null);
		plustestED("03", 2, null);
		plustestED("04", 2, null);
		plustestED("05", 2, null);
		plustestED("06", 2, null);
		plustestED("07", 2, null);
		plustestED("08", 2, null);
		plustestED("09", 2, null);
		plustestED("0A", 2, null);
		plustestED("0B", 2, null);
		plustestED("0C", 2, null);
		plustestED("0D", 2, null);
		plustestED("0E", 2, null);
		plustestED("0F", 2, null);
		plustestED("10", 2, null);
		plustestED("11", 2, null);
		plustestED("12", 2, null);
		plustestED("13", 2, null);
		plustestED("14", 2, null);
		plustestED("15", 2, null);
		plustestED("16", 2, null);
		plustestED("17", 2, null);
		plustestED("18", 2, null);
		plustestED("19", 2, null);
		plustestED("1A", 2, null);
		plustestED("1B", 2, null);
		plustestED("1C", 2, null);
		plustestED("1D", 2, null);
		plustestED("1E", 2, null);
		plustestED("1F", 2, null);
		plustestED("20", 2, null);
		plustestED("21", 2, null);
		plustestED("22", 2, null);
		plustestED("23", 2, null);
		plustestED("24", 2, null);
		plustestED("25", 2, null);
		plustestED("26", 2, null);
		plustestED("27", 2, null);
		plustestED("28", 2, null);
		plustestED("29", 2, null);
		plustestED("2A", 2, null);
		plustestED("2B", 2, null);
		plustestED("2C", 2, null);
		plustestED("2D", 2, null);
		plustestED("2E", 2, null);
		plustestED("2F", 2, null);
		plustestED("30", 2, null);
		plustestED("31", 2, null);
		plustestED("32", 2, null);
		plustestED("33", 2, null);
		plustestED("34", 2, null);
		plustestED("35", 2, null);
		plustestED("36", 2, null);
		plustestED("37", 2, null);
		plustestED("38", 2, null);
		plustestED("39", 2, null);
		plustestED("3A", 2, null);
		plustestED("3B", 2, null);
		plustestED("3C", 2, null);
		plustestED("3D", 2, null);
		plustestED("3E", 2, null);
		plustestED("3F", 2, null);
		plustestED("40", 4, null);
		plustestED("41", 4, null);
		plustestED("42", 4, null);
		plustestED("43", 6, null);
		plustestED("44", 2, null);
		plustestED("45", 4, null);
		plustestED("46", 2, null);
		plustestED("47", 3, null);
		plustestED("48", 4, null);
		plustestED("49", 4, null);
		plustestED("4A", 4, null);
		plustestED("4B", 6, null);
		plustestED("4C", 2, null);
		plustestED("4D", 4, null);
		plustestED("4E", 2, null);
		plustestED("4F", 3, null);
		plustestED("50", 4, null);
		plustestED("51", 4, null);
		plustestED("52", 4, null);
		plustestED("53", 6, null);
		plustestED("54", 2, null);
		plustestED("55", 4, null);
		plustestED("56", 2, null);
		plustestED("57", 3, null);
		plustestED("58", 4, null);
		plustestED("59", 4, null);
		plustestED("5A", 4, null);
		plustestED("5B", 6, null);
		plustestED("5C", 2, null);
		plustestED("5D", 4, null);
		plustestED("5E", 2, null);
		plustestED("5F", 3, null);
		plustestED("60", 4, null);
		plustestED("61", 4, null);
		plustestED("62", 4, null);
		plustestED("63", 6, null);
		plustestED("64", 2, null);
		plustestED("65", 4, null);
		plustestED("66", 2, null);
		plustestED("67", 5, null);
		plustestED("68", 4, null);
		plustestED("69", 4, null);
		plustestED("6A", 4, null);
		plustestED("6B", 6, null);
		plustestED("6C", 2, null);
		plustestED("6D", 4, null);
		plustestED("6E", 2, null);
		plustestED("6F", 5, null);
		plustestED("70", 4, null);
		plustestED("71", 4, null);
		plustestED("72", 4, null);
		plustestED("73", 6, null);
		plustestED("74", 2, null);
		plustestED("75", 4, null);
		plustestED("76", 2, null);
		plustestED("77", 2, null);
		plustestED("78", 4, null);
		plustestED("79", 4, null);
		plustestED("7A", 4, null);
		plustestED("7B", 6, null);
		plustestED("7C", 2, null);
		plustestED("7D", 4, null);
		plustestED("7E", 2, null);
		plustestED("7F", 2, null);
		plustestED("80", 2, null);
		plustestED("81", 2, null);
		plustestED("82", 2, null);
		plustestED("83", 2, null);
		plustestED("84", 2, null);
		plustestED("85", 2, null);
		plustestED("86", 2, null);
		plustestED("87", 2, null);
		plustestED("88", 2, null);
		plustestED("89", 2, null);
		plustestED("8A", 2, null);
		plustestED("8B", 2, null);
		plustestED("8C", 2, null);
		plustestED("8D", 2, null);
		plustestED("8E", 2, null);
		plustestED("8F", 2, null);
		plustestED("90", 2, null);
		plustestED("91", 2, null);
		plustestED("92", 2, null);
		plustestED("93", 2, null);
		plustestED("94", 2, null);
		plustestED("95", 2, null);
		plustestED("96", 2, null);
		plustestED("97", 2, null);
		plustestED("98", 2, null);
		plustestED("99", 2, null);
		plustestED("9A", 2, null);
		plustestED("9B", 2, null);
		plustestED("9C", 2, null);
		plustestED("9D", 2, null);
		plustestED("9E", 2, null);
		plustestED("9F", 2, null);
		plustestED("A0", 5, null);
		plustestED("A1", 4, null);
		plustestED("A2", 5, null);
		plustestED("A3", 5, null);
		plustestED("A4", 2, null);
		plustestED("A5", 2, null);
		plustestED("A6", 2, null);
		plustestED("A7", 2, null);
		plustestED("A8", 5, null);
		plustestED("A9", 4, null);
		plustestED("AA", 5, null);
		plustestED("AB", 5, null);
		plustestED("AC", 2, null);
		plustestED("AD", 2, null);
		plustestED("AE", 2, null);
		plustestED("AF", 2, null);
		plustestED("B0", 6, 5);
		plustestED("B1", 6, 4);
		plustestED("B2", 6, 5);
		plustestED("B3", 6, 5);
		plustestED("B4", 2, null);
		plustestED("B5", 2, null);
		plustestED("B6", 2, null);
		plustestED("B7", 2, null);
		plustestED("B8", 6, 5);
		plustestED("B9", 6, 4);
		plustestED("BA", 6, 5);
		plustestED("BB", 6, 5);
		plustestED("BC", 2, null);
		plustestED("BD", 2, null);
		plustestED("BE", 2, null);
		plustestED("BF", 2, null);
		plustestED("C0", 2, null);
		plustestED("C1", 2, null);
		plustestED("C2", 2, null);
		plustestED("C3", 2, null);
		plustestED("C4", 2, null);
		plustestED("C5", 2, null);
		plustestED("C6", 2, null);
		plustestED("C7", 2, null);
		plustestED("C8", 2, null);
		plustestED("C9", 2, null);
		plustestED("CA", 2, null);
		plustestED("CB", 2, null);
		plustestED("CC", 2, null);
		plustestED("CD", 2, null);
		plustestED("CE", 2, null);
		plustestED("CF", 2, null);
		plustestED("D0", 2, null);
		plustestED("D1", 2, null);
		plustestED("D2", 2, null);
		plustestED("D3", 2, null);
		plustestED("D4", 2, null);
		plustestED("D5", 2, null);
		plustestED("D6", 2, null);
		plustestED("D7", 2, null);
		plustestED("D8", 2, null);
		plustestED("D9", 2, null);
		plustestED("DA", 2, null);
		plustestED("DB", 2, null);
		plustestED("DC", 2, null);
		plustestED("DD", 2, null);
		plustestED("DE", 2, null);
		plustestED("DF", 2, null);
		plustestED("E0", 2, null);
		plustestED("E1", 2, null);
		plustestED("E2", 2, null);
		plustestED("E3", 2, null);
		plustestED("E4", 2, null);
		plustestED("E5", 2, null);
		plustestED("E6", 2, null);
		plustestED("E7", 2, null);
		plustestED("E8", 2, null);
		plustestED("E9", 2, null);
		plustestED("EA", 2, null);
		plustestED("EB", 2, null);
		plustestED("EC", 2, null);
		plustestED("ED", 2, null);
		plustestED("EE", 2, null);
		plustestED("EF", 2, null);
		plustestED("F0", 2, null);
		plustestED("F1", 2, null);
		plustestED("F2", 2, null);
		plustestED("F3", 2, null);
		plustestED("F4", 2, null);
		plustestED("F5", 2, null);
		plustestED("F6", 2, null);
		plustestED("F7", 2, null);
		plustestED("F8", 2, null);
		plustestED("F9", 2, null);
		plustestED("FA", 2, null);
		plustestED("FB", 2, null);
		plustestED("FC", 2, null);
		plustestED("FD", 2, null);
		plustestED("FE", 2, null);
		plustestED("FF", 2, null);
		// FD Codes
		plustestFD("00", 2, null);
		plustestFD("01", 4, null);
		plustestFD("02", 3, null);
		plustestFD("03", 3, null);
		plustestFD("04", 2, null);
		plustestFD("05", 2, null);
		plustestFD("06", 3, null);
		plustestFD("07", 2, null);
		plustestFD("08", 2, null);
		plustestFD("09", 4, null);
		plustestFD("0A", 3, null);
		plustestFD("0B", 3, null);
		plustestFD("0C", 2, null);
		plustestFD("0D", 2, null);
		plustestFD("0E", 3, null);
		plustestFD("0F", 2, null);
		plustestFD("10", 5, 4);
		plustestFD("11", 4, null);
		plustestFD("12", 3, null);
		plustestFD("13", 3, null);
		plustestFD("14", 2, null);
		plustestFD("15", 2, null);
		plustestFD("16", 3, null);
		plustestFD("17", 2, null);
		plustestFD("18", 4, null);
		plustestFD("19", 4, null);
		plustestFD("1A", 3, null);
		plustestFD("1B", 3, null);
		plustestFD("1C", 2, null);
		plustestFD("1D", 2, null);
		plustestFD("1E", 3, null);
		plustestFD("1F", 2, null);
		plustestFD("20", 3, 4);
		plustestFD("21", 4, null);
		plustestFD("22", 6, null);
		plustestFD("23", 3, null);
		plustestFD("24", 2, null);
		plustestFD("25", 2, null);
		plustestFD("26", 3, null);
		plustestFD("27", 2, null);
		plustestFD("28", 4, 3);
		plustestFD("29", 4, null);
		plustestFD("2A", 6, null);
		plustestFD("2B", 3, null);
		plustestFD("2C", 2, null);
		plustestFD("2D", 2, null);
		plustestFD("2E", 3, null);
		plustestFD("2F", 2, null);
		plustestFD("30", 3, 4);
		plustestFD("31", 4, null);
		plustestFD("32", 5, null);
		plustestFD("33", 3, null);
		plustestFD("34", 6, null);
		plustestFD("35", 6, null);
		plustestFD("36", 6, null);
		plustestFD("37", 2, null);
		plustestFD("38", 4, 3);
		plustestFD("39", 4, null);
		plustestFD("3A", 5, null);
		plustestFD("3B", 3, null);
		plustestFD("3C", 2, null);
		plustestFD("3D", 2, null);
		plustestFD("3E", 3, null);
		plustestFD("3F", 2, null);
		plustestFD("40", 2, null);
		plustestFD("41", 2, null);
		plustestFD("42", 2, null);
		plustestFD("43", 2, null);
		plustestFD("44", 2, null);
		plustestFD("45", 2, null);
		plustestFD("46", 5, null);
		plustestFD("47", 2, null);
		plustestFD("48", 2, null);
		plustestFD("49", 2, null);
		plustestFD("4A", 2, null);
		plustestFD("4B", 2, null);
		plustestFD("4C", 2, null);
		plustestFD("4D", 2, null);
		plustestFD("4E", 5, null);
		plustestFD("4F", 2, null);
		plustestFD("50", 2, null);
		plustestFD("51", 2, null);
		plustestFD("52", 2, null);
		plustestFD("53", 2, null);
		plustestFD("54", 2, null);
		plustestFD("55", 2, null);
		plustestFD("56", 5, null);
		plustestFD("57", 2, null);
		plustestFD("58", 2, null);
		plustestFD("59", 2, null);
		plustestFD("5A", 2, null);
		plustestFD("5B", 2, null);
		plustestFD("5C", 2, null);
		plustestFD("5D", 2, null);
		plustestFD("5E", 5, null);
		plustestFD("5F", 2, null);
		plustestFD("60", 2, null);
		plustestFD("61", 2, null);
		plustestFD("62", 2, null);
		plustestFD("63", 2, null);
		plustestFD("64", 2, null);
		plustestFD("65", 2, null);
		plustestFD("66", 5, null);
		plustestFD("67", 2, null);
		plustestFD("68", 2, null);
		plustestFD("69", 2, null);
		plustestFD("6A", 2, null);
		plustestFD("6B", 2, null);
		plustestFD("6C", 2, null);
		plustestFD("6D", 2, null);
		plustestFD("6E", 5, null);
		plustestFD("6F", 2, null);
		plustestFD("70", 5, null);
		plustestFD("71", 5, null);
		plustestFD("72", 5, null);
		plustestFD("73", 5, null);
		plustestFD("74", 5, null);
		plustestFD("75", 5, null);
		plustestFD("76", 1, null);
		plustestFD("77", 5, null);
		plustestFD("78", 2, null);
		plustestFD("79", 2, null);
		plustestFD("7A", 2, null);
		plustestFD("7B", 2, null);
		plustestFD("7C", 2, null);
		plustestFD("7D", 2, null);
		plustestFD("7E", 5, null);
		plustestFD("7F", 2, null);
		plustestFD("80", 2, null);
		plustestFD("81", 2, null);
		plustestFD("82", 2, null);
		plustestFD("83", 2, null);
		plustestFD("84", 2, null);
		plustestFD("85", 2, null);
		plustestFD("86", 5, null);
		plustestFD("87", 2, null);
		plustestFD("88", 2, null);
		plustestFD("89", 2, null);
		plustestFD("8A", 2, null);
		plustestFD("8B", 2, null);
		plustestFD("8C", 2, null);
		plustestFD("8D", 2, null);
		plustestFD("8E", 5, null);
		plustestFD("8F", 2, null);
		plustestFD("90", 2, null);
		plustestFD("91", 2, null);
		plustestFD("92", 2, null);
		plustestFD("93", 2, null);
		plustestFD("94", 2, null);
		plustestFD("95", 2, null);
		plustestFD("96", 5, null);
		plustestFD("97", 2, null);
		plustestFD("98", 2, null);
		plustestFD("99", 2, null);
		plustestFD("9A", 2, null);
		plustestFD("9B", 2, null);
		plustestFD("9C", 2, null);
		plustestFD("9D", 2, null);
		plustestFD("9E", 5, null);
		plustestFD("9F", 2, null);
		plustestFD("A0", 2, null);
		plustestFD("A1", 2, null);
		plustestFD("A2", 2, null);
		plustestFD("A3", 2, null);
		plustestFD("A4", 2, null);
		plustestFD("A5", 2, null);
		plustestFD("A6", 5, null);
		plustestFD("A7", 2, null);
		plustestFD("A8", 2, null);
		plustestFD("A9", 2, null);
		plustestFD("AA", 2, null);
		plustestFD("AB", 2, null);
		plustestFD("AC", 2, null);
		plustestFD("AD", 2, null);
		plustestFD("AE", 5, null);
		plustestFD("AF", 2, null);
		plustestFD("B0", 2, null);
		plustestFD("B1", 2, null);
		plustestFD("B2", 2, null);
		plustestFD("B3", 2, null);
		plustestFD("B4", 2, null);
		plustestFD("B5", 2, null);
		plustestFD("B6", 5, null);
		plustestFD("B7", 2, null);
		plustestFD("B8", 2, null);
		plustestFD("B9", 2, null);
		plustestFD("BA", 2, null);
		plustestFD("BB", 2, null);
		plustestFD("BC", 2, null);
		plustestFD("BD", 2, null);
		plustestFD("BE", 5, null);
		plustestFD("BF", 2, null);
		plustestFD("C0", 3, 5);
		plustestFD("C1", 4, null);
		plustestFD("C2", 4, null);
		plustestFD("C3", 4, null);
		plustestFD("C4", 4, 6);
		plustestFD("C5", 5, null);
		plustestFD("C6", 3, null);
		plustestFD("C7", 5, null);
		plustestFD("C8", 5, 3);
		plustestFD("C9", 4, null);
		plustestFD("CA", 4, null);
		plustestFD("CB", null, null); // manquant
		plustestFD("CC", 6, 4);
		plustestFD("CD", 6, null);
		plustestFD("CE", 3, null);
		plustestFD("CF", 5, null);
		plustestFD("D0", 3, 5);
		plustestFD("D1", 4, null);
		plustestFD("D2", 4, null);
		plustestFD("D3", 4, null);
		plustestFD("D4", 4, 6);
		plustestFD("D5", 5, null);
		plustestFD("D6", 3, null);
		plustestFD("D7", 5, null);
		plustestFD("D8", 5, 3);
		plustestFD("D9", 2, null);
		plustestFD("DA", 4, null);
		plustestFD("DB", 4, null);
		plustestFD("DC", 6, 4);
		plustestFD("DD", null, null); // manquant
		plustestFD("DE", 3, null);
		plustestFD("DF", 5, null);
		plustestFD("E0", 3, 5);
		plustestFD("E1", 4, null);
		plustestFD("E2", 4, null);
		plustestFD("E3", 7, null);
		plustestFD("E4", 4, 6);
		plustestFD("E5", 5, null);
		plustestFD("E6", 3, null);
		plustestFD("E7", 5, null);
		plustestFD("E8", 5, 3);
		plustestFD("E9", 2, null);
		plustestFD("EA", 4, null);
		plustestFD("EB", 2, null);
		plustestFD("EC", 6, 4);
		plustestFD("ED", null, null); // manquant
		plustestFD("EE", 3, null);
		plustestFD("EF", 5, null);
		plustestFD("F0", 3, 5);
		plustestFD("F1", 4, null);
		plustestFD("F2", 4, null);
		plustestFD("F3", 2, null);
		plustestFD("F4", 4, 6);
		plustestFD("F5", 5, null);
		plustestFD("F6", 3, null);
		plustestFD("F7", 5, null);
		plustestFD("F8", 5, 3);
		plustestFD("F9", 3, null);
		plustestFD("FA", 4, null);
		plustestFD("FB", 2, null);
		plustestFD("FC", 6, 4);
		plustestFD("FD", null, null); // manquant
		plustestFD("FE", 3, null);
		plustestFD("FF", 5, null);
		// DDCB Codes
		plustestDDCB("00", 7, null);
		plustestDDCB("01", 7, null);
		plustestDDCB("02", 7, null);
		plustestDDCB("03", 7, null);
		plustestDDCB("04", 7, null);
		plustestDDCB("05", 7, null);
		plustestDDCB("06", 7, null);
		plustestDDCB("07", 7, null);
		plustestDDCB("08", 7, null);
		plustestDDCB("09", 7, null);
		plustestDDCB("0A", 7, null);
		plustestDDCB("0B", 7, null);
		plustestDDCB("0C", 7, null);
		plustestDDCB("0D", 7, null);
		plustestDDCB("0E", 7, null);
		plustestDDCB("0F", 7, null);
		plustestDDCB("10", 7, null);
		plustestDDCB("11", 7, null);
		plustestDDCB("12", 7, null);
		plustestDDCB("13", 7, null);
		plustestDDCB("14", 7, null);
		plustestDDCB("15", 7, null);
		plustestDDCB("16", 7, null);
		plustestDDCB("17", 7, null);
		plustestDDCB("18", 7, null);
		plustestDDCB("19", 7, null);
		plustestDDCB("1A", 7, null);
		plustestDDCB("1B", 7, null);
		plustestDDCB("1C", 7, null);
		plustestDDCB("1D", 7, null);
		plustestDDCB("1E", 7, null);
		plustestDDCB("1F", 7, null);
		plustestDDCB("20", 7, null);
		plustestDDCB("21", 7, null);
		plustestDDCB("22", 7, null);
		plustestDDCB("23", 7, null);
		plustestDDCB("24", 7, null);
		plustestDDCB("25", 7, null);
		plustestDDCB("26", 7, null);
		plustestDDCB("27", 7, null);
		plustestDDCB("28", 7, null);
		plustestDDCB("29", 7, null);
		plustestDDCB("2A", 7, null);
		plustestDDCB("2B", 7, null);
		plustestDDCB("2C", 7, null);
		plustestDDCB("2D", 7, null);
		plustestDDCB("2E", 7, null);
		plustestDDCB("2F", 7, null);
		plustestDDCB("30", 7, null);
		plustestDDCB("31", 7, null);
		plustestDDCB("32", 7, null);
		plustestDDCB("33", 7, null);
		plustestDDCB("34", 7, null);
		plustestDDCB("35", 7, null);
		plustestDDCB("36", 7, null);
		plustestDDCB("37", 7, null);
		plustestDDCB("38", 7, null);
		plustestDDCB("39", 7, null);
		plustestDDCB("3A", 7, null);
		plustestDDCB("3B", 7, null);
		plustestDDCB("3C", 7, null);
		plustestDDCB("3D", 7, null);
		plustestDDCB("3E", 7, null);
		plustestDDCB("3F", 7, null);
		plustestDDCB("40", 6, null);
		plustestDDCB("41", 6, null);
		plustestDDCB("42", 6, null);
		plustestDDCB("43", 6, null);
		plustestDDCB("44", 6, null);
		plustestDDCB("45", 6, null);
		plustestDDCB("46", 6, null);
		plustestDDCB("47", 6, null);
		plustestDDCB("48", 6, null);
		plustestDDCB("49", 6, null);
		plustestDDCB("4A", 6, null);
		plustestDDCB("4B", 6, null);
		plustestDDCB("4C", 6, null);
		plustestDDCB("4D", 6, null);
		plustestDDCB("4E", 6, null);
		plustestDDCB("4F", 6, null);
		plustestDDCB("50", 6, null);
		plustestDDCB("51", 6, null);
		plustestDDCB("52", 6, null);
		plustestDDCB("53", 6, null);
		plustestDDCB("54", 6, null);
		plustestDDCB("55", 6, null);
		plustestDDCB("56", 6, null);
		plustestDDCB("57", 6, null);
		plustestDDCB("58", 6, null);
		plustestDDCB("59", 6, null);
		plustestDDCB("5A", 6, null);
		plustestDDCB("5B", 6, null);
		plustestDDCB("5C", 6, null);
		plustestDDCB("5D", 6, null);
		plustestDDCB("5E", 6, null);
		plustestDDCB("5F", 6, null);
		plustestDDCB("60", 6, null);
		plustestDDCB("61", 6, null);
		plustestDDCB("62", 6, null);
		plustestDDCB("63", 6, null);
		plustestDDCB("64", 6, null);
		plustestDDCB("65", 6, null);
		plustestDDCB("66", 6, null);
		plustestDDCB("67", 6, null);
		plustestDDCB("68", 6, null);
		plustestDDCB("69", 6, null);
		plustestDDCB("6A", 6, null);
		plustestDDCB("6B", 6, null);
		plustestDDCB("6C", 6, null);
		plustestDDCB("6D", 6, null);
		plustestDDCB("6E", 6, null);
		plustestDDCB("6F", 6, null);
		plustestDDCB("70", 6, null);
		plustestDDCB("71", 6, null);
		plustestDDCB("72", 6, null);
		plustestDDCB("73", 6, null);
		plustestDDCB("74", 6, null);
		plustestDDCB("75", 6, null);
		plustestDDCB("76", 6, null);
		plustestDDCB("77", 6, null);
		plustestDDCB("78", 6, null);
		plustestDDCB("79", 6, null);
		plustestDDCB("7A", 6, null);
		plustestDDCB("7B", 6, null);
		plustestDDCB("7C", 6, null);
		plustestDDCB("7D", 6, null);
		plustestDDCB("7E", 6, null);
		plustestDDCB("7F", 6, null);
		plustestDDCB("80", 7, null);
		plustestDDCB("81", 7, null);
		plustestDDCB("82", 7, null);
		plustestDDCB("83", 7, null);
		plustestDDCB("84", 7, null);
		plustestDDCB("85", 7, null);
		plustestDDCB("86", 7, null);
		plustestDDCB("87", 7, null);
		plustestDDCB("88", 7, null);
		plustestDDCB("89", 7, null);
		plustestDDCB("8A", 7, null);
		plustestDDCB("8B", 7, null);
		plustestDDCB("8C", 7, null);
		plustestDDCB("8D", 7, null);
		plustestDDCB("8E", 7, null);
		plustestDDCB("8F", 7, null);
		plustestDDCB("90", 7, null);
		plustestDDCB("91", 7, null);
		plustestDDCB("92", 7, null);
		plustestDDCB("93", 7, null);
		plustestDDCB("94", 7, null);
		plustestDDCB("95", 7, null);
		plustestDDCB("96", 7, null);
		plustestDDCB("97", 7, null);
		plustestDDCB("98", 7, null);
		plustestDDCB("99", 7, null);
		plustestDDCB("9A", 7, null);
		plustestDDCB("9B", 7, null);
		plustestDDCB("9C", 7, null);
		plustestDDCB("9D", 7, null);
		plustestDDCB("9E", 7, null);
		plustestDDCB("9F", 7, null);
		plustestDDCB("A0", 7, null);
		plustestDDCB("A1", 7, null);
		plustestDDCB("A2", 7, null);
		plustestDDCB("A3", 7, null);
		plustestDDCB("A4", 7, null);
		plustestDDCB("A5", 7, null);
		plustestDDCB("A6", 7, null);
		plustestDDCB("A7", 7, null);
		plustestDDCB("A8", 7, null);
		plustestDDCB("A9", 7, null);
		plustestDDCB("AA", 7, null);
		plustestDDCB("AB", 7, null);
		plustestDDCB("AC", 7, null);
		plustestDDCB("AD", 7, null);
		plustestDDCB("AE", 7, null);
		plustestDDCB("AF", 7, null);
		plustestDDCB("B0", 7, null);
		plustestDDCB("B1", 7, null);
		plustestDDCB("B2", 7, null);
		plustestDDCB("B3", 7, null);
		plustestDDCB("B4", 7, null);
		plustestDDCB("B5", 7, null);
		plustestDDCB("B6", 7, null);
		plustestDDCB("B7", 7, null);
		plustestDDCB("B8", 7, null);
		plustestDDCB("B9", 7, null);
		plustestDDCB("BA", 7, null);
		plustestDDCB("BB", 7, null);
		plustestDDCB("BC", 7, null);
		plustestDDCB("BD", 7, null);
		plustestDDCB("BE", 7, null);
		plustestDDCB("BF", 7, null);
		plustestDDCB("C0", 7, null);
		plustestDDCB("C1", 7, null);
		plustestDDCB("C2", 7, null);
		plustestDDCB("C3", 7, null);
		plustestDDCB("C4", 7, null);
		plustestDDCB("C5", 7, null);
		plustestDDCB("C6", 7, null);
		plustestDDCB("C7", 7, null);
		plustestDDCB("C8", 7, null);
		plustestDDCB("C9", 7, null);
		plustestDDCB("CA", 7, null);
		plustestDDCB("CB", 7, null);
		plustestDDCB("CC", 7, null);
		plustestDDCB("CD", 7, null);
		plustestDDCB("CE", 7, null);
		plustestDDCB("CF", 7, null);
		plustestDDCB("D0", 7, null);
		plustestDDCB("D1", 7, null);
		plustestDDCB("D2", 7, null);
		plustestDDCB("D3", 7, null);
		plustestDDCB("D4", 7, null);
		plustestDDCB("D5", 7, null);
		plustestDDCB("D6", 7, null);
		plustestDDCB("D7", 7, null);
		plustestDDCB("D8", 7, null);
		plustestDDCB("D9", 7, null);
		plustestDDCB("DA", 7, null);
		plustestDDCB("DB", 7, null);
		plustestDDCB("DC", 7, null);
		plustestDDCB("DD", 7, null);
		plustestDDCB("DE", 7, null);
		plustestDDCB("DF", 7, null);
		plustestDDCB("E0", 7, null);
		plustestDDCB("E1", 7, null);
		plustestDDCB("E2", 7, null);
		plustestDDCB("E3", 7, null);
		plustestDDCB("E4", 7, null);
		plustestDDCB("E5", 7, null);
		plustestDDCB("E6", 7, null);
		plustestDDCB("E7", 7, null);
		plustestDDCB("E8", 7, null);
		plustestDDCB("E9", 7, null);
		plustestDDCB("EA", 7, null);
		plustestDDCB("EB", 7, null);
		plustestDDCB("EC", 7, null);
		plustestDDCB("ED", 7, null);
		plustestDDCB("EE", 7, null);
		plustestDDCB("EF", 7, null);
		plustestDDCB("F0", 7, null);
		plustestDDCB("F1", 7, null);
		plustestDDCB("F2", 7, null);
		plustestDDCB("F3", 7, null);
		plustestDDCB("F4", 7, null);
		plustestDDCB("F5", 7, null);
		plustestDDCB("F6", 7, null);
		plustestDDCB("F7", 7, null);
		plustestDDCB("F8", 7, null);
		plustestDDCB("F9", 7, null);
		plustestDDCB("FA", 7, null);
		plustestDDCB("FB", 7, null);
		plustestDDCB("FC", 7, null);
		plustestDDCB("FD", 7, null);
		plustestDDCB("FE", 7, null);
		plustestDDCB("FF", 7, null);
		// FDCB Codes
		plustestFDCB("00", 7, null);
		plustestFDCB("01", 7, null);
		plustestFDCB("02", 7, null);
		plustestFDCB("03", 7, null);
		plustestFDCB("04", 7, null);
		plustestFDCB("05", 7, null);
		plustestFDCB("06", 7, null);
		plustestFDCB("07", 7, null);
		plustestFDCB("08", 7, null);
		plustestFDCB("09", 7, null);
		plustestFDCB("0A", 7, null);
		plustestFDCB("0B", 7, null);
		plustestFDCB("0C", 7, null);
		plustestFDCB("0D", 7, null);
		plustestFDCB("0E", 7, null);
		plustestFDCB("0F", 7, null);
		plustestFDCB("10", 7, null);
		plustestFDCB("11", 7, null);
		plustestFDCB("12", 7, null);
		plustestFDCB("13", 7, null);
		plustestFDCB("14", 7, null);
		plustestFDCB("15", 7, null);
		plustestFDCB("16", 7, null);
		plustestFDCB("17", 7, null);
		plustestFDCB("18", 7, null);
		plustestFDCB("19", 7, null);
		plustestFDCB("1A", 7, null);
		plustestFDCB("1B", 7, null);
		plustestFDCB("1C", 7, null);
		plustestFDCB("1D", 7, null);
		plustestFDCB("1E", 7, null);
		plustestFDCB("1F", 7, null);
		plustestFDCB("20", 7, null);
		plustestFDCB("21", 7, null);
		plustestFDCB("22", 7, null);
		plustestFDCB("23", 7, null);
		plustestFDCB("24", 7, null);
		plustestFDCB("25", 7, null);
		plustestFDCB("26", 7, null);
		plustestFDCB("27", 7, null);
		plustestFDCB("28", 7, null);
		plustestFDCB("29", 7, null);
		plustestFDCB("2A", 7, null);
		plustestFDCB("2B", 7, null);
		plustestFDCB("2C", 7, null);
		plustestFDCB("2D", 7, null);
		plustestFDCB("2E", 7, null);
		plustestFDCB("2F", 7, null);
		plustestFDCB("30", 7, null);
		plustestFDCB("31", 7, null);
		plustestFDCB("32", 7, null);
		plustestFDCB("33", 7, null);
		plustestFDCB("34", 7, null);
		plustestFDCB("35", 7, null);
		plustestFDCB("36", 7, null);
		plustestFDCB("37", 7, null);
		plustestFDCB("38", 7, null);
		plustestFDCB("39", 7, null);
		plustestFDCB("3A", 7, null);
		plustestFDCB("3B", 7, null);
		plustestFDCB("3C", 7, null);
		plustestFDCB("3D", 7, null);
		plustestFDCB("3E", 7, null);
		plustestFDCB("3F", 7, null);
		plustestFDCB("40", 6, null);
		plustestFDCB("41", 6, null);
		plustestFDCB("42", 6, null);
		plustestFDCB("43", 6, null);
		plustestFDCB("44", 6, null);
		plustestFDCB("45", 6, null);
		plustestFDCB("46", 6, null);
		plustestFDCB("47", 6, null);
		plustestFDCB("48", 6, null);
		plustestFDCB("49", 6, null);
		plustestFDCB("4A", 6, null);
		plustestFDCB("4B", 6, null);
		plustestFDCB("4C", 6, null);
		plustestFDCB("4D", 6, null);
		plustestFDCB("4E", 6, null);
		plustestFDCB("4F", 6, null);
		plustestFDCB("50", 6, null);
		plustestFDCB("51", 6, null);
		plustestFDCB("52", 6, null);
		plustestFDCB("53", 6, null);
		plustestFDCB("54", 6, null);
		plustestFDCB("55", 6, null);
		plustestFDCB("56", 6, null);
		plustestFDCB("57", 6, null);
		plustestFDCB("58", 6, null);
		plustestFDCB("59", 6, null);
		plustestFDCB("5A", 6, null);
		plustestFDCB("5B", 6, null);
		plustestFDCB("5C", 6, null);
		plustestFDCB("5D", 6, null);
		plustestFDCB("5E", 6, null);
		plustestFDCB("5F", 6, null);
		plustestFDCB("60", 6, null);
		plustestFDCB("61", 6, null);
		plustestFDCB("62", 6, null);
		plustestFDCB("63", 6, null);
		plustestFDCB("64", 6, null);
		plustestFDCB("65", 6, null);
		plustestFDCB("66", 6, null);
		plustestFDCB("67", 6, null);
		plustestFDCB("68", 6, null);
		plustestFDCB("69", 6, null);
		plustestFDCB("6A", 6, null);
		plustestFDCB("6B", 6, null);
		plustestFDCB("6C", 6, null);
		plustestFDCB("6D", 6, null);
		plustestFDCB("6E", 6, null);
		plustestFDCB("6F", 6, null);
		plustestFDCB("70", 6, null);
		plustestFDCB("71", 6, null);
		plustestFDCB("72", 6, null);
		plustestFDCB("73", 6, null);
		plustestFDCB("74", 6, null);
		plustestFDCB("75", 6, null);
		plustestFDCB("76", 6, null);
		plustestFDCB("77", 6, null);
		plustestFDCB("78", 6, null);
		plustestFDCB("79", 6, null);
		plustestFDCB("7A", 6, null);
		plustestFDCB("7B", 6, null);
		plustestFDCB("7C", 6, null);
		plustestFDCB("7D", 6, null);
		plustestFDCB("7E", 6, null);
		plustestFDCB("7F", 6, null);
		plustestFDCB("80", 7, null);
		plustestFDCB("81", 7, null);
		plustestFDCB("82", 7, null);
		plustestFDCB("83", 7, null);
		plustestFDCB("84", 7, null);
		plustestFDCB("85", 7, null);
		plustestFDCB("86", 7, null);
		plustestFDCB("87", 7, null);
		plustestFDCB("88", 7, null);
		plustestFDCB("89", 7, null);
		plustestFDCB("8A", 7, null);
		plustestFDCB("8B", 7, null);
		plustestFDCB("8C", 7, null);
		plustestFDCB("8D", 7, null);
		plustestFDCB("8E", 7, null);
		plustestFDCB("8F", 7, null);
		plustestFDCB("90", 7, null);
		plustestFDCB("91", 7, null);
		plustestFDCB("92", 7, null);
		plustestFDCB("93", 7, null);
		plustestFDCB("94", 7, null);
		plustestFDCB("95", 7, null);
		plustestFDCB("96", 7, null);
		plustestFDCB("97", 7, null);
		plustestFDCB("98", 7, null);
		plustestFDCB("99", 7, null);
		plustestFDCB("9A", 7, null);
		plustestFDCB("9B", 7, null);
		plustestFDCB("9C", 7, null);
		plustestFDCB("9D", 7, null);
		plustestFDCB("9E", 7, null);
		plustestFDCB("9F", 7, null);
		plustestFDCB("A0", 7, null);
		plustestFDCB("A1", 7, null);
		plustestFDCB("A2", 7, null);
		plustestFDCB("A3", 7, null);
		plustestFDCB("A4", 7, null);
		plustestFDCB("A5", 7, null);
		plustestFDCB("A6", 7, null);
		plustestFDCB("A7", 7, null);
		plustestFDCB("A8", 7, null);
		plustestFDCB("A9", 7, null);
		plustestFDCB("AA", 7, null);
		plustestFDCB("AB", 7, null);
		plustestFDCB("AC", 7, null);
		plustestFDCB("AD", 7, null);
		plustestFDCB("AE", 7, null);
		plustestFDCB("AF", 7, null);
		plustestFDCB("B0", 7, null);
		plustestFDCB("B1", 7, null);
		plustestFDCB("B2", 7, null);
		plustestFDCB("B3", 7, null);
		plustestFDCB("B4", 7, null);
		plustestFDCB("B5", 7, null);
		plustestFDCB("B6", 7, null);
		plustestFDCB("B7", 7, null);
		plustestFDCB("B8", 7, null);
		plustestFDCB("B9", 7, null);
		plustestFDCB("BA", 7, null);
		plustestFDCB("BB", 7, null);
		plustestFDCB("BC", 7, null);
		plustestFDCB("BD", 7, null);
		plustestFDCB("BE", 7, null);
		plustestFDCB("BF", 7, null);
		plustestFDCB("C0", 7, null);
		plustestFDCB("C1", 7, null);
		plustestFDCB("C2", 7, null);
		plustestFDCB("C3", 7, null);
		plustestFDCB("C4", 7, null);
		plustestFDCB("C5", 7, null);
		plustestFDCB("C6", 7, null);
		plustestFDCB("C7", 7, null);
		plustestFDCB("C8", 7, null);
		plustestFDCB("C9", 7, null);
		plustestFDCB("CA", 7, null);
		plustestFDCB("CB", 7, null);
		plustestFDCB("CC", 7, null);
		plustestFDCB("CD", 7, null);
		plustestFDCB("CE", 7, null);
		plustestFDCB("CF", 7, null);
		plustestFDCB("D0", 7, null);
		plustestFDCB("D1", 7, null);
		plustestFDCB("D2", 7, null);
		plustestFDCB("D3", 7, null);
		plustestFDCB("D4", 7, null);
		plustestFDCB("D5", 7, null);
		plustestFDCB("D6", 7, null);
		plustestFDCB("D7", 7, null);
		plustestFDCB("D8", 7, null);
		plustestFDCB("D9", 7, null);
		plustestFDCB("DA", 7, null);
		plustestFDCB("DB", 7, null);
		plustestFDCB("DC", 7, null);
		plustestFDCB("DD", 7, null);
		plustestFDCB("DE", 7, null);
		plustestFDCB("DF", 7, null);
		plustestFDCB("E0", 7, null);
		plustestFDCB("E1", 7, null);
		plustestFDCB("E2", 7, null);
		plustestFDCB("E3", 7, null);
		plustestFDCB("E4", 7, null);
		plustestFDCB("E5", 7, null);
		plustestFDCB("E6", 7, null);
		plustestFDCB("E7", 7, null);
		plustestFDCB("E8", 7, null);
		plustestFDCB("E9", 7, null);
		plustestFDCB("EA", 7, null);
		plustestFDCB("EB", 7, null);
		plustestFDCB("EC", 7, null);
		plustestFDCB("ED", 7, null);
		plustestFDCB("EE", 7, null);
		plustestFDCB("EF", 7, null);
		plustestFDCB("F0", 7, null);
		plustestFDCB("F1", 7, null);
		plustestFDCB("F2", 7, null);
		plustestFDCB("F3", 7, null);
		plustestFDCB("F4", 7, null);
		plustestFDCB("F5", 7, null);
		plustestFDCB("F6", 7, null);
		plustestFDCB("F7", 7, null);
		plustestFDCB("F8", 7, null);
		plustestFDCB("F9", 7, null);
		plustestFDCB("FA", 7, null);
		plustestFDCB("FB", 7, null);
		plustestFDCB("FC", 7, null);
		plustestFDCB("FD", 7, null);
		plustestFDCB("FE", 7, null);
		plustestFDCB("FF", 7, null);

		brain();
	}

	enum LATENCE_TYPE {
		_, CB, DD, ED, FD, DDCB, FDCB
	}

	Map<LATENCE_TYPE, Map<Integer, Integer>> latences1;
	Map<LATENCE_TYPE, Map<Integer, Integer>> latences2;
	Map<LATENCE_TYPE, Map<Integer, Integer>> plustest1;
	Map<LATENCE_TYPE, Map<Integer, Integer>> plustest2;
	{
		latences1 = new HashMap<LATENCE_TYPE, Map<Integer, Integer>>();
		latences2 = new HashMap<LATENCE_TYPE, Map<Integer, Integer>>();
		plustest1 = new HashMap<LATENCE_TYPE, Map<Integer, Integer>>();
		plustest2 = new HashMap<LATENCE_TYPE, Map<Integer, Integer>>();
		for (LATENCE_TYPE l : LATENCE_TYPE.values()) {
			latences1.put(l, new HashMap<Integer, Integer>());
			latences2.put(l, new HashMap<Integer, Integer>());
			plustest1.put(l, new HashMap<Integer, Integer>());
			plustest2.put(l, new HashMap<Integer, Integer>());
		}
	}

	private void brain() {
		for (LATENCE_TYPE l : LATENCE_TYPE.values()) {
			System.out.print("latences1(" + l + ") :" + latences1.get(l).keySet().size());
			System.out.println(", latences2(" + l + ") :" + latences2.get(l).keySet().size());
		}
		for (LATENCE_TYPE l : LATENCE_TYPE.values()) {
			System.out.print("plustest1(" + l + ") :" + plustest1.get(l).keySet().size());
			System.out.println(", plustest2(" + l + ") :" + plustest2.get(l).keySet().size());
		}
		int nbMissingBoth = 0;
		int nbMissingLatence = 0;
		int nbMissingPlustest = 0;
		int nbCata = 0;
		int nbArrange = 0;
		int nbArrangeNotOne = 0;
		int nbArrange1T = 0;
		int nbArrange2T = 0;
		int nbArrange3T = 0;
		int nbMissingBoth2 = 0;
		int nbMissingLatence2 = 0;
		int nbMissingPlustest2 = 0;
		int nbCata2 = 0;
		int nbArrange2 = 0;
		int nbArrangeNotOne2 = 0;
		int nbArrange1T2 = 0;
		int nbArrange2T2 = 0;
		int nbArrange3T2 = 0;
		for (LATENCE_TYPE l : LATENCE_TYPE.values()) {
			for (int i = 0; i < 256; i++) {
				if (!latences1.get(l).containsKey(i) && !plustest1.get(l).containsKey(i)) {
					nbMissingBoth++;
				} else if (!latences1.get(l).containsKey(i)) {
					nbMissingLatence++;
				} else if (!plustest1.get(l).containsKey(i)) {
					nbMissingPlustest++;
				} else {
					int l1 = latences1.get(l).get(i);
					int p1 = plustest1.get(l).get(i);
					if (p1 * 4 < l1) {
						nbCata++;
					} else if (p1 > (int) Math.ceil(((double) l1) / 4.0)) {
						nbArrange++;
						int distance = p1 - (int) Math.ceil(((double) l1) / 4.0);
						if (distance != 1) {
							nbArrangeNotOne++;
						} else {
							int distance2 = 4*p1 - 3-l1;
							if (distance2 == 1) {
								nbArrange1T++;
							} else if (distance2 == 2) {
								nbArrange2T++;
							}else if (distance2 == 3) {
								nbArrange3T++;
							} else {
								throw new Error(""+distance2+" "+p1+" "+l1);
							}
						}
					}
				}

				if (!latences2.get(l).containsKey(i) && !plustest2.get(l).containsKey(i)) {
					nbMissingBoth2++;
				} else if (!latences2.get(l).containsKey(i)) {
					nbMissingLatence2++;
				} else if (!plustest2.get(l).containsKey(i)) {
					nbMissingPlustest2++;
				} else {
					int l2 = latences2.get(l).get(i);
					int p2 = plustest2.get(l).get(i);
					if (p2 * 4 < l2) {
						nbCata2++;
					} else if (p2 > (int) Math.ceil(((double) l2) / 4.0)) {
						nbArrange2++;
						int distance = p2 - (int) Math.ceil(((double) l2) / 4.0);
						if (distance != 1) {
							nbArrangeNotOne2++;
						} else {
							int distance2 = 4*p2 - 3 - l2;
							if (distance2 == 1) {
								nbArrange1T2++;
							} else if (distance2 == 2) {
								nbArrange2T2++;
							}else if (distance2 == 3) {
								nbArrange3T2++;
							} else {
								throw new Error();
							}
						}
					}
				}
			}
		}
		System.out.println("CHECK RESULTS :");
		System.out.println("nbMissingBoth=" + nbMissingBoth);
		System.out.println("nbMissingLatence=" + nbMissingLatence);
		System.out.println("nbMissingPlustest=" + nbMissingPlustest);
		System.out.println("nbCata=" + nbCata);
		System.out.println("nbArrange=" + nbArrange);
		System.out.println("nbArrangeNotOne=" + nbArrangeNotOne);
		System.out.println("nbArrange1T="+nbArrange1T);
		System.out.println("nbArrange2T="+nbArrange2T);
		System.out.println("nbArrange3T="+nbArrange3T);
		System.out.println("nbMissingBoth2=" + nbMissingBoth2);
		System.out.println("nbMissingLatence2=" + nbMissingLatence2);
		System.out.println("nbMissingPlustest2=" + nbMissingPlustest2);
		System.out.println("nbCata2=" + nbCata2);
		System.out.println("nbArrange2=" + nbArrange2);
		System.out.println("nbArrangeNotOne2=" + nbArrangeNotOne2);
		System.out.println("nbArrange1T2="+nbArrange1T2);
		System.out.println("nbArrange2T2="+nbArrange2T2);
		System.out.println("nbArrange3T2="+nbArrange3T2);
	}

	private List<Integer> binary2Int(String binary) {
		List<Integer> liste = new ArrayList<Integer>();
		if (binary.contains("X")) {
			StringBuilder alea1 = new StringBuilder(binary);
			StringBuilder alea2 = new StringBuilder(binary);
			int pos = binary.indexOf("X");
			alea1.setCharAt(pos, '0');
			alea2.setCharAt(pos, '1');
			liste.addAll(binary2Int(alea1.toString()));
			liste.addAll(binary2Int(alea2.toString()));
		} else {
			liste.add(Integer.parseInt(binary, 2));
		}
		return liste;
	}

	private Integer hexa2Int(String hexa) {
		return Integer.parseInt(hexa, 16);
	}

	private void putLatences(LATENCE_TYPE latence_TYPE, int pos, int latence1, int latence2) {
		if (latence1<latence2) {
			putLatences(latence_TYPE, pos, latence2, latence1);
			return;
		}
		if (latences1.get(latence_TYPE).containsKey(pos)) {
			if (latences1.get(latence_TYPE).get(pos) != latence1) {
				throw new Error();
			}
		}
		latences1.get(latence_TYPE).put(pos, latence1);
		if (latences2.get(latence_TYPE).containsKey(pos)) {
			if (latences2.get(latence_TYPE).get(pos) != latence2) {
				throw new Error();
			}
		}
		latences2.get(latence_TYPE).put(pos, latence2);
	}

	private void putPlustest(LATENCE_TYPE latence_TYPE, int pos, int latence1, int latence2) {
		if (latence1<latence2) {
			putPlustest(latence_TYPE, pos, latence2, latence1);
			return;
		}
		if (plustest1.get(latence_TYPE).containsKey(pos)) {
			if (plustest1.get(latence_TYPE).get(pos) != latence1) {
				throw new Error();
			}
		}
		plustest1.get(latence_TYPE).put(pos, latence1);
		if (plustest2.get(latence_TYPE).containsKey(pos)) {
			if (plustest2.get(latence_TYPE).get(pos) != latence2) {
				throw new Error();
			}
		}
		plustest2.get(latence_TYPE).put(pos, latence2);
	}

	private void latence(String binary, int latence, Integer latence2, String instruction) {
		for (int b : binary2Int(binary)) {
			putLatences(LATENCE_TYPE._, b, latence, latence2 == null ? latence : latence2);
		}
	}

	private void latenceCB(String binary, int latence, Integer latence2, String instruction) {
		for (int b : binary2Int(binary)) {
			putLatences(LATENCE_TYPE.CB, b, latence, latence2 == null ? latence : latence2);
		}
	}

	private void latenceDD(String binary, int latence, Integer latence2, String instruction) {
		for (int b : binary2Int(binary)) {
			putLatences(LATENCE_TYPE.DD, b, latence, latence2 == null ? latence : latence2);
		}
	}

	private void latenceED(String binary, int latence, Integer latence2, String instruction) {
		for (int b : binary2Int(binary)) {
			putLatences(LATENCE_TYPE.ED, b, latence, latence2 == null ? latence : latence2);
		}
	}

	private void latenceFD(String binary, int latence, Integer latence2, String instruction) {
		for (int b : binary2Int(binary)) {
			putLatences(LATENCE_TYPE.FD, b, latence, latence2 == null ? latence : latence2);
		}
	}

	private void latenceDDCB(String binary, String binary2, int latence, Integer latence2, String instruction) {
		for (int b : binary2Int(binary2)) {
			putLatences(LATENCE_TYPE.DDCB, b, latence, latence2 == null ? latence : latence2);
		}
	}

	private void latenceFDCB(String binary, String binary2, int latence, Integer latence2, String instruction) {
		for (int b : binary2Int(binary2)) {
			putLatences(LATENCE_TYPE.FDCB, b, latence, latence2 == null ? latence : latence2);
		}
	}

	private void plustest(String hexa, Integer latence, Integer latence2) {
		int b = hexa2Int(hexa);
		if (latence == null)
			return;
		putPlustest(LATENCE_TYPE._, b, latence, latence2 == null ? latence : latence2);
	}

	private void plustestCB(String hexa, Integer latence, Integer latence2) {
		int b = hexa2Int(hexa);
		if (latence == null)
			return;
		putPlustest(LATENCE_TYPE.CB, b, latence, latence2 == null ? latence : latence2);
	}

	private void plustestFD(String hexa, Integer latence, Integer latence2) {
		int b = hexa2Int(hexa);
		if (latence == null)
			return;
		putPlustest(LATENCE_TYPE.FD, b, latence, latence2 == null ? latence : latence2);
	}

	private void plustestED(String hexa, Integer latence, Integer latence2) {
		int b = hexa2Int(hexa);
		if (latence == null)
			return;
		putPlustest(LATENCE_TYPE.ED, b, latence, latence2 == null ? latence : latence2);
	}

	private void plustestDD(String hexa, Integer latence, Integer latence2) {
		int b = hexa2Int(hexa);
		if (latence == null)
			return;
		putPlustest(LATENCE_TYPE.DD, b, latence, latence2 == null ? latence : latence2);
	}

	private void plustestDDCB(String hexa, Integer latence, Integer latence2) {
		int b = hexa2Int(hexa);
		if (latence == null)
			return;
		putPlustest(LATENCE_TYPE.DDCB, b, latence, latence2 == null ? latence : latence2);
	}

	private void plustestFDCB(String hexa, Integer latence, Integer latence2) {
		int b = hexa2Int(hexa);
		if (latence == null)
			return;
		putPlustest(LATENCE_TYPE.FDCB, b, latence, latence2 == null ? latence : latence2);
	}

}
