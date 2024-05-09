/**
 * @file kernal.asm
 * @brief Kernal module
 * @details This file contains labels that map to the Kernal routines of the Commodore 128.
 *
 * The Kernal is the operating system of the Commodore 128. It provides a variety of routines
 * for tasks such as input/output handling, memory management, and interrupt handling.
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

/** Performs power-on/reset sequence https://c128lib.github.io/Reference/E000#E000 */
.label RESET = $E000
/** Restores Kernal indirect vectors to their default values https://c128lib.github.io/Reference/E000#E056 */
.label RESTOR = $E056
/** Loads or copies Kernal indirect vector values https://c128lib.github.io/Reference/E000#E05B */
.label VECTOR = $E05B
/** Initializes. zero page and Kernal pointers https://c128lib.github.io/Reference/E000#E093 */
.label RAMTAS = $E093
/** Initializes I/O chip registers https://c128lib.github.io/Reference/E000#E109 */
.label IOINIT = $E109
/** Switches the system into 64 mode https://c128lib.github.io/Reference/E000#E24B */
.label C64MODE = $E24B
/** Sends TALK command to a serial device https://c128lib.github.io/Reference/E000#E33B */
.label TALK = $E33B
/** Sends LISTEN command to a serial device https://c128lib.github.io/Reference/E000#E33E */
.label LISTEN = $E33E
/** Reads a byte from a serial device https://c128lib.github.io/Reference/E000#E43E */
.label ACPTR = $E43E
/** Sends secondary address after LISTEN https://c128lib.github.io/Reference/E000#E4D2 */
.label SECOND = $E4D2
/** Sends secondary address after TALK https://c128lib.github.io/Reference/E000#E4E0 */
.label TKSA = $E4E0
/** Sends a byte to a serial device https://c128lib.github.io/Reference/E000#E503 */
.label CIOUT = $E503
/** Sends UNTALK command to a serial device https://c128lib.github.io/Reference/E000#E515 */
.label UNTLK = $E515
/** Sends UNLISTEN command to a serial device https://c128lib.github.io/Reference/E000#E526 */
.label UNLSN = $E526
/** Sets serial device for fast serial input https://c128lib.github.io/Reference/E000#E5C3 */
.label SPIN = $E5C3

