package jemu.system.cpc;

import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.swing.DefaultComboBoxModel;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import jemu.core.device.floppy.Drive;
import jemu.ui.JEMU;

public class MagicCPCMidnightCommander extends JFrame {
    private static final String BAD_FILE_EXTENSIONS[]={"dsk","dsk.properties"};

	private static final long serialVersionUID = 1L;
	private JEMU emu;
	
	// disc content (name of files)
	DefaultListModel<String> leftModel = new DefaultListModel<String>();
	DefaultListModel<String> rightModel = new DefaultListModel<String>();

	// file selection
	JList<String> leftList = new JList<String>();
	JList<String> rightList = new JList<String>();

	// select drive combobox : A B C D
	JComboBox<String> leftDriveButton = new JComboBox<String>();
	JComboBox<String> rightDriveButton = new JComboBox<String>();
	
	JButton moveToRight = new JButton("MOVE >");
	JButton copyToRight = new JButton("COPY >");
	JButton moveToLeft = new JButton("< MOVE");
	JButton copyToLeft = new JButton("< COPY");
	
	JButton deleteLeft = new JButton("DELETE X");
	JButton importLeft = new JButton("IMPORT >");
	JButton exportLeft = new JButton("EXPORT <");
	
	JButton deleteRight = new JButton("X DELETE");
	JButton importRight = new JButton("< IMPORT");
	JButton exportRight = new JButton("> EXPORT");
	
	private IMagicCPCMidnightCommander leftDisc;
	private IMagicCPCMidnightCommander rightDisc;

	public MagicCPCMidnightCommander(JEMU emu) {
		super("Midnight Commander");
		this.emu = emu;
		buildView();
		buildActions();
	}
	
