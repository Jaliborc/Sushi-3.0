--[[
Copyright 2008-2019 João Cardoso
Sushi is distributed under the terms of the GNU General Public License (or the Lesser GPL).
This file is part of Sushi.

Sushi is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Sushi is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Sushi. If not, see <http://www.gnu.org/licenses/>.
--]]

local Callable = LibStub('Sushi-3.1').Base:NewSushi('Callable', 1)
if not Callable then return end

function Callable:New(...)
	local f = self:Super(Callable):New(...)
	f.calls = {}
	return f
end

function Callable:SetCall(event, method)
	self.calls[event] = method
end

function Callable:GetCall(event)
	return self.calls and self.calls[event]
end

function Callable:FireCall(event, ...)
	local call = self:GetCall(event)
	if call then
		call(self, ...)
	end
end
