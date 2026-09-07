local workspaces = {
	{ name = "browser", key = "b" },
	{ name = "terminal", key = "t" },
	{ name = "search", key = "s" },
	{ name = "notes", key = "n" },
	{ name = "chat", key = "c" },
	{ name = "entertainment", key = "e" },
}

for _, ws in ipairs(workspaces) do
	hl.workspace_rule({
		workspace = "name:" .. ws.name,
	})
	hl.bind("ALT + " .. ws.key, hl.dsp.focus({ workspace = "name:" .. ws.name }))
	hl.bind("ALT + SHIFT + " .. ws.key, hl.dsp.window.move({ workspace = "name:" .. ws.name }))
end

for i = 1, 10 do
	local key = i % 10
	hl.bind("ALT + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("ALT + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
