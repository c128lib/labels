/**
 * @file vdc.asm
 * @brief Vdc module
 * @details Labels for Vdc support
 * 
 * https://c128lib.github.io/Reference/Vdc
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

.namespace Vdc {

/** Black color code */
.label VDC_BLACK = 0
/** Dark gray color code */
.label VDC_DARK_GRAY = 1
/** Dark blue color code */
.label VDC_DARK_BLUE = 2
/** Light blue color code */
.label VDC_LIGHT_BLUE = 3
/** Dark green color code */
.label VDC_DARK_GREEN = 4
/** Light green color code */
.label VDC_LIGHT_GREEN = 5
/** Dark cyan color code */
.label VDC_DARK_CYAN = 6
/** Light cyan color code */
.label VDC_LIGHT_CYAN = 7
/** Dark red color code */
.label VDC_DARK_RED = 8
/** Light red color code */
.label VDC_LIGHT_RED = 9
/** Dark purple color code */
.label VDC_DARK_PURPLE = 10
/** Light purple color code */
.label VDC_LIGHT_PURPLE = 11
/** Dark yellow color code */
.label VDC_DARK_YELLOW = 12
/** Light yellow color code */
.label VDC_LIGHT_YELLOW = 13
/** Light gray color code */
.label VDC_LIGHT_GRAY = 14
/** White color code */
.label VDC_WHITE = 15

.label COLOR80    = $ce5c

.label MODE       = $d7

.label TEXT_SCREEN_80_COL_WIDTH = 80

/** Vdc address/status register */
.label VDCADR     = $d600
/** Vdc data register */
.label VDCDAT     = $d601

