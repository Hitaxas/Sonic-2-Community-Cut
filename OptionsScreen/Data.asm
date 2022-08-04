
	; set the character set for menu text
	charset '@',"\27\30\31\32\33\34\35\36\37\38\39\40\41\42\43\44\45\46\47\48\49\50\51\52\53\54\55"
	charset '0',"\16\17\18\19\20\21\22\23\24\25"
	charset '*',$1A
	charset ':',$1C
	charset '.',$1D
	charset ' ',0

; =============================================================================

Txt_NoDraw:			    menutxt	"                 "	; byte_97CA:
Txt_Empty:			    menutxt	"                   "	; byte_97CA:
Txt_Unknown:            menutxt	"            UNKNOWN"	; byte_97CA:
Txt_PlayerSelect:	    menutxt	"* PLAYER SELECT *  "	; byte_97CA:
Txt_SonicAndMiles:	    menutxt	"    SONIC AND MILES"	; byte_97DC:
Txt_SonicAndTails:	    menutxt	"    SONIC AND TAILS"	; byte_97EC:
Txt_SonicAlone:		    menutxt	"        SONIC ALONE"	; byte_97FC:
Txt_MilesAlone:		    menutxt	"        MILES ALONE"	; byte_980C:
Txt_TailsAlone:		    menutxt	"        TAILS ALONE"	; byte_981C:
Txt_KnuxAlone:		    menutxt	"     KNUCKLES ALONE"	; byte_981C:
Txt_KnuxAndMiles:	    menutxt	" KNUCKLES AND MILES"	; byte_981C:
Txt_KnuxAndTails:	    menutxt	" KNUCKLES AND TAILS"	; byte_981C:

Txt_SonicOptions:	    menutxt	"SONIC OPTIONS      "
Txt_TailsOptions:	    menutxt	"TAILS OPTIONS      "
Txt_KnuxOptions:        menutxt	"KNUCKLES OPTIONS   "

Txt_None:			    menutxt	"               NONE"
Txt_InstaShield:        menutxt	"       INSTA SHIELD"
Txt_DropDash:		    menutxt	"          DROP DASH"
Txt_InstaAndDrop:	    menutxt	"     INSTA AND DROP"
Txt_HomingAttack:	    menutxt	"      HOMING ATTACK"
Txt_ShieldControl:	    menutxt	"     SHIELD CONTROL"

Txt_PhysicsStyle:	    menutxt	"PHYSICS STYLE      "
Txt_AirCurling:		    menutxt	"AIR CURLING        "
Txt_AirAbility:		    menutxt	"AIR ABILITY        "
Txt_ShieldAbilityStyle: menutxt	"SHIELD MOVE STYLE  "
Txt_CharStyle:		    menutxt	"PLAYER SPRITES     "
Txt_S2:				    menutxt	"            SONIC 2"
Txt_S1:				    menutxt	"            SONIC 1"
Txt_SCD:                menutxt	"           SONIC CD"
Txt_S3K:                menutxt	"           SONIC 3K"
Txt_Mania:			    menutxt	"        SONIC MANIA"
Txt_Original:		    menutxt	"           ORIGINAL"
Txt_Joey:			    menutxt	"               JOEY"
Txt_Hitaxas:			    menutxt	"            HITAXAS"

Txt_On:				    menutxt	"                 ON"
Txt_Off:                menutxt	"                OFF"
Txt_BGOnly:             menutxt	"            BG ONLY"
Txt_AnimOnly:           menutxt	"          ANIM ONLY"
Txt_AbilityOnly:        menutxt	"       ABILITY ONLY"

Txt_VsModeItems:        menutxt	"* VS MODE ITEMS *  "	; byte_982C:
Txt_AllKindsItems:	    menutxt	" ALL KINDS OF ITEMS"	; byte_983E:
Txt_TeleportOnly:	    menutxt	"      TELEPORT ONLY"	; byte_984E:

Txt_SoundTest:		    menutxt	"*  SOUND TEST   *  "	; byte_985E:

Txt_Back:               menutxt	"BACK               "

Txt_Options:			menutxt	"OPTIONS            "
Txt_GameplayOptions:	menutxt	"GAMEPLAY OPTIONS   "
Txt_StyleOptions:       menutxt	"STYLE OPTIONS      "
Txt_LevelOptions:       menutxt	"LEVEL OPTIONS      "
Txt_SystemOptions:		menutxt "SYSTEM OPTIONS     "