/** Sets serial device for fast serial output https://c128lib.github.io/Reference/E000#E5D6 */
.label SPOUT = $E5D6
/** Sets serial device for fast serial input or output https://c128lib.github.io/Reference/E000#E5FB */
.label SPIN_SPOUT = $E5FB
/** Retrieves a byte from the current input device https://c128lib.github.io/Reference/E000#EEEB */
.label GETIN = $EEEB
/** Accepts a byte from the current input device https://c128lib.github.io/Reference/E000#EF06 */
.label BASIN = $EF06
/** Sends a byte to the current output device https://c128lib.github.io/Reference/E000#EF79 */
.label BSOUT = $EF79
/** Opens a logical file to a specified device https://c128lib.github.io/Reference/E000#EFBD */
.label OPEN = $EFBD
/** Sets the current input file for GETIN and BASIN https://c128lib.github.io/Reference/E000#F106 */
.label CHKIN = $F106
/** Sets the current output file for BSOUT https://c128lib.github.io/Reference/E000#F14C */
.label CKOUT = $F14C
/** Closes a specified logical file https://c128lib.github.io/Reference/E000#F188 */
.label CLOSE = $F188
/** Clears file table entries https://c128lib.github.io/Reference/E000#F222 */
.label CLALL = $F222
/** Resets default I/O channels https://c128lib.github.io/Reference/E000#F226 */
.label CLRCH = $F226
/** Closes all open files for a specified serial device https://c128lib.github.io/Reference/E000#F23D */
.label CLOSE_ALL = $F23D
/** Loads or verifies a program file from disk or tape https://c128lib.github.io/Reference/E000#F265 */
.label LOAD = $F265
/** Saves a block of memory to tape or disk https://c128lib.github.io/Reference/E000#F53E */
.label SAVE = $F53E
/** Updates jiffy timers and checks RUN/STOP key column https://c128lib.github.io/Reference/E000#F5F8 */
.label UDTIM = $F5F8
/** Reads the software jiffy clock https://c128lib.github.io/Reference/E000#F65E */
.label RDTIM = $F65E
/** Sets the software jiffy clock https://c128lib.github.io/Reference/E000#F665 */
.label SETTIM = $F665
/** Tests for a RUN/STOP keypress https://c128lib.github.io/Reference/E000#F66E */
.label STOP = $F66E
/** Sets the length and address of filename for I/O operations https://c128lib.github.io/Reference/E000#F731 */
.label SETNAM = $F731
/** Sets logical file number, device number, and secondary address for I/O operations https://c128lib.github.io/Reference/E000#F738 */
.label SETLFS = $F738
/** Sets data and filename banks for I/O operations https://c128lib.github.io/Reference/E000#F73F */
.label SETBNK = $F73F
/** Reads the tape/serial or RS-232 status byte https://c128lib.github.io/Reference/E000#F744 */
.label READSS = $F744
/** Sets the Kernal message control flag https://c128lib.github.io/Reference/E000#F75C */
.label SETMSG = $F75C
/** Sets the IEEE timeout flag https://c128lib.github.io/Reference/E000#F75F */
.label SETTMO = $F75F
/** Sets or reads the system’s top-of-memory pointer https://c128lib.github.io/Reference/E000#F763 */
.label MEMTOP = $F763
/** Sets or reads the system’s bottom-of-memory pointer https://c128lib.github.io/Reference/E000#F772 */
.label MEMBOT = $F772
/** Returns base address of I/0 block https://c128lib.github.io/Reference/E000#F781 */
.label IOBASE = $F781
/** Checks whether a secondary address value is used https://c128lib.github.io/Reference/E000#F786 */
.label LKUPSA = $F786
/** Checks whether a logical file number value is used https://c128lib.github.io/Reference/E000#F79D */
.label LKUPLA = $F79D
/** Performs a DMA operation https://c128lib.github.io/Reference/E000#F7A5 */
.label DMA_CALL = $F7A5
/** Retrieves a character from any bank https://c128lib.github.io/Reference/E000#F7D0 */
.label INDFET = $F7D0
/** Stores the accumulator contents in any bank https://c128lib.github.io/Reference/E000#F7DA */
.label INDSTA = $F7DA
/** Compares the accumulator contents with a value from any bank https://c128lib.github.io/Reference/E000#F7E3 */
.label INDCMP = $F7E3
/** Translates a bank number into an MMU register setting https://c128lib.github.io/Reference/E000#F7EC */
.label GETCFG = $F7EC
/** Initializes function ROMs and attempts to boot a disk in the default drive https://c128lib.github.io/Reference/E000#F867 */
.label PHOENIX = $F867
/** Attempts to boot a disk https://c128lib.github.io/Reference/E000#F890 */
.label BOOT_CALL = $F890
/** Handles PRIMM (print immediate) function https://c128lib.github.io/Reference/E000#FA17 */
.label PRIMM = $FA17
/** Handles NMI interrupts https://c128lib.github.io/Reference/E000#FA40 */
.label NMI = $FA40
/** Handles IRQ interrupts https://c128lib.github.io/Reference/E000#FA65 */
.label IRQ = $FA65

