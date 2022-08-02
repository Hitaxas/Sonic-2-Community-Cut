Obj_Knuckles:						  ; ...
	; a0=character
	tst.w	(Debug_placement_mode).w	; is debug mode being used?
	beq.s	Obj_Knuckles_Normal			; if not, branch
	jmp	(DebugMode).l
; ---------------------------------------------------------------------------

Obj_Knuckles_Normal:					  ; ...
	moveq	#0,d0
	move.b	routine(a0),d0
	move.w	Obj_Knuckles_Index(pc,d0.w),d1
	jmp	Obj_Knuckles_Index(pc,d1.w)
; End of function Obj_Knuckles

; ---------------------------------------------------------------------------
Obj_Knuckles_Index:	offsetTable
		offsetTableEntry.w Obj_Knuckles_Init		;  0
		offsetTableEntry.w Obj_Knuckles_Control	;  2
		offsetTableEntry.w Obj_Knuckles_Hurt		;  4
		offsetTableEntry.w Obj_Knuckles_Dead		;  6
		offsetTableEntry.w Obj_Knuckles_Gone		;  8
		offsetTableEntry.w Obj_Knuckles_Respawning	; $A
; ---------------------------------------------------------------------------

Obj_Knuckles_Init:					  ; ...
	addq.b	#2,routine(a0)	; => Obj_Knuckles_Control
	move.b	#$13,y_radius(a0) ; this sets Sonic's collision height (2*pixels)
	move.b	#9,x_radius(a0)
	move.l	#Mapunc_Knuckles,mappings(a0)
	move.w	#prio(2),priority(a0)
	move.b	#$18,width_pixels(a0)
	move.b	#4,render_flags(a0)
	lea		(Sonic_top_speed).w,a2	; Load Sonic_top_speed into a2
	jsr		ApplySpeedSettings	; Fetch Speed settings
	tst.b	(Last_star_pole_hit).w
	bne.s	Obj_Knuckles_Init_Continued
	; only happens when not starting at a checkpoint:
	move.w	#make_art_tile(ArtTile_ArtUnc_Sonic,0,0),art_tile(a0)
	jsr 	Adjust2PArtPointer
	move.b	#$C,top_solid_bit(a0)
	move.b	#$D,lrb_solid_bit(a0)
	move.w	x_pos(a0),(Saved_x_pos).w
	move.w	y_pos(a0),(Saved_y_pos).w
	move.w	art_tile(a0),(Saved_art_tile).w
	move.w	top_solid_bit(a0),(Saved_Solid_bits).w

Obj_Knuckles_Init_Continued:				  ; ...
	move.b	#0,flips_remaining(a0)
	move.b	#4,flip_speed(a0)
	move.b	#0,(Super_Sonic_flag).w
	move.b	#$1E,air_left(a0)
	subi.w	#$20,x_pos(a0)
	addi_.w	#4,y_pos(a0)
	move.w	#0,(Sonic_Pos_Record_Index).w

	move.w	#$3F,d2
-	bsr.w	Sonic_RecordPos
	subq.w	#4,a1
	move.l	#0,(a1)
	dbf	d2,-

	addi.w	#$20,x_pos(a0)
	subi_.w	#4,y_pos(a0)

Obj_Knuckles_Control:					  ; ...
    ;jmp Obj_Sonic_Control
	jsr		PanCamera
	tst.w	(Debug_mode_flag).w	; is debug cheat enabled?
	beq.s	+			; if not, branch
	btst	#button_B,(Ctrl_1_Press).w	; is button B pressed?
	beq.s	+			; if not, branch
	move.w	#1,(Debug_placement_mode).w	; change Sonic into a ring/item
	clr.b	(Control_Locked).w		; unlock control
	rts
; -----------------------------------------------------------------------
+	tst.b	(Control_Locked).w	; are controls locked?
	bne.s	+			; if yes, branch
	move.w	(Ctrl_1).w,(Ctrl_1_Logical).w	; copy new held buttons, to enable joypad control
	move.w	(Ctrl_6btn_1).w,(Ctrl_6btn_1_Logical).w
	move.w	(Ctrl_Analog_1).w,(Ctrl_Analog_1_Logical).w	; copy new held buttons, to enable joypad control
+
	btst	#0,obj_control(a0)	; is Sonic interacting with another object that holds him in place or controls his movement somehow?
	bne.s	+			; if yes, branch to skip Sonic's control
	moveq	#0,d0
	move.b	status(a0),d0
	andi.w	#6,d0	; %0000 %0110
	move.w	Obj_Knuckles_Modes(pc,d0.w),d1
	jsr	Obj_Knuckles_Modes(pc,d1.w)	; run Sonic's movement control code
+
	cmpi.w	#-$100,(Camera_Min_Y_pos).w	; is vertical wrapping enabled?
	bne.s	+				; if not, branch
	andi.w	#$7FF,y_pos(a0) 		; perform wrapping of Sonic's y position
+
	jsr 	Sonic_Display
	bsr.w	Knuckles_Super
	bsr.w	Sonic_RecordPos
	bsr.w	Sonic_Water
	move.b	(Primary_Angle).w,next_tilt(a0)
	move.b	(Secondary_Angle).w,tilt(a0)
	tst.b	(WindTunnel_flag).w
	beq.s	+
	tst.b	anim(a0)
	bne.s	+
	move.b	next_anim(a0),anim(a0)
+
	bsr.w	Knuckles_Animate
	tst.b	obj_control(a0)
	bmi.s	+
	jsr	(TouchResponse).l
+
	bra.w	LoadKnucklesDynPLC
	;jmp	    LoadSonicDynPLC
; ---------------------------------------------------------------------------

Obj_Knuckles_Modes:	offsetTable
    offsetTableEntry.w Obj_Knuckles_MdNormal	; 0 - not airborne or rolling
    offsetTableEntry.w Obj_Knuckles_MdAir			; 2 - airborne
    offsetTableEntry.w Obj_Knuckles_MdRoll			; 4 - rolling
    offsetTableEntry.w Obj_Knuckles_MdJump			; 6 - jumping

; =============== S U B	R O U T	I N E =======================================

Obj_Knuckles_MdNormal:					  ; ...
    bsr.w	Sonic_CheckSpindash
    bsr.w	Sonic_Jump
    bsr.w	Sonic_SlopeResist
    bsr.w	Sonic_Move
    bsr.w	Sonic_Roll
    bsr.w	Sonic_LevelBound
    jsr	ObjectMove		  ; AKA	SpeedToPos in Sonic 1
    bsr.w	AnglePos
    bsr.w	Sonic_SlopeRepel
    rts
; End of function Obj_Knuckles_MdNormal


; =============== S U B	R O U T	I N E =======================================


Obj_Knuckles_MdAir:					  ; ...
    tst.b	glidemode(a0)
    bne.s	Obj_Knuckles_MdAir_Gliding
    bsr.w	Knuckles_JumpHeight
	jsr		Sonic_AirCurl
    bsr.w	Sonic_ChgJumpDir
    bsr.w	Sonic_LevelBound
    jsr	ObjectMoveAndFall
    btst	#6,status(a0)
    beq.s	loc_31569C
    sub.w	#$28,y_vel(a0)

loc_31569C:					  ; ...
    bsr.w	Sonic_JumpAngle
    bsr.w	Sonic_DoLevelCollision
    rts
; ---------------------------------------------------------------------------

Obj_Knuckles_MdAir_Gliding:				  ; ...
    bsr.w	Knuckles_GlideSpeedControl
    bsr.w	Sonic_LevelBound
    jsr	ObjectMove		  ; AKA	SpeedToPos in Sonic 1
    bsr.w	Knuckles_GlideControl
	jsr		Sonic_AirCurl

return_3156B8:					  ; ...
    rts
; End of function Obj_Knuckles_MdAir


; =============== S U B	R O U T	I N E =======================================


Knuckles_GlideControl:		  ; ...

; FUNCTION CHUNK AT 00315C40 SIZE 0000003C BYTES

	move.b	glidemode(a0),d0
	beq.s	return_3156B8
	cmp.b	#2,d0
	beq.w	Knuckles_FallingFromGlide
	cmp.b	#3,d0
	beq.w	Knuckles_Sliding
	cmp.b	#4,d0
	beq.w	Knuckles_Climbing_Wall
	cmp.b	#5,d0
	beq.w	Knuckles_Climbing_Up

