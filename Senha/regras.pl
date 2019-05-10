leArquivos(Regras, []) :-
    at_end_of_stream(Regras).

leArquivoRegras(Regras, [Cabeca|Cauda]):-
    \+ at_end_of_stream(Regras),
    read(Regras, Cabeca),
    write(Cabeca), nl,
    leArquivoRegras(Regras, Cauda).