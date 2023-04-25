/*--------------------------------------------------------------------*/
/* mywc.s                                                             */
/* Author: Julian Jimenez and Sid Vetrivel                            */
/*--------------------------------------------------------------------*/
/*
flattened C Code

int main(void)
{
   mainLoop:
    if ((iChar = getchar()) == EOF) goto endmainLoop;
        lCharCount++;
        if(!isspace(iChar)) goto else1;
            if (!iInWord) goto endif2;
                lWordCount++;
                iInWord = FALSE;
        endif2:
            goto endif1;
    else1:
            if (iInWord) goto endif3;
                iInWord = TRUE;
        endif3:
    endif1:
            if (iInWord) goto endif4;
                iInWord = TRUE;
        endif4:
            goto mainLoop;
   endmainLoop:
        if (!iInWord) goto endlWordCount:
            lWordCount++;
   endlWordCount:
   printf("%7ld %7ld %7ld\n", lLineCount, lWordCount, lCharCount);
   return 0;
}
*/
/*--------------------------------------------------------------------*/
 
        .section .rodata

/*--------------------------------------------------------------------*/

        .section .data

/*--------------------------------------------------------------------*/

        .section .bss
lLineCount:
        .quad 0

lWordCount:
        .quad 0

lCharCount:
        .quad 0

iChar:
        .skip 4

iInWord:
        .word FALSE

/*--------------------------------------------------------------------*/

        .section .text

/*--------------------------------------------------------------------*/

getchar:

isspace:

main:
    adr x0, lLineCount
    ldr w1, [x0]
    adr x0, lWordCount
    ldr w2, [x0]
    adr x0, lCharCount
    ldr w3, [x0]
    adr x0, iChar
    ldr w4, [x0]
    adr x0, iInWord
    ldr w5, [x0]

    mainLoop:
        cmp w4, EOF
        beq endmainLoop
        add w4, w4, 1
        cmp w5, FALSE
        beq else1
        cmp w1, FALSE
        beq endiInWord
        add w2, w2, 1
        mov w5, FALSE
    endiInWord:
        b endif1
    else1:
        cmp w1, TRUE
        beq endiInWord2
        mov w5, TRUE
    endiInWord2:
    endif1:
        cmp w4, //newline
        bne endofWord
        add w1, w1, 1
    endofWord:
        b mainLoop
    endmainLoop:
        cmp w5, FALSE
        beq endif4
        add w2, w2, 1
    endlWordCount:
        // call print statement
        mov w0, 0
        ret 


        