Knuckles_NormalGlide:
	move.b	#$A,y_radius(a0)
	move.b	#$A,x_radius(a0)
	bsr.w	Knuckles_DoLevelCollision2
	btst	#5,glideflags(a0)
	bne.w	Knuckles_BeginClimb
	move.b	#$13,y_radius(a0)
	move.b	#9,x_radius(a0)
	btst	#1,glideflags(a0)
	beq.s	Knuckles_BeginSlide
	move.b	(Ctrl_1_Held_Logical).w,d0
	and.b	#button_A_mask|button_B_mask|button_C_mask,d0
	bne.s	loc_31574C
	move.b	#2,glidemode(a0)
	move.b	#$21,anim(a0)
	bclr	#0,status(a0)
	tst.w	x_vel(a0)
	bpl.s	loc_315736
	bset	#0,status(a0)

loc_315736:			  ; ...
	asr	x_vel(a0)
	asr	x_vel(a0)
	move.b	#$13,y_radius(a0)
	move.b	#9,x_radius(a0)
	rts
; ---------------------------------------------------------------------------

loc_31574C:			  ; ...
	bra.w	sub_315C7C
; ---------------------------------------------------------------------------

Knuckles_BeginSlide:		  ; ...
	bclr	#0,status(a0)
	tst.w	x_vel(a0)
	bpl.s	loc_315762
	bset	#0,status(a0)

loc_315762:			  ; ...
	move.b	angle(a0),d0
	add.b	#$20,d0
	and.b	#$C0,d0
	beq.s	loc_315780
	move.w	inertia(a0),x_vel(a0)
	move.w	#0,y_vel(a0)
	bra.w	Knuckles_ResetOnFloor_Part2
; ---------------------------------------------------------------------------

loc_315780:			  ; ...
	move.b	#3,glidemode(a0)
	move.b	#$CC,mapping_frame(a0)
	move.b	#$7F,anim_frame_duration(a0)
	move.b	#0,anim_frame(a0)
	cmp.b	#$C,air_left(a0)
	bcs.s	return_3157AC
	move.b	#6,(Sonic_Dust+routine).w
	move.b	#$15,(Sonic_Dust+mapping_frame).w

return_3157AC:			  ; ...
	rts
; ---------------------------------------------------------------------------

Knuckles_BeginClimb:		  ; ...
    tst.b	(Knuckles_GlideSomething).w
	bmi.w	loc_31587A
	move.b	lrb_solid_bit(a0),d5
	move.b	glideunk(a0),d0
	add.b	#$40,d0
	bpl.s	loc_3157D8
	bset	#0,status(a0)
	bsr.w	CheckLeftCeilingDist
	or.w	d0,d1
	bne.s	Knuckles_FallFromGlide
	addq.w	#1,x_pos(a0)
	bra.s	loc_3157E8
; ---------------------------------------------------------------------------

loc_3157D8:			  ; ...
	bclr	#0,status(a0)
	bsr.w	CheckRightCeilingDist
	or.w	d0,d1
	bne.w	loc_31586A

loc_3157E8:			  ; ...
	move.b	#$13,y_radius(a0)
	move.b	#9,x_radius(a0)
	tst.b	(Super_Sonic_flag).w
	beq.s	loc_315804
	cmp.w	#$480,inertia(a0)
	bcs.s	loc_315804
	nop

loc_315804:			  ; ...
	move.w	#0,inertia(a0)
	move.w	#0,x_vel(a0)
	move.w	#0,y_vel(a0)
	move.b	#4,glidemode(a0)
	move.b	#$B7,mapping_frame(a0)
	move.b	#$7F,anim_frame_duration(a0)
	move.b	#0,anim_frame(a0)
	move.b	#3,glideunk(a0)
	move.w	x_pos(a0),2+x_pos(a0)
	sfx		sfx_Grab
	rts
; ---------------------------------------------------------------------------

Knuckles_FallFromGlide:		  ; ...
	move.w	x_pos(a0),d3
	move.b	y_radius(a0),d0
	ext.w	d0
	sub.w	d0,d3
	subq.w	#1,d3

loc_31584A:			  ; ...
	move.w	y_pos(a0),d2
	sub.w	#$B,d2
	jsr	ChkFloorEdge_Part2
	tst.w	d1
	bmi.s	loc_31587A
	cmp.w	#$C,d1
	bcc.s	loc_31587A
	add.w	d1,y_pos(a0)
	bra.w	loc_3157E8
; ---------------------------------------------------------------------------

loc_31586A:			  ; ...
	move.w	x_pos(a0),d3
	move.b	y_radius(a0),d0
	ext.w	d0
	add.w	d0,d3
	addq.w	#1,d3
	bra.s	loc_31584A
; ---------------------------------------------------------------------------

loc_31587A:			  ; ...
	move.b	#2,glidemode(a0)
	move.b	#$21,anim(a0)
	move.b	#$13,y_radius(a0)
	move.b	#9,x_radius(a0)
	bset	#1,glideflags(a0)
	rts
; ---------------------------------------------------------------------------

Knuckles_FallingFromGlide:		  ; ...
	bsr.w	Sonic_ChgJumpDir
	add.w	#$38,y_vel(a0)
	btst	#6,status(a0)
	beq.s	loc_3158B2
	sub.w	#$28,y_vel(a0)

loc_3158B2:			  ; ...
	bsr.w	Knuckles_DoLevelCollision2
	btst	#1,glideflags(a0)
	bne.s	return_315900
	move.w	#0,inertia(a0)
	move.w	#0,x_vel(a0)
	move.w	#0,y_vel(a0)
	move.b	y_radius(a0),d0
	sub.b	#$13,d0
	ext.w	d0
	add.w	d0,y_pos(a0)
	move.b	angle(a0),d0
	add.b	#$20,d0
	and.b	#$C0,d0
	beq.s	loc_3158F0
	bra.w	Knuckles_ResetOnFloor_Part2
; ---------------------------------------------------------------------------

loc_3158F0:			  ; ...
	bsr.w	Knuckles_ResetOnFloor_Part2
	move.w	#$F,move_lock(a0)
	move.b	#$23,anim(a0)
	sfx		sfx_GlideLand

return_315900:			  ; ...
	rts
; ---------------------------------------------------------------------------

Knuckles_Sliding:		  ; ...
	move.b	(Ctrl_1_Held_Logical).w,d0
	and.b	#button_A_mask|button_B_mask|button_C_mask,d0
	beq.s	loc_315926
	tst.w	x_vel(a0)
	bpl.s	loc_31591E
	add.w	#$20,x_vel(a0)
	bmi.s	loc_31591C
	bra.s	loc_315926
; ---------------------------------------------------------------------------

loc_31591C:			  ; ...
	bra.s	loc_315958
; ---------------------------------------------------------------------------

loc_31591E:			  ; ...
	sub.w	#$20,x_vel(a0)
	bpl.s	loc_315958

loc_315926:			  ; ...
	move.w	#0,inertia(a0)
	move.w	#0,x_vel(a0)
	move.w	#0,y_vel(a0)
	move.b	y_radius(a0),d0
	sub.b	#$13,d0
	ext.w	d0
	add.w	d0,y_pos(a0)
	bsr.w	Knuckles_ResetOnFloor_Part2
	move.w	#$F,move_lock(a0)
	move.b	#$22,anim(a0)
	rts
; ---------------------------------------------------------------------------

loc_315958:			  ; ...
	move.b	#$A,y_radius(a0)
	move.b	#$A,x_radius(a0)
	bsr.w	Knuckles_DoLevelCollision2
	bsr.w	Sonic_CheckFloor
	cmp.w	#$E,d1
	bge.s	loc_315988
	add.w	d1,y_pos(a0)
	move.b	d3,angle(a0)
	move.b	#$13,y_radius(a0)
	move.b	#9,x_radius(a0)
	move.b	(Timer_frames+1).w,d0
	andi.b	#7,d0
	bne.s	+
	sfx		sfx_GroundSlide
+	rts
; ---------------------------------------------------------------------------

loc_315988:			  ; ...
	move.b	#2,glidemode(a0)
	move.b	#$21,anim(a0)
	move.b	#$13,y_radius(a0)
	move.b	#9,x_radius(a0)
	bset	#1,glideflags(a0)
	rts
; ---------------------------------------------------------------------------

Knuckles_Climbing_Wall:		  ; ...
	tst.b	(Knuckles_GlideSomething).w
	bmi.w	loc_315BAE
	move.w	x_pos(a0),d0
	cmp.w	2+x_pos(a0),d0
	bne.w	loc_315BAE
	btst	#3,status(a0)
	bne.w	loc_315BAE
	move.w	#0,inertia(a0)
	move.w	#0,x_vel(a0)
	move.w	#0,y_vel(a0)
	move.l	#Primary_Collision,(Collision_addr).w
	cmp.b	#$D,lrb_solid_bit(a0)
	beq.s	loc_3159F0
	move.l	#Secondary_Collision,(Collision_addr).w

