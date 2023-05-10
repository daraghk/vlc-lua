
function descriptor()
	return {
		title = "VLC Extension - Print the number of packets read every second.",
		version = "0.1",
		author = "Daragh King",
		url = 'http://',
		shortdesc = "Print the number of packets read every second." ,
		description = "Print the number of packets read every second." ,
		capabilities = {"menu", "input-listener", "meta-listener", "playing-listener"}
	}
end

function activate()
	-- Extension starts here
    local player_item = vlc.player.item()
    while(true)
    do
        local stats = player_item:stats()
        print("Current number of packets read: " .. tostring(stats.read_packets))
        os.execute("sleep " .. tonumber(1))
    end
end

function deactivate()
	-- what should be done on deactivation of extension
    print("Deactivating Extension")
end

function close()
	-- function triggered on dialog box close event
	-- for example to deactivate extension on dialog box close:
	vlc.deactivate()
end
