/**
 * @file vic2.asm
 * @brief Vic2 module
 * @details This file contains labels that map to the VIC registers of the Commodore 128.
 *
 * The Commodore 128 has a VIC-IIe chip, which is an enhanced version of the VIC-II chip found in the Commodore 64.
 * The VIC-IIe chip controls the video output of the computer, including the screen resolution, color,
 * character set, and sprites.
 *
 * https://c128lib.github.io/Reference/Vic
 *
 * https://c128lib.github.io/Reference/D000
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

.namespace Vic2 {

/** Vic2 first register https://c128lib.github.io/Reference/D000 */
.label VIC2                 = $D000
/** Sprite 0 x-coordinate https://c128lib.github.io/Reference/D000#D000 */
.label SPRITE_0_X           = VIC2 + $00
/** Sprite 0 y-coordinate https://c128lib.github.io/Reference/D000#D001 */
.label SPRITE_0_Y           = VIC2 + $01
/** Sprite 1 x-coordinate https://c128lib.github.io/Reference/D000#D002 */
.label SPRITE_1_X           = VIC2 + $02
/** Sprite 1 y-coordinate https://c128lib.github.io/Reference/D000#D003 */
.label SPRITE_1_Y           = VIC2 + $03
/** Sprite 2 x-coordinate https://c128lib.github.io/Reference/D000#D004 */
.label SPRITE_2_X           = VIC2 + $04
/** Sprite 2 y-coordinate https://c128lib.github.io/Reference/D000#D005 */
.label SPRITE_2_Y           = VIC2 + $05
/** Sprite 3 x-coordinate https://c128lib.github.io/Reference/D000#D006 */
.label SPRITE_3_X           = VIC2 + $06
/** Sprite 3 y-coordinate https://c128lib.github.io/Reference/D000#D007 */
.label SPRITE_3_Y           = VIC2 + $07
/** Sprite 4 x-coordinate https://c128lib.github.io/Reference/D000#D008 */
.label SPRITE_4_X           = VIC2 + $08
/** Sprite 4 y-coordinate https://c128lib.github.io/Reference/D000#D009 */
.label SPRITE_4_Y           = VIC2 + $09
/** Sprite 5 x-coordinate https://c128lib.github.io/Reference/D000#D00A */
.label SPRITE_5_X           = VIC2 + $0A
/** Sprite 5 y-coordinate https://c128lib.github.io/Reference/D000#D00B */
.label SPRITE_5_Y           = VIC2 + $0B
/** Sprite 6 x-coordinate https://c128lib.github.io/Reference/D000#D00C */
.label SPRITE_6_X           = VIC2 + $0C
/** Sprite 6 y-coordinate https://c128lib.github.io/Reference/D000#D00D */
.label SPRITE_6_Y           = VIC2 + $0D
/** Sprite 7 x-coordinate https://c128lib.github.io/Reference/D000#D00E */
.label SPRITE_7_X           = VIC2 + $0E
/** Sprite 7 y-coordinate https://c128lib.github.io/Reference/D000#D00F */
.label SPRITE_7_Y           = VIC2 + $0F
/** Sprite msb for setting x pos over 255 px https://c128lib.github.io/Reference/D000#D010 */
.label SPRITE_MSB_X         = VIC2 + $10
/** Vertical smooth scrolling and control register https://c128lib.github.io/Reference/D000#D011 */
.label CONTROL_1            = VIC2 + $11
/** Raster compare register https://c128lib.github.io/Reference/D000#D012 */
.label RASTER               = VIC2 + $12
/** Light pen horizontal position https://c128lib.github.io/Reference/D000#D013 */
.label LIGHTPEN_X           = VIC2 + $13
/** Light pen vertical position https://c128lib.github.io/Reference/D000#D014 */
.label LIGHTPEN_Y           = VIC2 + $14
/** Sprite enable register https://c128lib.github.io/Reference/D000#D015 */
.label SPRITE_ENABLE        = VIC2 + $15
/** Horizontal smooth scrolling and control register https://c128lib.github.io/Reference/D000#D016 */
.label CONTROL_2            = VIC2 + $16
/** Sprite vertical expansion register https://c128lib.github.io/Reference/D000#D017 */
.label SPRITE_EXPAND_Y      = VIC2 + $17
/** Screen and character base address register https://c128lib.github.io/Reference/D000#D018 */
.label MEMORY_CONTROL       = VIC2 + $18
/** Interrupt register https://c128lib.github.io/Reference/D000#D019 */
.label IRR                  = VIC2 + $19
/** Interrupt enable register https://c128lib.github.io/Reference/D000#D01A */
.label IMR                  = VIC2 + $1A
/** Sprite-to-foreground priority register https://c128lib.github.io/Reference/D000#D01B */
.label SPRITE_PRIORITY      = VIC2 + $1B
/** Sprite multicolor mode register https://c128lib.github.io/Reference/D000#D01C */
.label SPRITE_COL_MODE      = VIC2 + $1C
/** Sprite horizontal expansion register https://c128lib.github.io/Reference/D000#D01D */
.label SPRITE_EXPAND_X      = VIC2 + $1D
/** Sprite-to-sprite collision register https://c128lib.github.io/Reference/D000#D01E */
.label SPRITE_2S_COLLISION  = VIC2 + $1E
/** Sprite-foreground collision register https://c128lib.github.io/Reference/D000#D01F */
.label SPRITE_2B_COLLISION  = VIC2 + $1F
/** Border color register https://c128lib.github.io/Reference/D000#D020 */
.label BORDER_COL           = VIC2 + $20
/** Background color register 0 https://c128lib.github.io/Reference/D000#D021 */
.label BG_COL_0             = VIC2 + $21
/** Background color register 1 https://c128lib.github.io/Reference/D000#D022 */
.label BG_COL_1             = VIC2 + $22
/** Background color register 2 https://c128lib.github.io/Reference/D000#D023 */
.label BG_COL_2             = VIC2 + $23
/** Background color register 3 https://c128lib.github.io/Reference/D000#D024 */
.label BG_COL_3             = VIC2 + $24
/** Sprite multicolor color 0 register https://c128lib.github.io/Reference/D000#D025 */
.label SPRITE_COL_0         = VIC2 + $25
/** Sprite multicolor color 1 register https://c128lib.github.io/Reference/D000#D026 */
.label SPRITE_COL_1         = VIC2 + $26
/** Sprite 0 color https://c128lib.github.io/Reference/D000#D027 */
.label SPRITE_0_COLOR       = VIC2 + $27
/** Sprite 1 color https://c128lib.github.io/Reference/D000#D028 */
.label SPRITE_1_COLOR       = VIC2 + $28
/** Sprite 2 color https://c128lib.github.io/Reference/D000#D029 */
.label SPRITE_2_COLOR       = VIC2 + $29
/** Sprite 3 color https://c128lib.github.io/Reference/D000#D02A */
.label SPRITE_3_COLOR       = VIC2 + $2A
/** Sprite 4 color https://c128lib.github.io/Reference/D000#D02B */
.label SPRITE_4_COLOR       = VIC2 + $2B
/** Sprite 5 color https://c128lib.github.io/Reference/D000#D02C */
.label SPRITE_5_COLOR       = VIC2 + $2C
/** Sprite 6 color https://c128lib.github.io/Reference/D000#D02D */
.label SPRITE_6_COLOR       = VIC2 + $2D
/** Sprite 7 color https://c128lib.github.io/Reference/D000#D02E */
.label SPRITE_7_COLOR       = VIC2 + $2E
/** Extended keyboard scan-line control register https://c128lib.github.io/Reference/D000#D02F */
.label XSCAN                = VIC2 + $2F
/** Processor clock rate control register https://c128lib.github.io/Reference/D000#D030 */
.label CLKRATE              = VIC2 + $30

