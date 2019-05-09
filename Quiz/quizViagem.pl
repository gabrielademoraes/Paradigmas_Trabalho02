inicioQuiz :-
    write('Com esse quiz você descobrirá qual o país ideal realizar a viagem dos seus sonhos. Primeiramente responda, você prefere:'), nl,
	write('1 - Frio'), nl,
	write('2 - Calor'), nl,
	write('Digite sua escolha'), nl,
	read(Escolha),
	clima(Escolha).

clima(1) :-
	write('Então, esse clima lhe agrada mais. Você prefere:'), nl,
	write('1 Florestas'), nl,
	write('2 Montanhas'), nl,
	write('Digite sua escolha'), nl,
	read(Escolha),
	ambienteFrio(Escolha).

clima(2) :-
	write('Então, esse clima lhe agrada mais. Você prefere:'), nl,
	write('1 Desertos'), nl,
	write('2 Praias'), nl,
	write('Digite sua escolha'), nl,
	read(Escolha),
	ambienteQuente(Escolha).

ambienteFrio(1) :-
	write('Então o local ideal para você é o Canadá, com seu clima frio e as suas lindas florestas.'), nl.

ambienteFrio(2) :-
	write('Então o local ideal para você é nos alpes suíços, local incrível para prática de esqui.'), nl.

ambienteQuente(1):-
	write('Então o local ideal para você é o Deserto do Saara. Aproveite para conhecer a cultura da região.'), nl.

ambienteQuente(2) :-
	write('Então a o local ideal para você é o Nordeste brasileiro. As praias de lá são de tirar o fôlego.'), nl.