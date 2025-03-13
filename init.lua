require("git"):setup()

require("starship"):setup()

require("yaziline"):setup()

require("full-border"):setup()

require("eza-preview"):setup({
	-- Determines the directory depth level to tree preview (default: 3)
	level = 3,

	-- Whether to follow symlinks when previewing directories (default: false)
	follow_symlinks = true,

	-- Whether to show target file info instead of symlink info (default: false)
	dereference = true,
})

require("relative-motions"):setup({ show_numbers = "relative", show_motion = true, enter_mode = "first" })

-- enable the linemode
function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		time = os.date("%b %d %H:%M", time)
	else
		time = os.date("%b %d  %Y", time)
	end

	local size = self._file:size()
	return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end