/** Sprite 0 movement control data https://c128lib.github.io/Reference/1100#117E */
.label SPRITE_MOTION_0      = $117E
/** Sprite 1 movement control data https://c128lib.github.io/Reference/1100#117E */
.label SPRITE_MOTION_1      = $1189
/** Sprite 2 movement control data https://c128lib.github.io/Reference/1100#117E */
.label SPRITE_MOTION_2      = $1194
/** Sprite 3 movement control data https://c128lib.github.io/Reference/1100#117E */
.label SPRITE_MOTION_3      = $119F
/** Sprite 4 movement control data https://c128lib.github.io/Reference/1100#117E */
.label SPRITE_MOTION_4      = $11AA
/** Sprite 5 movement control data https://c128lib.github.io/Reference/1100#117E */
.label SPRITE_MOTION_5      = $11B5
/** Sprite 6 movement control data https://c128lib.github.io/Reference/1100#117E */
.label SPRITE_MOTION_6      = $11C0
/** Sprite 7 movement control data https://c128lib.github.io/Reference/1100#117E */
.label SPRITE_MOTION_7      = $11CB
/** Offset between sprite control data pointers */
.label SPRITE_MOTION_OFFSET = $0B

.label SPRITE_MAIN_DIR_UP   = $00
.label SPRITE_MAIN_DIR_RIGHT = $01
.label SPRITE_MAIN_DIR_DOWN = $02
.label SPRITE_MAIN_DIR_LEFT = $03

