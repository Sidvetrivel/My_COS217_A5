/*--------------------------------------------------------------------*/
/* mywc.s                                                             */
/* Author: Julian Jimenez and Sid Vetrivel                            */
/*--------------------------------------------------------------------*/

//flattened C Code

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

/*--------------------------------------------------------------------*/

        .section .rodata

//----------------------------------------------------------------------

        .section .data

//----------------------------------------------------------------------

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

//----------------------------------------------------------------------

        .section .text