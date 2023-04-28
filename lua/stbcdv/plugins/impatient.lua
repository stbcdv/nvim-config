local status, impatient = pcall(require, "impatient")
if not status then
	vim.notify("no impatient", vim.log.levels.ERROR)
	return
end

-- View profiling data
impatient.enable_profile()