loc_3159F0:			  ; ...
	move.b	lrb_solid_bit(a0),d5
	move.b	#$A,y_radius(a0)
	move.b	#$A,x_radius(a0)
	moveq	#0,d1
	btst	#button_up,(Ctrl_1_Held_Logical).w
	beq.w	loc_315A76
	move.w	y_pos(a0),d2
	sub.w	#$B,d2
	bsr.w	sub_315C22
	cmp.w	#4,d1
	bge.w	Knuckles_ClimbUp	  ; Climb onto the floor above you
	tst.w	d1
	bne.w	loc_315B30
	move.b	lrb_solid_bit(a0),d5
	move.w	y_pos(a0),d2
	subq.w	#8,d2
	move.w	x_pos(a0),d3
	bsr.w	sub_3192E6	  ; Doesn't exist in S2
	tst.w	d1
	bpl.s	loc_315A46
	sub.w	d1,y_pos(a0)
	moveq	#1,d1
	bra.w	loc_315B04
; ---------------------------------------------------------------------------

loc_315A46:			  ; ...
	subq.w	#1,y_pos(a0)
	tst.b	(Super_Sonic_flag).w
	beq.s	loc_315A54
	subq.w	#1,y_pos(a0)

loc_315A54:			  ; ...
	moveq	#1,d1
	move.w	(Camera_Min_Y_pos).w,d0
	cmp.w	#-$100,d0
	beq.w	loc_315B04
	add.w	#$10,d0
	cmp.w	y_pos(a0),d0
	ble.w	loc_315B04
	move.w	d0,y_pos(a0)
	bra.w	loc_315B04
; ---------------------------------------------------------------------------

loc_315A76:			  ; ...
	btst	#button_down,(Ctrl_1_Held_Logical).w
	beq.w	loc_315B04
	cmp.b	#$BD,mapping_frame(a0)
	bne.s	loc_315AA2
	move.b	#$B7,mapping_frame(a0)
	addq.w	#3,y_pos(a0)
	subq.w	#3,x_pos(a0)
	btst	#0,status(a0)
	beq.s	loc_315AA2
	addq.w	#6,x_pos(a0)

loc_315AA2:			  ; ...
	move.w	y_pos(a0),d2
	add.w	#$B,d2
	bsr.w	sub_315C22
	tst.w	d1
	bne.w	loc_315BAE
	move.b	top_solid_bit(a0),d5
	move.w	y_pos(a0),d2
	add.w	#9,d2
	move.w	x_pos(a0),d3
	bsr.w	sub_318FF6
	tst.w	d1
	bpl.s	loc_315AF4
	add.w	d1,y_pos(a0)
	move.b	(Primary_Angle).w,angle(a0)
	move.w	#0,inertia(a0)
	move.w	#0,x_vel(a0)
	move.w	#0,y_vel(a0)
	bsr.w	Knuckles_ResetOnFloor_Part2
	move.b	#5,anim(a0)
	rts
; ---------------------------------------------------------------------------

loc_315AF4:			  ; ...
	addq.w	#1,y_pos(a0)
	tst.b	(Super_Sonic_flag).w
	beq.s	loc_315B02
	addq.w	#1,y_pos(a0)

loc_315B02:			  ; ...
	moveq	#-1,d1

loc_315B04:			  ; ...
	tst.w	d1
	beq.s	loc_315B30
	subq.b	#1,glideunk(a0)
	bpl.s	loc_315B30
	move.b	#3,glideunk(a0)
	add.b	mapping_frame(a0),d1
	cmp.b	#$B7,d1
	bcc.s	loc_315B22
	move.b	#$BC,d1

loc_315B22:			  ; ...
	cmp.b	#$BC,d1
	bls.s	loc_315B2C
	move.b	#$B7,d1

loc_315B2C:			  ; ...
	move.b	d1,mapping_frame(a0)

loc_315B30:			  ; ...
	move.b	#$20,anim_frame_duration(a0)
	move.b	#0,anim_frame(a0)
	move.b	#$13,y_radius(a0)
	move.b	#9,x_radius(a0)
	move.w	(Ctrl_1_Logical).w,d0
	and.w	#button_A_mask|button_B_mask|button_C_mask,d0
	beq.s	return_315B94
	move.w	#$FC80,y_vel(a0)
	move.w	#$400,x_vel(a0)
	bchg	#0,status(a0)
	bne.s	loc_315B6A
	neg.w	x_vel(a0)

loc_315B6A:			  ; ...
	bset	#1,status(a0)
	move.b	#1,jumping(a0)
	move.b	#$E,y_radius(a0)
	move.b	#7,x_radius(a0)
	move.b	#2,anim(a0)
	bset	#2,status(a0)
	move.b	#0,glidemode(a0)

return_315B94:			  ; ...
	rts
; ---------------------------------------------------------------------------

Knuckles_ClimbUp:		  ; ...
	move.b	#5,glidemode(a0)	  ; Climb up to	the floor above	you
	cmp.b	#$BD,mapping_frame(a0)
	beq.s	return_315BAC
	move.b	#0,glideunk(a0)
	bsr.s	sub_315BDA

return_315BAC:			  ; ...
	rts
; ---------------------------------------------------------------------------

loc_315BAE:			  ; ...
	move.b	#2,glidemode(a0)
	move.w	#$2121,anim(a0)
	move.b	#$CB,mapping_frame(a0)
	move.b	#7,anim_frame_duration(a0)
	move.b	#1,anim_frame(a0)
	move.b	#$13,y_radius(a0)
	move.b	#9,x_radius(a0)
	rts
; End of function Knuckles_GlideControl


; =============== S U B	R O U T	I N E =======================================


sub_315BDA:			  ; ...
	moveq	#0,d0
	move.b	glideunk(a0),d0
	lea	word_315C12(pc,d0.w),a1
	move.b	(a1)+,mapping_frame(a0)
	move.b	(a1)+,d0
	ext.w	d0
	btst	#0,status(a0)
	beq.s	loc_315BF6
	neg.w	d0

loc_315BF6:			  ; ...
	add.w	d0,x_pos(a0)
	move.b	(a1)+,d1
	ext.w	d1
	add.w	d1,y_pos(a0)
	move.b	(a1)+,anim_frame_duration(a0)
	addq.b	#4,glideunk(a0)
	move.b	#0,anim_frame(a0)
	rts
; End of function sub_315BDA

; ---------------------------------------------------------------------------
word_315C12:	dc.w $BD03,$FD06,$BE08,$F606,$BFF8,$F406,$D208,$FB06; 0	; ...

; =============== S U B	R O U T	I N E =======================================


sub_315C22:			  ; ...

; FUNCTION CHUNK AT 00319208 SIZE 00000020 BYTES
; FUNCTION CHUNK AT 003193D2 SIZE 00000024 BYTES

	move.b	lrb_solid_bit(a0),d5
	btst	#0,status(a0)
	bne.s	loc_315C36
	move.w	x_pos(a0),d3
	bra.w	loc_319208
; ---------------------------------------------------------------------------

loc_315C36:			  ; ...
	move.w	x_pos(a0),d3
	subq.w	#1,d3
	bra.w	loc_3193D2
; End of function sub_315C22

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR Knuckles_GlideControl

Knuckles_Climbing_Up:		  ; ...
	tst.b	anim_frame_duration(a0)
	bne.s	return_315C7A
	bsr.w	sub_315BDA
	cmp.b	#$10,glideunk(a0)
	bne.s	return_315C7A
	move.w	#0,inertia(a0)
	move.w	#0,x_vel(a0)
	move.w	#0,y_vel(a0)
	btst	#0,status(a0)
	beq.s	loc_315C70
	subq.w	#1,x_pos(a0)

loc_315C70:			  ; ...
	bsr.w	Knuckles_ResetOnFloor_Part2
	move.b	#5,anim(a0)

return_315C7A:			  ; ...
	rts
; END OF FUNCTION CHUNK	FOR Knuckles_GlideControl

; =============== S U B	R O U T	I N E =======================================


sub_315C7C:			  ; ...
	move.b	#$20,anim_frame_duration(a0)
	move.b	#0,anim_frame(a0)
	move.w	#$2020,anim(a0)
	bclr	#5,status(a0)
	bclr	#0,status(a0)
	moveq	#0,d0
	move.b	glideunk(a0),d0
	add.b	#$10,d0
	lsr.w	#5,d0
	move.b	byte_315CC2(pc,d0.w),d1
	move.b	d1,mapping_frame(a0)
	cmp.b	#$C4,d1
	bne.s	return_315CC0
	bset	#0,status(a0)
	move.b	#$C0,mapping_frame(a0)

return_315CC0:			  ; ...
	rts
; End of function sub_315C7C

; ---------------------------------------------------------------------------
byte_315CC2:	dc.b $C0,$C1,$C2,$C3,$C4,$C3,$C2,$C1; 0	; ...

; =============== S U B	R O U T	I N E =======================================


