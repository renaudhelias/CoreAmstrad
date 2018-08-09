package jemu.system.cpc;

import static org.junit.Assert.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.junit.Test;

/**
 * CPCDiskXP -File moustache.bin -AddAmsdosHeader 100 -AddToNewDsk jdvpa6_moustache.dsk
 * CPCDiskXP -File chat1.scr -AddToExistingDsk jdvpa6_moustache.dsk
 * CPCDiskXP -File chat2.scr -AddToExistingDsk jdvpa6_moustache.dsk
 * CPCDiskXP -File chat3.scr -AddToExistingDsk jdvpa6_moustache.dsk
 */
public class MagicCPCDiscImageTest {
	public static final int MAX_FILE_SIZE = 1024 * 1024 * 13;  // 1024K maximum
	
	@Test
	public void test1() {
		String name="resources/magic_test/jdvpa6_moustache.dsk";
		byte[] data = getFile(name);
		//DSK_Load(name, data);
		CPCDiscImage image = new CPCDiscImage(name, data);
		//transform CPCDiscImage en CPCMagicDiscImage
		//transform CPCMagicDiscImage en CPCDiscImage
		assertNotNull(image);
		image.saveImage();
	}
	
	@Test
	public void test2() {
		String name="magic_test/jdvpa6_moustache.dsk.properties";
		name="magic_test/";
		MagicCPCDiscImage image = new MagicCPCDiscImage(name);
		//transform CPCMagicDiscImage en CPCDiscImage
		//image.saveImage();
		assertNotNull(image);
	}

    public static byte[] getFile(String name) {
        return getFile(name, MAX_FILE_SIZE, true);
    }

	public static byte[] getFile(String name, int size, boolean crop) {
	    byte[] buffer = new byte[size];
	    int offs = 0;
	    try {
	      InputStream stream = null;
	      try {
	        stream = openFile(name);
	        while (size > 0) {
	          int read = stream.read(buffer,offs,size);
	          if (read == -1)
	            break;
	          else {
	            offs += read;
	            size -= read;
	          }
	        }
	      } finally {
	        if (stream != null)
	          stream.close();
	      }
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    if (crop && offs < buffer.length) {
	      byte[] result = new byte[offs];
	      System.arraycopy(buffer,0,result,0,offs);
	      buffer = result;
	    }
	    return buffer;
	  }
	
	public static InputStream openFile(String name) throws Exception {
		File file = new File(name);
		assertTrue(file.exists());
		return new FileInputStream(file);
    }
}