/** Serial fast input or output https://c128lib.github.io/Reference/E000#FF47 */
.label JSPIN_SPOUT = $FF47
/** Close all files to a device https://c128lib.github.io/Reference/E000#FF4A */
.label JCLOSE_ALL = $FF4A
/** Enter 64 mode https://c128lib.github.io/Reference/E000#FF4D */
.label JC64MODE = $FF4D
/** Send command to dma device https://c128lib.github.io/Reference/E000#FF50 */
.label JDMA_CALL = $FF50
/** Boot a program from disk https://c128lib.github.io/Reference/E000#FF53 */
.label JBOOT_CALL = $FF53
/** Init function cartridges https://c128lib.github.io/Reference/E000#FF56 */
.label JPHOENIX = $FF56
/** Work around a user’s open disk channels https://c128lib.github.io/Reference/E000#FF59 */
.label JLKUPLA = $FF59
/** Work around a user’s open disk channels https://c128lib.github.io/Reference/E000#FF5C */
.label JLKUPSA = $FF5C
/** Switch between 40-column VIC (composite) video display and 80-column 8563 (RGBI) video display. https://c128lib.github.io/Reference/E000#FF5F */
.label JSWAPPER = $FF5F
/** Copy char defintions from ROM to VDC RAM https://c128lib.github.io/Reference/E000#FF62 */
.label JDLCHR = $FF62
/** Program function key https://c128lib.github.io/Reference/E000#FF65 */
.label JPFKEY = $FF65
/** Set bank for i/o operations https://c128lib.github.io/Reference/E000#FF68 */
.label JSETBNK = $FF68
/** Get MMU bank configuration byte https://c128lib.github.io/Reference/E000#FF6B */
.label JGETCFG = $FF6B
/** Jump to subroutine in any bank https://c128lib.github.io/Reference/E000#FF6E */
.label JJSRFAR = $FF6E
/** Jump to routine in any bank https://c128lib.github.io/Reference/E000#FF71 */
.label JJMPFAR = $FF71
/** Lda indexed from any bank https://c128lib.github.io/Reference/E000#FF74 */
.label JINDFET = $FF74
/** Sta indexed to any bank https://c128lib.github.io/Reference/E000#FF77 */
.label JINDSTA = $FF77
/** Cmp indexed to any bank https://c128lib.github.io/Reference/E000#FF7A */
.label JINDCMP = $FF7A
/** Print Immediate utility https://c128lib.github.io/Reference/E000#FF7D */
.label JPRIMM = $FF7D
/** Initialize screen editor and devices https://c128lib.github.io/Reference/E000#FF81 */
.label JCINT = $FF81
/** Initialize system I/O https://c128lib.github.io/Reference/E000#FF84 */
.label JIOINIT = $FF84
/** Init RAM and buffers https://c128lib.github.io/Reference/E000#FF87 */
.label JRAMTAS = $FF87
/** Initialize Kernal indirects https://c128lib.github.io/Reference/E000#FF8A */
.label JRESTOR = $FF8A
/* Initialize or copy indirects* https://c128lib.github.io/Reference/E000#FF8D */
.label JVECTOR = $FF8D
/** Kernal messages on/off https://c128lib.github.io/Reference/E000#FF90 */
.label JSETMSG = $FF90
/** Serial - send SA after LISTEN https://c128lib.github.io/Reference/E000#FF93 */
.label JSECOND = $FF93
/** Serial - send SA after TALK https://c128lib.github.io/Reference/E000#FF96 */
.label JTKSA = $FF96
/** Read/set top of system RAM https://c128lib.github.io/Reference/E000#FF99 */
.label JMEMTOP = $FF99
/** Set/read bottom of system RAM https://c128lib.github.io/Reference/E000#FF9C */
.label JMEMBOT = $FF9C
/** Scans the entire c128 keyboard https://c128lib.github.io/Reference/E000#FF9F */
.label JKEY = $FF9F
/** Not used in the C128 https://c128lib.github.io/Reference/E000#FA2 */
.label JSETTMO = $FFA2
/** Serial - byte input https://c128lib.github.io/Reference/E000#FFA5 */
.label JACPTR = $FFA5
/** Serial - byte output https://c128lib.github.io/Reference/E000#FFA8 */
.label JCIOUT = $FFA8
/** Serial - send untalk https://c128lib.github.io/Reference/E000#FFAB */
.label JUNTLK = $FFAB
/** Serial - send unlisten https://c128lib.github.io/Reference/E000#FFAE */
.label JUNLSN = $FFAE
/** Serial - send listen command https://c128lib.github.io/Reference/E000#FFB1 */
.label JLISTN = $FFB1
/** Serial - send talk https://c128lib.github.io/Reference/E000#FFB4 */
.label JTALK = $FFB4
/** Read I/O status byte https://c128lib.github.io/Reference/E000#FFB7 */
.label JREADSS = $FFB7
/** Set logical file https://c128lib.github.io/Reference/E000#FFBA */
.label JSETLFS = $FFBA
/** Set file name https://c128lib.github.io/Reference/E000#FFBD */
.label JSETNAM = $FFBD
/** Open device channel https://c128lib.github.io/Reference/E000#FFC0 */
.label JOPEN = $FFC0
/** Close device channel https://c128lib.github.io/Reference/E000#FFC3 */
.label JCLOSE = $FFC3
/** Set channel in https://c128lib.github.io/Reference/E000#FFC6 */
.label JCHKIN = $FFC6
/** Set channel out https://c128lib.github.io/Reference/E000#FFC9 */
.label JCHKOUT = $FFC9
/** Restore default i/o channels https://c128lib.github.io/Reference/E000#FFCC */
.label JCLRCH = $FFCC
/** Input from channel https://c128lib.github.io/Reference/E000#FFCF */
.label JBASIN = $FFCF
/** Output to channel https://c128lib.github.io/Reference/E000#FFD2 */
.label JBSOUT = $FFD2
/** Load from device https://c128lib.github.io/Reference/E000#FFD5 */
.label JLOAD = $FFD5
/** Save to device https://c128lib.github.io/Reference/E000#FFD8 */
.label JSAVE = $FFD8
/** Set software clock https://c128lib.github.io/Reference/E000#FFDB */
.label JSETTIM = $FFDB
/** Read software clock https://c128lib.github.io/Reference/E000#FFDE */
.label JRDTIM = $FFDE
/** Scan the STOP key https://c128lib.github.io/Reference/E000#FFE1 */
.label JSTOP = $FFE1
/** Get key input https://c128lib.github.io/Reference/E000#FFE4 */
.label JGETIN = $FFE4
/** Close all files and channels https://c128lib.github.io/Reference/E000#FFE7 */
.label JCLALL = $FFE7
/** Increment internal clock https://c128lib.github.io/Reference/E000#FFEA */
.label JUDTIM = $FFEA
/** Get current screen window size https://c128lib.github.io/Reference/E000#FFED */
.label JSCRORG = $FFED
/** Set or read cursor position https://c128lib.github.io/Reference/E000#FFD0 */
.label JPLOT = $FFF0
/** Reads base address of I/O block https://c128lib.github.io/Reference/E000#FFF3 */
.label JIOBASE = $FFF3
/** Non-maskable interrupt vector lo-address https://c128lib.github.io/Reference/E000#FFFA */
.label NMI_LO = $FFFA
/** Non-maskable interrupt vector hi-address https://c128lib.github.io/Reference/E000#FFFA */
.label NMI_HI = $FFFB
/** Cold reset vector lo-address https://c128lib.github.io/Reference/E000#FFFC */
.label RESET_LO = $FFFC
/** Cold reset vector hi-address https://c128lib.github.io/Reference/E000#FFFC */
.label RESET_HI = $FFFD
/** Interrupt service routine vector lo-address https://c128lib.github.io/Reference/E000#FFFE */
.label IRQ_LO = $FFFE
/** Interrupt service routine vector hi-address https://c128lib.github.io/Reference/E000#FFFE */
.label IRQ_HI = $FFFF

}
