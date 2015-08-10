MiST_RAM_bootloader_inst : MiST_RAM_bootloader PORT MAP (
		address	 => address_sig,
		data	 => data_sig,
		inclock	 => inclock_sig,
		outclock	 => outclock_sig,
		rden	 => rden_sig,
		wren	 => wren_sig,
		q	 => q_sig
	);
