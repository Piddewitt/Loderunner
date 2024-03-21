        * = $1000


B_Vic   = $d000
B_Vmem  = $2000
pY      = $2
pX      = $3
pX1     = $5
pY1     = $52
pXR     = $a8
pYR     = $a6
dA      = $a3
wOffs   = $fb
 
 
; ************************************************
;
;       Circle
; 
;       input: pX1 (word 0-319**), center x-coord
;              pY1 (byte 0-199**), center y-coord
;              pXR (word 0-320**), radius
;       **values can in fact be larger: Y can be up to 255
;       while X and R can be up to 65535 (X in 0-32767 for 
;       circles centered outside the video on the right, 
;       32768-65535 for circles outside on the left)         
;
;
; 0       circle (x0, y0, r)
; 1           x=r;
; 2           y=0;
; 3           a=x;
; 4           while (true) {
; 5                plot(x0+x,y0+y);
; 6                plot(x0+x,y0-y);
; 7                plot(x0-x,y0-y);
; 8                plot(x0-x,y0+y);
; 9                plot(x0+y,y0+x);
; 10               plot(x0+y,y0-x);
; 11               plot(x0-y,y0-x);
; 12               plot(x0-y,y0+x);
; 13             if (x>y) break;
; 14             y=y+1;
; 15             a=a-y;
; 16             if (a<0) { 
; 17                x=x-1;
; 18                a=a+x;
; 19             }
; 20          }       
;
;       algo: http://ffd2.com/fridge/chacking/c=hacking9.txt
;       draws the circle plotting 8 arcs 
;                         arc8 - - arc1
;                       arc7 /     \ arc2
;                       arc6 \     / arc3
;                         arc5 - - arc4
;
; ************************************************
 
xoPx    = $61 ; byte 0,0
xoPy    = $63 ; byte 0,0
xoMx    = $65 ; byte 0,0
xoMy    = $69 ; byte 0,0
yoPx    = $6b ; byte 0
yoPy    = $6c ; byte 0
yoMx    = $6d ; byte 0
yoMy    = $6e ; byte 0
; --------------------------------------------------------------------------------------------------------------------- ;
B_Circle
                            lda #0                          ; ****** 2. YR=0
                            sta pYR                         ; 
                            sta pYR+1                       ; 
                            lda pXR                         ; ****** 3. dA=X (=R)
                            sta dA                          ; 
                            lda pXR+1                       ; 
                            sta dA+1                        ; 
; --------------------------------------------------------------------------------------------------------------------- ;
                                                            ; ****** 5-12: preparation
; --------------------------------------------------------------------------------------------------------------------- ;
B_cb                        clc                             ; x0+x
                            lda pXR                         ; 
                            adc pX1                         ; 
                            sta xoPx                        ; 
                            lda pXR+1                       ; 
                            adc pX1+1                       ; 
                            sta xoPx+1                      ; 
; --------------------------------------------------------------------------------------------------------------------- ;
                            sec                             ; x0-x
                            lda pX1                         ; 
                            sbc pXR                         ; 
                            sta xoMx                        ; 
                            lda pX1+1                       ; 
                            sbc pXR+1                       ; 
                            sta xoMx+1                      ; 
; --------------------------------------------------------------------------------------------------------------------- ;
                            clc                             ; x0+y
                            lda pYR                         ; 
                            adc pX1                         ; 
                            sta xoPy                        ; 
                            lda pYR+1                       ; 
                            adc pX1+1                       ; 
                            sta xoPy+1                      ; 
; --------------------------------------------------------------------------------------------------------------------- ;
                            sec                             ; x0-y
                            lda pX1                         ; 
                            sbc pYR                         ; 
                            sta xoMy                        ; 
                            lda pX1+1                       ; 
                            sbc pYR+1                       ; 
                            sta xoMy+1                      ; 
; --------------------------------------------------------------------------------------------------------------------- ;
                            clc                             ; y0+x
                            lda pXR                         ; 
                            adc pY1                         ; 
                            bcs B_noY1                      ; if Y+XR>255 then won't plot it
                            sta yoPx                        ; 
                            lda pXR+1                       ; 
                            beq B_2yoMX                     ; 
B_noY1                      lda #201                        ; if outside the video, sets Y=201
                            sta yoPx                        ; 
; --------------------------------------------------------------------------------------------------------------------- ;
B_2yoMX                     sec                             ; y0-x
                            lda pY1                         ; 
                            sbc pXR                         ; 
                            bcc B_noY2                      ; if XR > Y then it's outside the video
                            sta yoMx                        ; 
                            lda pXR+1                       ; 
                            beq B_2yoPy                     ; 
B_noY2                      lda #201                        ; if outside the video, sets Y=201
                            sta yoMx                        ; 
; --------------------------------------------------------------------------------------------------------------------- ;
B_2yoPy                     clc                             ; y0+y
                            lda pYR                         ; 
                            adc pY1                         ; 
                            bcs B_noY3                      ; if Y+YR>255 then won't plot it
                            sta yoPy                        ; 
                            lda pYR+1                       ; 
                            beq B_2yoMy                     ; 
B_noY3                      lda #201                        ; if outside the video, sets Y=201
                            sta yoPy                        ; 
; --------------------------------------------------------------------------------------------------------------------- ;
B_2yoMy                     sec                             ; y0-y
                            lda pY1                         ; 
                            sbc pYR                         ; 
                            bcc B_noY4                      ; if YR > Y then it's outside the video
                            sta yoMy                        ; 
                            lda pYR+1                       ; 
                            beq Plot8                       ; 
B_noY4                      lda #201                        ; if outside the video, sets Y=201
                            sta yoMy                        ; 