Txt_Playersprites:      menutxt	"PLAYER SPRITES     "
Txt_Itemsprites:		menutxt	"ITEM SPRITES       "
Txt_Titlecard:          menutxt	"TITLE CARD         "

Txt_WaterSoundFilter:   menutxt "WATER SND FILTER   "
Txt_WaterRipple:        menutxt "WATER RIPPLE       "

Txt_PeelOut:	        menutxt "PEEL OUT           "
Txt_Flight:		        menutxt "FLIGHT             "
Txt_OnWithAssist:       menutxt "     ON WITH ASSIST"
Txt_SpeedTrail:     	menutxt "SPEED TRAIL        "

Txt_Scaling:			menutxt "SCALING            "
Txt_Integer:			menutxt "            INTEGER"
Txt_Fit:				menutxt "                FIT"
Txt_Stretch:			menutxt "            STRETCH"

Txt_MirrorMode:			menutxt "MIRROR MODE        "

Txt_Shields:			menutxt "SHIELDS            "
Txt_NormalOnly:			menutxt "        NORMAL ONLY"
Txt_ElementalAndNormal: menutxt "ELEMENTAL AND NRMAL"
Txt_ElementalAndRandom: menutxt " ELEMENTAL AND RND."
Txt_RandomizedElemental: menutxt "     RND. ELEMENTAL"
Txt_FireOnly:			menutxt "          FIRE ONLY"
Txt_ElectricOnly:		menutxt "      ELECTRIC ONLY"
Txt_BubbleOnly:			menutxt "        BUBBLE ONLY"

Txt_CameraStyle:		menutxt "CAMERA STYLE       "
Txt_Normal:				menutxt "             NORMAL"
Txt_Extended:			menutxt "           EXTENDED"

Txt_InvincShields:		menutxt "INVINC. SHIELDS    "
Txt_SuperMusic:			menutxt "SUPER MUSIC        "

Txt_ActTransitions:		menutxt "ACT TRANSITIONS    "
Txt_Instant:			menutxt "            INSTANT"

Txt_Credits:			menutxt "CREDITS            "
Txt_S2Credits:			menutxt "SONIC 2 CREDITS    "
Txt_ModCredits:			menutxt "MOD CREDITS        "
Txt_Music:				menutxt "MUSIC              "
Txt_SFX:				menutxt "SOUND EFFECTS      "
Txt_SoundOptions:		menutxt "SOUND OPTIONS      "

; =============================================================================

MenuItemLabel 		= 2
MenuItemValue 		= 4
MenuItemSub 		= 6
MenuItemSound 		= 8
MenuItemValuePlayer = 10
MenuItemValue2P 	= 12
MenuItemBack 	    = 14
MenuItemCredits 	= 16

menuitemdata_len	= 10
menuitemdata macro type,txtlabel,otherdataptr
	dc.w type
	dc.l txtlabel,otherdataptr
	endm

menuitemdatavalue_len	= 10
menuitemdatavalue macro maxval,address,txtlist
	dc.w maxval
	dc.l address,txtlist
	endm

; ===========================================================================

TxtList_CharacterJ:
	dc.l Txt_SonicAndMiles
	dc.l Txt_SonicAlone
	dc.l Txt_MilesAlone
	dc.l Txt_KnuxAlone
	dc.l Txt_KnuxAndMiles

TxtList_CharacterUE:
	dc.l Txt_SonicAndTails
	dc.l Txt_SonicAlone
	dc.l Txt_TailsAlone
	dc.l Txt_KnuxAlone
	dc.l Txt_KnuxAndTails

TxtList_PhysicsStyle:
	dc.l Txt_S2
	dc.l Txt_S1
	dc.l Txt_S3K
	dc.l Txt_Mania
	dc.l Txt_Joey
	dc.l Txt_Hitaxas

TxtList_CharStyle:
	dc.l Txt_Original
	dc.l Txt_S2
	dc.l Txt_S1
	dc.l Txt_SCD
	dc.l Txt_S3K

TxtList_2PItems:
	dc.l Txt_AllKindsItems
	dc.l Txt_TeleportOnly

TxtList_OffOn:
	dc.l Txt_Off
	dc.l Txt_On

TxtList_OnOff:
	dc.l Txt_On
	dc.l Txt_Off

TxtList_WaterRipple:
	dc.l Txt_On
	dc.l Txt_BGOnly
	dc.l Txt_Off

TxtList_SonicAbility:
	dc.l Txt_None
	dc.l Txt_InstaShield
	dc.l Txt_DropDash
	dc.l Txt_InstaAndDrop
	dc.l Txt_HomingAttack
	dc.l Txt_ShieldControl

