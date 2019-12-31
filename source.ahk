#NoEnv
#SingleInstance force
buildscr := 4
#Include includes/updater.ahk
SendMode Input
SetTitleMatchMode, RegEx

script = MC BINDER for Minecraft
author = m4x3r1337 

Menu,Tray,NoStandard 
Menu,Tray,DeleteAll
Menu,Tray,Icon,Shell32.dll,174
Menu,Tray,Add,Выход,MExit
Menu,Tray,Add,
Menu,Tray,Add,Показать настройки,MShow

ButtonLoadConfig()
{
	global
	IniRead, Key1, config.ini, MineBind, Key1, ^1
	Hotkey, % Key1, KKey1, Off, UseErrorLevel
	IniRead, Key2, config.ini, MineBind, Key2, ^2
	Hotkey, % Key2, KKey2, Off, UseErrorLevel
	IniRead, Key3, config.ini, MineBind, Key3, ^3
	Hotkey, % Key3, KKey3, Off, UseErrorLevel
	IniRead, Key4, config.ini, MineBind, Key4, ^4
	Hotkey, % Key4, KKey4, Off, UseErrorLevel
	IniRead, Key5, config.ini, MineBind, Key5, ^5
	Hotkey, % Key5, KKey5, Off, UseErrorLevel
	IniRead, Key6, config.ini, MineBind, Key6, ^6
	Hotkey, % Key6, KKey6, Off, UseErrorLevel
	IniRead, Bind1, config.ini, MineBind, Bind1, Бинд
	IniRead, Bind2, config.ini, MineBind, Bind2, Бинд
	IniRead, Bind3, config.ini, MineBind, Bind3, Бинд
	IniRead, Bind4, config.ini, MineBind, Bind4, Бинд
	IniRead, Bind5, config.ini, MineBind, Bind5, Бинд
	IniRead, Bind6, config.ini, MineBind, Bind6, Бинд
	Gosub, Save
	Hotkey, % Key1, KKey1, On, UseErrorLevel
	Hotkey, % Key2, KKey2, On, UseErrorLevel
	Hotkey, % Key3, KKey3, On, UseErrorLevel
	Hotkey, % Key4, KKey4, On, UseErrorLevel
	Hotkey, % Key5, KKey5, On, UseErrorLevel
	Hotkey, % Key6, KKey6, On, UseErrorLevel
	reload
}

LoadConfig()
{
	global
	IniRead, Key1, config.ini, MineBind, Key1, ^1
	Hotkey, % Key1, KKey1, On, UseErrorLevel
	IniRead, Key2, config.ini, MineBind, Key2, ^2
	Hotkey, % Key2, KKey2, On, UseErrorLevel
	IniRead, Key3, config.ini, MineBind, Key3, ^3
	Hotkey, % Key3, KKey3, On, UseErrorLevel
	IniRead, Key4, config.ini, MineBind, Key4, ^3
	Hotkey, % Key4, KKey4, On, UseErrorLevel
	IniRead, Key5, config.ini, MineBind, Key5, ^3
	Hotkey, % Key5, KKey5, On, UseErrorLevel
	IniRead, Key6, config.ini, MineBind, Key6, ^3
	Hotkey, % Key6, KKey6, On, UseErrorLevel
	IniRead, Bind1, config.ini, MineBind, Bind1, Бинд
	IniRead, Bind2, config.ini, MineBind, Bind2, Бинд
	IniRead, Bind3, config.ini, MineBind, Bind3, Бинд
	IniRead, Bind4, config.ini, MineBind, Bind4, Бинд
	IniRead, Bind5, config.ini, MineBind, Bind5, Бинд
	IniRead, Bind6, config.ini, MineBind, Bind6, Бинд
}

Save()
{
	global
	Gui, Submit, NoHide
	IniWrite, %Key1%, config.ini, MineBind, Key1
	IniWrite, %Key2%, config.ini, MineBind, Key2
	IniWrite, %Key3%, config.ini, MineBind, Key3
	IniWrite, %Key4%, config.ini, MineBind, Key4
	IniWrite, %Key5%, config.ini, MineBind, Key5
	IniWrite, %Key6%, config.ini, MineBind, Key6
	IniWrite, %Bind1%, config.ini, MineBind, Bind1
	IniWrite, %Bind2%, config.ini, MineBind, Bind2
	IniWrite, %Bind3%, config.ini, MineBind, Bind3
	IniWrite, %Bind4%, config.ini, MineBind, Bind4
	IniWrite, %Bind5%, config.ini, MineBind, Bind5
	IniWrite, %Bind6%, config.ini, MineBind, Bind6
}

SendChat(BindNumber)
{
	global
	IfWinActive,Minecraft.*
	{
		Send, {T}
		Sleep,100
		Sendinput,%BindNumber%{ENTER}
	}
}

LoadConfig()
Gui, Font, S9, Calibri
Gui,Add,Hotkey,x20 y30 w120 h21 vKey1,%Key1%
Gui,Add,Edit,x160 y30 w300 h21 vBind1,%Bind1%
Gui,Add,Hotkey,x20 y70 w120 h21 vKey2,%Key2%
Gui,Add,Edit,x160 y70 w300 h21 vBind2,%Bind2%
Gui,Add,Hotkey,x20 y110 w120 h21 vKey3,%Key3%
Gui,Add,Edit,x160 y110 w300 h21 vBind3,%Bind3%
Gui,Add,Hotkey,x20 y150 w120 h21 vKey4,%Key4%
Gui,Add,Edit,x160 y150 w300 h21 vBind4,%Bind4%
Gui,Add,Hotkey,x20 y190 w120 h21 vKey5,%Key5%
Gui,Add,Edit,x160 y190 w300 h21 vBind5,%Bind5%
Gui,Add,Hotkey,x20 y230 w120 h21 vKey6,%Key6%
Gui,Add,Edit,x160 y230 w300 h21 vBind6,%Bind6%
Gui,Add,Button,x200 y280 w43 h23 gLoad,load
Gui,Add,Button,x270 y280 w43 h23 gSave,save
Gui,Show,w500 h326,%script% %buildscr% by %author%
return

Save:
{
	Save()
	return
}
Load:
{
	ButtonLoadConfig()
	return
}
KKey1:
{
	SendChat(Bind1)
	Return
}
KKey2:
{
	SendChat(Bind2)
	Return
}
KKey3:
{
	SendChat(Bind3)
	Return
}
KKey4:
{
	SendChat(Bind4)
	Return
}
KKey5:
{
	SendChat(Bind5)
	Return
}
KKey6:
{
	SendChat(Bind6)
	Return
}
GuiClose:
{
	Save()
	TrayTip, %script% %buildscr% by %author%, Биндер свернут в трей. ПКМ по значку чтобы открыть его.
	Gui, Hide
	return
}
MExit:
{
	Save()
	ExitApp
	return
}
MShow:
{
	Gui, Restore
	return
}