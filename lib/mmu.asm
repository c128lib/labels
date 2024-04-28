/**
 * @file mmu.asm
 * @brief Mmu module
 * @details Labels for Mmu support
 * 
 * https://c128lib.github.io/Reference/Mmu
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

.namespace Mmu {

/** Configuration register https://c128lib.github.io/Reference/D500#D500 */
.label CONFIGURATION        = $D500
/** Preconfiguration register A https://c128lib.github.io/Reference/D500#D501 */
.label PRECONFIG_A          = $D501
/** Preconfiguration register B https://c128lib.github.io/Reference/D500#D502 */
.label PRECONFIG_B          = $D502
/** Preconfiguration register C https://c128lib.github.io/Reference/D500#D503 */
.label PRECONFIG_C          = $D503
/** Preconfiguration register D https://c128lib.github.io/Reference/D500#D504 */
.label PRECONFIG_D          = $D504
/** Mode configuration register https://c128lib.github.io/Reference/D500#D505 */
.label MODE_CONFIG          = $D505
/** RAM configuration register https://c128lib.github.io/Reference/D500#D506 */
.label RAM_CONFIG           = $D506
/** Page 0 pointer https://c128lib.github.io/Reference/D500#D507 */
.label PAGE0_PAGE_POINTER   = $D507
/** Page 0 block pointer https://c128lib.github.io/Reference/D500#D508 */
.label PAGE0_BLOCK_POINTER  = $D508
/** Page 1 pointer https://c128lib.github.io/Reference/D500#D509 */
.label PAGE1_PAGE_POINTER   = $D509
/** Page 1 block pointer https://c128lib.github.io/Reference/D500#D50A */
.label PAGE1_BLOCK_POINTER  = $D50A
/** Version register https://c128lib.github.io/Reference/D500#D50B */
.label MMU_VERSION          = $D50B
/** Configuration register https://c128lib.github.io/Reference/FF00#FF00 */
.label LOAD_CONFIGURATION   = $FF00
/** Load configuration register A https://c128lib.github.io/Reference/FF00#FF01 */
.label LOAD_PRECONFIG_A     = $FF01
/** Load configuration register B https://c128lib.github.io/Reference/FF00#FF02 */
.label LOAD_PRECONFIG_B     = $FF02
/** Load configuration register C https://c128lib.github.io/Reference/FF00#FF03 */
.label LOAD_PRECONFIG_C     = $FF03
/** Load configuration register D https://c128lib.github.io/Reference/FF00#FF04 */
.label LOAD_PRECONFIG_D     = $FF04

/** Mask for configuration bit 0 to set ROM active on address $d000-$dfff */
.label IO_ROM             = %00000000
/** Mask for configuration bit 0 to set RAM active on address $d000-$dfff */
.label IO_RAM             = %00000001

/** Mask for configuration bit 1 to set ROM active on address $4000-$7fff (Basic low rom) */
.label ROM_LOW_ROM        = %00000000
/** Mask for configuration bit 1 to set RAM active on address $4000-$7fff (Basic low rom) */
.label ROM_LOW_RAM        = %00000010

/** Mask for configuration bits 2-3 to set ROM active on upper portion of BASIC ROM ($8000-$AFFF), plus monitor ROM ($B000-$BFFF) */
.label ROM_MID_ROM        = %00000000
/** Mask for configuration bits 2-3 to set internal function ROM: refers to ROM in the free ROM socket on the 128 circuit board */
.label ROM_MID_INT        = %00000100
/** Mask for configuration bits 2-3 to set xxternal function ROM: refers to ROM in a cartridge plugged into the expansion port. */
.label ROM_MID_EXT        = %00001000
/** Mask for configuration bits 2-3 to set RAM active on upper portion of BASIC ROM ($8000-$AFFF), plus monitor ROM ($B000-$BFFF) */
.label ROM_MID_RAM        = %00001100