TxtList_ShieldAbilityStyle:
	dc.l Txt_Original
	dc.l Txt_Mania
	dc.l Txt_Joey

TxtList_PeelOut:
	dc.l Txt_Off
	dc.l Txt_On
	dc.l Txt_AnimOnly
	dc.l Txt_AbilityOnly

TxtList_TailsFlight:
	dc.l Txt_OnWithAssist
	dc.l Txt_On
	dc.l Txt_Off

TxtList_Scaling:
	dc.l Txt_Fit
	dc.l Txt_Integer
	dc.l Txt_Stretch

TxtList_CameraStyle:
	dc.l Txt_Normal
	dc.l Txt_Extended
	dc.l Txt_SCD

TxtList_Shields:
	dc.l Txt_NormalOnly
	dc.l Txt_ElementalAndNormal
	dc.l Txt_ElementalAndRandom
	dc.l Txt_RandomizedElemental
	dc.l Txt_FireOnly
	dc.l Txt_ElectricOnly
	dc.l Txt_BubbleOnly

TxtList_ActTransitions:
	dc.l Txt_Off
	dc.l Txt_On
	dc.l Txt_Instant

; =============================================================================

OptionsMenu_Main:
	dc.w 6
	menuitemdata MenuItemValuePlayer,	Txt_PlayerSelect,       OptionsMenu_Val_Player
	menuitemdata MenuItemValue2P, 		Txt_VsModeItems,        OptionsMenu_Val_2P
	menuitemdata MenuItemSound, 		Txt_SoundTest,          OptionsMenu_Val_Sound
	menuitemdata MenuItemSub,			Txt_GameplayOptions,    OptionsMenu_Gameplay
	menuitemdata MenuItemSub,			Txt_StyleOptions,       OptionsMenu_Style
	menuitemdata MenuItemSub,			Txt_SystemOptions,		OptionsMenu_Emulator
	menuitemdata MenuItemCredits,		Txt_Credits,			0

OptionsMenu_Val_Player: 	        menuitemdatavalue	4,          Player_option,	        TxtList_CharacterUE
OptionsMenu_Val_2P:			        menuitemdatavalue	1,          Option_2PItems,         TxtList_2PItems
OptionsMenu_Val_Sound:		        menuitemdatavalue	SFXlast, 	Sound_test_sound_byte,  0

; =============================================================================

OptionsMenu_Gameplay:
	dc.w 6 ; max index
	menuitemdata MenuItemBack,	        Txt_Back,               OptionsMenu_Main
	menuitemdata MenuItemSub,	        Txt_SonicOptions,       OptionsMenu_GameplaySonic
	menuitemdata MenuItemSub,	        Txt_TailsOptions,       OptionsMenu_GameplayTails
	menuitemdata MenuItemValue,         Txt_PhysicsStyle,       OptionsMenu_Val_Physics
	menuitemdata MenuItemValue,         Txt_AirCurling,         OptionsMenu_Val_AirCurling
	menuitemdata MenuItemValue,         Txt_InvincShields,      OptionsMenu_Val_InvincShields
	menuitemdata MenuItemSub,			Txt_LevelOptions,       OptionsMenu_Level

OptionsMenu_Val_Physics: 	        menuitemdatavalue	5,          Option_PhysicsStyle,    TxtList_PhysicsStyle
OptionsMenu_Val_AirCurling:         menuitemdatavalue	1,          Option_AirCurling,      TxtList_OffOn
OptionsMenu_Val_InvincShields:      menuitemdatavalue	1,          Option_InvincShields,   TxtList_OffOn

; =============================================================================

OptionsMenu_GameplaySonic:
	dc.w 3 ; max index
	menuitemdata MenuItemBack,      	Txt_Back,               OptionsMenu_Gameplay
	menuitemdata MenuItemValue,         Txt_AirAbility,         OptionsMenu_Val_SonicAbility
	menuitemdata MenuItemValue,         Txt_PeelOut,			OptionsMenu_Val_PeelOut
	menuitemdata MenuItemValue,         Txt_ShieldAbilityStyle, OptionsMenu_Val_ShieldAbilityStyle

OptionsMenu_Val_SonicAbility:       menuitemdatavalue	5,          Option_SonicAbility,        TxtList_SonicAbility
OptionsMenu_Val_PeelOut:			menuitemdatavalue	3,          Option_PeelOut,  			TxtList_PeelOut
OptionsMenu_Val_ShieldAbilityStyle: menuitemdatavalue	2,          Option_ShieldAbilityStyle,  TxtList_ShieldAbilityStyle

