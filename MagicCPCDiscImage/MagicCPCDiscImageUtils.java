package jemu.system.cpc;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

public class MagicCPCDiscImageUtils {

	public static final int MAX_FILE_SIZE = 1024 * 1024 * 13;  // 1024K maximum

    public static byte[] getFile(String name) {
        return getFile(name, MAX_FILE_SIZE, true);
    }

	private static byte[] getFile(String name, int size, boolean crop) {
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
	
	private static InputStream openFile(String name) throws Exception {
		File file = new File(name);
		assertTrue(file.exists());
		return new FileInputStream(file);
    }
}
