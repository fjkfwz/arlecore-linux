
USETEXTLINKS = 1
STARTALLOPEN = 0
WRAPTEXT = 1
PRESERVESTATE = 0
HIGHLIGHT = 1
ICONPATH = 'file:////home/lyn/arlecore_linux/'    //change if the gif's folder is a subfolder, for example: 'images/'

foldersTree = gFld("<i>ARLEQUIN RESULTS (cohen.arp)</i>", "")
insDoc(foldersTree, gLnk("R", "Arlequin log file", "Arlequin_log.txt"))
	aux1 = insFld(foldersTree, gFld("Run of 01/05/16 at 00:07:28", "cohen.xml#01_05_16at00_07_28"))
	insDoc(aux1, gLnk("R", "Settings", "cohen.xml#01_05_16at00_07_28_run_information"))
		aux2 = insFld(aux1, gFld("Genetic structure (samp=group)", "cohen.xml#01_05_16at00_07_28_gr_gen_struct"))
		insDoc(aux2, gLnk("R", "Euclidean distances", "cohen.xml#01_05_16at00_07_28_gr_amova_dm"))
		insDoc(aux2, gLnk("R", "Euclidean distances", "cohen.xml#01_05_16at00_07_28_pop_amova_dm"))
		insDoc(aux2, gLnk("R", "Minimum Spanning Network", "cohen.xml#01_05_16at00_07_28_gr_glob_spann"))
		insDoc(aux2, gLnk("R", "AMOVA", "cohen.xml#01_05_16at00_07_28_gr_amova"))
		insDoc(aux2, gLnk("R", "Pairwise distances", "cohen.xml#01_05_16at00_07_28_gr_pairw_diff"))
		insDoc(aux2, gLnk("R", "Locus by locus AMOVA", "cohen.xml#01_05_16at00_07_28gr_Loc_by_Loc_AMOVA"))
		insDoc(aux2, gLnk("R", "Euclidean distances", "cohen.xml#01_05_16at00_07_28_pop_amova_dm"))
		insDoc(aux2, gLnk("R", "Minimum Spanning Network", "cohen.xml#01_05_16at00_07_28_pop_glob_spann"))
		insDoc(aux2, gLnk("R", "AMOVA", "cohen.xml#01_05_16at00_07_28_pop_amova"))
		insDoc(aux2, gLnk("R", "Pairwise distances", "cohen.xml#01_05_16at00_07_28_pop_pairw_diff"))
		insDoc(aux2, gLnk("R", "Locus by locus AMOVA", "cohen.xml#01_05_16at00_07_28pop_Loc_by_Loc_AMOVA"))
		aux2 = insFld(aux1, gFld("Loci under selection", "cohen.xml#01_05_16at00_07_28_fdist2_"))
