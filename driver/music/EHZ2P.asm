EmeraldHill2P_Header:
	sHeaderInit						; Z80 offset is $1380
	sHeaderTempo	$01, $A5
	sHeaderCh	$05, $03
	sHeaderDAC	EmeraldHill2P_DAC1
	sHeaderDAC	EmeraldHill2P_DAC2
	sHeaderFM	EmeraldHill2P_FM1, $F4, $0A
	sHeaderFM	EmeraldHill2P_FM2, $F4, $0F
	sHeaderFM	EmeraldHill2P_FM3, $F4, $0A
	sHeaderFM	EmeraldHill2P_FM4, $F4, $10
	sHeaderFM	EmeraldHill2P_FM5, $E8, $10
	sHeaderPSG	EmeraldHill2P_PSG1, $D0+$0C, $30, $00, v00
	sHeaderPSG	EmeraldHill2P_PSG2, $D0+$0C, $30, $00, v00
	sHeaderPSG	EmeraldHill2P_PSG3, $00, $28, $00, v00

	; Patch $00
	; $20
	; $66, $60, $65, $60,	$DF, $9F, $DF, $1F
	; $00, $09, $06, $0C,	$07, $06, $06, $08
	; $2F, $1F, $1F, $FF,	$1C, $16, $3A, $80
	spAlgorithm	$00
	spFeedback	$04
	spDetune	$06, $06, $06, $06
	spMultiple	$06, $00, $05, $00
	spRateScale	$03, $02, $03, $00
	spAttackRt	$1F, $1F, $1F, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$00, $09, $06, $0C
	spDecayRt	$07, $06, $06, $08
	spSustainLv	$02, $01, $01, $0F
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$1C, $16, $3A, $00

	; Patch $01
	; $0D
	; $32, $06, $08, $01,	$1F, $19, $19, $19
	; $0A, $05, $05, $05,	$00, $02, $02, $02
	; $3F, $2F, $2F, $2F,	$28, $86, $80, $8D
	spAlgorithm	$05
	spFeedback	$01
	spDetune	$03, $00, $00, $00
	spMultiple	$02, $06, $08, $01
	spRateScale	$00, $00, $00, $00
	spAttackRt	$1F, $19, $19, $19
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0A, $05, $05, $05
	spDecayRt	$00, $02, $02, $02
	spSustainLv	$03, $02, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$28, $06, $00, $0D

	; Patch $02
	; $3A
	; $61, $51, $08, $02,	$5D, $5D, $5D, $50
	; $04, $1F, $0F, $1F,	$00, $00, $00, $00
	; $1F, $0F, $5F, $0F,	$22, $22, $1E, $80
	spAlgorithm	$02
	spFeedback	$07
	spDetune	$06, $05, $00, $00
	spMultiple	$01, $01, $08, $02
	spRateScale	$01, $01, $01, $01
	spAttackRt	$1D, $1D, $1D, $10
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$04, $1F, $0F, $1F
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$01, $00, $05, $00
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$22, $22, $1E, $00

	; Patch $03
	; $02
	; $01, $02, $55, $04,	$92, $8E, $8D, $54
	; $0D, $00, $0C, $03,	$00, $00, $00, $00
	; $FF, $0F, $2F, $5F,	$16, $1D, $2A, $80
	spAlgorithm	$02
	spFeedback	$00
	spDetune	$00, $00, $05, $00
	spMultiple	$01, $02, $05, $04
	spRateScale	$02, $02, $02, $01
	spAttackRt	$12, $0E, $0D, $14
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$0D, $00, $0C, $03
	spDecayRt	$00, $00, $00, $00
	spSustainLv	$0F, $00, $02, $05
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$16, $1D, $2A, $00

	; Patch $04
	; $02
	; $75, $73, $71, $31,	$1F, $96, $58, $9F
	; $01, $03, $1B, $08,	$01, $01, $04, $05
	; $FF, $3F, $2F, $2F,	$24, $30, $29, $80
	spAlgorithm	$02
	spFeedback	$00
	spDetune	$07, $07, $07, $03
	spMultiple	$05, $03, $01, $01
	spRateScale	$00, $02, $01, $02
	spAttackRt	$1F, $16, $18, $1F
	spAmpMod	$00, $00, $00, $00
	spSustainRt	$01, $03, $1B, $08
	spDecayRt	$01, $01, $04, $05
	spSustainLv	$0F, $03, $02, $02
	spReleaseRt	$0F, $0F, $0F, $0F
	spTotalLv	$24, $30, $29, $00

