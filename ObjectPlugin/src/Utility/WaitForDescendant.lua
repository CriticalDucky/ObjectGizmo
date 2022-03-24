return function (descendantOf, str)
	assert(typeof(descendantOf) == "Instance", "Invalid type for argument 1 (descendatOf)")
	assert(typeof(str) == "string", "Invalid type for argument 2 (str)")
	
	local TIMEOUT = 10

	if descendantOf:FindFirstChild(str, true) then
		return descendantOf:FindFirstChild(str, true)
	else
		local object
		
		coroutine.wrap(function()
			task.wait(TIMEOUT)

			if not object then
				warn("Infinite yield possible on "..tostring(descendantOf)..":WaitForDescendant("..str..")")
			end
		end)()

		repeat
			local descendant = descendantOf.DescendantAdded:Wait()
			
			object = if descendant.Name == str then descendant else nil
		until object

		return object
	end
end