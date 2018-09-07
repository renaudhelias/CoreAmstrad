package jemu.system.cpc;

import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.GridLayout;

import javax.swing.ComboBoxModel;
import javax.swing.DefaultComboBoxModel;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

public class MagicCPCMidnightCommander extends JFrame {
	private static final long serialVersionUID = 1L;
	
	public MagicCPCMidnightCommander() {
		super("Midnight Commander");
		build();
	}
	private void build() {
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
		
		JList<String> leftList = new JList<String>();
		JScrollPane leftListScroll = new JScrollPane(leftList);
		DefaultListModel<String> leftModel = new DefaultListModel<String>();
		leftModel.addElement("TOTO.BAS");
		leftModel.addElement("TITI.BAS");
		leftList.setModel(leftModel);

		leftPanel.add(leftListScroll, BorderLayout.CENTER);
		
		JPanel blPanel = new JPanel();
		GridLayout blLayout = new GridLayout(3,0);
		blPanel.setLayout(blLayout);
		JButton bl1 = new JButton("DELETE X");
		JButton bl2 = new JButton("IMPORT >");
		JButton bl3 = new JButton("EXPORT <");
		blPanel.add(bl1);
		blPanel.add(bl2);
		blPanel.add(bl3);
		
		leftPanel.add(blPanel, BorderLayout.WEST);

		JButton leftMagicButton = new JButton("MAGIC");
		leftPanel.add(leftMagicButton,BorderLayout.SOUTH);

		JComboBox<String> leftDriveButton = new JComboBox<String>();
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
		JButton bm1 = new JButton("MOVE >");
		JButton bm2 = new JButton("COPY >");
		JButton bm3 = new JButton("< MOVE");
		JButton bm4 = new JButton("< COPY");
		bmPanel.add(bm1);
		bmPanel.add(bm2);
		bmPanel.add(bm3);
		bmPanel.add(bm4);
		
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

		
		JList<String> rightList = new JList<String>();
		JScrollPane rightListScroll = new JScrollPane(rightList);
		DefaultListModel<String> rightModel = new DefaultListModel<String>();
		rightModel.addElement("TOTO.BAS");
		rightModel.addElement("TITI.BAS");
		rightList.setModel(rightModel);

		
		rightPanel.add(rightListScroll, BorderLayout.CENTER);
		
		JPanel brPanel = new JPanel();
		GridLayout brLayout = new GridLayout(3,0);
		brPanel.setLayout(brLayout);
		JButton br1 = new JButton("X DELETE");
		JButton br2 = new JButton("< IMPORT");
		JButton br3 = new JButton("> EXPORT");
		brPanel.add(br1);
		brPanel.add(br2);
		brPanel.add(br3);
		
		rightPanel.add(brPanel, BorderLayout.EAST);

		JButton rightMagicButton = new JButton("MAGIC");
		rightPanel.add(rightMagicButton,BorderLayout.SOUTH);
		
		JComboBox<String> rightDriveButton = new JComboBox<String>();
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
}
