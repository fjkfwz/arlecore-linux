
USETEXTLINKS = 1
STARTALLOPEN = 0
WRAPTEXT = 1
PRESERVESTATE = 0
HIGHLIGHT = 1
ICONPATH = 'file:////home/lyn/arlecore_linux/'    //change if the gif's folder is a subfolder, for example: 'images/'

foldersTree = gFld("<i>ARLEQUIN RESULTS (mtDNAHV1.arp)</i>", "")
insDoc(foldersTree, gLnk("R", "Arlequin log file", "Arlequin_log.txt"))
	aux1 = insFld(foldersTree, gFld("Run of 30/04/16 at 10:40:37", "mtDNAHV1.xml#30_04_16at10_40_37"))
	insDoc(aux1, gLnk("R", "Settings", "mtDNAHV1.xml#30_04_16at10_40_37_run_information"))
		aux2 = insFld(aux1, gFld("Groups", ""))
		insDoc(aux2, gLnk("R", "Group1", "mtDNAHV1.xml#30_04_16at10_40_37_samp0"))
		aux2 = insFld(aux1, gFld("Within-groups summary", ""))
		aux2 = insFld(aux1, gFld("Samples", ""))
		insDoc(aux2, gLnk("R", "Mandenka", "mtDNAHV1.xml#30_04_16at10_40_37_group0"))
		aux2 = insFld(aux1, gFld("Within-samples summary", ""))
		aux2 = insFld(aux1, gFld("Loci under selection", "mtDNAHV1.xml#30_04_16at10_40_37_fdist2_"))
