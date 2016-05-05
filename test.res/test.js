
USETEXTLINKS = 1
STARTALLOPEN = 0
WRAPTEXT = 1
PRESERVESTATE = 0
HIGHLIGHT = 1
ICONPATH = 'file:////home/lyn/arlecore_linux/'    //change if the gif's folder is a subfolder, for example: 'images/'

foldersTree = gFld("<i>ARLEQUIN RESULTS (test.arp)</i>", "")
insDoc(foldersTree, gLnk("R", "Arlequin log file", "Arlequin_log.txt"))
	aux1 = insFld(foldersTree, gFld("Run of 30/04/16 at 11:05:45", "test.xml#30_04_16at11_05_45"))
	insDoc(aux1, gLnk("R", "Settings", "test.xml#30_04_16at11_05_45_run_information"))
		aux2 = insFld(aux1, gFld("Genetic structure (samp=group)", "test.xml#30_04_16at11_05_45_gr_gen_struct"))
		insDoc(aux2, gLnk("R", "Pairwise distances", "test.xml#30_04_16at11_05_45_pop_pairw_diff"))