	private void buildView() {
		setSize(640, 480);
		BorderLayout ultraLayout = new BorderLayout();
		setLayout(ultraLayout);

		JPanel panel = new JPanel();
		GridBagLayout globalLayout = new GridBagLayout();
		panel.setLayout(globalLayout);
		
		/*
		 * LEFT
		 */
		JPanel leftPanel = new JPanel();
		BorderLayout leftLayout = new BorderLayout();
		leftPanel.setLayout(leftLayout);
		
		JScrollPane leftListScroll = new JScrollPane(leftList);
		
		leftModel.addElement("TOTO.BAS");
		leftModel.addElement("TITI.BAS");
		leftList.setModel(leftModel);

		leftPanel.add(leftListScroll, BorderLayout.CENTER);
		
		JPanel blPanel = new JPanel();
		GridLayout blLayout = new GridLayout(3,0);
		blPanel.setLayout(blLayout);
		blPanel.add(deleteLeft);
		blPanel.add(importLeft);
		blPanel.add(exportLeft);
		
		leftPanel.add(blPanel, BorderLayout.WEST);

		JButton leftMagicButton = new JButton("MAGIC");
		leftPanel.add(leftMagicButton,BorderLayout.SOUTH);

		DefaultComboBoxModel<String> leftDriveModel= new DefaultComboBoxModel<String>();
		leftDriveModel.addElement("DRIVE A");
		leftDriveModel.addElement("DRIVE B");
		leftDriveModel.addElement("DRIVE C");
		leftDriveModel.addElement("DRIVE D");
		leftDriveButton.setModel(leftDriveModel);
		leftDriveButton.setSelectedIndex(0);
		leftPanel.add(leftDriveButton,BorderLayout.NORTH);

		GridBagConstraints leftLayoutConstraints = new GridBagConstraints();
		leftLayoutConstraints.fill=GridBagConstraints.BOTH;
		leftLayoutConstraints.weightx = 0.5;
		leftLayoutConstraints.weighty = 0.5;
		leftLayoutConstraints.gridx=0;
		leftLayoutConstraints.gridy=0;
		panel.add(leftPanel,leftLayoutConstraints);
		
		/*
		 * MIDDLE BUTTONS
		 */
		
		JPanel bmPanel = new JPanel();
		GridLayout bmLayout = new GridLayout(4,0);
		bmPanel.setLayout(bmLayout);
		bmPanel.add(moveToRight);
		bmPanel.add(copyToRight);
		bmPanel.add(moveToLeft);
		bmPanel.add(copyToLeft);
		
		GridBagConstraints middleLayoutConstraints = new GridBagConstraints();
		middleLayoutConstraints.fill=GridBagConstraints.BOTH;
		middleLayoutConstraints.weightx = 0.1;
		middleLayoutConstraints.weighty = 0.5;
		middleLayoutConstraints.gridx=1;
		middleLayoutConstraints.gridy=0;
		panel.add(bmPanel, middleLayoutConstraints);		

		/*
		 * RIGHT
		 */
		JPanel rightPanel = new JPanel();
		BorderLayout rightLayout = new BorderLayout();
		rightPanel.setLayout(rightLayout);

		
		JScrollPane rightListScroll = new JScrollPane(rightList);
		rightModel.addElement("TOTO.BAS");
		rightModel.addElement("TITI.BAS");
		rightList.setModel(rightModel);

		
		rightPanel.add(rightListScroll, BorderLayout.CENTER);
		
		JPanel brPanel = new JPanel();
		GridLayout brLayout = new GridLayout(3,0);
		brPanel.setLayout(brLayout);
		brPanel.add(deleteRight);
		brPanel.add(importRight);
		brPanel.add(exportRight);
		
		rightPanel.add(brPanel, BorderLayout.EAST);

		JButton rightMagicButton = new JButton("MAGIC");
		rightPanel.add(rightMagicButton,BorderLayout.SOUTH);
		
		
		DefaultComboBoxModel<String> rightDriveModel= new DefaultComboBoxModel<String>();
		rightDriveModel.addElement("DRIVE A");
		rightDriveModel.addElement("DRIVE B");
		rightDriveModel.addElement("DRIVE C");
		rightDriveModel.addElement("DRIVE D");
		rightDriveButton.setModel(rightDriveModel);
		rightDriveButton.setSelectedIndex(1);
		rightPanel.add(rightDriveButton,BorderLayout.NORTH);
		
		GridBagConstraints rightLayoutConstraints = new GridBagConstraints();
		rightLayoutConstraints.fill=GridBagConstraints.BOTH;
		rightLayoutConstraints.weightx = 0.5;
		rightLayoutConstraints.weighty = 0.5;
		rightLayoutConstraints.gridx=2;
		rightLayoutConstraints.gridy=0;
		panel.add(rightPanel,rightLayoutConstraints);


		
		
		
		add(panel,BorderLayout.CENTER);
		
		/*
		 * BOTTOM MAGIC CRUD
		 */
		JPanel magicPanel = new JPanel();
		GridLayout magicLayout = new GridLayout(5,0);
		magicPanel.setLayout(magicLayout);
		JComboBox<String> magicFormat = new JComboBox<String>();
		DefaultComboBoxModel<String> magicModel= new DefaultComboBoxModel<String>();
		magicModel.addElement("80 TRACKS SD 128KB");
		magicModel.addElement("80 TRACKS DOSD2 750KB");
		magicFormat.setModel(magicModel);
		JCheckBox check1=new JCheckBox("header ascii");
		JCheckBox check2=new JCheckBox("header binary");
		JCheckBox check3=new JCheckBox("header protected ascii");
		JCheckBox check4=new JCheckBox("header protected binary");
		magicPanel.add(magicFormat);
		magicPanel.add(check1);
		magicPanel.add(check2);
		magicPanel.add(check3);
		magicPanel.add(check4);
		
		add(magicPanel,BorderLayout.SOUTH);
		
		//setVisible(true);
	}
	
