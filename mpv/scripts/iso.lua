-- iso.lua
--
-- Open ISO files and VIDEO_TS folders as DVD

function is_dvd_source(path)
    return string.match(path, "%.[iI][sS][oO]$") or
           string.match(path, "/VIDEO_TS") or
           string.match(path, "\\VIDEO_TS") -- For Windows paths
end

function dvd_or_stream()
    local path = mp.get_property("path", "")
    if not path or path == "" then
        return
    end

    if is_dvd_source(path) then
        if not string.match(path, "^dvd://") then
            mp.set_property("dvd-device", path)
            mp.set_property("path", "dvd://")
            print("dvd detected")
            -- Removed the stop and play commands to avoid issues
            -- Consider prompting the user to restart playback if necessary
        end
    else
        -- Not an ISO or VIDEO_TS, and not already set to DVD mode
        mp.command("script-binding video_formats_toggle")
    end
end

mp.register_event("start-file", function()
    local path = mp.get_property("stream-open-filename", "")
    if is_dvd_source(path) then
        dvd_or_stream()
    end
end)