/** Total number of horizontal character positions https://c128lib.github.io/Reference/Vdc#00 */
.label TOTALE_NUMBER_OF_HORIZONTAL_CHARACTER_POSITIONS    = $00
/** Number of visible horizontal character positions https://c128lib.github.io/Reference/Vdc#01 */
.label NUMBER_OF_VISIBILE_HORIZONTAL_CHARACTER_POSITIONS  = $01
/** Horizontal sync position https://c128lib.github.io/Reference/Vdc#02 */
.label HORIZONTAL_SYNC_POSITION                           = $02
/** Horizontal and vertical sync width https://c128lib.github.io/Reference/Vdc#03 */
.label HORIZONTAL_VERTICAL_SYNC_WIDTH                     = $03
/** Total number of screen rows https://c128lib.github.io/Reference/Vdc#04 */
.label NUMBER_SCREEN_ROWS                                 = $04
/** Vertical fine adjustment https://c128lib.github.io/Reference/Vdc#05 */
.label VERTICAL_FINE_ADJUSTMENT                           = $05
/** Number of visible screen rows https://c128lib.github.io/Reference/Vdc#06 */
.label VISIBLE_SCREEN_ROWS                                = $06
/** Vertical sync position https://c128lib.github.io/Reference/Vdc#07 */
.label VERTICAL_SYNC_POSITION                             = $07
/** Interlace mode control register https://c128lib.github.io/Reference/Vdc#08 */
.label INTERLACE_MODE_CONTRO_POSITION                     = $08
/** Number of scan lines per characte https://c128lib.github.io/Reference/Vdc#09 */
.label SCANLINES_PER_CHARACTER                            = $09
/** Cursor mode control https://c128lib.github.io/Reference/Vdc#0A */
.label CURSOR_MODE_CONTROL                                = $0A
/** Ending scan line for cursor https://c128lib.github.io/Reference/Vdc#0B */
.label ENDING_SCAN_LINE                                   = $0B
/** Screen memory starting address (high byte) https://c128lib.github.io/Reference/Vdc#0C */
.label SCREEN_MEMORY_STARTING_HIGH_ADDRESS                = $0C
/** Screen memory starting address (low byte) https://c128lib.github.io/Reference/Vdc#0D */
.label SCREEN_MEMORY_STARTING_LOW_ADDRESS                 = $0D
/** Cursor position address (high byte) https://c128lib.github.io/Reference/Vdc#0E */
.label CURSOR_POSITION_HIGH_ADDRESS                       = $0E
/** Cursor position address (low byte) https://c128lib.github.io/Reference/Vdc#0F */
.label CURSOR_POSITION_LOW_ADDRESS                        = $0F
/** Light pen vertical position https://c128lib.github.io/Reference/Vdc#10 */
.label LIGHT_PEN_VERTICAL_POSITION                        = $10
/** Light pen horizontal position https://c128lib.github.io/Reference/Vdc#11 */
.label LIGHT_PEN_HORIZONTAL_POSITION                      = $11
/** Current memory address (high byte) https://c128lib.github.io/Reference/Vdc#12 */
.label CURRENT_MEMORY_HIGH_ADDRESS                        = $12
/** Current memory address (low byte) https://c128lib.github.io/Reference/Vdc#13 */
.label CURRENT_MEMORY_LOW_ADDRESS                         = $13
/** Attribute memory starting address (high byte) https://c128lib.github.io/Reference/Vdc#14 */
.label ATTRIBUTE_MEMORY_HIGH_ADDRESS                      = $14
/** Attribute memory starting address (low byte) https://c128lib.github.io/Reference/Vdc#15 */
.label ATTRIBUTE_MEMORY_LOW_ADDRESS                       = $15
/** Character horizontal size control register https://c128lib.github.io/Reference/Vdc#16 */
.label CHARACTER_HORIZONTAL_SIZE_CONTROL                  = $16
/** Character vertical size control register https://c128lib.github.io/Reference/Vdc#17 */
.label CHARACTER_VERTICAL_SIZE_CONTROL                    = $17
/** Vertical smooth scrolling and control register https://c128lib.github.io/Reference/Vdc#18 */
.label VERTICAL_SMOOTH_SCROLLING                          = $18
/** Horizontal smooth scrolling and control register https://c128lib.github.io/Reference/Vdc#19 */
.label HORIZONTAL_SMOOTH_SCROLLING                        = $19
/** Foreground/background color register https://c128lib.github.io/Reference/Vdc#1A */
.label FOREGROUND_BACKGROUND_COLOR                        = $1A
/** Address increment per row https://c128lib.github.io/Reference/Vdc#1B */
.label ADDRESS_INCREMENT_PER_ROW                          = $1B
/** Character set address and memory type register https://c128lib.github.io/Reference/Vdc#1C */
.label CHARACTER_SET_ADDRESS                              = $1C
/** Underline scan-line-position register https://c128lib.github.io/Reference/Vdc#1D */
.label UNDERLINE_SCAN_LINE_POSITION                       = $1D
/** Number of bytes for block write or copy https://c128lib.github.io/Reference/Vdc#1E */
.label NUMBER_OF_BYTES_FOR_BLOCK_WRITE_OR_COPY            = $1E
/** Memory read/write register https://c128lib.github.io/Reference/Vdc#1F */
.label MEMORY_READ_WRITE                                  = $1F
/** Block copy source address (high byte) https://c128lib.github.io/Reference/Vdc#20 */
.label BLOCK_COPY_SOURCE_HIGH_ADDRESS                     = $20
/** Block copy source address (low byte) https://c128lib.github.io/Reference/Vdc#21 */
.label BLOCK_COPY_SOURCE_LOW_ADDRESS                      = $21
/** Beginning position for horizontal blanking https://c128lib.github.io/Reference/Vdc#22 */
.label BEGINNING_POSITION_FOR_HORIZONTAL_BLANKING         = $22
/** Ending position for horizontal blanking https://c128lib.github.io/Reference/Vdc#23 */
.label ENDING_POSITION_FOR_HORIZONTAL_BLANKING            = $23
/** Number of memory refresh cycles per scan line https://c128lib.github.io/Reference/Vdc#24 */
.label NUMBER_OF_MEMORY_REFRESH_CYCLER_PER_SCANLINE       = $24

.label ATTRIBUTE_ALTERNATE  = %10000000;
.label ATTRIBUTE_REVERSE    = %01000000;
.label ATTRIBUTE_UNDERLINE  = %00100000;
.label ATTRIBUTE_BLINK      = %00010000;

}
