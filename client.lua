local displayTime = true
local useMilitaryTime = false
local displayDayOfWeek = true
local displayDate = true

local timeAndDateString = nil
local hour
local minute
local dayOfWeek
local month
local dayOfMonth
local year

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

-- Define the variable used to open/close the tab
local WatchEnabled = false
local radartablet  = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1) 

		if IsControlJustPressed(0, Keys['F10'])then
			if radartablet == true then 
                radartablet = false
                SendNUIMessage({
                    showWatch   = false,
                    hour        = '',
                    minute      = '',
                    dayOfWeek   = '' ,
                    month       = '',
                    dayOfMonth  = '',
                    year        = ''
                })
			else 
                radartablet = true 
                
                CalculateTimeToDisplay()
                CalculateDayOfWeekToDisplay()
                CalculateDateToDisplay()

                SendNUIMessage({
                    showWatch   = true,
                    hour        = hour,
                    minute      = minute,
                    dayOfWeek   = dayOfWeek ,
                    month       = month,
                    dayOfMonth  = dayOfMonth,
                    year        = year
                })
			end		
 
		end	
	end
end)


function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()

	if useMilitaryTime == false then
		if hour == 0 or hour == 24 then
			hour = 12
		elseif hour >= 13 then
			hour = hour - 12
		end
	end

	if hour <= 9 then
		hour = "0" .. hour
	end
	if minute <= 9 then
		minute = "0" .. minute
	end
end

function CalculateDayOfWeekToDisplay()
	dayOfWeek = GetClockDayOfWeek()
	
	if dayOfWeek == 0 then
		dayOfWeek = "Pazar"
	elseif dayOfWeek == 1 then
		dayOfWeek = "Pazartesi"
	elseif dayOfWeek == 2 then
		dayOfWeek = "Sali"
	elseif dayOfWeek == 3 then
		dayOfWeek = "Çarşamba"
	elseif dayOfWeek == 4 then
		dayOfWeek = "Perşembe"
	elseif dayOfWeek == 5 then
		dayOfWeek = "Cuma"
	elseif dayOfWeek == 6 then
		dayOfWeek = "Cumartesi"
	end
end

function CalculateDateToDisplay()
	month = GetClockMonth()
	dayOfMonth = GetClockDayOfMonth()
	year = GetClockYear()
	
	if month == 0 then
		month = "Ocak"
	elseif month == 1 then
		month = "Şubat"
	elseif month == 2 then
		month = "Mart"
	elseif month == 3 then
		month = "Nisan"
	elseif month == 4 then
		month = "Mayıs"
	elseif month == 5 then
		month = "Haziran"
	elseif month == 6 then
		month = "Temmuz"
	elseif month == 7 then
		month = "Ağustos"
	elseif month == 8 then
		month = "Eylül"
	elseif month == 9 then
		month = "Ekim"
	elseif month == 10 then
		month = "Kasim"
	elseif month == 11 then
		month = "Aralik"
	end
end