EmeraldHill2P_FM1:
	sVoice		$04
	ssDetune	$01
	dc.b nG6, $06, nE6, nF6, nD6, nE6, nC6, nC6
	dc.b nA5

EmeraldHill2P_Jump1:
	sCall		EmeraldHill2P_Call1
	sVoice		$03
	saVol		$06
	dc.b nG4, $06
	sNoteTimeOut	$06
	dc.b nA4, $03, nC5, nC5, nA4
	sVoice		$04
	saVol		$FA
	sNoteTimeOut	$00
	sCall		EmeraldHill2P_Call1
	dc.b nRst, $12, nC6, $18, nA5, $0C, nC6, nBb5
	dc.b nC6, $06, nD6, $0C, nC6, $06, nBb5, $0C
	dc.b nC6, $18, nA5, $0C, nC6, nBb5, $06
	sVoice		$02
	saVol		$06
	dc.b nEb5, $06, nF5, nEb5, nRst, nEb5, nF5, nEb5
	sVoice		$04
	saVol		$FA
	dc.b nC6, $18, nA5, $0C, nC6, nBb5, nC6, $06
	dc.b nD6, $0C, nC6, $06, nBb5, $0C, nA5, $18
	dc.b nF5, $0C, nA5
	sVoice		$02
	saVol		$06
	dc.b nG5, $03, nRst, nG5, $06, nA5, $03, nG5
	dc.b nA5, $06, nG5, $03, nRst, $15
	sVoice		$04
	saVol		$FA
	sJump		EmeraldHill2P_Jump1

EmeraldHill2P_Call1:
	sVoice		$03
	saVol		$06
	dc.b nE5, $06
	sNoteTimeOut	$06
	dc.b nC5, $03, nA4, nC5, $06, nRst, nRst
	sVoice		$04
	saVol		$FA
	sNoteTimeOut	$00
	dc.b nB4, $06, $09, $03
	sVoice		$03
	saVol		$06
	sNoteTimeOut	$06
	dc.b nF5, $03, nF5, nRst, nF5, nRst, nF5
	sNoteTimeOut	$00
	dc.b nFs5, $06, nG5, nRst
	sNoteTimeOut	$06
	dc.b nG5, $03, $03, nA5, nG5
	sNoteTimeOut	$00
	dc.b nE5, $06
	sNoteTimeOut	$06
	dc.b nC5, $03, nA4, nC5, $06, nRst, nRst
	sNoteTimeOut	$00
	sVoice		$04
	saVol		$FA
	dc.b nE5, nG5, nE5
	sVoice		$02
	saVol		$06
	sNoteTimeOut	$06
	dc.b nF5, $03, nF5, nRst, nF5, nRst, nF5
	sNoteTimeOut	$00
	dc.b nFs5, $06, nG5, $03, nRst
	sVoice		$04
	saVol		$FA
	sRet

EmeraldHill2P_FM4:
	sVoice		$04
	saVol		$FA
	dc.b nRst, $03, nF6, $06, nD6, nE6, nC6, nD6
	dc.b nB5, nB5, nG5, $03
	saVol		$06