// bit 4-5 - controls rom mid space $c000-$ffff (Screen editor rom, kernal rom)
/** Mask for configuration bits 4-5 to set ROM active on screen editor ROM ($c000-$cfff), character ROM ($d000-$Ddfff), Kemal ROM ($e000-$ffff) */
.label ROM_HI             = %00000000
/** Mask for configuration bits 4-5 to set internal function ROM: refers to ROM in the free ROM socket on the 128 circuit board. */
.label ROM_HI_INT         = %00010000
/** Mask for configuration bits 4-5 to set external function ROM: refers to ROM in a cartridge plugged into the expansion port. */
.label ROM_HI_EXT         = %00100000
/** Mask for configuration bits 4-5 to set RAM active on screen editor ROM ($c000-$cfff), character ROM ($d000-$Ddfff), Kemal ROM ($e000-$ffff) */
.label ROM_HI_RAM         = %00110000

/** Mask for configuration bit 6 to set block 0 active */
.label RAM0               = %00000000
/** Mask for configuration bit 6 to set block 1 active */
.label RAM1               = %01000000

/** Mask for bit 0 for selecting Z80 cpu to run  */
.label CPU_Z80            = %00000000
/** Mask for bit 0 for selecting 8502 cpu to run  */
.label CPU_8502           = %00000001

/** Mask for bit 3 for selecting fast serial input */
.label FASTSERIALINPUT    = %00000000
/** Mask for bit 3 for selecting fast serial output */
.label FASTSERIALOUTPUT   = %00001000

/** Mask for bit 4 for GAME pin low */
.label GAME_LOW           = %00000000
/** Mask for bit 4 for GAME pin high */
.label GAME_HI            = %00010000

/** Mask for bit 5 for EXROM pin low */
.label EXROM_LOW          = %00000000
/** Mask for bit 5 for EXROM pin high */
.label EXROM_HI           = %00100000

/** Mask for bit 6 for selecting 128 Kernal rom */
.label KERNAL_128         = %00000000
/** Mask for bit 6 for selecting 64 Kernal rom */
.label KERNAL_64          = %01000000

/** Mask for bit 7 for selecting 40/80 keyboard key switch status to 80 col */
.label COLS_80            = %00000000
/** Mask for bit 7 for selecting 40/80 keyboard key switch status to 40 col */
.label COLS_40            = %10000000

/** Mask for bits 0-1 to set 1k of common ram */
.label COMMON_RAM_1K      = %00000000
/** Mask for bits 0-1 to set 4k of common ram */
.label COMMON_RAM_4K      = %00000001
/** Mask for bits 0-1 to set 8k of common ram */
.label COMMON_RAM_8K      = %00000010
/** Mask for bits 0-1 to set 16k of common ram */
.label COMMON_RAM_16K     = %00000011

/** Mask for bits 2-3 to disable common ram  */
.label COMMON_RAM_UNUSED  = %00000000
/** Mask for bits 2-3 to set common ram on bottom (near $0000) */
.label COMMON_RAM_BOTTOM  = %00000100
/** Mask for bits 2-3 to set common ram on top (near $FFFF) */
.label COMMON_RAM_TOP     = %00001000
/** Mask for bits 2-3 to set common ram on bottom and top */
.label COMMON_RAM_BOTH    = COMMON_RAM_BOTTOM | COMMON_RAM_TOP

/** Mask for bit 7 to set Vic bank on ram block 0 */
.label VIC_BANK_ON_RAM_0  = %00000000
/** Mask for bit 7 to set Vic bank on ram block 1 */
.label VIC_BANK_ON_RAM_1  = %01000000
/** Mask for bit 7 to set Vic bank on ram block 2 */
.label VIC_BANK_ON_RAM_2  = %10000000
/** Mask for bit 7 to set Vic bank on ram block 3 */
.label VIC_BANK_ON_RAM_3  = %11000000

}