Knuckles_GlideSpeedControl:		  ; ...
	cmp.b	#1,glidemode(a0)
	bne.w	loc_315D88
	move.w	inertia(a0),d0
	cmp.w	#$400,d0
	bcc.s	loc_315CE2
	addq.w	#8,d0
	bra.s	loc_315CFC
; ---------------------------------------------------------------------------

loc_315CE2:			  ; ...
	cmp.w	#$1800,d0
	bcc.s	loc_315CFC
	move.b	glideunk(a0),d1
	and.b	#$7F,d1
	bne.s	loc_315CFC
	addq.w	#4,d0
	tst.b	(Super_Sonic_flag).w
	beq.s	loc_315CFC
	addq.w	#8,d0

loc_315CFC:			  ; ...
	move.w	d0,inertia(a0)
	move.b	glideunk(a0),d0
	btst	#button_left,(Ctrl_1_Held_Logical).w
	beq.s	loc_315D1C
	cmp.b	#$80,d0
	beq.s	loc_315D1C
	tst.b	d0
	bpl.s	loc_315D18
	neg.b	d0

loc_315D18:			  ; ...
	addq.b	#2,d0
	bra.s	loc_315D3A
; ---------------------------------------------------------------------------

loc_315D1C:			  ; ...
	btst	#button_right,(Ctrl_1_Held_Logical).w
	beq.s	loc_315D30
	tst.b	d0
	beq.s	loc_315D30
	bmi.s	loc_315D2C
	neg.b	d0

loc_315D2C:			  ; ...
	addq.b	#2,d0
	bra.s	loc_315D3A
; ---------------------------------------------------------------------------

loc_315D30:			  ; ...
	move.b	d0,d1
	and.b	#$7F,d1
	beq.s	loc_315D3A
	addq.b	#2,d0

loc_315D3A:			  ; ...
	move.b	d0,glideunk(a0)
	move.b	glideunk(a0),d0
	jsr	CalcSine
	muls.w	inertia(a0),d1
	asr.l	#8,d1
	move.w	d1,x_vel(a0)
	cmp.w	#$80,y_vel(a0)
	blt.s	loc_315D62
	sub.w	#$20,y_vel(a0)
	bra.s	loc_315D68
; ---------------------------------------------------------------------------

loc_315D62:			  ; ...
	add.w	#$20,y_vel(a0)

loc_315D68:			  ; ...
	move.w	(Camera_Min_Y_pos).w,d0
	cmp.w	#$FF00,d0
	beq.w	loc_315D88
	add.w	#$10,d0
	cmp.w	y_pos(a0),d0
	ble.w	loc_315D88
	asr	x_vel(a0)
	asr	inertia(a0)

loc_315D88:			  ; ...
	cmp.w	#$60,(Camera_Y_pos_bias).w
	beq.s	return_315D9A
	bcc.s	loc_315D96
	addq.w	#4,(Camera_Y_pos_bias).w

loc_315D96:			  ; ...
	subq.w	#2,(Camera_Y_pos_bias).w

return_315D9A:			  ; ...
	rts
; End of function Knuckles_GlideSpeedControl

; ---------------------------------------------------------------------------

Obj_Knuckles_MdRoll:					  ; ...
    tst.b	pinball_mode(a0)
    bne.s	loc_315DA6
    bsr.w	Sonic_Jump

loc_315DA6:					  ; ...
		bsr.w	Sonic_RollRepel
		bsr.w	Sonic_RollSpeed
		bsr.w	Sonic_LevelBound
		jsr	ObjectMove		  ; AKA	SpeedToPos in Sonic 1
		bsr.w	AnglePos
		bsr.w	Sonic_SlopeRepel
		rts
; ---------------------------------------------------------------------------

Obj_Knuckles_MdJump:					  ; ...
	bsr.w	Sonic_CheckGoSuper
    bsr.w	Knuckles_JumpHeight
    bsr.w	Sonic_ChgJumpDir
    bsr.w	Sonic_LevelBound
    jsr	ObjectMoveAndFall
    btst	#6,status(a0)
    beq.s	loc_315DE2
    sub.w	#$28,y_vel(a0)

loc_315DE2:					  ; ...
		bsr.w	Sonic_JumpAngle
		bsr.w	Sonic_DoLevelCollision
		rts

; =============== S U B	R O U T	I N E =======================================


Knuckles_JumpHeight:				  ; ...
	; HJW: If in cutscene, skip Knux jump height (for WFZ cutscene)
	tst.b	(Control_Locked).w
	bne.w	Sonic_JumpHeight

    tst.b	jumping(a0)
    beq.s	Knuckles_UpwardsVelocityCap
    move.w	#-$400,d1
    btst	#6,status(a0)
    beq.s	loc_31650C
    move.w	#-$200,d1

loc_31650C:					  ; ...
    cmp.w	y_vel(a0),d1
    ble.w	Knuckles_CheckGlide	  ; Check if Knuckles should begin a glide
	move.b	(Ctrl_1_Held_Logical).w,d0
	andi.b	#button_B_mask|button_C_mask|button_A_mask,d0 ; is a jump button pressed?
    bne.s	return_316522
    move.w	d1,y_vel(a0)

return_316522:					  ; ...
		rts
; ---------------------------------------------------------------------------

Knuckles_UpwardsVelocityCap:			  ; ...
		tst.b	spindash_flag(a0)
		bne.s	return_316538
		cmp.w	#-$FC0,y_vel(a0)
		bge.s	return_316538
		move.w	#-$FC0,y_vel(a0)

return_316538:					  ; ...
		rts
; ---------------------------------------------------------------------------

Knuckles_CheckGlide:				  ; ...
	;tst.w	(Demo_mode_flag).w		  ; Don't glide on demos
	;bne.w	return_3165D2
	tst.b	glidemode(a0)
	bne.w	return_3165D2
	move.b	(Ctrl_1_Press_Logical).w,d0
	andi.b	#button_A_mask|button_B_mask|button_C_mask,d0
	beq.w	return_3165D2
	;tst.b	(Super_Sonic_flag).w
	;bne.s	Knuckles_AssistCheck
	;cmp.b	#7,(Emerald_count).w
	;bcs.s	Knuckles_AssistCheck
	;cmp.w	#50,(Ring_count).w
	;bcs.s	Knuckles_AssistCheck
	;tst.b	(Update_HUD_timer).w
	;bne.s	Knuckles_TurnSuper

Knuckles_AssistCheck:
		cmpi.l	#Obj_Tails,(Sidekick+id).w
		bne.s	Knuckles_BeginGlide
		move.b	(Ctrl_1_Held_Logical).w,d0
		andi.b	#button_up_mask,d0
		beq.w	Knuckles_BeginGlide
		rts

Knuckles_BeginGlide:				  ; ...
		bclr	#2,status(a0)
		move.b	#$A,y_radius(a0)
		move.b	#$A,x_radius(a0)
		bclr	#4,status(a0)
		move.b	#1,glidemode(a0)
		add.w	#$200,y_vel(a0)
		bpl.s	loc_31659E
		move.w	#0,y_vel(a0)

loc_31659E:					  ; ...
		moveq	#0,d1
		move.w	#$400,d0
		move.w	d0,inertia(a0)
		btst	#0,status(a0)
		beq.s	loc_3165B4
		neg.w	d0
		moveq	#-$80,d1

loc_3165B4:					  ; ...
		move.w	d0,x_vel(a0)
		move.b	d1,glideunk(a0)
		move.w	#0,angle(a0)
		move.b	#0,glideflags(a0)
		bset	#1,glideflags(a0)
		bsr.w	sub_315C7C

return_3165D2:					  ; ...
		rts
; ---------------------------------------------------------------------------

Knuckles_TurnSuper:				  ; ...
		move.b	#1,(Super_Sonic_palette).w
		move.b	#$F,(Palette_timer).w
		move.b	#1,(Super_Sonic_flag).w
		move.w	#60,(Super_Sonic_frame_count).w
		move.b	#$81,obj_control(a0)
		move.b	#$1F,anim(a0)
    	move.l	#Obj_SuperSonicStars,(SuperSonicStars+id).w ; load Obj_SuperSonicStars (super sonic stars object) at $FFFFD040
		lea		(Sonic_top_speed).w,a2	; Load Sonic_top_speed into a2
		jsr		ApplySpeedSettings	; Fetch Speed settings
		move.w	#0,$32(a0)
		bset	#1,$2B(a0)
		move.w	#$DF,d0
        sfx	sfx_Transform				; Play transformation sound effect.
		tst.b	(Option_SuperMusic).w	; Allow super music?
		bne.s	+						; If not, branch
        music	mus_SuperSonic				; load the Super Sonic song and return
; End of function Knuckles_JumpHeight
; ---------------------------------------------------------------------------
+
		rts

