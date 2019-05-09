:- dynamic palpite/4.
:- dynamic senha/4.

cor(1, vermelho).
cor(2, verde).
cor(3, azul).
cor(4, roxo).
cor(5, rosa).
cor(6, laranja).
cor(7, amarelo).

loopJogo:- 
    randseq(4, 7, Senha),
    write(Senha),nl,
    converteNumeroStr(Senha, StrSenha),
    write(StrSenha), nl,nl,
    write('Senha gerada com sucesso! Vamos começar...'),nl,
    repeat,
    recebePalpite(PalpiteLista),
    write(PalpiteLista), nl,
    listing(palpite), nl,
    conferePalpite(PalpiteLista, StrSenha),nl,
    finalizaLoop(0),
    !.

conferePalpite(PalpiteLista, StrSenha):-    
    ifThenElse(PalpiteLista = StrSenha, write('Parabéns, você ganhou'), 
    conferePinos(PalpiteLista,StrSenha)).


conferePinos(PalpiteLista,StrSenha):-
    PalpiteLista = [Palpite1|Palpites],
    Palpites     = [Palpite2|Palpites2],
    Palpites2    = [Palpite3|Palpites3],
    Palpites3    = [Palpite4|_],

    StrSenha     = [Senha1|Senhas],
    Senhas       = [Senha2|Senhas2],
    Senhas2      = [Senha3|Senhas3],
    Senhas3      = [Senha4|_],

    ifThenElse(Palpite1 = Senha1, write('Pino Preto'), 
    ifThenElse(existeElemento(Palpite1, StrSenha), write('Pino Branco'), write('Sem Pino'))),nl,
    
    ifThenElse(Palpite2 = Senha2, write('Pino Preto'),
    ifThenElse(existeElemento(Palpite2, StrSenha), write('Pino Branco'), write('Sem Pino'))),nl,
    
    ifThenElse(Palpite3 = Senha3, write('Pino Preto'),
    ifThenElse(existeElemento(Palpite3, StrSenha), write('Pino Branco'), write('Sem Pino'))),nl,

    ifThenElse(Palpite4 = Senha4, write('Pino Preto'),
    ifThenElse(existeElemento(Palpite4, StrSenha), write('Pino Branco'), write('Sem Pino'))),nl.


recebePalpite(PalpiteLista):-
    write('Cores possíveis: vermelho, verde, azul, roxo, rosa, laranja e amarelo'),nl, nl,
    write('Formato da senha'), nl,
    write('1° cor | 2° cor | 3° cor | 4° cor'), nl,nl,nl,
    write('Insira a 1° cor: '), nl,
    read(Palpite1),
    write('Insira a 2° cor: '), nl,
    read(Palpite2),
    write('Insira a 3° cor: '), nl,
    read(Palpite3),
    write('Insira a 4° cor: '), nl,
    read(Palpite4),
    append([Palpite1, Palpite2], [Palpite3, Palpite4], PalpiteLista),
    assert(palpite(Palpite1, Palpite2, Palpite3, Palpite4)).

converteNumeroStr([],[]).
converteNumeroStr([CabecaCor|CaudaCor], [CabecaNome | CaudaNome]):- 
    cor(CabecaCor, CabecaNome),!,converteNumeroStr(CaudaCor, CaudaNome).

existeElemento(X, [ X | _ ]).
existeElemento(X, [ _ | L ]) :- existeElemento(X, L).

ifThenElse(X, Y, _) :- X, !, Y.
ifThenElse(_, _, Z) :- Z.

aumentaContador(Contador):- Contador is Contador+1.

finalizaLoop(3):- write('Todas as tentativas se esgotaram, você perdeu'), !.