/*
  Mask for sprite, used SPRITE_ENABLE, SPRITE_COL_MODE etc...
*/
.label SPRITE_MASK_0 = %00000001
.label SPRITE_MASK_1 = %00000010
.label SPRITE_MASK_2 = %00000100
.label SPRITE_MASK_3 = %00001000
.label SPRITE_MASK_4 = %00010000
.label SPRITE_MASK_5 = %00100000
.label SPRITE_MASK_6 = %01000000
.label SPRITE_MASK_7 = %10000000

/** Vic2 first shadow register  https://c128lib.github.io/Reference/1100#11D6 */
.label SHADOW_VIC2          = $11D6
/** Sprite 0 shadow register x-coordinate https://c128lib.github.io/Reference/1100#11D6 */
.label SHADOW_SPRITE_0_X    = SHADOW_VIC2 + $00
/** Sprite 0 shadow register y-coordinate https://c128lib.github.io/Reference/1100#11D7 */
.label SHADOW_SPRITE_0_Y    = SHADOW_VIC2 + $01
/** Sprite 1 shadow register x-coordinate https://c128lib.github.io/Reference/1100#11D8 */
.label SHADOW_SPRITE_1_X    = SHADOW_VIC2 + $02
/** Sprite 1 shadow register y-coordinate https://c128lib.github.io/Reference/1100#11D9 */
.label SHADOW_SPRITE_1_Y    = SHADOW_VIC2 + $03
/** Sprite 2 shadow register x-coordinate https://c128lib.github.io/Reference/1100#11DA */
.label SHADOW_SPRITE_2_X    = SHADOW_VIC2 + $04
/** Sprite 2 shadow register y-coordinate https://c128lib.github.io/Reference/1100#11DB */
.label SHADOW_SPRITE_2_Y    = SHADOW_VIC2 + $05
/** Sprite 3 shadow register x-coordinate https://c128lib.github.io/Reference/1100#11DC */
.label SHADOW_SPRITE_3_X    = SHADOW_VIC2 + $06
/** Sprite 3 shadow register y-coordinate https://c128lib.github.io/Reference/1100#11DD */
.label SHADOW_SPRITE_3_Y    = SHADOW_VIC2 + $07
/** Sprite 4 shadow register x-coordinate https://c128lib.github.io/Reference/1100#11DE */
.label SHADOW_SPRITE_4_X    = SHADOW_VIC2 + $08
/** Sprite 4 shadow register y-coordinate https://c128lib.github.io/Reference/1100#11DF */
.label SHADOW_SPRITE_4_Y    = SHADOW_VIC2 + $09
/** Sprite 5 shadow register x-coordinate https://c128lib.github.io/Reference/1100#11E0 */
.label SHADOW_SPRITE_5_X    = SHADOW_VIC2 + $0A
/** Sprite 5 shadow register y-coordinate https://c128lib.github.io/Reference/1100#11E1 */
.label SHADOW_SPRITE_5_Y    = SHADOW_VIC2 + $0B
/** Sprite 6 shadow register x-coordinate https://c128lib.github.io/Reference/1100#11E2 */
.label SHADOW_SPRITE_6_X    = SHADOW_VIC2 + $0C
/** Sprite 6 shadow register y-coordinate https://c128lib.github.io/Reference/1100#11E3 */
.label SHADOW_SPRITE_6_Y    = SHADOW_VIC2 + $0D
/** Sprite 7 shadow register x-coordinate https://c128lib.github.io/Reference/1100#11E4 */
.label SHADOW_SPRITE_7_X    = SHADOW_VIC2 + $0E
/** Sprite 7 shadow register y-coordinate https://c128lib.github.io/Reference/1100#11E5 */
.label SHADOW_SPRITE_7_Y    = SHADOW_VIC2 + $0F
/** Sprite shadow register msb for setting x pos over 255 px https://c128lib.github.io/Reference/1100#11E6 */
.label SHADOW_SPRITE_MSB_X  = SHADOW_VIC2 + $10
/** Sprite-to-sprite collision shadow register https://c128lib.github.io/Reference/1100#11E7 */
.label SHADOW_SPRITE_2S_COLLISION = SHADOW_VIC2 + $11
/** Sprite-to-background collision shadow register https://c128lib.github.io/Reference/1100#11E8 */
.label SHADOW_SPRITE_2B_COLLISION = SHADOW_VIC2 + $12
/** Light pen horizontal position shadow register https://c128lib.github.io/Reference/1100#11E9 */
.label SHADOW_LIGHTPEN_X    = SHADOW_VIC2 + $13
/** Light pen vertical position shadow register https://c128lib.github.io/Reference/1100#11EA */
.label SHADOW_LIGHTPEN_Y    = SHADOW_VIC2 + $14

