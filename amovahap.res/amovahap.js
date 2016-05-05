
USETEXTLINKS = 1
STARTALLOPEN = 0
WRAPTEXT = 1
PRESERVESTATE = 0
HIGHLIGHT = 1
ICONPATH = 'file:////home/lyn/arlecore_linux/'    //change if the gif's folder is a subfolder, for example: 'images/'

foldersTree = gFld("<i>ARLEQUIN RESULTS (amovahap.arp)</i>", "")
insDoc(foldersTree, gLnk("R", "Arlequin log file", "Arlequin_log.txt"))
	aux1 = insFld(foldersTree, gFld("Run of 30/04/16 at 10:55:55", "amovahap.xml#30_04_16at10_55_55"))
	insDoc(aux1, gLnk("R", "Settings", "amovahap.xml#30_04_16at10_55_55_run_information"))
		aux2 = insFld(aux1, gFld("Groups", ""))
		insDoc(aux2, gLnk("R", "Group1", "amovahap.xml#30_04_16at10_55_55_samp0"))
		insDoc(aux2, gLnk("R", "Group2", "amovahap.xml#30_04_16at10_55_55_samp1"))
		insDoc(aux2, gLnk("R", "Group3", "amovahap.xml#30_04_16at10_55_55_samp2"))
		insDoc(aux2, gLnk("R", "Group4", "amovahap.xml#30_04_16at10_55_55_samp3"))
		insDoc(aux2, gLnk("R", "Group5", "amovahap.xml#30_04_16at10_55_55_samp4"))
		aux2 = insFld(aux1, gFld("Within-groups summary", ""))
		aux2 = insFld(aux1, gFld("Samples", ""))
		insDoc(aux2, gLnk("R", "Tharu", "amovahap.xml#30_04_16at10_55_55_group0"))
		insDoc(aux2, gLnk("R", "Oriental", "amovahap.xml#30_04_16at10_55_55_group1"))
		insDoc(aux2, gLnk("R", "Wolof", "amovahap.xml#30_04_16at10_55_55_group2"))
		insDoc(aux2, gLnk("R", "Peul", "amovahap.xml#30_04_16at10_55_55_group3"))
		insDoc(aux2, gLnk("R", "Pima", "amovahap.xml#30_04_16at10_55_55_group4"))
		insDoc(aux2, gLnk("R", "Maya", "amovahap.xml#30_04_16at10_55_55_group5"))
		insDoc(aux2, gLnk("R", "Finnish", "amovahap.xml#30_04_16at10_55_55_group6"))
		insDoc(aux2, gLnk("R", "Sicilian", "amovahap.xml#30_04_16at10_55_55_group7"))
		insDoc(aux2, gLnk("R", "Israeli Jew", "amovahap.xml#30_04_16at10_55_55_group8"))
		insDoc(aux2, gLnk("R", "Israeli Arab", "amovahap.xml#30_04_16at10_55_55_group9"))
		aux2 = insFld(aux1, gFld("Within-samples summary", ""))
		aux2 = insFld(aux1, gFld("Loci under selection", "amovahap.xml#30_04_16at10_55_55_fdist2_"))