EmeraldHill2P_Loop3:
	sVoice		$01
	sPan		spRight
	saTranspose	$F4
	sNoteTimeOut	$06
	dc.b nRst, $06, nE5, $03, $09, $0C, nG5, $03
	dc.b $09, $06
	sVoice		$04
	sPan		spCenter
	saVol		$FA
	sNoteTimeOut	$00
	dc.b nA5
	sNoteTimeOut	$06
	saVol		$06
	sVoice		$01
	sPan		spRight
	dc.b nF5, $03, $09, $0C, nG5, $03, $09, $0C
	dc.b nE5, $03, $09, $0C, nG5, $03, $09, $06
	sVoice		$02
	sPan		spCenter
	saTranspose	$0C
	dc.b nA5, $03, nA5, nRst, nA5, nRst, nA5
	sNoteTimeOut	$00
	dc.b nBb5, $06, nB5, $03
	sVoice		$01
	sPan		spRight
	saTranspose	$F4
	sNoteTimeOut	$06
	dc.b nRst, nG5, $03, $09, $06
	sVoice		$02
	sPan		spCenter
	saTranspose	$0C
	sNoteTimeOut	$00
	sLoop		$00, $02, EmeraldHill2P_Loop3
	sVoice		$01
	sPan		spRight
	saTranspose	$F4
	sNoteTimeOut	$06
	dc.b nRst, $06, nA5, $03, $09, $03, $09, $03
	dc.b $09, $03, $03, nRst, $06, nG5, $03, $09
	dc.b $03, $09, $03, $09, $03, $03, nRst, $06
	dc.b nA5, $03, $09, $03, $09, $03, $09, $03
	dc.b $03
	sVoice		$02
	sPan		spCenter
	saTranspose	$0C
	sNoteTimeOut	$00
	dc.b nRst, $06, nG5, nA5, nG5, nRst, nG5, nA5
	dc.b nG5
	sVoice		$01
	sPan		spRight
	saTranspose	$F4
	sNoteTimeOut	$06
	dc.b nRst, $06, nA5, $03, $09, $03, $09, $03
	dc.b $09, $03, $03, nRst, $06, nG5, $03, $09
	dc.b $03, $09, $03, $09, $03, $03, nRst, $06
	dc.b nF5, $03, $09, $03, $09, $03, $09, $03
	dc.b $03
	sVoice		$02
	sPan		spCenter
	saTranspose	$0C
	sNoteTimeOut	$00
	dc.b nB5, $03, nRst, nB5, $06, nC6, $03, nB5
	dc.b nC6, $06, nB5, $03, nRst, $15
	sJump		EmeraldHill2P_Loop3

EmeraldHill2P_FM3:
	sVoice		$03
	sNoteTimeOut	$06
	dc.b nRst, $1E, nG5, $03, $03, nA5, nC6, nC6
	dc.b nA5

EmeraldHill2P_Jump2:
	sCall		EmeraldHill2P_Call2
	sVoice		$01
	sPan		spRight
	saTranspose	$F4
	sNoteTimeOut	$06
	saVol		$06
	dc.b nRst, $06, nF5, $03, $09, $06
	sVoice		$03
	sPan		spCenter
	saTranspose	$0C
	sNoteTimeOut	$00
	saVol		$FA
	dc.b nRst, nG5
	sNoteTimeOut	$06
	dc.b nA5, $03, nC6, nC6, nA5
	sCall		EmeraldHill2P_Call2
	sVoice		$01
	sPan		spRight
	saTranspose	$F4
	sNoteTimeOut	$06
	saVol		$06
	dc.b nRst, $06, nF5, $03, $09, $06, nRst, nG5
	dc.b $03, $09, $06
	sVoice		$03
	sPan		spCenter
	saTranspose	$0C
	sNoteTimeOut	$00
	saVol		$FA
	sCall		EmeraldHill2P_Call3
	dc.b nRst, $30
	sCall		EmeraldHill2P_Call3
	sVoice		$01
	sPan		spRight
	saTranspose	$F4
	sNoteTimeOut	$06
	saVol		$06
	dc.b nRst, $06, nG5, $03, $09, $03, $09, $03
	dc.b $09, $03, $03
	sVoice		$03
	sPan		spCenter
	saTranspose	$0C
	sNoteTimeOut	$00
	saVol		$FA
	sCall		EmeraldHill2P_Call3
	dc.b nRst, $30, nD6, $0C, nE6, nF6, nFs6, nG6
	dc.b $06
	sVoice		$01
	sPan		spRight
	saTranspose	$F4
	sNoteTimeOut	$06
	saVol		$06
	dc.b nB5, $03, $09, $03, $03
	sVoice		$03
	sPan		spCenter
	saTranspose	$0C
	sNoteTimeOut	$00
	saVol		$FA
	sNoteTimeOut	$00
	dc.b nRst, $06, nG5
	sNoteTimeOut	$06
	dc.b nA5, $03, nC6, nC6, nA5
	sJump		EmeraldHill2P_Jump2