; =============================================================================

OptionsMenu_GameplayTails:
	dc.w 1 ; max index
	menuitemdata MenuItemBack,      	Txt_Back,               OptionsMenu_Gameplay
	menuitemdata MenuItemValue,         Txt_Flight,				OptionsMenu_Val_TailsFlight

OptionsMenu_Val_TailsFlight:		menuitemdatavalue	2,          Option_TailsFlight,        TxtList_TailsFlight

; =============================================================================

OptionsMenu_Style:
	dc.w 4 ; max index
	menuitemdata MenuItemBack,	Txt_Back,                OptionsMenu_Main
	menuitemdata MenuItemSub, 	Txt_SoundOptions,        OptionsMenu_Sound
	menuitemdata MenuItemValue, Txt_WaterRipple,         OptionsMenu_Val_WaterRipple
	menuitemdata MenuItemValue, Txt_SpeedTrail,          OptionsMenu_Val_SpeedTrail
	menuitemdata MenuItemValue, Txt_CameraStyle,         OptionsMenu_Val_CameraStyle

OptionsMenu_Val_WaterSoundFilter:   menuitemdatavalue	1,          Option_WaterSoundFilter,		TxtList_OffOn
OptionsMenu_Val_WaterRipple:        menuitemdatavalue	2,          Option_WaterRipple,		        TxtList_WaterRipple
OptionsMenu_Val_SpeedTrail:         menuitemdatavalue	1,          Option_SpeedTrail,		        TxtList_OnOff
OptionsMenu_Val_CameraStyle:   		menuitemdatavalue	2,          Option_CameraStyle,				TxtList_CameraStyle
OptionsMenu_Val_SuperMusic:   		menuitemdatavalue	1,          Option_SuperMusic,				TxtList_OnOff

; =============================================================================

OptionsMenu_Level:
	dc.w 2 ; max index
	menuitemdata MenuItemBack,	Txt_Back,               OptionsMenu_Gameplay
	menuitemdata MenuItemValue, Txt_Shields,			OptionsMenu_Val_Shields
	menuitemdata MenuItemValue, Txt_ActTransitions,		OptionsMenu_Val_ActTransitions

OptionsMenu_Val_Shields:   		menuitemdatavalue	6,      Option_Shields,			TxtList_Shields
OptionsMenu_Val_ActTransitions: menuitemdatavalue	1,      Option_ActTransitions,	TxtList_ActTransitions

; =============================================================================

OptionsMenu_Emulator:
	dc.w 2 ; max index
	menuitemdata MenuItemBack,	Txt_Back,               OptionsMenu_Main
	menuitemdata MenuItemValue, Txt_Scaling,			OptionsMenu_Val_Emulator_Scaling
	menuitemdata MenuItemValue, Txt_MirrorMode,			OptionsMenu_Val_Emulator_MirrorMode

OptionsMenu_Val_Emulator_Scaling:   	menuitemdatavalue	2,          Option_Emulator_Scaling,		TxtList_Scaling
OptionsMenu_Val_Emulator_MirrorMode:	menuitemdatavalue	1,          Option_Emulator_MirrorMode,		TxtList_OffOn

; =============================================================================

OptionsMenu_Credits:
	dc.w 2 ; max index
	menuitemdata MenuItemBack,		Txt_Back,               OptionsMenu_Main
	menuitemdata MenuItemCredits,	Txt_S2Credits,			0
	menuitemdata MenuItemCredits,	Txt_ModCredits,			0

; =============================================================================

OptionsMenu_Sound:
	dc.w 4 ; max index
	menuitemdata MenuItemBack,		Txt_Back,               OptionsMenu_Style
	menuitemdata MenuItemValue, 	Txt_Music,			    OptionsMenu_Val_Music
	menuitemdata MenuItemValue, 	Txt_SFX,			    OptionsMenu_Val_SFX
	menuitemdata MenuItemValue, 	Txt_WaterSoundFilter,   OptionsMenu_Val_WaterSoundFilter
	menuitemdata MenuItemValue, 	Txt_SuperMusic,         OptionsMenu_Val_SuperMusic

OptionsMenu_Val_Music:   	menuitemdatavalue	1,          Option_Music,		TxtList_OnOff
OptionsMenu_Val_SFX:	   	menuitemdatavalue	1,          Option_SFX,			TxtList_OnOff

; =============================================================================

	charset ; reset character set
	even