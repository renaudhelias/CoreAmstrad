package jemu.system.cpc;

import java.util.List;

/**
 * List of MagicCPCMidnightCommander action on MagicCPCDiscImage
 * @author Joe
 *
 */
public interface IMagicCPCMidnightCommander {

	List<String> crudList();

	MagicCPCFile crudRead(String magicRealFileName);

	void crudAdd(MagicCPCFile magicFile);

	void crudRemove(String magicRealFileName);

}