.label COLOR_RAM            = $D800
.label TOP_SCREEN_RASTER_POS = 50

.label RASTER_MAX_PAL       = 312
.label RASTER_MAX_NTSC      = 263

/** Extra bit for raster register https://c128lib.github.io/Reference/D000#D011 */
.label CONTROL_1_RASTER8  = %10000000
/** Extended background color mode https://c128lib.github.io/Reference/D000#D011 */
.label CONTROL_1_ECM      = %01000000
/** Char mode or bitmapped mode https://c128lib.github.io/Reference/D000#D011 */
.label CONTROL_1_BMM      = %00100000
/** Enable or disable Vic screen https://c128lib.github.io/Reference/D000#D011 */
.label CONTROL_1_DEN      = %00010000
/** Vertical screen row count https://c128lib.github.io/Reference/D000#D011 */
.label CONTROL_1_RSEL     = %00001000

/** Reset bit */
.label CONTROL_2_RES      = %00100000
/** Multicolor mode https://c128lib.github.io/Reference/D000#D016 */
.label CONTROL_2_MCM      = %00010000
/** Horizontal screen column count */
.label CONTROL_2_CSEL     = %00001000

/** Irq status https://c128lib.github.io/Reference/D000#D019 */
.label IRR_IRQ            = %10000000
/** Light pen signal https://c128lib.github.io/Reference/D000#D019 */
.label IRR_LIGHTPEN       = %00001000
/** Sprite to sprite collision https://c128lib.github.io/Reference/D000#D019 */
.label IRR_SPR_SPR        = %00000100
/** Sprite to background collision https://c128lib.github.io/Reference/D000#D019 */
.label IRR_SPR_BG         = %00000010
/** Irq on raster line https://c128lib.github.io/Reference/D000#D019 */
.label IRR_RASTER         = %00000001

/** Light pen interrupt https://c128lib.github.io/Reference/D000#D01A */
.label IMR_LIGHTPEN       = %00001000
/** Sprite to sprite collision interrupt https://c128lib.github.io/Reference/D000#D01A */
.label IMR_SPR_SPR        = %00000100
/** Sprite to background collision interrupt https://c128lib.github.io/Reference/D000#D01A */
.label IMR_SPR_BG         = %00000010
/** Raster interrupt https://c128lib.github.io/Reference/D000#D01A */
.label IMR_RASTER         = %00000001

