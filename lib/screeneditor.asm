/**
 * @file screeneditor.asm
 * @brief Screen Editor module
 * @details Labels for Screen Editor support
 * 
 * https://c128lib.github.io/Reference/C000
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

.namespace ScreenEditor {

/** Set default characteristics for 40 and 80 column displays https://c128lib.github.io/Reference/C000#C000 */
.label JCINT          = $C000
/** Deposit a screen code to current position  https://c128lib.github.io/Reference/C000#C003 */
.label JDISPLY        = $C003
/** Retrieves a single character from keyboard https://c128lib.github.io/Reference/C000#C006 */
.label JKEYIN         = $C006
/** Retrieves a character from a line of keyboard or screen input https://c128lib.github.io/Reference/C000#C009 */
.label JGETSCRN       = $C009
/** Prints a character at the current position with current attribute https://c128lib.github.io/Reference/C000#C00C */
.label JPRINT         = $C00C
/** Returns information about the current window size https://c128lib.github.io/Reference/C000#C00F */
.label JSCRORG        = $C00F
/** Scans keyboard for keypress https://c128lib.github.io/Reference/C000#C012 */
.label JSCNKEY        = $C012
/** Alternative for SCNKEY routine https://c128lib.github.io/Reference/C000#C015 */
.label JREPEAT        = $C015
/** Reads or sets the cursor position https://c128lib.github.io/Reference/C000#C018 */
.label JPLOT          = $C018
/** Moves cursor on 80 column display to coordinates https://c128lib.github.io/Reference/C000#C01B */
.label JCRSR80        = $C01B
/** Escape sequence handling routing https://c128lib.github.io/Reference/C000#C01E */
.label JESCAPE        = $C01E
/** Redefines a programmable key https://c128lib.github.io/Reference/C000#C021 */
.label JKEYSET        = $C021
/** Handler the screen editor portion of the IRQ handling sequence https://c128lib.github.io/Reference/C000#C024 */
.label JSCNIRQ        = $C024
/** Initializas the character patterns for the 80 column display https://c128lib.github.io/Reference/C000#C027 */
.label JINIT80        = $C027
/** Switches active screen displays https://c128lib.github.io/Reference/C000#C02A */
.label JSWAPPER       = $C02A
/** Sets the position of a corner of the output window https://c128lib.github.io/Reference/C000#C02D */
.label JWINDOW        = $C02D
/** Table of screen line starting address https://c128lib.github.io/Reference/C000#C033 */
.label SADDRTBL       = $C033
/** Table of default screen editor indirect vectors https://c128lib.github.io/Reference/C000#C065 */
.label SCNVCTRS       = $C065
/** Table of default keyboard decoding table pointers https://c128lib.github.io/Reference/C000#C06F */
.label KEYPTRS        = $C06F
/** Initializes screen editor contants, variables, tables and vectors https://c128lib.github.io/Reference/C000#C07B */
.label CINT           = $C07B
/** Clears the current window and homes the cursor https://c128lib.github.io/Reference/C000#C142 */
.label CLEAR          = $C142
/** Moves the cursor to the home position of the current window https://c128lib.github.io/Reference/C000#C150 */
.label HOME           = $C150
/** Sets starting address pointers for the current line https://c128lib.github.io/Reference/C000#C15C */
.label SETLINE        = $C15C
/** Sets starting address pointers for a specified line https://c128lib.github.io/Reference/C000#C15E */
.label SETADDR        = $C15E
/** Performs screen and keyboard portion of IRQ functions https://c128lib.github.io/Reference/C000#C194 */
.label SCNIRQ         = $C194
/** Performs GETIN from keyboard https://c128lib.github.io/Reference/C000#C234 */
.label KEYIN          = $C234
/** Accepts a line of keyboard input and returns the first character https://c128lib.github.io/Reference/C000#C258 */
.label KEYLIN         = $C258
/** Performs BASIN fron screen or keyboard https://c128lib.github.io/Reference/C000#C29B */
.label GETSCRN        = $C29B
/** Handles quote mode flag https://c128lib.github.io/Reference/C000#C2FF */
.label QUOTECK        = $C2FF
/** Provides common exit for screen BSOUT https://c128lib.github.io/Reference/C000#C30C */
.label PRNTEXIT       = $C30C
/** Handles character printing for screen BSOUT https://c128lib.github.io/Reference/C000#C320 */
.label SETCHAR        = $C320
/** Updates the cursor position https://c128lib.github.io/Reference/C000#C33E */
.label UDCRSR         = $C33E
/** Moves the cursor down one line https://c128lib.github.io/Reference/C000#C363 */
.label NEXTLIN        = $C363
/** Insert a new line linked to the one above https://c128lib.github.io/Reference/C000#C37C */
.label OPENLIN        = $C37C
/** Scrolls the window up one line https://c128lib.github.io/Reference/C000#C3A6 */
.label SCROLL         = $C3A6
/** Copies lines up one row and clears bottom line https://c128lib.github.io/Reference/C000#C3DC */
.label SCRLUP         = $C3DC
/** Copies character from a line to another https://c128lib.github.io/Reference/C000#C40D */
.label MOVLINE        = $C40D
/** Clears a line https://c128lib.github.io/Reference/C000#C4A5 */
.label CLRLINE        = $C4A5
/** Fills or copies a block of 8563 Ram (Vdc) https://c128lib.github.io/Reference/C000#C53C */
.label FILLSRAM       = $C53C
/** Scans keyboard matrix for keypress https://c128lib.github.io/Reference/C000#C55D */
.label SCNKEY         = $C55D
/** Decodes key matrix value into character value and handles key repeating https://c128lib.github.io/Reference/C000#C651 */
.label REPEAT         = $C651
/** Table of programmable key character values https://c128lib.github.io/Reference/C000#C6DD */
.label PFKCHRS        = $C6DD
/** Handles cursor blinking for 40 column screen https://c128lib.github.io/Reference/C000#C6E7 */
.label CRSR40         = $C6E7
/** Handles BSOUT to the screen https://c128lib.github.io/Reference/C000#C72D */
.label PRINT          = $C72D
/** Handles return and shift-return characters https://c128lib.github.io/Reference/C000#C76F */
.label RTRN           = $C76F
/** Cancels quote and reverse modes and clears pending inserts https://c128lib.github.io/Reference/C000#C77D */
.label MODESOFF       = $C77D
/** Handles color change characters https://c128lib.github.io/Reference/C000#C7DA */
.label COLORSET       = $C7DA
/** Restores the cursor row and columns positions https://c128lib.github.io/Reference/C000#C932 */
.label RSTRPOS        = $C932
/** Deletes a character in a logical line https://c128lib.github.io/Reference/C000#C93D */
.label DELCHAR        = $C93D
/** Tests tab stop bit for current cursor position https://c128lib.github.io/Reference/C000#C96C */
.label TESTTAB        = $C96C
/** Handles Esc sequences https://c128lib.github.io/Reference/C000#C9BE */
.label ESCAPE         = $C9BE
/** Table of Esc key dispatch addresses https://c128lib.github.io/Reference/C000#C9DE */
.label ESCTBL         = $C9DE
/** Defines the upper left corner of the window https://c128lib.github.io/Reference/C000#CA14 */
.label SETTOP         = $CA14
/** Defines the lower right corner of the window https://c128lib.github.io/Reference/C000#CA16 */
.label SETBTM         = $CA16
/** Sets window boundaries https://c128lib.github.io/Reference/C000#CA1B */
.label WINDOW         = $CA1B
/** Resets the window to full screen size https://c128lib.github.io/Reference/C000#CA24 */
.label FULLW          = $CA24
/** Reads character and attribute at current cursor position https://c128lib.github.io/Reference/C000#CB58 */
.label READCHR        = $CB58
/** Tests whether a line is linked https://c128lib.github.io/Reference/C000#CB74 */
.label TESTLINK       = $CB74
/** Links or unlinks the current screen line https://c128lib.github.io/Reference/C000#CB81 */
.label SETLINK        = $CB81
/** Unlinks a screen line https://c128lib.github.io/Reference/C000#CB85 */
.label UNLINK         = $CB85
/** Links a screen line https://c128lib.github.io/Reference/C000#CB93 */
.label LINK           = $CB93
/** Calculates offsets into the line link bitmap https://c128lib.github.io/Reference/C000#CB9F */
.label FINDLINK       = $CB9F
/** Finds the position of the last character in a line https://c128lib.github.io/Reference/C000#CBC3 */
.label FINDEND        = $CBC3
/** Moves the cursor one position to the right https://c128lib.github.io/Reference/C000#CBED */
.label FORWARD        = $CBED
/** Moves the cursor one position to the left https://c128lib.github.io/Reference/C000#CC00 */
.label RETREAT        = $CC00
/** Stores the cursor position for later restoration https://c128lib.github.io/Reference/C000#CC1E */
.label SAVEPOS        = $CC1E
/** Prints a space https://c128lib.github.io/Reference/C000#CC27 */
.label SPACE          = $CC27
/** Displays a character using the current attribute https://c128lib.github.io/Reference/C000#CC2F */
.label DISPLY1        = $CC2F
/** Displays a character using the previous attribute https://c128lib.github.io/Reference/C000#CC32 */
.label DISPLY2        = $CC32
/** Displays a character at the current cursor position https://c128lib.github.io/Reference/C000#CC34 */
.label DISPLY         = $CC34
/** Returns height and width of current screen window https://c128lib.github.io/Reference/C000#CC5B */
.label SCRORG         = $CC5B
/** Reads or sets the current cursor position https://c128lib.github.io/Reference/C000#CC6A */
.label PLOT           = $CC6A
/** Defines a programmable function key https://c128lib.github.io/Reference/C000#CCA2 */
.label KEYSET         = $CCA2
/** Switches active screen displays https://c128lib.github.io/Reference/C000#CD2E */
.label SWAPPER        = $CD2E
/** Sets cursor position on 80-column screen https://c128lib.github.io/Reference/C000#CD57 */
.label CRSR80         = $CD57
/** Turns cursor on https://c128lib.github.io/Reference/C000#CD6F */
.label CRSRON         = $CD6F
/** Turns cursor off https://c128lib.github.io/Reference/C000#CD9F */
.label CRSROFF        = $CD9F
/** Writes a byte value to 80-column chip memory https://c128lib.github.io/Reference/C000#CDCA */
.label WRITE80        = $CDCA
/** Writes to an 80-column chip register https://c128lib.github.io/Reference/C000#CDCC */
.label WRITEREG       = $CDCC
/** Reads a byte value from 80-column chip memory https://c128lib.github.io/Reference/C000#CDD8 */
.label READ80         = $CDD8
/** Reads from an 80-column chip register https://c128lib.github.io/Reference/C000#CDDA */
.label READREG        = $CDDA
/** Sets the current address in 80-column screen memory https://c128lib.github.io/Reference/C000#CDE6 */
.label SCNPOS         = $CDE6
/** Sets the current address in 80-column attribute memory https://c128lib.github.io/Reference/C000#CDF9 */
.label ATTRPOS        = $CDF9
/** Initializes character definitions for 80-column screen https://c128lib.github.io/Reference/C000#CE0C */
.label INIT80         = $CE0C
/** Table of color character translation values https://c128lib.github.io/Reference/C000#CE4C */
.label COLORTBL       = $CE4C
/** Table of 8563 color https://c128lib.github.io/Reference/C000#CE5C */
.label COLOR80        = $CE5C
/** Table of bit mask values https://c128lib.github.io/Reference/C000#CE6C */
.label MASKTBL        = $CE6C
/** Tables of default screen editor variables https://c128lib.github.io/Reference/C000#CE74 */
.label VARTBL         = $CE74
/** Table of standard function key definitions https://c128lib.github.io/Reference/C000#CEA8 */
.label KEYDEFS        = $CEA8

}
