/**
 * @file sid.asm
 * @brief Sid module
 * @details This file contains labels that map to the SID registers of the Commodore 128.
 * Labels are intended to be used in assembly for 6502 with KickAssembler.
 *
 * The Commodore 128 has a SID chip, which is responsible for producing sound.
 * The SID chip controls three independent audio channels, each capable of generating
 * various waveforms and modulating frequency, resonance, attack, decay, sustain, and release.
 *
 * https://c128lib.github.io/Reference/Sid
 *
 * https://c128lib.github.io/Reference/D400
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

.namespace Sid {

/** Sid main address https://c128lib.github.io/Reference/D400 */
.label SID = $D400
/** Frequency register for voice 1 (low byte) https://c128lib.github.io/Reference/D400#D400 */
.label VOICE1_FREQ_REGISTER_LOW = SID
/** Frequency register for voice 1 (high byte) https://c128lib.github.io/Reference/D400#D401 */
.label VOICE1_FREQ_REGISTER_HI = SID + 1
/** Pulsewidth for voice 1 (low byte) https://c128lib.github.io/Reference/D400#D402 */
.label VOICE1_PULSEWIDTH_LOW = SID + 2
/** Pulsewidth for voice 1 (high byte) https://c128lib.github.io/Reference/D400#D403 */
.label VOICE1_PULSEWIDTH_HI = SID + 3
/** Control register for voice 1 https://c128lib.github.io/Reference/D400#D404 */
.label VOICE1_CONTROL_REGISTER = SID + 4
/** Attack/decay register for voice 1 https://c128lib.github.io/Reference/D400#D405 */
.label VOICE1_ATTACK_DECAY = SID + 5
/** Sustain/release register for voice 1 https://c128lib.github.io/Reference/D400#D406 */
.label VOICE1_SUSTAIN_RELEASE = SID + 6
/** Frequency register for voice 2 (low byte) https://c128lib.github.io/Reference/D400#D407 */
.label VOICE2_FREQ_REGISTER_LOW = SID + 7
/** Frequency register for voice 2 (high byte) https://c128lib.github.io/Reference/D400#D408 */
.label VOICE2_FREQ_REGISTER_HI = SID + 8
/** Pulsewidth for voice 2 (low byte) https://c128lib.github.io/Reference/D400#D409 */
.label VOICE2_PULSEWIDTH_LOW = SID + 9
/** Pulsewidth for voice 2 (high byte) https://c128lib.github.io/Reference/D400#D40A */
.label VOICE2_PULSEWIDTH_HI = SID + 10
/** Control register for voice 2 https://c128lib.github.io/Reference/D400#D40B */
.label VOICE2_CONTROL_REGISTER = SID + 11
/** Attack/decay register for voice 2 https://c128lib.github.io/Reference/D400#D40C */
.label VOICE2_ATTACK_DECAY = SID + 12
/** Sustain/release register for voice 2 https://c128lib.github.io/Reference/D400#D40D */
.label VOICE2_SUSTAIN_RELEASE = SID + 13
/** Frequency register for voice 3 (low byte) https://c128lib.github.io/Reference/D400#D40E */
.label VOICE3_FREQ_REGISTER_LOW = SID + 14
/** Frequency register for voice 3 (high byte) https://c128lib.github.io/Reference/D400#D40F */
.label VOICE3_FREQ_REGISTER_HI = SID + 15
/** Pulsewidth for voice 3 (low byte)  https://c128lib.github.io/Reference/D400#D410 */
.label VOICE3_PULSEWIDTH_LOW = SID + 16
/** Pulsewidth for voice 3 (high byte) https://c128lib.github.io/Reference/D400#D411 */
.label VOICE3_PULSEWIDTH_HI = SID + 17
/** Control register for voice 3 https://c128lib.github.io/Reference/D400#D412 */
.label VOICE3_CONTROL_REGISTER = SID + 18
/** Attack/decay register for voice 3 https://c128lib.github.io/Reference/D400#D413 */
.label VOICE3_ATTACK_DECAY = SID + 19
/** Sustain/release register for voice 3 https://c128lib.github.io/Reference/D400#D414 */
.label VOICE3_SUSTAIN_RELEASE = SID + 20
/** Filter cutoff frequency (low byte) https://c128lib.github.io/Reference/D400#D415 */
.label CUTOFF_FREQ_LOW = SID + 21
/** Filter cutoff frequency (high byte) https://c128lib.github.io/Reference/D400#D416 */
.label CUTOFF_FREQ_HI = SID + 22
/** Resonance/filter control register https://c128lib.github.io/Reference/D400#D417 */
.label RESONANCE_FILTER_CONTROL_REGISTER = SID + 23
/** Volume/filter mode register https://c128lib.github.io/Reference/D400#D418 */
.label VOLUME_FILTER_MODE_REGISTER = SID + 24
/** Potentiometer (paddle) x position https://c128lib.github.io/Reference/D400#D419 */
.label PADDLE_X_POSITION = SID + 25
/** Potentiometer (paddle) y position https://c128lib.github.io/Reference/D400#D41A */
.label PADDLE_Y_POSITION = SID + 26
/** Voice 3 oscillator output https://c128lib.github.io/Reference/D400#D41B */
.label VOICE3_OSCILLATOR = SID + 27
/** Voice 3 envelope generator output https://c128lib.github.io/Reference/D400#D41C */
.label VOICE3_ENVELOPE = SID + 28

}