; =============== S U B	R O U T	I N E =======================================


Knuckles_Super:					  ; ...
    jmp     Sonic_Super
; End of function Knuckles_Super

; =============== S U B	R O U T	I N E =======================================

Knuckles_DoLevelCollision2:			  ; ...
		move.l	#Primary_Collision,(Collision_addr).w
		cmp.b	#$C,top_solid_bit(a0)
		beq.s	loc_31694E
		move.l	#Secondary_Collision,(Collision_addr).w

loc_31694E:					  ; ...
		move.b	lrb_solid_bit(a0),d5
		move.w	x_vel(a0),d1
		move.w	y_vel(a0),d2
		jsr	CalcAngle
		sub.b	#$20,d0
		and.b	#$C0,d0
		cmp.b	#$40,d0
		beq.w	Knuckles_HitLeftWall2
		cmp.b	#$80,d0
		beq.w	Knuckles_HitCeilingAndWalls2
		cmp.b	#$C0,d0
		beq.w	Knuckles_HitRightWall2
		bsr.w	CheckLeftWallDist
		tst.w	d1
		bpl.s	loc_316998
		sub.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,glideflags(a0)

loc_316998:					  ; ...
		bsr.w	CheckRightWallDist
		tst.w	d1
		bpl.s	loc_3169B0
		add.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,glideflags(a0)

loc_3169B0:					  ; ...
		bsr.w	Sonic_CheckFloor
		tst.w	d1
		bpl.s	return_3169CC
		add.w	d1,y_pos(a0)
		move.b	d3,angle(a0)
		move.w	#0,y_vel(a0)
		bclr	#1,glideflags(a0)

return_3169CC:					  ; ...
		rts
; ---------------------------------------------------------------------------

Knuckles_HitLeftWall2:				  ; ...
		bsr.w	CheckLeftWallDist
		tst.w	d1
		bpl.s	Knuckles_HitCeilingAlt
		sub.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,glideflags(a0)

Knuckles_HitCeilingAlt:				  ; ...
		bsr.w	Sonic_CheckCeiling
		tst.w	d1
		bpl.s	Knuckles_HitFloor
		neg.w	d1
		cmp.w	#$14,d1
		bcc.s	loc_316A08
		add.w	d1,y_pos(a0)
		tst.w	y_vel(a0)
		bpl.s	return_316A06
		move.w	#0,y_vel(a0)

return_316A06:					  ; ...
		rts
; ---------------------------------------------------------------------------

loc_316A08:					  ; ...
		bsr.w	CheckRightWallDist
		tst.w	d1
		bpl.s	return_316A20
		add.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,glideflags(a0)

return_316A20:					  ; ...
		rts
; ---------------------------------------------------------------------------

Knuckles_HitFloor:				  ; ...
		tst.w	y_vel(a0)
		bmi.s	return_316A44
		bsr.w	Sonic_CheckFloor
		tst.w	d1
		bpl.s	return_316A44
		add.w	d1,y_pos(a0)
		move.b	d3,angle(a0)
		move.w	#0,y_vel(a0)
		bclr	#1,glideflags(a0)

return_316A44:					  ; ...
		rts
; ---------------------------------------------------------------------------

Knuckles_HitCeilingAndWalls2:			  ; ...
		bsr.w	CheckLeftWallDist
		tst.w	d1
		bpl.s	loc_316A5E
		sub.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,glideflags(a0)

loc_316A5E:					  ; ...
		bsr.w	CheckRightWallDist
		tst.w	d1
		bpl.s	loc_316A76
		add.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,glideflags(a0)

loc_316A76:					  ; ...
		bsr.w	Sonic_CheckCeiling
		tst.w	d1
		bpl.s	return_316A88
		sub.w	d1,y_pos(a0)
		move.w	#0,y_vel(a0)

return_316A88:					  ; ...
		rts
; ---------------------------------------------------------------------------

Knuckles_HitRightWall2:				  ; ...
		bsr.w	CheckRightWallDist
		tst.w	d1
		bpl.s	loc_316AA2
		add.w	d1,x_pos(a0)
		move.w	#0,x_vel(a0)
		bset	#5,glideflags(a0)

loc_316AA2:					  ; ...
		bsr.w	Sonic_CheckCeiling
		tst.w	d1
		bpl.s	loc_316ABC
		sub.w	d1,y_pos(a0)
		tst.w	y_vel(a0)
		bpl.s	return_316ABA
		move.w	#0,y_vel(a0)

return_316ABA:					  ; ...
		rts
; ---------------------------------------------------------------------------

loc_316ABC:					  ; ...
		tst.w	y_vel(a0)
		bmi.s	return_316ADE
		bsr.w	Sonic_CheckFloor
		tst.w	d1
		bpl.s	return_316ADE
		add.w	d1,y_pos(a0)
		move.b	d3,angle(a0)
		move.w	#0,y_vel(a0)
		bclr	#1,glideflags(a0)

return_316ADE:					  ; ...
		rts
; End of function Knuckles_DoLevelCollision2

; =============== S U B	R O U T	I N E =======================================

Knuckles_ResetOnFloor:
	tst.b	pinball_mode(a0)
	bne.w	Knuckles_ResetOnFloor_Part3
;=====================================================================================================================
; if up is being held while landing from a momentumless jump, play look up animation. 
; allows for activiting peelout immediately
; however, to do so properly requires a frame perfect input... (enjoy, speedrunners!)
;=====================================================================================================================	
	btst	#button_up,(Ctrl_1_Held_Logical).w	; is up being pressed?
	beq.w	.CheckIfDucking				; if not, branch
	move.b	#7,anim(a0)				; use look up animation
	bra.w	Knuckles_ResetOnFloor_Part2	
;=====================================================================================================================
; if down is being held while landing from a momentumless jump, play ducking animation. 
; allows for activiting spindash immediately
; however, to do so properly requires a frame perfect input... (enjoy, speedrunners!)
;=====================================================================================================================
	.CheckIfDucking:	
		btst	#button_down,(Ctrl_1_Held_Logical).w	; is down being pressed?
		beq.w	.ReturnToWalkRunDash			; if not, branch
		tst.w	inertia(a0)				; is character moving?
		bne.w	.ContinueRolling			; if so, branch
		bclr	#2,status(a0)				; clear rolling status	
	        move.b	#$13,y_radius(a0)			; this increases Sonic's collision height to standing
	        move.b	#9,x_radius(a0)				; adjust Sonic's collision width to standing
		jsr	Sonic_Duck
		bra.w	Knuckles_Adjust_Y_Pos	

	.ContinueRolling:	
        	jsr     Obj_Sonic_DoRoll			; make character roll
        	bra.w   Knuckles_ResetOnFloor_Part3		; still need to clear some flags, etc.

	.ReturnToWalkRunDash:		
		move.b	#0,anim(a0)
;=====================================================================================================================
; this code is called by the code that handles player standing on objects, like platforms or bridges
; some routines outside of Tails' code can call Knuckles_ResetOnFloor_Part2
; when they mean to call Tails_ResetOnFloor_Part2, so fix that here
;=====================================================================================================================
; loc_1B0AC:
Knuckles_ResetOnFloor_Part2: 
                btst	#2,status(a0)				; is rolling status set?
		beq.w	Knuckles_ResetOnFloor_Part3		; if so, branch
		bclr	#2,status(a0)				; clear rolling status
		move.b	#$13,y_radius(a0)			; this increases Sonic's collision height to standing
		move.b	#9,x_radius(a0)				; adjust Sonic's collision width to standing
		tst.w	x_vel(a0)				; is character moving?
		bne.w	.ReturnToWalkRunDash			; if so, branch	

	.ReturnToIdle:	
		move.b	#$5,anim(a0)				; use standing/idle animation
		bra.s	Knuckles_Adjust_Y_Pos	

	.ReturnToWalkRunDash:		
		move.b	#0,anim(a0)				; use running/walking/standing animation

Knuckles_Adjust_Y_Pos:
	subq.w	#5,y_pos(a0)				; move Sonic up 5 pixels so the increased height doesn't push him into the ground    
;=====================================================================================================================
; clear flags, and signify a true reset on floor
;=====================================================================================================================
; loc_1B0DA:
Knuckles_ResetOnFloor_Part3:      
	bclr	#1,status(a0)				; clear in air status
	bclr	#5,status(a0)				; clear pushing status
	bclr	#4,status(a0)				; clear rolljump status
	move.b	#0,jumping(a0)				; clear jumping flag
	move.b	#0,glidemode(a0)
	move.w	#0,(Chain_Bonus_counter).w
	move.b	#0,flip_angle(a0)
	move.b	#0,flips_remaining(a0)
