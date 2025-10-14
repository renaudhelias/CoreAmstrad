package paletteC64ToCPC;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import javax.swing.JFileChooser;
import javax.swing.JMenuItem;
import javax.swing.JPopupMenu;
import javax.swing.filechooser.FileNameExtensionFilter;

public class JPopupMenuImportExport extends JPopupMenu {
	C64ToCPCPaletteConverter app;
	List<RGB> paletteOrigine;
	List<YUV> paletteOrigineYUV;
	List<RGB> newPaletteGenerated;
	List<YUV> newPaletteGeneratedYUV;
	public JPopupMenuImportExport(C64ToCPCPaletteConverter app, List<RGB> paletteOrigine,List<YUV> paletteOrigineYUV,List<RGB> newPaletteGenerated, List<YUV> newPaletteGeneratedYUV) {
		this.paletteOrigine = paletteOrigine;
		this.paletteOrigineYUV = paletteOrigineYUV;
		this.newPaletteGenerated = newPaletteGenerated;
		this.newPaletteGeneratedYUV = newPaletteGeneratedYUV;
		this.app = app;
		ActionListener al = new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				JMenuItem menu = (JMenuItem) e.getSource();
				switch (menu.getText()) {
				case "Import":
					JFileChooser chooser = new JFileChooser();
			        FileNameExtensionFilter filter = new FileNameExtensionFilter(
			                "Import *.rgbFF;*.yuv", "rgbFF", "yuv");
			        chooser.setFileFilter(filter);
			        int returnVal = chooser.showOpenDialog(null);
			        if(returnVal == JFileChooser.APPROVE_OPTION) {
			            System.out.println("You chose to open this file: " +
			                    chooser.getSelectedFile().getName());
			            File fl = chooser.getSelectedFile();
			            if (fl.getName().endsWith(".rgbFF")) {
				            try (BufferedReader br = new BufferedReader(new FileReader(fl))) {
							    String line;
							    int i = 0;
							    while ((line = br.readLine()) != null) {
							       // process the line.
							    	if (i==0) {
							    		if (!line.equals("r;g;b")) throw new Exception("entete rgb");
							    		while (newPaletteGenerated.size()>0) {
							    			// on garde juste le pointeur
							    			newPaletteGenerated.removeLast();
							    			newPaletteGeneratedYUV.removeLast();
							    		}
							    	} else if (i<16){
							    		// on zap paletteOrigine
							    	} else {
							    		String [] colors = line.split(";");
								    	System.out.println(line);
								    	int r=Integer.parseInt(colors[0],16);
								    	int g=Integer.parseInt(colors[1],16);
								    	int b=Integer.parseInt(colors[2],16);
								    	RGB rgb = new RGB(r,g,b);
								    	YUV yuv = app.rgb2yuvFF(rgb);
								    	newPaletteGenerated.add(rgb);
								    	newPaletteGeneratedYUV.add(yuv);
							    	}
							    	i++;
							    }
							    app.p.repaint();
							} catch (FileNotFoundException e1) {
								e1.printStackTrace();
							} catch (IOException e1) {
								e1.printStackTrace();
							} catch (Exception e1) {
								e1.printStackTrace();
							}
			            } else if (fl.getName().endsWith(".yuv")) {
				            try (BufferedReader br = new BufferedReader(new FileReader(fl))) {
							    String line;
							    int i = 0;
							    while ((line = br.readLine()) != null) {
							       // process the line.
							    	if (i==0) {
							    		if (!line.equals("y;u;v")) throw new Exception("entete yuv");
							    		while (newPaletteGenerated.size()>0) {
							    			// on garde juste le pointeur
							    			newPaletteGenerated.removeLast();
							    			newPaletteGeneratedYUV.removeLast();
							    		}
							    	} else if (i<16+1){
							    		// on zap paletteOrigine
							    	} else {
							    		String [] colors = line.split(";");
								    	System.out.println(line);
								    	double y=Double.parseDouble(colors[0]);
								    	double u=Double.parseDouble(colors[1]);
								    	double v=Double.parseDouble(colors[2]);
								    	YUV yuv = new YUV(y,u,v);
								    	RGB rgb = app.yuv2rgbFF(yuv);
								    	newPaletteGenerated.add(rgb);
								    	newPaletteGeneratedYUV.add(yuv);
							    	}
							    	i++;
							    	if (i>32+1+1) throw new Exception("palette trop grande");
							    }
							    app.p.repaint();
							} catch (FileNotFoundException e1) {
								e1.printStackTrace();
							} catch (IOException e1) {
								e1.printStackTrace();
							} catch (Exception e1) {
								e1.printStackTrace();
							}			            	
			            }
			        }
					// Fichier parse 16 RGB
					// Fichier parse 16 YUV
					System.out.println("import menu");
					
					
					break;
				case "Export":
					JFileChooser chooserSave = new JFileChooser();
			        FileNameExtensionFilter filterSave = new FileNameExtensionFilter(
			                "Export *.rgbFF;*.rgb3F;*.vhd;*.yuv", "rgbFF", "rgb3F", "vhd", "yuv");
			        chooserSave.setFileFilter(filterSave);
			        int returnValSave = chooserSave.showSaveDialog(null);
			        if(returnValSave == JFileChooser.APPROVE_OPTION) {
			            System.out.println("You chose to open this file: " +
			                    chooserSave.getSelectedFile().getName());
			            File fs = chooserSave.getSelectedFile();
			            try (BufferedWriter writer = new BufferedWriter(new FileWriter(fs, false))) {
			                if (fs.getName().endsWith(".rgbFF")) {
				            	writer.write("r;g;b");
				                writer.newLine();
				                if (paletteOrigine.size()>16) throw new Exception("paletteOrigine KO");
				                for(RGB rgb : paletteOrigine) {
				                	writer.write( String.format("%02X;%02X;%02X",rgb.r,rgb.g,rgb.b));
					                writer.newLine();				                	
				                }
				                if (paletteOrigine.size()>16) throw new Exception("newPaletteGenerated KO");
				                for(RGB rgb : newPaletteGenerated) {
				                	writer.write( String.format("%02X;%02X;%02X",rgb.r,rgb.g,rgb.b));
					                writer.newLine();				                	
				                }
			                } else if (fs.getName().endsWith(".yuv")) {
			                	writer.write("y;u;v");
				                writer.newLine();
				                if (paletteOrigine.size()>16) throw new Exception("paletteOrigineYUV KO");
				                for(YUV yuv : paletteOrigineYUV) {
				                	writer.write( String.format("%.9f;%.9f;%.9f",yuv.Y,yuv.U,yuv.V).replace(",", "."));
					                writer.newLine();				                	
				                }
				                if (paletteOrigine.size()>16) throw new Exception("newPaletteGeneratedYUV KO");
				                for(YUV yuv : newPaletteGeneratedYUV) {
				                	writer.write( String.format("%.9f;%.9f;%.9f",yuv.Y,yuv.U,yuv.V).replace(",", "."));
					                writer.newLine();				                	
				                }
			                } else if (fs.getName().endsWith(".vhd")) {
				                if (paletteOrigine.size()>16) throw new Exception("paletteOrigine KO");
				                writer.write("constant C64_SCREEN_RED:T_C64 :=(");
				                writer.newLine();
				                for(RGB rgb : paletteOrigine) {
				                	RGB rgb3F = app.convertTo3F(rgb);
				                	writer.write( String.format("\"%6s\",",Integer.toBinaryString(rgb3F.r)).replace(" ", "0"));
					                writer.newLine();
				                }
				                if (paletteOrigine.size()>16) throw new Exception("newPaletteGenerated KO");
				                writer.newLine();
				                for(RGB rgb : newPaletteGenerated) {
				                	RGB rgb3F = app.convertTo3F(rgb);
				                	writer.write( String.format("\"%6s\"",Integer.toBinaryString(rgb3F.r)).replace(" ", "0"));
				                	if (newPaletteGenerated.getLast()!=rgb) writer.write(",");
					                writer.newLine();
				                }
				                writer.write(");");
				                writer.newLine();
				                writer.write("constant C64_SCREEN_GREEN:T_C64 :=(");
				                writer.newLine();				                	
				                for(RGB rgb : paletteOrigine) {
				                	RGB rgb3F = app.convertTo3F(rgb);
				                	writer.write( String.format("\"%6s\",",Integer.toBinaryString(rgb3F.g)).replace(" ", "0"));
					                writer.newLine();
				                }
				                writer.newLine();
				                for(RGB rgb : newPaletteGenerated) {
				                	RGB rgb3F = app.convertTo3F(rgb);
				                	writer.write( String.format("\"%6s\"",Integer.toBinaryString(rgb3F.g)).replace(" ", "0"));
				                	if (newPaletteGenerated.getLast()!=rgb) writer.write(",");
					                writer.newLine();
				                }
				                writer.write(");");
				                writer.newLine();
				                writer.write("constant C64_SCREEN_BLUE:T_C64 :=(");
				                writer.newLine();
				                for(RGB rgb : paletteOrigine) {
				                	RGB rgb3F = app.convertTo3F(rgb);
				                	writer.write( String.format("\"%6s\",",Integer.toBinaryString(rgb3F.b)).replace(" ", "0"));
					                writer.newLine();
				                }
				                writer.newLine();
				                for(RGB rgb : newPaletteGenerated) {
				                	RGB rgb3F = app.convertTo3F(rgb);
				                	writer.write( String.format("\"%6s\"",Integer.toBinaryString(rgb3F.b)).replace(" ", "0"));
				                	if (newPaletteGenerated.getLast()!=rgb) writer.write(",");
					                writer.newLine();
				                }
				                writer.write(");");
				                writer.newLine();
			                }
			              }
			              catch (IOException ex) {
			                ex.printStackTrace();
			              } catch (Exception e1) {
							e1.printStackTrace();
						}
			        }
					System.out.println("export menu");
					break;
				}
			}
		};
	
	
		JMenuItem importMenu= new JMenuItem("Import");
		add(importMenu);
		importMenu.addActionListener(al);
		JMenuItem exportMenu= new JMenuItem("Export");
		add(exportMenu);
		exportMenu.addActionListener(al);
	
	}
}
