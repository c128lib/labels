/**
 * @file kernal.asm
 * @brief Kernal module
 * @details Labels for Kernal support
 * 
 * https://c128lib.github.io/Reference/E000
 *
 * @author Raffaele Intorcia raffaele.intorcia@gmail.com
 *
 * @copyright MIT License
 * Copyright (c) 2024 c128lib - https://github.com/c128lib
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * @date 2024
 */

#importonce

.filenamespace c128lib

.namespace Kernal {

/** Serial fast input or output https://c128lib.github.io/Reference/E000#FF47 */
.label SPIN       = $FF47
/** Close all files to a device https://c128lib.github.io/Reference/E000#FF4A */
.label CLOSE_ALL  = $FF4A
/** Enter 64 mode https://c128lib.github.io/Reference/E000#FF4D */
.label C64MODE    = $FF4D
/** Send command to dma device https://c128lib.github.io/Reference/E000#FF50 */
.label DMA_CALL   = $FF50
/** Boot a program from disk https://c128lib.github.io/Reference/E000#FF53 */
.label BOOT_CALL  = $FF53
/** Init function cartridges https://c128lib.github.io/Reference/E000#FF56 */
.label PHOENIX    = $FF56
/** Work around a user’s open disk channels https://c128lib.github.io/Reference/E000#FF59 */
.label LKUPLA     = $FF59
/** Work around a user’s open disk channels https://c128lib.github.io/Reference/E000#FF5C */
.label LKUPSA     = $FF5C
/** Switch between 40-column VIC (composite) video display and 80-column 8563 (RGBI) video display. https://c128lib.github.io/Reference/E000#FF5F */
.label SWAPPER    = $FF5F
/** Copy char defintions from ROM to VDC RAM https://c128lib.github.io/Reference/E000#FF62 */
.label DLCHR      = $FF62
/** Program function key https://c128lib.github.io/Reference/E000#FF65 */
.label PFKEY      = $FF65
/** Set bank for i/o operations https://c128lib.github.io/Reference/E000#FF68 */
.label SETBNK     = $FF68
/** Get MMU bank configuration byte https://c128lib.github.io/Reference/E000#FF6B */
.label GETCFG     = $FF6B
/** Jump to subroutine in any bank https://c128lib.github.io/Reference/E000#FF6E */
.label JSRFAR     = $FF6E
/** Jump to routine in any bank https://c128lib.github.io/Reference/E000#FF71 */
.label JMPFAR     = $FF71
/** Lda indexed from any bank https://c128lib.github.io/Reference/E000#FF74 */
.label INDFET     = $FF74
/** Sta indexed to any bank https://c128lib.github.io/Reference/E000#FF77 */
.label INDSTA     = $FF77
/** Cmp indexed to any bank https://c128lib.github.io/Reference/E000#FF7A */
.label INDCMP     = $FF7A
/** Print Immediate utility https://c128lib.github.io/Reference/E000#FF7D */
.label PRIMM      = $FF7D
/** Initialize screen editor and devices https://c128lib.github.io/Reference/E000#FF81 */
.label CINT       = $FF81
/** Initialize system I/O https://c128lib.github.io/Reference/E000#FF84 */
.label IOINIT     = $FF84
/** Init RAM and buffers https://c128lib.github.io/Reference/E000#FF87 */
.label RAMTAS     = $FF87
/** Initialize Kernal indirects https://c128lib.github.io/Reference/E000#FF8A */
.label RESTOR     = $FF8A
/* Initialize or copy indirects* https://c128lib.github.io/Reference/E000#FF8D */
.label VECTOR     = $FF8D
/** Kernal messages on/off https://c128lib.github.io/Reference/E000#FF90 */
.label SETMSG     = $FF90
/** Serial - send SA after LISTEN https://c128lib.github.io/Reference/E000#FF93 */
.label SECOND     = $FF93
/** Serial - send SA after TALK https://c128lib.github.io/Reference/E000#FF96 */
.label TKSA       = $FF96
/** Read/set top of system RAM https://c128lib.github.io/Reference/E000#FF99 */
.label MEMTOP     = $FF99
/** Set/read bottom of system RAM https://c128lib.github.io/Reference/E000#FF9C */
.label MEMBOT     = $FF9C
/** Scans the entire c128 keyboard https://c128lib.github.io/Reference/E000#FF9F */
.label KEY        = $FF9F
/** Not used in the C128 https://c128lib.github.io/Reference/E000#FA2 */
.label SETTMO     = $FFA2
/** Serial - byte input https://c128lib.github.io/Reference/E000#FFA5 */
.label ACPTR      = $FFA5
/** Serial - byte output https://c128lib.github.io/Reference/E000#FFA8 */
.label CIOUT      = $FFA8
/** Serial - send untalk https://c128lib.github.io/Reference/E000#FFAB */
.label UNTLK      = $FFAB
/** Serial - send unlisten https://c128lib.github.io/Reference/E000#FFAE */
.label UNLSN      = $FFAE
/** Serial - send listen command https://c128lib.github.io/Reference/E000#FFB1 */
.label LISTN      = $FFB1
/** Serial - send talk https://c128lib.github.io/Reference/E000#FFB4 */
.label TALK       = $FFB4
/** Read I/O status byte https://c128lib.github.io/Reference/E000#FFB7 */
.label READST     = $FFB7
/** Set logical file https://c128lib.github.io/Reference/E000#FFBA */
.label SETLFS     = $FFBA
/** Set file name https://c128lib.github.io/Reference/E000#FFBD */
.label SETNAM     = $FFBD
/** Open device channel https://c128lib.github.io/Reference/E000#FFC0 */
.label OPEN       = $FFC0
/** Close device channel https://c128lib.github.io/Reference/E000#FFC3 */
.label CLOSE      = $FFC3
/** Set channel in https://c128lib.github.io/Reference/E000#FFC6 */
.label CHKIN      = $FFC6
/** Set channel out https://c128lib.github.io/Reference/E000#FFC9 */
.label CHKOUT     = $FFC9
/** Restore default i/o channels https://c128lib.github.io/Reference/E000#FFCC */
.label CLRCH      = $FFCC
/** Input from channel https://c128lib.github.io/Reference/E000#FFCF */
.label BASIN      = $FFCF
/** Output to channel https://c128lib.github.io/Reference/E000#FFD2 */
.label BSOUT      = $FFD2
/** Load from device https://c128lib.github.io/Reference/E000#FFD5 */
.label LOAD       = $FFD5
/** Save to device https://c128lib.github.io/Reference/E000#FFD8 */
.label SAVE       = $FFD8
/** Set software clock https://c128lib.github.io/Reference/E000#FFDB */
.label SETTIM     = $FFDB
/** Read software clock https://c128lib.github.io/Reference/E000#FFDE */
.label RDTIM      = $FFDE
/** Scan the STOP key https://c128lib.github.io/Reference/E000#FFE1 */
.label STOP       = $FFE1
/** Get key input https://c128lib.github.io/Reference/E000#FFE4 */
.label GETIN      = $FFE4
/** Close all files and channels https://c128lib.github.io/Reference/E000#FFE7 */
.label CLALL      = $FFE7
/** Increment internal clock https://c128lib.github.io/Reference/E000#FFEA */
.label UDTIM      = $FFEA
/** Get current screen window size https://c128lib.github.io/Reference/E000#FFED */
.label SCRORG     = $FFED
/** Set or read cursor position https://c128lib.github.io/Reference/E000#FFD0 */
.label PLOT       = $FFF0
/** Reads base address of I/O block https://c128lib.github.io/Reference/E000#FFF3 */
.label IOBASE     = $FFF3
/** Non-maskable interrupt vector lo-address https://c128lib.github.io/Reference/E000#FFFA */
.label NMI_LO       = $FFFA
/** Non-maskable interrupt vector hi-address https://c128lib.github.io/Reference/E000#FFFA */
.label NMI_HI       = $FFFB
/** Cold reset vector lo-address https://c128lib.github.io/Reference/E000#FFFC */
.label RESET_LO     = $FFFC
/** Cold reset vector hi-address https://c128lib.github.io/Reference/E000#FFFC */
.label RESET_HI     = $FFFD
/** Interrupt service routine vector lo-address https://c128lib.github.io/Reference/E000#FFFE */
.label IRQ_LO       = $FFFE
/** Interrupt service routine vector hi-address https://c128lib.github.io/Reference/E000#FFFE */
.label IRQ_HI       = $FFFF

}
