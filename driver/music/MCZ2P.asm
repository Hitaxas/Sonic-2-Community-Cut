MysticCave2P_Header:
	sHeaderInit						; Z80 offset is $1380
	sHeaderTempo	$01, $14
	sHeaderCh	$05, $03
	sHeaderDAC	MysticCave2P_DAC1
	sHeaderDAC	MysticCave2P_DAC2
	sHeaderFM	MysticCave2P_FM1, $00, $10
	sHeaderFM	MysticCave2P_FM2, $18, $0D
	sHeaderFM	MysticCave2P_FM3, $00, $12
	sHeaderFM	MysticCave2P_FM4, $00, $18
	sHeaderFM	MysticCave2P_FM5, $00, $18
	sHeaderPSG	MysticCave2P_PSG1, $DC+$0C, $28, $00, v0C
	sHeaderPSG	MysticCave2P_PSG2, $E8+$0C, $30, $00, v04
	sHeaderPSG	MysticCave2P_PSG3, $DC+$0C, $20, $00, v0C

	; Patch $00
	; $3A
	; $69, $50, $70, $60,	$1C, $1A, $18, $18
	; $10, $02, $0C, $09,	$08, $06, $06, $03
	; $F9, $06, $56, $06,	$28, $14, $15, $00
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$06, $05, $07, $06
	spMultiple	$09, $00, $00, $00
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1C, $1A, $18, $18
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$10, $02, $0C, $09
	spDecayRt	$08, $06, $06, $03
	spSustainLv	$0F, $00, $05, $00
	spReleaseRt	$09, $06, $06, $06
	spTotalLv	$28, $14, $15, $00

	; Patch $01
	; $3A
	; $02, $02, $04, $02,	$8E, $8D, $8E, $53
	; $0E, $0E, $0B, $0D,	$01, $00, $00, $00
	; $13, $13, $FA, $0A,	$19, $29, $19, $00
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$02, $02, $04, $02
	spRateScale	$02, $02, $02, $01
	spAttackRt	$0E, $0D, $0E, $13
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0E, $0E, $0B, $0D
	spDecayRt	$01, $00, $00, $00
	spSustainLv	$01, $01, $0F, $00
	spReleaseRt	$03, $03, $0A, $0A
	spTotalLv	$19, $29, $19, $00

	; Patch $02
	; $3D
	; $00, $02, $01, $01,	$4C, $50, $0F, $12
	; $0C, $00, $02, $05,	$01, $00, $00, $00
	; $28, $2A, $29, $19,	$1A, $06, $00, $00
	spAlgorithm	$05
	spFeedback	$07
	spDetune	$00, $00, $00, $00
	spMultiple	$00, $02, $01, $01
	spRateScale	$01, $01, $00, $00
	spAttackRt	$0C, $10, $0F, $12
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0C, $00, $02, $05
	spDecayRt	$01, $00, $00, $00
	spSustainLv	$02, $02, $02, $01
	spReleaseRt	$08, $0A, $09, $09
	spTotalLv	$1A, $06, $00, $00

	; Patch $03
	; $06
	; $62, $13, $23, $71,	$0D, $6D, $0D, $0E
	; $09, $06, $06, $06,	$00, $00, $00, $00
	; $1F, $2F, $2F, $2F,	$10, $97, $94, $80
	spAlgorithm	$06
	spFeedback	$00
	spDetune	$06, $01, $02, $07
	spMultiple	$02, $03, $03, $01
	spRateScale	$00, $01, $00, $00
	spAttackRt	$0D, $0D, $0D, $0E
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$09, $06, $06, $06
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$01, $02, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$10, $17, $14, $00

	; Patch $04
	; $2C
	; $71, $31, $71, $31,	$1F, $1F, $16, $16
	; $00, $00, $0F, $0F,	$00, $00, $0F, $0F
	; $00, $00, $FA, $FA,	$15, $14, $00, $00
	spAlgorithm	$04
	spFeedback	$05
	spDetune	$07, $03, $07, $03
	spMultiple	$01, $01, $01, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $1F, $16, $16
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $00, $0F, $0F
	spDecayRt	$00, $00, $0F, $0F
	spSustainLv	$00, $00, $0F, $0F
	spReleaseRt	$00, $00, $0A, $0A
	spTotalLv	$15, $14, $00, $00


MysticCave2P_Call1:
	dc.b nG4, $08, nA4, nB4
	sRet

