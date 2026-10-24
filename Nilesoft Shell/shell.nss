settings
{
	priority=1
	exclude.where = !process.is_explorer
	showdelay = 200
	// Options to allow modification of system items
	modify.remove.duplicate=1
	tip.enabled=true
}

import 'imports/theme.nss'
import 'imports/images.nss'
import 'imports/modify.nss'

menu(mode="multiple" title="Pin/Unpin" image=icon.pin)
{
}

menu(mode="multiple" title=title.more_options image=icon.more_options)
{
}

import 'imports/terminal.nss'
import 'imports/file-manage.nss'
import 'imports/develop.nss'
import 'imports/goto.nss'
import 'imports/taskbar.nss'

// Remove specific context menu items
remove(find="Open with Visual Studio")
remove(find="Open Git GUI here")
remove(find="Open Git Bash here")
remove(find="WizTree")
remove(find="File Pilot")
remove(find="NVIDIA APP")
remove(find="NVIDIA Control Panel")
remove(find="Display settings")
remove(find="Personalize")
