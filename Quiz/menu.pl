menu:- repeat,
    write('=============== Quizes ==================='), nl,
    write('1. Viagem dos sonhos'), nl,
    write('2. Quizz 2'), nl,
    write('0. Sair'), nl,
    read(Escolha),
    operacaoMenu(Escolha),
    Escolha==0,
    !.

operacaoMenu(0):- !.
operacaoMenu(1):- write('Quiz 1 selecionado: '), consult('quizViagem.pl'), inicioQuiz, nl, !.
operacaoMenu(2):- write('Opção B'), nl, !.
operacaoMenu(_):- write('Opção Inválida! Tente novamente'), nl, !.