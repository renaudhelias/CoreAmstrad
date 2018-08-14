package jemu.system.cpc;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;

import java.awt.*;

import javax.swing.*;
/**
 * Title:        JavaCPC
 * Description:  The Java Amstrad CPC Emulator
 * Copyright:    Copyright (c) 2006-2010
 * Company:
 * @author
 * @version 6.8
 */
/**
 * Merge to dsk files into a single double sided!
 * 
 * @author Roland.Barthel
 */
public class CPCDiscImageMerger {

    /**
     * @param args
     */
    public static void merge() {//(final String[] args) {

        // choose first dsk file
        Frame frame = new Frame();
        FileDialog filedia1 = new FileDialog((Frame) frame, "Select first dsk file...", FileDialog.LOAD);
        filedia1.setFile("*.dsk");
        filedia1.setVisible(true);
        String filename1 = filedia1.getFile();
        if (filename1 != null) {
            filename1 = filedia1.getDirectory() + filedia1.getFile();
            String firstFileName = filename1;

            // choose second dsk file
            FileDialog filedia2 = new FileDialog((Frame) frame, "Select second dsk file...", FileDialog.LOAD);
            filedia2.setFile("*.dsk");
            filedia2.setVisible(true);
            String filename2 = filedia2.getFile();
            if (filename2 != null) {
                filename2 = filedia2.getDirectory() + filedia2.getFile();
                String secondFileName = filename2;

                // choose destination file
                FileDialog filedia3 = new FileDialog((Frame) frame, "Select destination dsk file...", FileDialog.SAVE);
                filedia3.setFile("*.dsk");
                filedia3.setVisible(true);
                String filename3 = filedia3.getFile();
                if (filename3 != null) {
                    filename3 = filedia3.getDirectory() + filedia3.getFile();
                    String newFileName = filename3;
                    if (!newFileName.toLowerCase().endsWith(".dsk")) {
                        newFileName = newFileName + ".dsk";
                    }

                    // open dsk files
                    try {
                        final CPCDiscImageForMerge firstImage = openImage(firstFileName);
                        final CPCDiscImageForMerge secondImage = openImage(secondFileName);
                        final CPCDiscImageForMerge newImage = new CPCDiscImageForMerge(newFileName, firstImage, secondImage);
                        newImage.saveImage();
                    } catch (final IOException iox) {
                        JOptionPane.showMessageDialog(null, iox.getMessage(), "Guru meditation!", JOptionPane.ERROR_MESSAGE);
                    }
                }
            }
        }
    }

    private static CPCDiscImageForMerge openImage(final String fileName) throws IOException {
        final BufferedInputStream bis = new BufferedInputStream(new FileInputStream(fileName));
        return CPCDiscImageForMerge.create(fileName, bis);
    }

    public static void main(final String[] args) {

        // choose first dsk file
        Frame frame = new Frame();
        FileDialog filedia1 = new FileDialog((Frame) frame, "Select first dsk file...", FileDialog.LOAD);
        filedia1.setFile("*.dsk");
        filedia1.setVisible(true);
        String filename1 = filedia1.getFile();
        if (filename1 == null) {
            System.exit(0);
        }
        if (filename1 != null) {
            filename1 = filedia1.getDirectory() + filedia1.getFile();
            String firstFileName = filename1;

            // choose second dsk file
            FileDialog filedia2 = new FileDialog((Frame) frame, "Select second dsk file...", FileDialog.LOAD);
            filedia2.setFile("*.dsk");
            filedia2.setVisible(true);
            String filename2 = filedia2.getFile();
            if (filename2 == null) {
                System.exit(0);
            }
            if (filename2 != null) {
                filename2 = filedia2.getDirectory() + filedia2.getFile();
                String secondFileName = filename2;

                // choose destination file
                FileDialog filedia3 = new FileDialog((Frame) frame, "Select destination dsk file...", FileDialog.SAVE);
                filedia3.setFile("*.dsk");
                filedia3.setVisible(true);
                String filename3 = filedia3.getFile();
                if (filename3 == null) {
                    System.exit(0);
                }
                if (filename3 != null) {
                    filename3 = filedia3.getDirectory() + filedia3.getFile();
                    String newFileName = filename3;
                    if (!newFileName.toLowerCase().endsWith(".dsk")) {
                        newFileName = newFileName + ".dsk";
                    }

                    // open dsk files
                    try {
                        final CPCDiscImageForMerge firstImage = openImage(firstFileName);
                        final CPCDiscImageForMerge secondImage = openImage(secondFileName);
                        final CPCDiscImageForMerge newImage = new CPCDiscImageForMerge(newFileName, firstImage, secondImage);
                        newImage.saveImage();
                    } catch (final IOException iox) {
                        JOptionPane.showMessageDialog(null, iox.getMessage(), "Guru meditation!", JOptionPane.ERROR_MESSAGE);
                    }
                }
            }
            // exit OK
            System.exit(0);
        }
    }
}