;=====================================================================================================================
; if rolling status was already set, we want to branch away from the end of this code
; this prevents an issue where holding down would cause the character to duck rather than roll in most cases
;=====================================================================================================================
	btst    #2,status(a0)				; is status set to rolling?
	beq.w   Kreturn_1B11E  
;=====================================================================================================================
; clear a few more flags
;=====================================================================================================================
	move.b  #0,flip_turned(a0)
	move.w	#0,(Sonic_Look_delay_counter).w
	cmpi.b	#$14,anim(a0)
	bne.w	Kreturn_1B11E	
	move.b	#0,anim(a0)
	bra.w	Kreturn_1B11E
;=====================================================================================================================
; The end
;=====================================================================================================================
Kreturn_1B11E:	
	rts
; End of function Knuckles_ResetOnFloor


; =============== S U B	R O U T	I N E =======================================

Obj_Knuckles_Hurt:					  ; ...
; FUNCTION CHUNK AT 00316E14 SIZE 0000001C BYTES
		tst.w	(Debug_mode_flag).w
		beq.s	Obj_Knuckles_Hurt_Normal
		btst	#button_B,(Ctrl_1_Press).w
		beq.s	Obj_Knuckles_Hurt_Normal
		move.w	#1,(Debug_placement_mode).w
		clr.b	(Control_Locked).w
		rts
; ---------------------------------------------------------------------------

Obj_Knuckles_Hurt_Normal:				  ; ...
		tst.b	routine_secondary(a0)
		bmi.w	Knuckles_HurtInstantRecover
		jsr     ObjectMove		  ; AKA	SpeedToPos in Sonic 1
		add.w	#$30,y_vel(a0)
		btst	#6,status(a0)
		beq.s	loc_316DA0
		sub.w	#$20,y_vel(a0)

loc_316DA0:					  ; ...
		cmp.w	#-$100,(Camera_Min_Y_pos).w
		bne.s	loc_316DAE
		and.w	#$7FF,y_pos(a0)

loc_316DAE:					  ; ...
		bsr.w	Sonic_HurtStop
		bsr.w	Sonic_LevelBound
		jsr	Sonic_RecordPos
		bsr.w	Knuckles_Animate
		jsr	Sonic_Water
		bsr.w	LoadKnucklesDynPLC
		jmp	DisplaySprite
; End of function Obj_Knuckles_Hurt

; ---------------------------------------------------------------------------

JmpToK_KillCharacter:				  ; ...
		jmp	KillCharacter
; End of function Knuckles_HurtStop

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR Obj_Knuckles_Hurt

Knuckles_HurtInstantRecover:			  ; ...
    subq.b	#2,routine(a0)
    move.b	#0,routine_secondary(a0)
    jsr	Sonic_RecordPos
    bsr.w	Knuckles_Animate
    bsr.w	LoadKnucklesDynPLC
    jmp	DisplaySprite
; END OF FUNCTION CHUNK	FOR Obj_Knuckles_Hurt

; =============== S U B	R O U T	I N E =======================================

Obj_Knuckles_Dead:					  ; ...
		tst.w	(Debug_mode_flag).w
		beq.s	loc_316E4A
		btst	#button_B,(Ctrl_1_Press).w
		beq.s	loc_316E4A
		move.w	#1,(Debug_placement_mode).w
		clr.b	(Control_Locked).w
		rts
; ---------------------------------------------------------------------------

loc_316E4A:					  ; ...
		bsr.w	CheckGameOver
		jsr	ObjectMoveAndFall
		jsr	Sonic_RecordPos
		bsr.w	Knuckles_Animate
		bsr.w	LoadKnucklesDynPLC
		jmp	DisplaySprite
; End of function Obj_Knuckles_Dead

; =============== S U B	R O U T	I N E =======================================

Obj_Knuckles_Gone:					  ; ...
    jmp Obj_Sonic_Gone
; End of function Obj_Knuckles_Gone

; ---------------------------------------------------------------------------

Obj_Knuckles_Respawning:				  ; ...
		tst.w	(Camera_X_pos_diff).w
		bne.s	loc_316F8C
		tst.w	(Camera_Y_pos_diff).w
		bne.s	loc_316F8C
		move.b	#2,routine(a0)

loc_316F8C:					  ; ...
		bsr.w	Knuckles_Animate
		bsr.w	LoadKnucklesDynPLC
		jmp	DisplaySprite

; =============== S U B	R O U T	I N E =======================================

Knuckles_Animate:				  ; ...
		lea	(KnucklesAniData).l,a1
		moveq	#0,d0
		move.b	anim(a0),d0
		cmp.b	next_anim(a0),d0
		beq.s	KAnim_Do
		move.b	d0,next_anim(a0)
		move.b	#0,anim_frame(a0)
		move.b	#0,anim_frame_duration(a0)
		bclr	#5,status(a0)

KAnim_Do:					  ; ...
		add.w	d0,d0
		add.w	(a1,d0.w),a1
		move.b	(a1),d0
		bmi.s	KAnim_WalkRun
		move.b	status(a0),d1
		and.b	#1,d1
		and.b	#$FC,render_flags(a0)
		or.b	d1,render_flags(a0)
		subq.b	#1,anim_frame_duration(a0)
		bpl.s	KAnim_Delay
		move.b	d0,anim_frame_duration(a0)

KAnim_Do2:					  ; ...
		moveq	#0,d1
		move.b	anim_frame(a0),d1
		move.b	1(a1,d1.w),d0
		cmp.b	#$FC,d0
		bcc.s	KAnim_End_FF

KAnim_Next:					  ; ...
		move.b	d0,mapping_frame(a0)
		addq.b	#1,anim_frame(a0)

KAnim_Delay:					  ; ...
		rts
; ---------------------------------------------------------------------------

KAnim_End_FF:					  ; ...
		addq.b	#1,d0
		bne.s	KAnim_End_FE
		move.b	#0,anim_frame(a0)
		move.b	1(a1),d0
		bra.s	KAnim_Next
; ---------------------------------------------------------------------------

KAnim_End_FE:					  ; ...
		addq.b	#1,d0
		bne.s	KAnim_End_FD
		move.b	2(a1,d1.w),d0
		sub.b	d0,anim_frame(a0)
		sub.b	d0,d1
		move.b	1(a1,d1.w),d0
		bra.s	KAnim_Next
; ---------------------------------------------------------------------------

KAnim_End_FD:					  ; ...
		addq.b	#1,d0
		bne.s	KAnim_End
		move.b	2(a1,d1.w),anim(a0)

KAnim_End:					  ; ...
		rts
; ---------------------------------------------------------------------------

KAnim_WalkRun:					  ; ...
		addq.b	#1,d0
		bne.w	KAnim_Roll
		moveq	#0,d0
		move.b	flip_angle(a0),d0
		bne.w	KAnim_Tumble
		moveq	#0,d1
		move.b	angle(a0),d0
		bmi.s	loc_31704E
		beq.s	loc_31704E
		subq.b	#1,d0

loc_31704E:					  ; ...

		move.b	status(a0),d2
		and.b	#1,d2
		bne.s	loc_31705A
		not.b	d0

loc_31705A:					  ; ...
		add.b	#$10,d0
		bpl.s	loc_317062
		moveq	#3,d1

loc_317062:					  ; ...
		andi.b	#$FC,render_flags(a0)
		eor.b	d1,d2
		or.b	d2,render_flags(a0)
		btst	#5,status(a0)
		bne.w	KAnim_Push
		lsr.b	#4,d0
		and.b	#6,d0
		move.w	inertia(a0),d2
		bpl.s	loc_317086
		neg.w	d2

loc_317086:					  ; ...
		tst.b	$2B(a0)
		bpl.w	loc_317090
		add.w	d2,d2

loc_317090:					  ; ...
		lea	(KnucklesAni_Run).l,a1
		cmp.w	#$600,d2
		bcc.s	loc_3170A4
		lea	(KnucklesAni_Walk).l,a1
		add.b	d0,d0

loc_3170A4:					  ; ...
		add.b	d0,d0
		move.b	d0,d3
		moveq	#0,d1
		move.b	anim_frame(a0),d1
		move.b	1(a1,d1.w),d0
		cmp.b	#$FF,d0
		bne.s	loc_3170C2
		move.b	#0,anim_frame(a0)
		move.b	1(a1),d0

loc_3170C2:					  ; ...
		move.b	d0,mapping_frame(a0)
		add.b	d3,mapping_frame(a0)
		subq.b	#1,anim_frame_duration(a0)
		bpl.s	return_3170E4
		neg.w	d2
		add.w	#$800,d2
		bpl.s	loc_3170DA
		moveq	#0,d2

loc_3170DA:					  ; ...
		lsr.w	#8,d2
		move.b	d2,anim_frame_duration(a0)
		addq.b	#1,anim_frame(a0)

