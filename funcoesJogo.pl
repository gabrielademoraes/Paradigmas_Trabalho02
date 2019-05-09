cor(1, vermelho).
cor(2, verde).
cor(3, azul).
cor(4, roxo).
cor(5, rosa).
cor(6, laranja).
cor(7, amarelo).

/*
:- static senha/4.
*/

:- dynamic palpite/4.


converteNumeroStr([],[]).
converteNumeroStr([CabecaCor|CaudaCor], [CabecaNome | CaudaNome]):- 
    cor(CabecaCor, CabecaNome),!,converteNumeroStr(CaudaCor, CaudaNome).

loopJogo:- randseq(4, 7, Senha),
    write(Senha),nl,
    converteNumeroStr(Senha, StrSenha),
    write(StrSenha), nl,
    write('Senha gerada com sucesso! Vamos começar...'), nl,
    recebePalpite(PalpiteLista, StrSenha), nl,
    write(PalpiteLista), nl,
    listing(palpite), nl,
    /*nth0(I, StrSenha, PalpiteLista[X|_]),*/
    write(I).

recebePalpite(PalpiteLista, StrSenha):- write('Formato da senha'), nl,
    write('1° cor | 2° cor | 3° cor | 4° cor'), nl,
    write('Cores possíveis: vermelho, verde, azul, roxo, rosa, laranja e amarelo'), nl,
    write('Insira a 1° cor: '), nl,
    read(Palpite1),
    nth0(0, StrSenha, Palpite1),
    write('Insira a 2° cor: '), nl,
    read(Palpite2),
    nth0(1, StrSenha, Palpite2),
    write('Insira a 3° cor: '), nl,
    read(Palpite3),
    nth0(2, StrSenha, Palpite3),
    write('Insira a 4° cor: '), nl,
    read(Palpite4),
    nth0(3, StrSenha, Palpite4),
    append([Palpite1, Palpite2], [Palpite3, Palpite4], PalpiteLista),
    assert(palpite(Palpite1, Palpite2, Palpite3, Palpite4)).
    