; --------------------------------------------------------------------------------------------------------------------- ;
Plot8                       lda xoPx                        ; ****** 5. ESE, arc 3
                            sta pX                          ; 
                            lda xoPx+1                      ; 
                            sta pX+1                        ; 
                            lda yoPy                        ; 
                            sta pY                          ; 
                            jsr CheckPlot                   ; 
                                                            ; 
                            lda yoMy                        ; ****** 6. ENE, arc 2
                            sta pY                          ; 
                            jsr CheckPlot                   ; 
                                                            ; 
                            lda xoMx                        ; ****** 7. WNW, arc 7
                            sta pX                          ; 
                            lda xoMx+1                      ; 
                            sta pX+1                        ; 
                            jsr CheckPlot                   ; 
                                                            ; 
                            lda yoPy                        ; ****** 8. WSW, arc 6
                            sta pY                          ; 
                            jsr CheckPlot                   ; 
                                                            ; 
                            lda xoPy                        ; ****** 9. SSE, arc 4
                            sta pX                          ; 
                            lda xoPy+1                      ; 
                            sta pX+1                        ; 
                            lda yoPx                        ; 
                            sta pY                          ; 
                            jsr CheckPlot                   ; 
                                                            ; 
                            lda yoMx                        ; ****** 10. NNE, arc 1
                            sta pY                          ; 
                            jsr CheckPlot                   ; 
                                                            ; 
                            lda xoMy                        ; ****** 11. NNW, arc 8
                            sta pX                          ; 
                            lda xoMy+1                      ; 
                            sta pX+1                        ; 
                            jsr CheckPlot                   ; 
                                                            ; 
                            lda yoPx                        ; ****** 12. SSW, arc 5
                            sta pY                          ; 
                            jsr CheckPlot                   ; 
                                                            ; 
                            lda pYR                         ; ****** 13. y<=x ?
                            cmp pXR                         ; 
                            lda pYR+1                       ; 
                            sbc pXR+1                       ; 
                            bcc over                        ; if YR<=XR go on
                            rts                             ; end
over                        inc pYR                         ; ****** 14. YR=YR+1
                            bne noYRhi                      ; 
                            inc pYR+1                       ; 
noYRhi                      sec                             ; ****** 15. dA=dA-YR
                            lda dA                          ; 
                            sbc pYR                         ; 
                            sta dA                          ; 
                            lda dA+1                        ; 
                            sbc pYR+1                       ; 
                            sta dA+1                        ; 
                            bpl noX                         ; ****** 16. dA<0 ?
                            lda pXR                         ; ****** 17. XR=XR-1
                            bne noXRhi                      ; 
                            dec pXR+1                       ; 
noXRhi                      dec pXR                         ; 
                            clc                             ; ****** 18. dA=dA+XR
                            lda dA                          ; 
                            adc pXR                         ; 
                            sta dA                          ; 
                            lda dA+1                        ; 
                            adc pXR+1                       ; 
                            sta dA+1                        ; 
noX                         jmp B_cb                        ;  
; --------------------------------------------------------------------------------------------------------------------- ;
;       Plot
; 
;       input: pX (word 0-319**)
;              pY (byte 0-200**)
;       **boundary check via CheckPlot
; 
; offset = BaseAddr + 320*int(Y/8)+(Y and 7) + 8*int(X/8)
; pixel  = 2^(7-(X and 7))
; --------------------------------------------------------------------------------------------------------------------- ;
CheckPlot
                            lda pY                          ; 
                            cmp #200                        ; 
                            bcs B_CPRet                     ; <
                            
                            lda pX                          ; 
                            cmp #<320                       ; 
                            lda pX+1                        ; 
                            sbc #>320                       ; 
                            bcs B_CPRet                     ; 
                            
;                           jmp B_Plot                      ; 
                                                            ; 
B_Plot                                                      ; 
                            ldy #0                          ; 2     ; comput. dY
                            sty wOffs                       ; 3     ; reset lobyte
                            
                            lda pY                          ; 3
                            lsr                             ; 2
                            lsr                             ; 2
                            lsr                             ; 2     ; int(Y/8)
                            sta wOffs+1                     ; 3     ; 256*int(Y/8) hibyte (lobyte=0)
                            
                            lsr                             ; 2
                            ror wOffs                       ; 5
                            lsr                             ; 2     ; 64*int(Y/8)  hibyte
                            ror wOffs                       ; 5     ; 64*int(Y/8)  lobyte  (= 320*int(Y/8) lobyte)
                            adc wOffs+1                     ; 3     ; 256*int(Y/8) + 64*int(Y/8)  hibyte
                            sta wOffs+1                     ; 3     ; =320*int(Y/8) hibyte
                            
                            lda pY                          ; 3     ; add (Y and 7)
                            and #7                          ; 2
                            ora wOffs                       ; 3     ; lobyte [xx000xxx]
                            sta wOffs                       ; 3  48   
                                                            ; 
                            lda pX                          ; 3     ; dX + dY + BaseAddr
                            and #248                        ; 2
                            adc wOffs                       ; 3
                            sta wOffs                       ; 3
                            
                            lda wOffs+1                     ; 3
                            adc pX+1                        ; 3
                            adc #>B_Vmem                    ; 2
                            sta wOffs+1                     ; 3  22
                                                            ; 
                            lda pX                          ; 3     ; set pixel-bit
                            and #7                          ; 2
                            tax                             ; 2
                            lda (wOffs),y                   ; 5     
                            ora ortab,x                     ; 4
                            sta (wOffs),y                   ; 6  22
                    
B_CPRet                     rts
; --------------------------------------------------------------------------------------------------------------------- ;
ortab                       .byte 128, 64, 32, 16, 8, 4, 2, 1
; --------------------------------------------------------------------------------------------------------------------- ;