MysticCave2P_Call2:
	dc.b nF4, $30, sHold, $30, sHold, nF4, nRst, $18
	dc.b nG4, $08, nA4, nB4, nF4, $30, sHold, $30
	dc.b sHold, $30, sHold, $24
	sRet

MysticCave2P_Call4:
	dc.b nRst, $30, nRst, nB4, $06, nC5, nB4, nG4
	dc.b nA4, nF4, $0C, nG4, nD4, nD4, $06, nF4
	dc.b $0C, nG4
	sRet

MysticCave2P_Call3:
	dc.b nB4, $30, sHold, $30, nC5, $30, sHold, $24
	dc.b nB4, $06, nC5, nD5, $30, sHold, $30, nB4
	dc.b $30, sHold, $30, nB4, $30, sHold, $30, nC5
	dc.b $30, sHold, $24, nB4, $06, nC5, nD5, $30
	dc.b sHold, $30, nF5, $30, sHold, $30, nG5, $24
	dc.b nF5, nE5, $18, nF5, $24, nE5, nC5, $18
	sRet

MysticCave2P_FM2:
	dc.b nRst, $18
	sVoice		$00

MysticCave2P_Jump2:
	dc.b nG1, $0C, nD1, nF1, nD1, $06, nG1, $05
	dc.b nG1, $07, $06, nD1, $0C, nF1, nD1
	sJump		MysticCave2P_Jump2

MysticCave2P_FM1:
	sVoice		$02
	saVol		$12
	sCall		MysticCave2P_Call1

MysticCave2P_Jump1:
	sCall		MysticCave2P_Call2
	ssMod68k	$24, $01, $03, $04
	dc.b nRst, $0C
	saVol		$E6
	sVoice		$03
	sCall		MysticCave2P_Call3
	dc.b $24, nB4, nD5, $18, sHold, $30, sHold, $30
	dc.b nB5, $24, nA5, nG5, $18, nA5, $24, nG5
	dc.b nE5, $18, nE5, nF5, $0C, nD5, $30, sHold
	dc.b $0C, sHold, $30, sHold, $24, nRst, $0C, nRst
	dc.b $30, nRst, nRst, nRst, nC5, $24, nE5, nG5
	dc.b $18, nF5, $24, nD5, nB4, $18, nB4, nC5
	dc.b $0C, nB4, $30, sHold, $0C, sHold, $30, sHold
	dc.b $18, nRst, $18, nC5, $24, nE5, nG5, $18
	dc.b nF5, $24, nD5, nB4, $18, nB5, $30, sHold
	dc.b $30, sHold, $30, sHold, $0C, nRst, $0C
	sModOff
	saVol		$1A
	sVoice		$02
	dc.b nE4, $08, nF4, nG4
	sJump		MysticCave2P_Jump1

MysticCave2P_PSG1:
	ssDetune	$02
	dc.b nRst, $1B

MysticCave2P_Jump6:
	dc.b nRst, $30, nRst, nRst, nRst, nRst, nRst, nRst
	dc.b nRst
	sCall		MysticCave2P_Call3
	dc.b $24, nB4, nD5, $18, sHold, $30, sHold, $30
	dc.b nB5, $24, nA5, nG5, $18, nA5, $24, nG5
	dc.b nE5, $18, nE5, nF5, $0C, nD5, $30, sHold
	dc.b $0C, sHold, $30, sHold, $24, nRst, $0C, nRst
	dc.b $30, nRst, nRst, nRst, nC5, $24, nE5, nG5
	dc.b $18, nF5, $24, nD5, nB4, $18, nB4, nC5
	dc.b $0C, nB4, $30, sHold, $0C, sHold, $30, sHold
	dc.b $18, nRst, $18, nC5, $24, nE5, nG5, $18
	dc.b nF5, $24, nD5, nB4, $18, nB5, $30, sHold
	dc.b $30, sHold, $30, sHold, $0C, nRst, $24
	sJump		MysticCave2P_Jump6

MysticCave2P_PSG3:
	dc.b nRst, $18

