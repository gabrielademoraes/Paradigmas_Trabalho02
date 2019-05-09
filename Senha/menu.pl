menu:- repeat, nl,
    write('=============== Jogo Senha ==================='), nl,
    write('1. Jogar'), nl,
    write('2. Regras'), nl,
    write('0. Sair'), nl,nl,
    read(Escolha),
    operacaoMenu(Escolha),
    Escolha==0,
    !.

operacaoMenu(0):- nl, write('Encerrando programa...'), halt(0).
operacaoMenu(1):- consult('funcoesJogo.pl'), preparaJogo, nl, !.
operacaoMenu(2):- open('regras.txt', read, Regras), consult('regras.pl'), leArquivoRegras(Regras, Linhas), close(Regras), nl, nl, !.
operacaoMenu(_):- nl, write('Opção Inválida! Tente novamente'), nl, !.