return_3170E4:					  ; ...
		rts
; ---------------------------------------------------------------------------

KAnim_Tumble:					  ; ...
		move.b	flip_angle(a0),d0
		moveq	#0,d1
		move.b	status(a0),d2
		and.b	#1,d2
		bne.s	KAnim_Tumble_Left
		and.b	#$FC,render_flags(a0)
		add.b	#$B,d0
		divu.w	#$16,d0
		add.b	#$31,d0
		move.b	d0,mapping_frame(a0)
		move.b	#0,anim_frame_duration(a0)
		rts
; ---------------------------------------------------------------------------

KAnim_Tumble_Left:				  ; ...
		and.b	#$FC,render_flags(a0)
		tst.b	flip_turned(a0)
		beq.s	loc_31712C
		or.b	#1,render_flags(a0)
		add.b	#$B,d0
		bra.s	loc_317138
; ---------------------------------------------------------------------------

loc_31712C:					  ; ...
		or.b	#3,render_flags(a0)
		neg.b	d0
		add.b	#-$71,d0

loc_317138:					  ; ...
		divu.w	#$16,d0
		add.b	#$31,d0
		move.b	d0,mapping_frame(a0)
		move.b	#0,anim_frame_duration(a0)
		rts
; ---------------------------------------------------------------------------

KAnim_Roll:					  ; ...
		subq.b	#1,anim_frame_duration(a0)
		bpl.w	KAnim_Delay
		addq.b	#1,d0
		bne.s	KAnim_Push
		move.w	inertia(a0),d2
		bpl.s	loc_317160
		neg.w	d2

loc_317160:					  ; ...
		lea	(KnucklesAni_Roll2).l,a1
		cmp.w	#$600,d2
		bcc.s	loc_317172
		lea	(KnucklesAni_Roll).l,a1

loc_317172:					  ; ...
		neg.w	d2
		add.w	#$400,d2
		bpl.s	loc_31717C
		moveq	#0,d2

loc_31717C:					  ; ...
		lsr.w	#8,d2
		move.b	d2,anim_frame_duration(a0)
		move.b	status(a0),d1
		and.b	#1,d1
		and.b	#$FC,render_flags(a0)
		or.b	d1,render_flags(a0)
		bra.w	KAnim_Do2
; ---------------------------------------------------------------------------

KAnim_Push:					  ; ...
		subq.b	#1,anim_frame_duration(a0)
		bpl.w	KAnim_Delay
		move.w	inertia(a0),d2
		bmi.s	loc_3171A8
		neg.w	d2

loc_3171A8:					  ; ...
		add.w	#$800,d2
		bpl.s	loc_3171B0
		moveq	#0,d2

loc_3171B0:					  ; ...
		lsr.w	#8,d2
		move.b	d2,anim_frame_duration(a0)
		lea	(KnucklesAni_Push).l,a1
		move.b	status(a0),d1
		and.b	#1,d1
		and.b	#$FC,render_flags(a0)
		or.b	d1,render_flags(a0)
		bra.w	KAnim_Do2
; End of function Knuckles_Animate

; ---------------------------------------------------------------------------
KnucklesAniData:dc.w KnucklesAni_Walk-KnucklesAniData; 0 ; ...
		dc.w KnucklesAni_Run-KnucklesAniData; 1
		dc.w KnucklesAni_Roll-KnucklesAniData; 2
		dc.w KnucklesAni_Roll2-KnucklesAniData;	3
		dc.w KnucklesAni_Push-KnucklesAniData; 4
		dc.w KnucklesAni_Wait-KnucklesAniData; 5
		dc.w KnucklesAni_Balance-KnucklesAniData; 6
		dc.w KnucklesAni_LookUp-KnucklesAniData; 7
		dc.w KnucklesAni_Duck-KnucklesAniData; 8
		dc.w KnucklesAni_Spindash-KnucklesAniData; 9
		dc.w KnucklesAni_Unused-KnucklesAniData; 10
		dc.w KnucklesAni_Pull-KnucklesAniData; 11
		dc.w KnucklesAni_Balance2-KnucklesAniData; 12
		dc.w KnucklesAni_Stop-KnucklesAniData; 13
		dc.w KnucklesAni_Float-KnucklesAniData;	14
		dc.w KnucklesAni_Float2-KnucklesAniData; 15
		dc.w KnucklesAni_Spring-KnucklesAniData; 16
		dc.w KnucklesAni_Hang-KnucklesAniData; 17
		dc.w KnucklesAni_Unused_0-KnucklesAniData; 18
		dc.w KnucklesAni_S3EndingPose-KnucklesAniData; 19
		dc.w KnucklesAni_WFZHang-KnucklesAniData; 20
		dc.w KnucklesAni_Bubble-KnucklesAniData; 21
		dc.w KnucklesAni_DeathBW-KnucklesAniData; 22
		dc.w KnucklesAni_Drown-KnucklesAniData;	23
		dc.w KnucklesAni_Death-KnucklesAniData;	24
		dc.w KnucklesAni_OilSlide-KnucklesAniData; 25
		dc.w KnucklesAni_Hurt-KnucklesAniData; 26
		dc.w KnucklesAni_OilSlide_0-KnucklesAniData; 27
		dc.w KnucklesAni_Blank-KnucklesAniData;	28
		dc.w KnucklesAni_Unused_1-KnucklesAniData; 29
		dc.w KnucklesAni_Unused_2-KnucklesAniData; 30
		dc.w KnucklesAni_Transform-KnucklesAniData; 31
		dc.w KnucklesAni_Gliding-KnucklesAniData; 32
		dc.w KnucklesAni_FallFromGlide-KnucklesAniData;	33
		dc.w KnucklesAni_GetUp-KnucklesAniData;	34
		dc.w KnucklesAni_HardFall-KnucklesAniData; 35
		dc.w KnucklesAni_Badass-KnucklesAniData; 36
KnucklesAni_Walk:dc.b $FF,  7,	8,  1,	2,  3,	4,  5,	6,$FF; 0 ; ...
KnucklesAni_Run:dc.b $FF,$21,$22,$23,$24,$FF,$FF,$FF,$FF,$FF; 0	; ...
KnucklesAni_Roll:dc.b $FE,$9A,$96,$9A,$97,$9A,$98,$9A,$99,$FF; 0 ; ...
KnucklesAni_Roll2:dc.b $FE,$9A,$96,$9A,$97,$9A,$98,$9A,$99,$FF;	0 ; ...
KnucklesAni_Push:dc.b $FD,$CE,$CF,$D0,$D1,$FF,$FF,$FF,$FF,$FF; 0 ; ...
KnucklesAni_Wait:dc.b	5,$56,$56,$56,$56,$56,$56,$56,$56,$56,$56,$56,$56; 0 ; ...
		dc.b $56,$56,$56,$56,$56,$56,$56,$56,$56,$56,$56,$56,$56; 13
		dc.b $56,$56,$56,$56,$56,$56,$56,$56,$56,$56,$56,$56,$56; 26
		dc.b $56,$56,$56,$56,$56,$56,$56,$56,$56,$56,$56,$56,$D2; 39
		dc.b $D2,$D2,$D3,$D3,$D3,$D2,$D2,$D2,$D3,$D3,$D3,$D2,$D2; 52
		dc.b $D2,$D3,$D3,$D3,$D2,$D2,$D2,$D3,$D3,$D3,$D2,$D2,$D2; 65
		dc.b $D3,$D3,$D3,$D2,$D2,$D2,$D3,$D3,$D3,$D2,$D2,$D2,$D3; 78
		dc.b $D3,$D3,$D2,$D2,$D2,$D3,$D3,$D3,$D2,$D2,$D2,$D3,$D3; 91
		dc.b $D3,$D4,$D4,$D4,$D4,$D4,$D7,$D8,$D9,$DA,$DB,$D8,$D9; 104
		dc.b $DA,$DB,$D8,$D9,$DA,$DB,$D8,$D9,$DA,$DB,$D8,$D9,$DA; 117
		dc.b $DB,$D8,$D9,$DA,$DB,$D8,$D9,$DA,$DB,$D8,$D9,$DA,$DB; 130
		dc.b $DC,$DD,$DC,$DD,$DE,$DE,$D8,$D7,$FF; 143
KnucklesAni_Balance:dc.b   3,$9F,$9F,$A0,$A0,$A1,$A1,$A2,$A2,$A3,$A3,$A4,$A4; 0	; ...
		dc.b $A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5; 13
		dc.b $A5,$A5,$A6,$A6,$A6,$A7,$A7,$A7,$A8,$A8,$A9,$A9,$AA; 26
		dc.b $AA,$FE,  6		  ; 39
