TEMA 1 METODE NUMERICE - IMBREA GIULIA-STEFANIA 311CB
-----------------------------------------------------------------------------------------------------------------------------------------------------------
PR_Inv
Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
A = QR => inv(A) = inv(R)inv(Q) = inv(R) Q'
sistemul este: A*B = I;stim ca A = Q*R => sistemul este echivalent cu Q*R*B = I <=> RB = Q'
pas 1) aflu Q si R aplicand algoritmul Gram-Schmidt modificat
pas 2) aflu B(i,:), formula fiind dedusa matematic
		Fie B o matrice 3x3, stim ca R * B = Q'      
		Aplic Q=Q', iar sistemul de ecuatii devine:
		(1): R(1,1)B(1,:) + R(2,2)B(2,:) + R(3,3)B(3,:) = Q(1,:)
		(2):                R(2,2)B(2,:) + R(3,3)B(3,:) = Q(2,:)
		(3):                               R(3,3)B(3,:) = Q(3,:)
		R-ul fiind o matrice diagonala este usor de scos cate un element, incepand cu ultima ecuatie
		(3) => B(3,:) = Q(3,:)/R(3,3) - 0
		(2) => B(2,:) = [Q(2,:) - R(3,3)B(3,:)] / R(2,2)
		(3) => B(1,:) = [Q(1,:) - ( R(2,2)B(2,:) + R(3,3)B(3,:) )] / R(1,1)
		not. suma de dupa minus cu s(care initial este 0), s = s = s + B(j,:) * R(i,j); pentru j = i+1:3
		stiind acestea, am generalizat formula la : B(i,:) =  (Q(i, :) - s ) / R(i,i);
-----------------------------------------------------------------------------------------------------------------------------------------------------------
Iterative
Functia care calculeaza matricea R folosind algoritmul iterativ.
	Intrari:
	-> nume: numele fisierului din care se citeste;
	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	-> eps: eroarea care apare in algoritm.
	Iesiri:
	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
-Citesc N
-Citesc V o matrice(vecinii) incepand cu linia 1 coloana 2(de unde incep vecinii), 
pana la linia N(nr pagini) si coloana (N+1, obtinut din: 1(pagina) + 1(nr vecini) + N-1(nr max de vecini) = N+1
-Pentru a realiza matricea A(care contine 1 sau 0) si K(matricea diagoanala ce retine nr ul de vecini(excluzand nodurile care au link catre ele insele)
parcurg matricile V, A, K, verific daca nodul i are un vecin j (V(i,k)), care este != i si modific K prin cresterea nr de vecini al nodului i
-aplic algoritmul descris de link-ul 1 din tema
	pas1) fie M = (inv(K)*A)';
	pas2) intializez elementele din R cu 1 / N si cele din D(termeni liberi) cu (1-d) / N
	pas3) aplic formula R(t+1) = d*M*R(t) + D cat timp |R(t+1) - R(t)| >= eps ; in program R(t+1) = aux, iar R(t)=R
-----------------------------------------------------------------------------------------------------------------------------------------------------------
Algebraic
Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	Intrari: 
	-> nume: numele fisierului in care se scrie;
	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	Iesiri:
	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
-Citesc N
-Citesc V o matrice(vecinii) incepand cu linia 1 coloana 2(de unde incep vecinii), 
pana la linia N(nr pagini) si coloana (N+1, obtinut din: 1(pagina) + 1(nr vecini) + N-1(nr max de vecini) = N+1
-Pentru a realiza matricea A(care contine 1 sau 0) si K(matricea diagoanala ce retine nr ul de vecini(excluzand nodurile care au link catre ele insele)
parcurg matricile V, A, K, verific daca nodul i are un vecin j (V(i,k)), care este != i si modific K prin cresterea nr de vecini al nodului i
-aplic prima parte a  algoritmului descris de link-ul 1 din tema, prima parte din Iterative
	pas1) fie M = (inv(K)*A)'; M este matricea formata din elementul din A(1 sau 0) / nr de vecini a paginii respective(adica coloana lui M) ca la algoritmul Iterative
	pas2) initializez elementele din D (termeni liberi) cu (1-d) / N
	pas3) stim ca R = D + d*M*R (ca la Iterative), insa pentru a afla R, ne vom folosi de inversa: R = inv(I - d*M) * D, inv = PR_Inv
---------------------------------------------------------------------------------------------------------------------------------------------------------------
Apartenenta
 Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
 Stim ca 0 <= x <= 1
         |0,    0 <= x < val1
  u(x) = |ax+b, val1 <= x <= val2
         |1,    val2<x<=1
  u(x) continua <=> | lim[x->val1, x>val1] ax + b = 0 => a*val1 + b = 0 => val1/(val2-val1) + b = 0 => b = val1 /(val1 -val2)
                    | lim[x->val2, x<val2] ax + b = 1 => a*val2 + b = 1 =>a(val1-val2) = -1 => a = 1/(val2-val1)
----------------------------------------------------------------------------------------------------------------------------------------------------------------
PageRank
 Calculeaza indicii PageRank pentru cele 3 cerinte
 Scrie fisierul de iesire nume.out
-Citesc N, aux(toata matricea pana la linia cu val1), val1 si val2
-R1 = Iterative(nume, d, eps) si R2 = Algebraic(nume, d);
-sortez in ordine descrescatoare elementele din R2, punandu-le in PR1, iar in index reprezinta indicii elementelor mutate
-aplic functia Apartenenta lui PR1, punand rezultatul in F
-creez un index1, vector coloana cu numere de la 1 la N
-imi ramane de printat in ordinea ceruta

:)