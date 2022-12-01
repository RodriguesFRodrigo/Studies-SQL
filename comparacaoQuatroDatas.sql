 where (
        (contratoValor."dataVencimento" is null and usuario."cancellation" is null)
        or contratoValor."dataInicio" between usuario."activation" and nvl(usuario."cancellation", contratoValor."dataInicio")
        or usuario."activation" between contratoValor."dataInicio" and nvl(contratoValor."dataVencimento", usuario."activation")
       )
       
--

 where (
              (
                (contratoValor."dataInicio" <= usuario."activation" or contratoValor."dataInicio" >= usuario."activation")
                and (
                  (contratoValor."dataVencimento" is null)
                  or (usuario."cancellation" is null and usuario."activation" <= contratoValor."dataVencimento")
                  or (contratoValor."dataVencimento" <= usuario."cancellation")
                  or (contratoValor."dataVencimento" >= usuario."cancellation")
                )
              )
            )
