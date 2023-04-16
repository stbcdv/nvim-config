local status, impatient = pcall(require, "impatient")
if not status then
	return
end

-- View profiling data
impatient.enable_profile()
