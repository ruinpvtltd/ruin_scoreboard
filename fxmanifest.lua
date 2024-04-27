fx_version 'cerulean'

game 'gta5'
description 'This is a clean and simple scoreboard script with low ms by RUIN PVT LTD'
lua54 'yes'
version '1.0'

--Client Scripts-- 
client_scripts {
 'Client/*.lua'
}


--Server Scripts-- 
server_scripts {
 'Server/*.lua'
}
shared_scripts {
    'Shared.lua'
}
--UI Part-- 
ui_page {
 'html/index.html', 
}

--File Part-- 
files {
 'html/index.html',
 'html/app.js', 
 'html/style.css'
} 

dependencies {
	'ruin_lib',
}
