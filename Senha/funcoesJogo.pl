:- dynamic palpite/4.

cor(1, vermelho).
cor(2, verde).
cor(3, azul).
cor(4, roxo).
cor(5, rosa).
cor(6, laranja).
cor(7, amarelo).
palpite(a,a,a,a).

preparaJogo:- 
    randseq(4, 7, Senha),
    retractall(palpite(_,_,_,_)),
    converteNumeroStr(Senha, StrSenha),
    write('Senha gerada com sucesso! Vamos começar...'),nl, nl,
    loopJogo(StrSenha).
    

loopJogo(StrSenha):- repeat, 
    seq(1,10,Index),
    recebePalpite(PalpiteLista,Index),
    listing(palpite), nl,
    conferePalpite(PalpiteLista, StrSenha),nl,
    finalizaLoop(Index, StrSenha).

conferePalpite(PalpiteLista, StrSenha):-    
    ifThenElse(PalpiteLista = StrSenha, retornaMenuGanhou, 
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

    ifThenElse(Palpite1 = Senha1, write('  Pino Preto'), 
    ifThenElse(existeElemento(Palpite1, StrSenha), write('  Pino Branco'), write(' Sem Pino'))),
    
    ifThenElse(Palpite2 = Senha2, write(' | Pino Preto'),
    ifThenElse(existeElemento(Palpite2, StrSenha), write('| Pino Branco'), write('| Sem Pino'))),nl,
    
    write('  ------------------------'), nl,
    ifThenElse(Palpite3 = Senha3, write('  Pino Preto'),
    ifThenElse(existeElemento(Palpite3, StrSenha), write('  Pino Branco'), write(' Sem Pino'))),

    ifThenElse(Palpite4 = Senha4, write(' | Pino Preto'),
    ifThenElse(existeElemento(Palpite4, StrSenha), write('| Pino Branco'), write('| Sem Pino'))),nl.


recebePalpite(PalpiteLista,Index):-
    write('Tentativa '),
    write(Index),nl,nl,
    write('Cores possíveis: vermelho, verde, azul, roxo, rosa, laranja e amarelo'),nl, nl,
    write('----------------------------------------'), nl,
    write('|            Formato da senha            |'), nl, nl,
    write('|    1° cor | 2° cor | 3° cor | 4° cor   |'), nl, 
    write('----------------------------------------'),nl,nl,nl,
    write('1° cor | 2° cor | 3° cor | 4° cor'),nl,
    write('  ^'),nl,
    write('  |'), nl,nl,
    write('Insira a 1° cor: '), nl,
    read(Palpite1),
    nl, write('1° cor | 2° cor | 3° cor | 4° cor'),nl,
    write('           ^'),nl,
    write('           |'), nl,nl,
    write('Insira a 2° cor: '), nl,
    read(Palpite2),
    nl, write('1° cor | 2° cor | 3° cor | 4° cor'),nl,
    write('                    ^'),nl,
    write('                    |'), nl,nl,
    write('Insira a 3° cor: '), nl,
    read(Palpite3),
    nl, write('1° cor | 2° cor | 3° cor | 4° cor'),nl,
    write('                             ^'),nl,
    write('                             |'), nl,nl,
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

finalizaLoop(10, StrSenha):- retornaMenuPerdeu(StrSenha), !.

seq(From,_,From).
seq(From,To,X) :-
    From<To,
    Next is From+1,
    seq(Next,To,X).

retornaMenuGanhou:-
    write('Parabéns, você ganhou!!!!!!!'),nl,nl,
    consult('menu.pl'), menu.

retornaMenuPerdeu(StrSenha):-
    write('Todas as tentativas se esgotaram, você perdeu!'),nl,
    write('A senha era:'), write(StrSenha), nl, nl, 
    consult('menu.pl'), menu.
