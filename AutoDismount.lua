--[[ 
AutoDismount
Warhammer Online: Age of Reckoning UI modification that automatically 
dismounts you when abilities fail due to being mounted.
    
Copyright (C) 2009-2011  Dillon "Rhekua" DeLoss
rhekua@msn.com		    www.rhekua.com

I was asked by this mod's previous author to remove him from the 
project and credits. How nice!

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]--

AutoDismount = {}

local MountAbilities = 
{
-- this is every "Summon Mount" ability in the game
[14593]=true,--	; TEST Magus Basic mounts^n
[14594]=true,--	Summon Mount^n
[14595]=true,--	Summon Mount^n
[14596]=true,--	Summon Mount^n
[14597]=true,--	Summon Mount^n
[14598]=true,--	Summon Mount^n
[14599]=true,--	Summon Mount^n
[14600]=true,--	Summon Mount^n
[14601]=true,--	Summon Mount^n
[14602]=true,--	Summon Mount^n
[14603]=true,--	Summon Mount^n
[14604]=true,--	Summon Mount^n
[14605]=true,--	Summon Mount^n
[14606]=true,--	Summon Mount^n
[14607]=true,--	Summon Mount^n
[14608]=true,--	Summon Mount^n
[14609]=true,--	Summon Mount^n
[14610]=true,--	Summon Mount^n
[14611]=true,--	Summon Mount^n
[14612]=true,--	Summon Mount^n
[14613]=true,--	Summon Mount^n
[14614]=true,--	Summon Mount^n
[14615]=true,--	Summon Mount^n
[14616]=true,--	Summon Mount^n
[14617]=true,--	Summon Mount^n
[14618]=true,--	Summon Mount^n
[14619]=true,--	Summon Mount^n
[14620]=true,--	Summon Mount^n
[14621]=true,--	Summon Mount^n
[14622]=true,--	Summon Mount^n
[14623]=true,--	Summon Mount^n
[14624]=true,--	Summon Mount^n
[14625]=true,--	Summon Mount^n
[14626]=true,--	Summon Mount^n
[14627]=true,--	Summon Mount^n
[14628]=true,--	Summon Mount^n
[14629]=true,--	Summon Mount^n
[14630]=true,--	Summon Mount^n
[14631]=true,--	Summon Mount^n
[14632]=true,--	Summon Mount^n
[14633]=true,--	Summon Mount^n
[14634]=true,--	Summon Mount^n
[14635]=true,--	Summon Mount^n
[14636]=true,--	Summon Mount^n
[14637]=true,--	Summon Mount^n
[14638]=true,--	Summon Mount^n
[14639]=true,--	Summon Mount^n
[14640]=true,--	Summon Mount^n
[14641]=true,--	Summon Mount^n
[14669]=true,--	; TEST Magus Mounts^n
[14670]=true,--	Summon Mount^n
[14671]=true,--	; TEST Dwarf Mounts^n
[14672]=true,--	Summon Mount^n
[14673]=true,--	; TEST Goblin Mounts^n
[14674]=true,--	Summon Mount^n
[14675]=true,--	; TEST Orc Mounts^n
[14676]=true,--	Summon Mount^n
[14677]=true,--	; TEST Empire Mounts^n
[14678]=true,--	Summon Mount^n
[14679]=true,--	; TEST Chaos Mounts^n
[14680]=true,--	Summon Mount^n
[14681]=true,--	; TEST High Elf Mounts^n
[14682]=true,--	Summon Mount^n
[14683]=true,--	; TEST Dark Elf Mounts^n
[14684]=true,--	Summon Mount^n
[14782]=true,--	; TEST Dwarf Light mounts^n
[14783]=true,--	Summon Mount^n
[14784]=true,--	Summon Mount^n
[14785]=true,--	Summon Mount^n
[14786]=true,--	Summon Mount^n
[14787]=true,--	Summon Mount^n
[14788]=true,--	Summon Mount^n
[14789]=true,--	; TEST Goblin Light mounts^n
[14790]=true,--	Summon Mount^n
[14791]=true,--	Summon Mount^n
[14792]=true,--	Summon Mount^n
[14793]=true,--	Summon Mount^n
[14794]=true,--	Summon Mount^n
[14795]=true,--	Summon Mount^n
[14796]=true,--	; TEST Orc Light mounts^n
[14797]=true,--	Summon Mount^n
[14798]=true,--	Summon Mount^n
[14799]=true,--	Summon Mount^n
[14800]=true,--	Summon Mount^n
[14801]=true,--	Summon Mount^n
[14802]=true,--	Summon Mount^n
[14803]=true,--	; TEST Empire Light mounts^n
[14804]=true,--	Summon Mount^n
[14805]=true,--	Summon Mount^n
[14806]=true,--	Summon Mount^n
[14807]=true,--	Summon Mount^n
[14808]=true,--	Summon Mount^n
[14809]=true,--	Summon Mount^n
[14810]=true,--	; TEST Chaos Light mounts^n
[14811]=true,--	Summon Mount^n
[14812]=true,--	Summon Mount^n
[14813]=true,--	Summon Mount^n
[14814]=true,--	Summon Mount^n
[14815]=true,--	Summon Mount^n
[14816]=true,--	Summon Mount^n
[14817]=true,--	; TEST High Elf Light mounts^n
[14818]=true,--	Summon Mount^n
[14819]=true,--	Summon Mount^n
[14820]=true,--	Summon Mount^n
[14821]=true,--	Summon Mount^n
[14822]=true,--	Summon Mount^n
[14823]=true,--	Summon Mount^n
[14824]=true,--	; TEST Dark Elf Light mounts^n
[14825]=true,--	Summon Mount^n
[14826]=true,--	Summon Mount^n
[14827]=true,--	Summon Mount^n
[14828]=true,--	Summon Mount^n
[14829]=true,--	Summon Mount^n
[14830]=true,--	Summon Mount^n
[14831]=true,--	; TEST Dwarf Heavy mounts^n
[14832]=true,--	Summon Mount^n
[14833]=true,--	Summon Mount^n
[14834]=true,--	Summon Mount^n
[14835]=true,--	Summon Mount^n
[14836]=true,--	Summon Mount^n
[14837]=true,--	Summon Mount^n
[14838]=true,--	; TEST Goblin Heavy mounts^n
[14839]=true,--	Summon Mount^n
[14840]=true,--	Summon Mount^n
[14841]=true,--	Summon Mount^n
[14842]=true,--	Summon Mount^n
[14843]=true,--	Summon Mount^n
[14844]=true,--	Summon Mount^n
[14845]=true,--	; TEST Orc Heavy mounts^n
[14846]=true,--	Summon Mount^n
[14847]=true,--	Summon Mount^n
[14848]=true,--	Summon Mount^n
[14849]=true,--	Summon Mount^n
[14850]=true,--	Summon Mount^n
[14851]=true,--	Summon Mount^n
[14852]=true,--	; TEST Empire Heavy mounts^n
[14853]=true,--	Summon Mount^n
[14854]=true,--	Summon Mount^n
[14855]=true,--	Summon Mount^n
[14856]=true,--	Summon Mount^n
[14857]=true,--	Summon Mount^n
[14858]=true,--	Summon Mount^n
[14979]=true,--	; TEST Chaos Heavy mounts^n
[14980]=true,--	Summon Mount^n
[14981]=true,--	Summon Mount^n
[14982]=true,--	Summon Mount^n
[14983]=true,--	Summon Mount^n
[14984]=true,--	Summon Mount^n
[14985]=true,--	Summon Mount^n
[14986]=true,--	; TEST High Elf Heavy mounts^n
[14987]=true,--	Summon Mount^n
[14988]=true,--	Summon Mount^n
[14989]=true,--	Summon Mount^n
[14990]=true,--	Summon Mount^n
[14991]=true,--	Summon Mount^n
[14992]=true,--	Summon Mount^n
[14993]=true,--	; TEST Dark Elf Heavy mounts^n
[14994]=true,--	Summon Mount^n
[14995]=true,--	Summon Mount^n
[14996]=true,--	Summon Mount^n
[14997]=true,--	Summon Mount^n
[14998]=true,--	Summon Mount^n
[14999]=true,--	Summon Mount^n
[15601]=true,--	; TEST Magus Light mounts^n
[15602]=true,--	Summon Mount^n
[15603]=true,--	Summon Mount^n
[15604]=true,--	Summon Mount^n
[15605]=true,--	Summon Mount^n
[15606]=true,--	Summon Mount^n
[15607]=true,--	Summon Mount^n
[15608]=true,--	; TEST Magus Heavy mounts^n
[15609]=true,--	Summon Mount^n
[15610]=true,--	Summon Mount^n
[15611]=true,--	Summon Mount^n
[15612]=true,--	Summon Mount^n
[15613]=true,--	Summon Mount^n
[15614]=true,--	Summon Mount^n
[15051]=true,--   Summon Mount (?)
[14970]=true,--   Summon Manticore (Referral Mount?)
[14971]=true,--   Summon Griffon (Referral Mount)
[14972]=true,--   Summon Manticore (Referral Mount)
[14973]=true,--   Summon Manticore Bone Disc (Referral Mount)
[14974]=true,--   Summon Manticore (Referral Mount?)
[15074]=true,--   Summon Black Arabian Steed
[15075]=true,--   Summon Exotic Grey Arabian Steed
[15076]=true,--   Summon Pinto Arabian Steed
[15077]=true,--   Summon Midnight Arabian Disc
[10954]=true,--   Fleet Stag Mantle
}

--local MountTable = {[20215]=true, [20221]=true, [20219]=true, [20216]=true, [2497]=true, [20217]=true, [20220]=true, [20218]=true}

function AutoDismount.Initialize()
	RegisterEventHandler(SystemData.Events.SHOW_ALERT_TEXT, "AutoDismount.OnAlertTextShown")
	RegisterEventHandler(TextLogGetUpdateEventId("Combat"), "AutoDismount.OnCombatLogUpdated")
	
	for i = 28900, 28995 do -- this entire block of spells are all named "Summon Mount"
		MountAbilities[i] = true
	end
end

function AutoDismount.Shutdown()
	UnregisterEventHandler(SystemData.Events.SHOW_ALERT_TEXT, "AutoDismount.OnAlertTextShown")
	UnregisterEventHandler(TextLogGetUpdateEventId("Combat"), "AutoDismount.OnCombatLogUpdated")
end

function AutoDismount.CheckMountAbilities(arg)
	if( arg ~= nil ) then
		arg = towstring(arg)
	else
		arg = L"Summon Mount"
	end
	for i = 1, 1000000 do 
	-- yep, thats 1,000,000! i'm sure there aren't this many abilities but i want to be THOROUGH
		if ( wstring.find(GetAbilityName(i), arg) ~= nil and MountAbilities[i] == nil ) then
			EA_ChatWindow.Print(towstring(i) .. L" " .. GetAbilityName(i))
		end
	end
end

function AutoDismount.Dismount()
	for k,v in pairs(GetBuffs(GameData.BuffTargetType.SELF)) do
		--if ( MountTable[v.iconNum] ) then
		if ( MountAbilities[v.abilityId] ) then
			RemoveEffect(v.effectIndex)
		end
	end
end

function AutoDismount.OnCombatLogUpdated( updateType, filterType )
	local combatLog = L""
	local combatLogType = 0

	-- check to prevent double parsing when TextLog entries are capped at around 2048
	if ( updateType == 0 ) then
		_,combatLogType,combatLog = TextLogGetEntry("Combat", TextLogGetNumEntries("Combat")-1)
		if ( filterType == 1011 ) then
			AutoDismount.Dismount()
		end
		--EA_ChatWindow.Print(towstring(filterType) .. L" " .. towstring(combatLogType) .. L" " .. combatLog)
	end
end

function AutoDismount.OnAlertTextShown()
	if ( SystemData.AlertText.VecType[1] == 1 ) then
		AutoDismount.Dismount()
	end
end