	private void buildActions() {
		leftDriveButton.addActionListener( new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				refreshListOfFiles();
			}
		});
		rightDriveButton.addActionListener( new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				refreshListOfFiles();
			}
		});
		moveToRight.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String magicFileName = leftModel.getElementAt(leftList.getSelectedIndex());
				MagicCPCFile magicFile= leftDisc.crudRead(magicFileName);
				rightDisc.crudAdd(magicFile);
				leftDisc.crudRemove(magicFileName);
				refreshListOfFiles();
			}
		});
		copyToRight.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String magicFileName = leftModel.getElementAt(leftList.getSelectedIndex());
				MagicCPCFile magicFile= leftDisc.crudRead(magicFileName);
				rightDisc.crudAdd(magicFile);
				refreshListOfFiles();
			}
		});
		moveToLeft.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String magicFileName = rightModel.getElementAt(rightList.getSelectedIndex());
				MagicCPCFile magicFile= rightDisc.crudRead(magicFileName);
				leftDisc.crudAdd(magicFile);
				rightDisc.crudRemove(magicFileName);
				refreshListOfFiles();
			}
		});
		copyToLeft.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String magicFileName = rightModel.getElementAt(rightList.getSelectedIndex());
				MagicCPCFile magicFile= rightDisc.crudRead(magicFileName);
				leftDisc.crudAdd(magicFile);
				refreshListOfFiles();
			}
		});
		deleteLeft.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String magicFileName = leftModel.getElementAt(leftList.getSelectedIndex());
				leftDisc.crudRemove(magicFileName);
				refreshListOfFiles();
			}
		});
		importLeft.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileDlg = new JFileChooser();
				fileDlg.setDialogTitle("Select file to import into LEFT disc");
		        fileDlg.setFileSelectionMode(JFileChooser.FILES_ONLY);
		        fileDlg.setAcceptAllFileFilterUsed(false);
		        fileDlg.addChoosableFileFilter(new javax.swing.filechooser.FileFilter() {
					public String getDescription() {
		                return "file to import (*.*)";
		            }
		         
		            public boolean accept(File f) {
		                if (f.isDirectory()) {
		                    return false;
		                } else {
		                	for (String badExtension: BAD_FILE_EXTENSIONS) {
			                    if (f.getName().toLowerCase().endsWith("."+badExtension)) {
			                    	return false;
			                    }	                		
		                	}
		                	return true;
		                }
		            }
		        });
		        File file = fileDlg.showOpenDialog(new JFrame()) == JFileChooser.APPROVE_OPTION ? fileDlg.getSelectedFile() : null;
		        if (file != null) {
		        	MagicCPCFile magicFile = transformFileToMagicCPCFile(file);
		        	leftDisc.crudAdd(magicFile);
		        	refreshListOfFiles();
		        }
			}
		});
		exportLeft.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileDlg = new JFileChooser();
				fileDlg.setDialogTitle("Save file exported from LEFT disc");
		        fileDlg.setFileSelectionMode(JFileChooser.FILES_ONLY);
//		        fileDlg.setAcceptAllFileFilterUsed(false);
//		        fileDlg.addChoosableFileFilter(new javax.swing.filechooser.FileFilter() {
//					public String getDescription() {
//		                return "file to import (*.*)";
//		            }
//		         
//		            public boolean accept(File f) {
//		                if (f.isDirectory()) {
//		                    return false;
//		                } else {
//		                	for (String badExtension: BAD_FILE_EXTENSIONS) {
//			                    if (f.getName().toLowerCase().endsWith("."+badExtension)) {
//			                    	return false;
//			                    }	                		
//		                	}
//		                	return true;
//		                }
//		            }
//		        });
		        File file = fileDlg.showSaveDialog(new JFrame()) == JFileChooser.APPROVE_OPTION ? fileDlg.getSelectedFile() : null;
		        if (file != null) {
					String magicFileName = leftModel.getElementAt(leftList.getSelectedIndex());
					MagicCPCFile magicFile= leftDisc.crudRead(magicFileName);
		        	transformMagicCPCFileToFile(magicFile,file);
		        }
			}
		});
		deleteRight.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String magicFileName = rightModel.getElementAt(rightList.getSelectedIndex());
				rightDisc.crudRemove(magicFileName);
				refreshListOfFiles();
			}
		});
		importRight.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileDlg = new JFileChooser();
				fileDlg.setDialogTitle("Select file to import into RIGHT disc");
		        fileDlg.setFileSelectionMode(JFileChooser.FILES_ONLY);
		        fileDlg.setAcceptAllFileFilterUsed(false);
		        fileDlg.addChoosableFileFilter(new javax.swing.filechooser.FileFilter() {
					public String getDescription() {
		                return "file to import (*.*)";
		            }
		         
		            public boolean accept(File f) {
		                if (f.isDirectory()) {
		                    return false;
		                } else {
		                	for (String badExtension: BAD_FILE_EXTENSIONS) {
			                    if (f.getName().toLowerCase().endsWith("."+badExtension)) {
			                    	return false;
			                    }	                		
		                	}
		                	return true;
		                }
		            }
		        });
		        File file = fileDlg.showOpenDialog(new JFrame()) == JFileChooser.APPROVE_OPTION ? fileDlg.getSelectedFile() : null;
		        if (file != null) {
		        	MagicCPCFile magicFile = transformFileToMagicCPCFile(file);
		        	rightDisc.crudAdd(magicFile);
		        	refreshListOfFiles();
		        }
			}
		});
		exportRight.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fileDlg = new JFileChooser();
				fileDlg.setDialogTitle("Save file exported from RIGHT disc");
		        fileDlg.setFileSelectionMode(JFileChooser.FILES_ONLY);