EmeraldHill2P_Call3:
	sNoteTimeOut	$06
	dc.b nRst, $06, nA5, nF5, $03, nC5, $06, $03
	dc.b nF5, $06, nA5, nBb5, $03
	sNoteTimeOut	$00
	dc.b nA5, $09
	sRet

EmeraldHill2P_Call2:
	sNoteTimeOut	$00
	dc.b nE6, $06
	sNoteTimeOut	$06
	dc.b nC6, $03, nA5, nC6, $06, nRst, nRst, $09
	sVoice		$04
	sNoteTimeOut	$00
	dc.b nC5, nA4, $06
	sNoteTimeOut	$06
	sVoice		$03
	dc.b nF6, $03, nF6, nRst, nF6, nRst, nF6
	sNoteTimeOut	$00
	dc.b nFs6, $06, nG6, nRst
	sNoteTimeOut	$06
	dc.b nG6, $03, $03, nA6, nG6
	sNoteTimeOut	$00
	dc.b nE6, $06
	sNoteTimeOut	$06
	dc.b nC6, $03, nA5, nC6, $06
	sNoteTimeOut	$00
	sVoice		$04
	dc.b nRst, $0F, nF5, $06, nF5, nC5, $03
	sRet

EmeraldHill2P_FM5:
	sPan		spLeft, $01
	sVoice		$01
	dc.b nRst, $30

EmeraldHill2P_Loop4:
	sNoteTimeOut	$06
	dc.b nRst, $06, nG5, $03, $09, $0C, nB5, $03
	dc.b $09, $06, nRst, nA5, $03, $09, $0C, nB5
	dc.b $03, $09, $06
	sLoop		$00, $04, EmeraldHill2P_Loop4

EmeraldHill2P_Loop5:
	dc.b nRst, $06, nC6, $03, $09, $03, $09, $03
	dc.b $09, $03, $03, nRst, $06, nBb5, $03, $09
	dc.b $03, $09, $03, $09, $03, $03
	sLoop		$00, $03, EmeraldHill2P_Loop5
	dc.b nRst, $06, nA5, $03, $09, $03, $09, $03
	dc.b $09, $03, $03, nRst, $06, nD6, $03, $09
	dc.b $03, $1B
	sJump		EmeraldHill2P_Loop4

EmeraldHill2P_FM2:
	sVoice		$03
	sNoteTimeOut	$06
	dc.b nRst, $1E, nG4, $03, $03, nA4, nC5, nC5
	dc.b nA4
	sVoice		$00
	saVol		$FA

