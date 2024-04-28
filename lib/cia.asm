/**
 * @file cia.asm
 * @brief Cia module
 * @details Labels for Cia support
 * 
 * https://c128lib.github.io/Reference/Cia
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

.namespace Cia {

/** I/O port data registers D1PRA https://c128lib.github.io/Reference/DC00 */
.label CIA1               = $DC00
/** I/O port data registers D1PRA https://c128lib.github.io/Reference/DC00#DC00 */
.label CIA1_DATA_PORT_A   = CIA1 + $00
/** I/O port data registers D1PRB https://c128lib.github.io/Reference/DC00#DC01 */
.label CIA1_DATA_PORT_B   = CIA1 + $01
/** Data direction registers D1DDRA https://c128lib.github.io/Reference/DC00#DC02 */
.label CIA1_DATA_DIR_A    = CIA1 + $02
/** Data direction registers D1DDRB https://c128lib.github.io/Reference/DC00#DC03 */
.label CIA1_DATA_DIR_B    = CIA1 + $03
/** Timer A latch/counter registers D1T1L https://c128lib.github.io/Reference/DC00#DC04 */
.label CIA1_TIMER_A_LO    = CIA1 + $04
/** Timer A latch/counter registers D1T1H https://c128lib.github.io/Reference/DC00#DC05 */
.label CIA1_TIMER_A_HI    = CIA1 + $05
/** Timer B latch/counter registers D1T2L https://c128lib.github.io/Reference/DC00#DC06 */
.label CIA1_TIMER_B_LO    = CIA1 + $06
/** Timer B latch/counter registers D1T2H https://c128lib.github.io/Reference/DC00#DC07 */
.label CIA1_TIMER_B_HI    = CIA1 + $07
/** Time-of-day clock registers D1TOD1 https://c128lib.github.io/Reference/DC00#DC08 */
.label CIA1_TOD_SEC10     = CIA1 + $08
/** Time-of-day clock registers D1TODS https://c128lib.github.io/Reference/DC00#DC09 */
.label CIA1_TOD_SEC       = CIA1 + $09
/** Time-of-day clock registers D1TODM https://c128lib.github.io/Reference/DC00#DC0A */
.label CIA1_TOD_MIN       = CIA1 + $0A
/** Time-of-day clock registers D1TODH *https://c128lib.github.io/Reference/DC00#DC0B */
.label CIA1_TOD_HOUR      = CIA1 + $0B
/** Serial data register D1SDR https://c128lib.github.io/Reference/DC00#DC0C */
.label CIA1_IO_BUFFER     = CIA1 + $0C
/** Interrupt control register D1ICR https://c128lib.github.io/Reference/DC00#DC0D */
.label CIA1_IRQ_CONTROL   = CIA1 + $0D
/** Control register A D1CRA https://c128lib.github.io/Reference/DC00#DC0E */
.label CIA1_CONTROL_A     = CIA1 + $0E
/** Control register B D1CRB https://c128lib.github.io/Reference/DC00#DC0F */
.label CIA1_CONTROL_B     = CIA1 + $0F

/** I/O port data registers D2PRA https://c128lib.github.io/Reference/DD00 */
.label CIA2               = $DD00
/** I/O port data registers D2PRA https://c128lib.github.io/Reference/DD00#DD00 */
.label CIA2_DATA_PORT_A   = CIA2 + $00
/** I/O port data registers D2PRB https://c128lib.github.io/Reference/DD00#DD01 */
.label CIA2_DATA_PORT_B   = CIA2 + $01
/** Data direction registers D2DDRA https://c128lib.github.io/Reference/DD00#DD02 */
.label CIA2_DATA_DIR_A    = CIA2 + $02
/** Data direction registers D2DDRA https://c128lib.github.io/Reference/DD00#DD03 */
.label CIA2_DATA_DIR_B    = CIA2 + $03
/** Timer A latch/counter registers D2T1L https://c128lib.github.io/Reference/DD00#DD04 */
.label CIA2_TIMER_A_LO    = CIA2 + $04
/** Timer A latch/counter registers D2T1H https://c128lib.github.io/Reference/DD00#DD05 */
.label CIA2_TIMER_A_HI    = CIA2 + $05
/** Timer B latch/counter registers D2T2L https://c128lib.github.io/Reference/DD00#DD06 */
.label CIA2_TIMER_B_LO    = CIA2 + $06
/** Timer B latch/counter registers D2T2H https://c128lib.github.io/Reference/DD00#DD07 */
.label CIA2_TIMER_B_HI    = CIA2 + $07
/** Time-of-day clock registers D2TOD1 https://c128lib.github.io/Reference/DD00#DD08 */
.label CIA2_TOD_SEC10     = CIA2 + $08
/** Time-of-day clock registers D2TODS https://c128lib.github.io/Reference/DD00#DD09 */
.label CIA2_TOD_SEC       = CIA2 + $09
/** Time-of-day clock registers D2TODM https://c128lib.github.io/Reference/DD00#DD0A */
.label CIA2_TOD_MIN       = CIA2 + $0A
/** Time-of-day clock registers D2TODH https://c128lib.github.io/Reference/DD00#DD0B */
.label CIA2_TOD_HOUR      = CIA2 + $0B
/** Serial data register D2SDR https://c128lib.github.io/Reference/DD00#DD0C */
.label CIA2_IO_BUFFER     = CIA2 + $0C
/** Interrupt control register D2ICR https://c128lib.github.io/Reference/DD00#DD0D */
.label CIA2_IRQ_CONTROL   = CIA2 + $0D
/** Control register A D2CRA https://c128lib.github.io/Reference/DD00#DD0E */
.label CIA2_CONTROL_A     = CIA2 + $0E
/** Control register B D2CRB https://c128lib.github.io/Reference/DD00#DD0F */
.label CIA2_CONTROL_B     = CIA2 + $0F

/** Mask for joystick up direction detection */
.label JOY_UP           = %00001
/** Mask for joystick down direction detection */
.label JOY_DOWN         = %00010
/** Mask for joystick left direction detection */
.label JOY_LEFT         = %00100
/** Mask for joystick right direction detection */
.label JOY_RIGHT        = %01000
/** Mask for joystick fire pressed detection */
.label JOY_FIRE         = %10000

/** Mask for Vic-2 bank 0 selection ($0000-$3FFF) */
.label BANK_0           = %00000011
/** Mask for Vic-2 bank 1 selection ($4000-$7FFF) */
.label BANK_1           = %00000010
/** Mask for Vic-2 bank 2 selection ($8000-$BFFF) */
.label BANK_2           = %00000001
/** Mask for Vic-2 bank 3 selection ($C000-$FFFF) */
.label BANK_3           = %00000000

}