//		        fileDlg.setAcceptAllFileFilterUsed(false);
//		        fileDlg.addChoosableFileFilter(new javax.swing.filechooser.FileFilter() {
//					public String getDescription() {
//		                return "file to import (*.*)";
//		            }
//		         
//		            public boolean accept(File f) {
//		                if (f.isDirectory()) {
//		                    return false;
//		                } else {
//		                	for (String badExtension: BAD_FILE_EXTENSIONS) {
//			                    if (f.getName().toLowerCase().endsWith("."+badExtension)) {
//			                    	return false;
//			                    }	                		
//		                	}
//		                	return true;
//		                }
//		            }
//		        });
		        File file = fileDlg.showSaveDialog(new JFrame()) == JFileChooser.APPROVE_OPTION ? fileDlg.getSelectedFile() : null;
		        if (file != null) {
					String magicFileName = rightModel.getElementAt(rightList.getSelectedIndex());
					MagicCPCFile magicFile= rightDisc.crudRead(magicFileName);
		        	transformMagicCPCFileToFile(magicFile,file);
		        }
			}
		});
	}
	
	protected MagicCPCFile transformFileToMagicCPCFile(File file) {
		MagicCPCFile magicFile = new MagicCPCFile();
		try {
			magicFile.setName(file.getName());
			magicFile.setPath(file.getParent());
			FileInputStream fis = new FileInputStream(file);
			byte [] data = new byte[(int) file.length()];
			fis.read(data);
			fis.close();
			magicFile.setData(data);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return magicFile;
	}
	protected File transformMagicCPCFileToFile(MagicCPCFile magicFile, File file) {
		File f = new File(file.getParent()+File.separator+magicFile.getName());
		try {
			FileOutputStream fos = new FileOutputStream(f);
			fos.write(magicFile.getData());
			fos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public void setVisible (boolean visible) {
		super.setVisible(visible);
		if (visible) {
			// version 0 :p
			// the midnight commander, does command, it does not need to be "refresh" by events from dsk or dir
			// the midnight commander main objectif is to send actions on MagicCPCDiscImage.
			refreshListOfFiles();
		}
	}
	
	void refreshListOfFiles() {
		leftDisc = getLeftDisc();
		for (String file : leftDisc.crudList()) {
			leftModel.addElement(file);
		}
		rightDisc = getRightDisc();
		for (String file : rightDisc.crudList()) {
			rightModel.addElement(file);
		}
	}
	
	private IMagicCPCMidnightCommander getLeftDisc() {
		int d = leftDriveButton.getSelectedIndex();
		Drive drive = emu.getComputer().getFloppyDrives()[d];
		if (drive.getDisc(0) instanceof IMagicCPCMidnightCommander) {
			return (IMagicCPCMidnightCommander) drive.getDisc(0);
		}
		return null;
	}
	private IMagicCPCMidnightCommander getRightDisc() {
		int d = rightDriveButton.getSelectedIndex();
		Drive drive = emu.getComputer().getFloppyDrives()[d];
		if (drive.getDisc(0) instanceof IMagicCPCMidnightCommander) {
			return (IMagicCPCMidnightCommander) drive.getDisc(0);
		}
		return null;
	}
	
}
