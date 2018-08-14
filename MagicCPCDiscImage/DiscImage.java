/*
 * DiscImage.java
 *
 * Created on 29 July 2006, 11:50
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package jemu.core.device.floppy;

import java.io.File;

/**
 * Title: JavaCPC Description: The Java Amstrad CPC Emulator Copyright:
 * Copyright (c) 2006-2010 Company:
 *
 * @author
 * @version 6.8
 */
/**
 *
 * @author Richard
 */
public abstract class DiscImage implements IDiscImage {

    public DiscImage() {
    }

    /**
     * CRUD
     */

    public abstract String getName();

    /**
     * Save the disc image.
     */
    public abstract void saveImage(File saveFile);

    public abstract byte[] getImage();

	public final void notifyWriteSector(byte data, int cylinder, int head, int c, int h, int r, int n) {
		// useless :p
	}

	public final void notifyReadSector(boolean beginOfSector, int cylinder, int head, int c, int h, int r, int n) {
		// useless :p
	}
}
