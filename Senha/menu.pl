menu:- repeat,
    write('=============== Jogo Senha ==================='), nl,
    write('1. Jogar'), nl,
    write('2. Regras'), nl,
    write('0. Sair'), nl,
    read(Escolha),
    operacaoMenu(Escolha),
    Escolha==0,
    !.

operacaoMenu(0):- !.
operacaoMenu(1):- write('Jogar'), consult('funcoesJogo.pl'), loopJogo, nl, !.
operacaoMenu(2):- write('Opção B'), nl, !.
operacaoMenu(_):- write('Opção Inválida! Tente novamente'), nl, !.
