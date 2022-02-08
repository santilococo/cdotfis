source sadedot/scripts/common.sh
setDialogBox "dialog"

    msg="\nEnter an absolute folder path where you would like to use the work account."
    gitWorkPath=$(displayDialogBox --inputbox "$msg" VALUES 3>&1 1>&2 2>&3)
    checkCancel "You must enter a path." && return
    gitWorkPath=$(echo "$gitWorkPath" | envsubst)
    mkdir -p "$gitWorkPath"
    while [[ ! -d "$gitWorkPath" ]]; do
        msg="\nPath isn't valid. Please try again."
        gitWorkPath=$(displayDialogBox --inputbox "$msg" VALUES 3>&1 1>&2 2>&3)
        checkCancel "You must enter a path." && return
        gitWorkPath=$(echo "$gitWorkPath" | envsubst)
        mkdir -p "$gitWorkPath"
    done

    gitWorkName=$(displayDialogBox --inputbox "\nEnter a name." VALUES 3>&1 1>&2 2>&3)
    checkCancel "You must enter a name." && return
    gitWorkMail=$(displayDialogBox --inputbox "\nEnter an e-mail." VALUES 3>&1 1>&2 2>&3)
    checkCancel "You must enter an e-mail." && return

        msg="\nPlease confirm that the data you entered is correct:\n\n -"
        msg="${msg} Name: ${gitWorkName}\n - E-mail: ${gitWorkMail}\n - Path: ${gitWorkPath}"
        displayDialogBox --yesno "$msg" && break