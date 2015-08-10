VRAM_Amstrad_MiST_inst : VRAM_Amstrad_MiST PORT MAP (
		data	 => data_sig,
		rdaddress	 => rdaddress_sig,
		rdclock	 => rdclock_sig,
		wraddress	 => wraddress_sig,
		wrclock	 => wrclock_sig,
		wren	 => wren_sig,
		q	 => q_sig
	);