/** Standard text mode https://c128lib.github.io/Reference/Vic#character-display-modes */
.label STANDARD_TEXT_MODE     = %000
/** Multicolor text mode https://c128lib.github.io/Reference/Vic#multicolor-character-mode */
.label MULTICOLOR_TEXT_MODE   = %001
/**+ Bitmapped display mode https://c128lib.github.io/Reference/Vic#bitmapped-display-modes */
.label STANDARD_BITMAP_MODE   = %010
/** Multicolor bitmapped mode https://c128lib.github.io/Reference/Vic#multicolor-bitmapped-mode */
.label MULTICOLOR_BITMAP_MODE = %011
/** Extended background color mode https://c128lib.github.io/Reference/Vic#extended-background-color-mode */
.label EXTENDED_TEXT_MODE     = %100

.label MODE_ECM               = %100
.label MODE_BMM               = %010
.label MODE_MCM               = %001

// Misc. constants
.label TEXT_SCREEN_WIDTH = 40

.label BASIC_IRQ_FLAG         = $12FD     // IRQ_WRAP_FLAG

.label SCREEN_EDITOR_IRQ_FLAG = $D8

// TIP(intoinside): c128ProgrammersReferenceGuide has a wrong example on page 231
// (manual page 223). $0A2C and $0A2D is wrongly written as $02AC and $02AC
/** VIC text screen and character base */
.label VIC_SCREEN_CHAR_SHADOW   = $0A2C
/** VIC bitmap and video matrix base */
.label VIC_BITMAP_VIDEO_SHADOW  = $0A2D

/** Char memory on $0000 */
.label CHAR_MEM_0000        = %00000000
/** Char memory on $0800 */
.label CHAR_MEM_0800        = %00000010
/** Char memory on $1000 */
.label CHAR_MEM_1000        = %00000100
/** Char memory on $1800 */
.label CHAR_MEM_1800        = %00000110
/** Char memory on $2000 */
.label CHAR_MEM_2000        = %00001000
/** Char memory on $2800 */
.label CHAR_MEM_2800        = %00001010
/** Char memory on $3000 */
.label CHAR_MEM_3000        = %00001100
/** Char memory on $0800 */
.label CHAR_MEM_3800        = %00001110

/** Screen memory on $0000 */
.label SCREEN_MEM_0000      = %00000000
/** Screen memory on $0400 */
.label SCREEN_MEM_0400      = %00010000
/** Screen memory on $0800 */
.label SCREEN_MEM_0800      = %00100000
/** Screen memory on $0c00 */
.label SCREEN_MEM_0C00      = %00110000
/** Screen memory on $1000 */
.label SCREEN_MEM_1000      = %01000000
/** Screen memory on $1400 */
.label SCREEN_MEM_1400      = %01010000
/** Screen memory on $1800 */
.label SCREEN_MEM_1800      = %01100000
/** Screen memory on $1c00 */
.label SCREEN_MEM_1C00      = %01110000
/** Screen memory on $2000 */
.label SCREEN_MEM_2000      = %10000000
/** Screen memory on $2400 */
.label SCREEN_MEM_2400      = %10010000
/** Screen memory on $2800 */
.label SCREEN_MEM_2800      = %10100000
/** Screen memory on $2c00 */
.label SCREEN_MEM_2C00      = %10110000
/** Screen memory on $3000 */
.label SCREEN_MEM_3000      = %11000000
/** Screen memory on $3400 */
.label SCREEN_MEM_3400      = %11010000
/** Screen memory on $3800 */
.label SCREEN_MEM_3800      = %11100000
/** Screen memory on $3c00 */
.label SCREEN_MEM_3C00      = %11110000

/** Bitmap memory on $0000 */
.label BITMAP_MEM_0000      = %00000000
/** Bitmap memory on $2000 */
.label BITMAP_MEM_2000      = %00001000

}
