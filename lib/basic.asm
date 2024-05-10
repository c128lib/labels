/**
 * @file basic.asm
 * @brief Basic module
 * @details This file contains labels that map to the BASIC routines of the Commodore 128.
 *
 * BASIC (Beginner's All-purpose Symbolic Instruction Code) is the built-in programming language of the Commodore 128.
 * It provides a variety of routines for tasks such as input/output handling, mathematical operations, and program flow control.
 *
 * https://c128lib.github.io/Reference/4000
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

.namespace Basic {

/** BASIC cold-start entry point. This is the normal entry point following a system reset. https://c128lib.github.io/Reference/4000 */
.label JHARD_RESET = $4000
/** BASIC warm-start entry point. This is the normal entry point during a RUN/STOP-RESTORE NMI interrupt. https://c128lib.github.io/Reference/4000#4003 */
.label JSOFT_RESET = $4003
/** BASIC IRQ entry point. The target routine supports sprite movement, sprite collision detection, light pen reading, and the BASIC music statements. This is the normal entry point during the system IRQ service routine. https://c128lib.github.io/Reference/4000#4006 */
.label JBASIC_IRQ = $4006
/** Performs a warm start of BASIC. https://c128lib.github.io/Reference/4000#4009 */
.label SOFT_RESET = $4009
/** Performs a cold start of BASIC. https://c128lib.github.io/Reference/4000#4023 */
.label HARD_RESET = $4023
/** Tokenizes keywords in lines of BASIC program text. https://c128lib.github.io/Reference/4000#430A */
.label CRUNCH = $430A
/** Main BASIC statement execution routine. https://c128lib.github.io/Reference/4000#4A9F */
.label GONE = $4A9F
/** Executes the next BASIC statement. https://c128lib.github.io/Reference/4000#4AF6 */
.label NEWSTT = $4AF6
/** Handles the STOP and END statements. https://c128lib.github.io/Reference/4000#4BCB */
.label STOP_END = $4BCB
/** Handles the OR logical operator. https://c128lib.github.io/Reference/4000#4C86 */
.label OR = $4C86
/** Handles the AND logical operator. https://c128lib.github.io/Reference/4000#4C89 */
.label AND = $4C89
/** Enters MAIN with a READY prompt. https://c128lib.github.io/Reference/4000#4D37 */
.label READY = $4D37
/** Handles BASIC errors. https://c128lib.github.io/Reference/4000#4D3C */
.label ERROR = $4D3C
/** Handles immediate mode and program line entry. https://c128lib.github.io/Reference/4000#4DB7 */
.label MAIN = $4DB7
/** Relinks BASIC program lines. https://c128lib.github.io/Reference/4000#4F4F */
.label LNKPRG = $4F4F
/** Searches program text for a specified line number. https://c128lib.github.io/Reference/4000#5064 */
.label FNDLIN = $5064
/** Creates integer value from a character string. https://c128lib.github.io/Reference/4000#50A0 */
.label LINGET = $50A0
/** Handles the LIST statement. https://c128lib.github.io/Reference/4000#50E2 */
.label LIST = $50E2
/** Handles the NEW statement. https://c128lib.github.io/Reference/4000#51D6 */
.label NEW = $51D6
/** Handles the CLR statement. https://c128lib.github.io/Reference/4000#51F8 */
.label CLR = $51F8
/** Handles the RETURN statement. https://c128lib.github.io/Reference/4000#5262 */
.label RETURN = $5262
/** Handles the BEND/DATA statement. https://c128lib.github.io/Reference/4000#528F */
.label BEND_DATA = $528F
/** Handles the REM statement. https://c128lib.github.io/Reference/4000#529D */
.label REM = $529D
/** Handles the IF statement. https://c128lib.github.io/Reference/4000#52C5 */
.label IF = $52C5
/** Skips a BEGIN-BEND block. https://c128lib.github.io/Reference/4000#5320 */
.label BEGIN_BEND = $5320
/** Handles the ELSE statement. https://c128lib.github.io/Reference/4000#5391 */
.label ELSE = $5391
/** Handles the ON statement. https://c128lib.github.io/Reference/4000#53A3 */
.label ON = $53A3
/** Handles variable value assignments. https://c128lib.github.io/Reference/4000#53C6 */
.label LET = $53C6
/** Handles the PRINT# statement. https://c128lib.github.io/Reference/4000#553A */
.label PRINT_ = $553A
/** Handles the CMD statement. https://c128lib.github.io/Reference/4000#5540 */
.label CMD = $5540
/** Handles the PRINT statement. https://c128lib.github.io/Reference/4000#5554 */
.label PRINT = $5554
/** Handles the GET statement (also GET# and GETKEY). https://c128lib.github.io/Reference/4000#5612 */
.label GET = $5612
/** Handles the INPUT# statement. https://c128lib.github.io/Reference/4000#5648 */
.label INPUT_ = $5648
/** Handles the INPUT statement. https://c128lib.github.io/Reference/4000#5662 */
.label INPUT = $5662

}