MysticCave2P_Jump8:
	dc.b nRst, $30, nRst, nRst, nRst, nRst, nRst, nRst
	dc.b nRst
	sCall		MysticCave2P_Call3
	dc.b $24, nB4, nD5, $18, sHold, $30, sHold, $30
	saVol		-$10
	dc.b nG5, $24, nF5, nE5, $18, nF5, $24, nE5
	dc.b nC5, $18, nC5, nD5, $0C, nB4, $30, sHold
	dc.b $0C, sHold, $30, sHold, $24, nRst, $0C, nRst
	dc.b $30, nRst, nRst, nRst, nA4, $24, nC5, nE5
	dc.b $18, nD5, $24, nB4, nG4, $18, nF4, nD4
	dc.b $0C, nG4, $30, sHold, $0C, sHold, $30, sHold
	dc.b $18, nRst, $18, nA4, $24, nC5, nE5, $18
	dc.b nD5, $24, nB4, nG4, $18, nG5, $30, sHold
	dc.b $30, sHold, $30, sHold, $0C, nRst, $24
	saVol		$10
	sJump		MysticCave2P_Jump8

MysticCave2P_FM4:
	sVoice		$02
	ssDetune	$02
	sPan		spLeft
	sCall		MysticCave2P_Call1

MysticCave2P_Jump4:
	sCall		MysticCave2P_Call2
	ssDetune	$00
	sVoice		$01
	saVol		$F2
	saTranspose	$F4
	dc.b nA3, $0C, nB3, $06, nRst, $30, nRst, $2A
	dc.b nRst, $30, nRst, $24, nC4, $0C, nB3, $06
	dc.b nRst, $30, nRst, $2A, nRst, $30, nRst, $24
	dc.b nA3, $0C, nB3, $06, nRst, $30, nRst, $2A
	dc.b nRst, $30, nRst, $24, nC4, $0C, nB3, $06
	dc.b nRst, $30, nRst, $2A, nRst, $30, nRst, nRst
	dc.b nRst, nG4, $24, nF4, nE4, $18, nF4, $24
	dc.b nE4, nC4, $18, $24, nB3, nD4, $18, sHold
	dc.b $30, sHold, $30, nB4, $24, nA4, nG4, $18
	dc.b nA4, $24, nG4, nE4, $18, nE4, nF4, $0C
	dc.b nD4, $24
	saVol		$0E
	saTranspose	$0C
	sVoice		$02
	sCall		MysticCave2P_Call1
	dc.b nF4, $30, sHold, $30, sHold, $30, sHold, $18
	dc.b nRst, $18
	saVol		$F2
	saTranspose	$F4
	sVoice		$01
	dc.b nRst, $30, nRst, nRst, nRst, $24, nG4, $06
	dc.b nF4, nG4, $0C, nG4, nF4, $06, nG4, $0C
	dc.b $06, nRst, $24, $06, nF4, nG4, $0C, nG4
	dc.b nF4, $06, nG4, $0C, $06, nRst, $30, nRst
	dc.b $30, nRst, nRst, nRst, $24, $06, nF4, nG4
	dc.b $0C, nG4, nF4, $06, nG4, $0C, $06, nRst
	dc.b $24, $06, nF4, nG4, $0C, nG4, nF4, $06
	dc.b nG4, $0C, $06, nRst, $18
	saVol		$0E
	saTranspose	$0C
	sVoice		$02
	sCall		MysticCave2P_Call1
	sJump		MysticCave2P_Jump4

MysticCave2P_FM5:
	dc.b nRst, $01
	sVoice		$02
	ssDetune	$FE
	sPan		spRight
	sCall		MysticCave2P_Call1

MysticCave2P_Jump5:
	sCall		MysticCave2P_Call2
	ssDetune	$FA
	saVol		$F2
	saTranspose	$F4
	sVoice		$01
	dc.b nF3, $0B, nG3, $06, nRst, $30, nRst, $2A
	dc.b nRst, $30, nRst, $24, nA3, $0C, nG3, $06
	dc.b nRst, $30, nRst, $2A, nRst, $30, nRst, $24
	dc.b nF3, $0C, nG3, $06, nRst, $30, nRst, $2A
	dc.b nRst, $30, nRst, $24, nA3, $0C, nG3, $06
	dc.b nRst, $30, nRst, $2A, nRst, $30, nRst, nRst
	dc.b nRst, nG4, $24, nF4, nE4, $18, nF4, $24
	dc.b nE4, nC4, $18, $24, nB3, nD4, $18, sHold
	dc.b $30, sHold, $30, nG4, $24, nF4, nE4, $18
	dc.b nF4, $24, nE4, nC4, $18, nC4, nD4, $0C
	dc.b nB3, $24
	saVol		$0E
	saTranspose	$0C
	sVoice		$02
	sCall		MysticCave2P_Call1
	dc.b nF4, $30, sHold, $30, sHold, $30, sHold, $18
	dc.b nRst, $18
	saVol		$F2
	saTranspose	$F4
	sVoice		$01
	dc.b nRst, $30, nRst, $30, nRst, $30, nRst, $24
	dc.b nD4, $06, nC4, nD4, $0C, nD4, nC4, $06
	dc.b nD4, $0C, $06, nRst, $24, $06, nC4, nD4
	dc.b $0C, nD4, nC4, $06, nD4, $0C, $06, nRst
	dc.b $30, nRst, $30, nRst, nRst, nRst, $24, $06
	dc.b nC4, nD4, $0C, nD4, nC4, $06, nD4, $0C
	dc.b $06, nRst, $24, $06, nC4, nD4, $0C, nD4
	dc.b nD4, $06, nC4, $0C, $06, nRst, $19
	saVol		$0E
	saTranspose	$0C
	sVoice		$02
	sCall		MysticCave2P_Call1
	sJump		MysticCave2P_Jump5

