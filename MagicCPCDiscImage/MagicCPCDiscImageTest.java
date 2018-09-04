package jemu.system.cpc;

import static org.junit.Assert.*;

import java.io.File;
import java.util.Arrays;

import org.junit.Test;

import jemu.ui.Switches;
import jemu.ui.selectDSK;

/**
 * CPCDiskXP -File moustache.bin -AddAmsdosHeader 100 -AddToNewDsk jdvpa6_moustache.dsk
 * CPCDiskXP -File chat1.scr -AddToExistingDsk jdvpa6_moustache.dsk
 * CPCDiskXP -File chat2.scr -AddToExistingDsk jdvpa6_moustache.dsk
 * CPCDiskXP -File chat3.scr -AddToExistingDsk jdvpa6_moustache.dsk
 */
public class MagicCPCDiscImageTest {
	

	@Test
	public void testNewDATA40() {
		int format = Arrays.asList(selectDSK.DSKImage).indexOf("dataDS40");
        String discimage = selectDSK.DSKImages[format];
        int discsize = selectDSK.DSKSizes[format];
        byte[] bufferdsk = selectDSK.copyResource("dskutil/file/" + discimage, discsize);
        String name="resources/magic_test/empty_DATA40.dsk";
		CPCDiscImage image = new CPCDiscImage(name, bufferdsk);
		Switches.uncompressed=true;
		image.saveImage(new File(name));
	}
	
	@Test
	public void testNewDATA80() {
		int format = Arrays.asList(selectDSK.DSKImage).indexOf("dataDS80");
        String discimage = selectDSK.DSKImages[format];
        int discsize = selectDSK.DSKSizes[format];
        byte[] bufferdsk = selectDSK.copyResource("dskutil/file/" + discimage, discsize);
        String name="resources/magic_test/empty_DATA80.dsk";
		CPCDiscImage image = new CPCDiscImage(name, bufferdsk);
		Switches.uncompressed=true;
		image.saveImage(new File(name));
	}

	@Test
	public void testNewDOSD2() {
		int format = Arrays.asList(selectDSK.DSKImage).indexOf("romdosD2");
        String discimage = selectDSK.DSKImages[format];
        int discsize = selectDSK.DSKSizes[format];
        byte[] bufferdsk = selectDSK.copyResource("dskutil/file/" + discimage, discsize);
        String name="resources/magic_test/empty_romdosD2.dsk";
		CPCDiscImage image = new CPCDiscImage(name, bufferdsk);
		Switches.uncompressed=true;
		image.saveImage(new File(name));
	}
	
	@Test
	public void testAmsHeader() {
		// do extract them, and print a report
		
	}

	@Test
	public void test1() {
		String name="resources/magic_test/jdvpa6_moustache.dsk";
		byte[] data = MagicCPCDiscImageUtils.getFile(name);
		//DSK_Load(name, data);
		CPCDiscImage image = new CPCDiscImage(name, data);
		//transform CPCDiscImage en CPCMagicDiscImage
		//transform CPCMagicDiscImage en CPCDiscImage
		assertNotNull(image);
		//image.saveImage();
		Switches.uncompressed=true;
		image.saveImage(new File(new File(name).getParent(), "jdvpa6_moustache_saved.dsk"));
	}
	
	@Test
	public void testMagicProps() {
		String name="resources/magic_test/jdvpa6_moustache.dsk.properties";
		MagicCPCDiscImage image = new MagicCPCDiscImage(name);
		//transform CPCMagicDiscImage en CPCDiscImage
		assertNotNull(image);
//		image.copyAsDSK("MAGIC_OUTPUT_PROPS.DSK");
		image.saveImage(new File("MAGIC_OUTPUT_PROPS.DSK"));
	}
	
	@Test
	public void testMagicDir() {
		String name="resources/magic_test/";
		MagicCPCDiscImage image = new MagicCPCDiscImage(name);
		assertNotNull(image);
//		image.copyAsDSK("MAGIC_OUTPUT.DSK");
		image.saveImage(new File("MAGIC_OUTPUT.DSK"));
	}

}
