<?xml version="1.0" encoding="UTF-8"?>
<!--
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
-->
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<UiMod name="AutoDismount" version="2.0" date="3/3/2011" >
		<VersionSettings gameVersion="1.4.1" windowsVersion="1.0" savedVariablesVersion="1.0" />
		<Author name="Rhekua" email="rhekua@msn.com" />
		<Description text="Automatically dismounts you when abilities fail due to being mounted." />
		<Files>
			<File name="AutoDismount.lua" />
		</Files>
		<OnInitialize>
			<CallFunction name="AutoDismount.Initialize" />
		</OnInitialize>
		<OnUpdate />
		<OnShutdown />
	</UiMod>
</ModuleFile>