MysticCave2P_FM3:
	sVoice		$04
	dc.b nRst, $18

MysticCave2P_Jump3:
	saVol		$FC
	sCall		MysticCave2P_Call4
	sCall		MysticCave2P_Call4
	saVol		$04

MysticCave2P_Loop1:
	dc.b nB4, $0C, nB4, nB4, $06, nRst, $12, nA4
	dc.b $0C, nA4, nB4, $06, nRst, $12, $0C, $06
	dc.b nB4, $0C, nB4, nB4, $06, nA4, $0C, nC5
	dc.b nB4, $06, nRst, $12
	sLoop		$00, $09, MysticCave2P_Loop1

MysticCave2P_Loop2:
	dc.b nA4, $0C, nA4, nA4, $06, nRst, $12, nG4
	dc.b $0C, nG4, nA4, $06, nRst, $12, nG4, $0C
	dc.b $06, nG4, $0C, nG4, nG4, $06, nG4, $0C
	dc.b nE4, nG4, $06, nRst, $12, nB4, $0C, nB4
	dc.b nB4, $06, nRst, $12, nA4, $0C, nA4, nB4
	dc.b $06, nRst, $12, $0C, $06, nB4, $0C, nB4
	dc.b nB4, $06, nA4, $0C, nC5, nB4, $06, nRst
	dc.b $12
	sLoop		$00, $02, MysticCave2P_Loop2
	sJump		MysticCave2P_Jump3

MysticCave2P_PSG2:
	sNoteTimeOut	$08
	dc.b nRst, $18

MysticCave2P_Jump7:
	sCall		MysticCave2P_Call4
	sCall		MysticCave2P_Call4

MysticCave2P_Loop3:
	dc.b nG4, $0C, nG4, nG4, $06, nRst, $12, nF4
	dc.b $0C, nF4, nG4, $06, nRst, $12, $0C, $06
	dc.b nG4, $0C, nG4, nG4, $06, nF4, $0C, nA4
	dc.b nG4, $06, nRst, $12
	sLoop		$00, $09, MysticCave2P_Loop3

MysticCave2P_Loop4:
	dc.b nF4, $0C, nF4, nF4, $06, nRst, $12, nE4
	dc.b $0C, nE4, nF4, $06, nRst, $12, nE4, $0C
	dc.b $06, nE4, $0C, nE4, nE4, $06, nE4, $0C
	dc.b nC4, nE4, $06, nRst, $12, nG4, $0C, nG4
	dc.b nG4, $06, nRst, $12, nF4, $0C, nF4, nG4
	dc.b $06, nRst, $12, $0C, $06, nG4, $0C, nG4
	dc.b nG4, $06, nF4, $0C, nA4, nG4, $06, nRst
	dc.b $12
	sLoop		$00, $02, MysticCave2P_Loop4
	sJump		MysticCave2P_Jump7

MysticCave2P_DAC1:
	sStop

MysticCave2P_DAC2:
	dc.b nRst, $18

MysticCave2P_Jump9:
	dc.b dKick, $0C, dHiBongo, $06, dMidBongo, dSnare, $0C, dMidBongo
	dc.b $06, dLowBongo, dKick, $0C, dHiBongo, $06, dLowBongo, dSnare
	dc.b $0C, dHiBongo, $06, dLowBongo
	sJump		MysticCave2P_Jump9
