:- static cor/2
cor(1, vermelho).
cor(2, verde).
cor(3, azul).
cor(4, roxo).
cor(5, rosa).
cor(6, laranja).
cor(7, amarelo).

%:- dynamic
%senha/4.

sortearSenha:- randseq(4, 7, Senha),
    write(Senha),
    bagof(Senha[Ncor|_], cor(Ncor, Nomecor), Novasenha),
    write('Unificado'),
    write(Novasenha),
    %converteFormatoSenha(Senha),
    write('Senha sorteada! Vamos começar ?').


%converteFormatoSenha(Senha):- bagof([Ncor|_], cor(Ncor, Nomecor), Senha).


%montaSenha([], cor(_,_), (length(senha, Tamanho) == 4)).
%montaSenha([Ncor|_], cor(Ncor, Nomecor), senha[Nomecor|_]):- montaSenha([_|Y], cor(_,_), senha).