KnucklesAni_LookUp:dc.b	  5,$D5,$D6,$FE,  1	     ; 0 ; ...
KnucklesAni_Duck:dc.b	5,$9B,$9C,$FE,	1	   ; 0 ; ...
KnucklesAni_Spindash:dc.b   0,$86,$87,$86,$88,$86,$89,$86,$8A,$86,$8B,$FF; 0 ; ...
KnucklesAni_Unused:dc.b	  9,$BA,$C5,$C6,$C6,$C6,$C6,$C6,$C6,$C7,$C7,$C7,$C7; 0 ; ...
		dc.b $C7,$C7,$C7,$C7,$C7,$C7,$C7,$C7,$FD,  0; 13
KnucklesAni_Pull:dc.b  $F,$8F,$FF		   ; 0 ; ...
KnucklesAni_Balance2:dc.b   3,$A1,$A1,$A2,$A2,$A3,$A3,$A4,$A4,$A5,$A5,$A5,$A5; 0 ; ...
		dc.b $A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A6,$A6; 13
		dc.b $A6,$A7,$A7,$A7,$A8,$A8,$A9,$A9,$AA,$AA,$FE; 26
		dc.b   6
KnucklesAni_Stop:dc.b	3,$9D,$9E,$9F,$A0,$FD,	0  ; 0 ; ...
KnucklesAni_Float:dc.b	 7,$C0,$FF		    ; 0	; ...
KnucklesAni_Float2:dc.b	  5,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$FF; 0 ; ...
KnucklesAni_Spring:dc.b	$2F,$8E,$FD,  0		     ; 0 ; ...
KnucklesAni_Hang:dc.b	1,$AE,$AF,$FF		   ; 0 ; ...
KnucklesAni_Unused_0:dc.b  $F,$43,$43,$43,$FE,	1      ; 0 ; ...
KnucklesAni_S3EndingPose:dc.b	5,$B1,$B2,$B2,$B2,$B3,$B4,$FE,	1,  7,$B1,$B3,$B3; 0 ; ...
		dc.b $B3,$B3,$B3,$B3,$B2,$B3,$B4,$B3,$FE,  4; 13
KnucklesAni_WFZHang:dc.b $13,$91,$FF		      ;	0 ; ...
KnucklesAni_Bubble:dc.b	 $B,$B0,$B0,  3,  4,$FD,  0  ; 0 ; ...
KnucklesAni_DeathBW:dc.b $20,$AC,$FF		      ;	0 ; ...
KnucklesAni_Drown:dc.b $20,$AD,$FF		    ; 0	; ...
KnucklesAni_Death:dc.b $20,$AB,$FF		    ; 0	; ...
KnucklesAni_OilSlide:dc.b   9,$8C,$FF		       ; 0 ; ...
KnucklesAni_Hurt:dc.b $40,$8D,$FF		   ; 0 ; ...
KnucklesAni_OilSlide_0:dc.b   9,$8C,$FF			 ; 0 ; ...
KnucklesAni_Blank:dc.b $77,  0,$FF		    ; 0	; ...
KnucklesAni_Unused_1:dc.b   3,$9F,$9F,$A0,$A0,$A1,$A1,$A2,$A2,$A3,$A3,$A4,$A4; 0	; ...
		dc.b $A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5; 13
		dc.b $A5,$A5,$A6,$A6,$A6,$A7,$A7,$A7,$A8,$A8,$A9,$A9,$AA; 26
		dc.b $AA,$FE,  6		  ; 39
KnucklesAni_Unused_2:dc.b   3,$9F,$9F,$A0,$A0,$A1,$A1,$A2,$A2,$A3,$A3,$A4,$A4; 0	; ...
		dc.b $A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5; 13
		dc.b $A5,$A5,$A6,$A6,$A6,$A7,$A7,$A7,$A8,$A8,$A9,$A9,$AA; 26
		dc.b $AA,$FE,  6		  ; 39
KnucklesAni_Gliding:dc.b $1F,$C0,$FF		      ;	0 ; ...
KnucklesAni_FallFromGlide:dc.b	 7,$CA,$CB,$FE,	 1	    ; 0	; ...
KnucklesAni_GetUp:dc.b	$F,$CD,$FD,  0		    ; 0	; ...
KnucklesAni_HardFall:dc.b  $F,$9C,$FD,	0	       ; 0 ; ...
KnucklesAni_Badass:dc.b	  5,$D8,$D9,$DA,$DB,$D8,$D9,$DA,$DB,$D8,$D9,$DA,$DB; 0 ; ...
		dc.b $D8,$D9,$DA,$DB,$D8,$D9,$DA,$DB,$D8,$D9,$DA,$DB,$D8; 13
		dc.b $D9,$DA,$DB,$D8,$D9,$DA,$DB,$DC,$DD,$DC,$DD,$DE,$DE; 26
		dc.b $FF			  ; 39
KnucklesAni_Transform:dc.b   2,$EB,$EB,$EC,$ED,$EC,$ED,$EC,$ED,$EC,$ED,$EC,$ED;	0 ; ...
		dc.b $FD,  0,  0		  ; 13

; =============== S U B	R O U T	I N E =======================================


LoadKnucklesDynPLC:				  ; ...
    moveq	#0,d0
    move.b	mapping_frame(a0),d0
; End of function LoadKnucklesDynPLC

; START	OF FUNCTION CHUNK FOR sub_333D66

LoadKnucklesDynPLC_Part2:			  ; ...
    cmp.b	(Sonic_LastLoadedDPLC).w,d0
    beq.w	return_31753E
    move.b	d0,(Sonic_LastLoadedDPLC).w
    lea	(MapRUnc_Knuckles).l,a2	  ; SK_PLC_Knuckles
    add.w	d0,d0
    add.w	(a2,d0.w),a2
    move.w	(a2)+,d5
    subq.w	#1,d5
    bmi.w	return_31753E
	move.w	#tiles_to_bytes(ArtTile_ArtUnc_Sonic),d4
; loc_1B86E:
KPLC_ReadEntry:
	moveq	#0,d1
	move.w	(a2)+,d1
	move.w	d1,d3
	lsr.w	#8,d3
	andi.w	#$F0,d3
	addi.w	#$10,d3
	andi.w	#$FFF,d1
	lsl.l	#5,d1
	addi.l	#ArtUnc_Knuckles,d1
	move.w	d4,d2
	add.w	d3,d4
	add.w	d3,d4
	jsr	(QueueDMATransfer).l
	dbf	d5,KPLC_ReadEntry	; repeat for number of entries
return_31753E:					  ; ...
		rts
; END OF FUNCTION CHUNK	FOR sub_333D66
; ---------------------------------------------------------------------------
; =============== S U B	R O U T	I N E =======================================

; Doesn't exist in S2

sub_3192E6:					  ; ...
		move.b	x_radius(a0),d0
		ext.w	d0
		sub.w	d0,d2
		eor.w	#$F,d2
		lea	(Primary_Angle).w,a4
		move.w	#-$10,a3
		move.w	#$800,d6
		bsr.w	FindFloor
		move.b	#$80,d2

loc_319306:
		bra.w	loc_318FE8
; End of function sub_3192E6

; START	OF FUNCTION CHUNK FOR CheckRightWallDist

loc_318FE8:					  ; ...
		move.b	(Primary_Angle).w,d3
		btst	#0,d3
		beq.s	return_318FF4
		move.b	d2,d3

return_318FF4:					  ; ...
		rts
; END OF FUNCTION CHUNK	FOR CheckRightWallDist

; =============== S U B	R O U T	I N E =======================================


sub_318FF6:					  ; ...
		move.b	x_radius(a0),d0
		ext.w	d0
		add.w	d0,d2
		lea	(Primary_Angle).w,a4
		move.w	#$10,a3
		move.w	#0,d6
		bsr.w	FindFloor
		move.b	#0,d2
		bra.s	loc_318FE8
; End of function sub_318FF6

; ---------------------------------------------------------------------------
; This doesn't exist in S2...
; START	OF FUNCTION CHUNK FOR sub_315C22

loc_319208:					  ; ...
		move.b	x_radius(a0),d0
		ext.w	d0
		add.w	d0,d3
		lea	(Primary_Angle).w,a4
		move.w	#$10,a3
		move.w	#0,d6
		bsr.w	FindWall
		move.b	#$C0,d2
		bra.w	loc_318FE8
; END OF FUNCTION CHUNK	FOR sub_315C22

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_315C22

loc_3193D2:					  ; ...
		move.b	x_radius(a0),d0
		ext.w	d0
		sub.w	d0,d3
		eor.w	#$F,d3
		lea	(Primary_Angle).w,a4
		move.w	#$FFF0,a3
		move.w	#$400,d6
		bsr.w	FindWall
		move.b	#$40,d2
		bra.w	loc_318FE8
; END OF FUNCTION CHUNK	FOR sub_315C22