EmeraldHill2P_Loop1:
	sNoteTimeOut	$00
	dc.b nRst, $06, nC4, nA3, $03, $03, nG3, $06
	dc.b nRst, nB3, nA3, $03, $03, nG3, $06, nRst
	dc.b nA3, nG3, $03, $03, nF3, $06, nRst, nG3
	dc.b $06, $03, $03, nA3, nG3, nRst, $06, nC4
	dc.b nA3, $03, $03, nG3, $06, nRst, nB3, nA3
	dc.b $03, $03, nG3, $06
	sVoice		$04
	dc.b nC5
	sVoice		$00
	dc.b nA3, nG3, $03, $03, nF3, $06, nRst, nG3
	dc.b $06, $03, $03, nA3, nG3
	sLoop		$00, $02, EmeraldHill2P_Loop1

EmeraldHill2P_Loop2:
	dc.b nRst, $06, nF4, $03, $03, nD4, nD4, nC4
	dc.b nC4, nRst, $06, nF4, $03, $03, nD4, nD4
	dc.b nC4, nC4, nRst, $06, nEb4, $03, $03, nC4
	dc.b nC4, nBb3, nBb3, nRst, $06, nEb4, $03, $03
	dc.b nC4, nC4, nBb3, nBb3
	sLoop		$00, $03, EmeraldHill2P_Loop2
	dc.b nRst, $06, nD4, $03, $03, nC4, nC4, nA3
	dc.b nA3, nRst, $06, nD4, $03, $03, nC4, nC4
	dc.b nA3, nA3, nG3, $06, $06, nA3, $03, nG3
	dc.b nA3, $06, nG3, $18
	sJump		EmeraldHill2P_Loop1

EmeraldHill2P_DAC1:
	sStop

EmeraldHill2P_DAC2:
	dc.b dMidTom, $03, dMidTom, dMidTom, $06, dLowTom, $03, dLowTom
	dc.b dLowTom, $06, dFloorTom, $03, dFloorTom, dFloorTom, $06, dLowTom
	dc.b dFloorTom

EmeraldHill2P_Loop6:
	dc.b dKick, dKick, dFloorTom, nRst, dKick, dKick, dFloorTom, nRst
	sLoop		$00, $0F, EmeraldHill2P_Loop6
	dc.b dKick, dKick, dFloorTom, nRst, dMidTom, $03, dMidTom, dMidTom
	dc.b $06, dLowTom, dFloorTom
	sJump		EmeraldHill2P_Loop6

EmeraldHill2P_PSG1:
	dc.b nRst, $02
	sVolEnv		v08
	saVol		$20
	dc.b nG6, $03, nF6, nE6, nD6, nF6, nE6, nD6
	dc.b nC6, nE6, nD6, nC6, nB5, nC6, nB5, nA5
	dc.b nG5, $01
	saVol		-$20
	saTranspose	$04
	sJump		EmeraldHill2P_Jump3

EmeraldHill2P_PSG2:
	dc.b nRst, $30

EmeraldHill2P_Jump3:
	sNoteTimeOut	$06
	dc.b nRst, $06, nC5, $03, $09, $0C, nG5, $03
	dc.b $09, $06, nRst, nF5, $03, $09, $0C, nG5
	dc.b $03, $09, $06
	sLoop		$00, $04, EmeraldHill2P_Jump3
	sNoteTimeOut	$00
	sVolEnv		v0B
	dc.b nF5, $18, nF5, $0C, nF5, nEb5, nF5, $06
	dc.b nEb5, $0C, nF5, $06, nEb5, $0C, nF5, $18
	dc.b nF5, $0C, nF5, nEb5, $30, nF5, $18, nF5
	dc.b $0C, nF5, nEb5, nF5, $06, nEb5, $0C, nF5
	dc.b $06, nEb5, $0C, nF5, $18, nF5, $0C, nF5
	dc.b nG5, $06, nRst, $2A
	sJump		EmeraldHill2P_Jump3

EmeraldHill2P_PSG3:
	dc.b nRst, $30
	sVolEnv		v04
	sNoisePSG	$E7
	ssMod68k	$00, $01, $01, $01

EmeraldHill2P_Jump4:
	dc.b nHiHat, $03, $03, $06
	sJump		EmeraldHill2P_Jump4
