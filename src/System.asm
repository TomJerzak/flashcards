/**************************************************
 * File name: System.asm
 * Author:    Tomasz Jerzak
 **************************************************/

#importonce

/*
 * Clear the interrupt flag (the CPU will respond to IRQ interrupt events).
 */
.macro ClearInterruptFlag() {
    cli
}

/*
 * Set the interrupt flag (preventing the CPU from responding to IRQ interrupt events).
 */
.macro SetInterruptFlag() {
    sei
}

/*
 * Set border (frame) color using the address $D020 (53280). 
 * Parameters:
 *   color: number
 *          Black               -   0
 *          White               -   1
 *          Red                 -   2
 *          Cyan                -   3
 *          Violet / purple     -   4
 *          Green               -   5
 *          Blue                -   6
 *          Yellow              -   7
 *          Orange              -   8
 *          Brown               -   9
 *          Light red           -  10
 *          Dark grey / grey 1  -  11
 *          Grey 2              -  12
 *          Light green         -  13
 *          Light blue          -  14
 *          Light grey / grey 3 -  15
 */
.macro SetBorderColor(color) {
    lda #color
    sta $d020
}

/*
 * Set background color using the address $D021 (53281).
 * Parameters:
 *   color: number
 *          Black               -   0
 *          White               -   1
 *          Red                 -   2
 *          Cyan                -   3
 *          Violet / purple     -   4
 *          Green               -   5
 *          Blue                -   6
 *          Yellow              -   7
 *          Orange              -   8
 *          Brown               -   9
 *          Light red           -  10
 *          Dark grey / grey 1  -  11
 *          Grey 2              -  12
 *          Light green         -  13
 *          Light blue          -  14
 *          Light grey / grey 3 -  15
 */
.macro SetBackgroundColor(color) {
    lda #color
    sta $d021
}

/*
 * Clear the screen.
 */
.macro ClearScreen() {
    jsr $e544
}

/*
 * Print char.
 * Parameters:
 *   char:    screen code (https://sta.c64.org/cbm64scr.html)
 *   address: memory address from $0400 to $07e7 (https://www.c64-wiki.com/wiki/Screen_RAM)
 * Example: Print($4F, $0770)
 */
.macro Print(char, address) {
    lda #char
    sta address
}