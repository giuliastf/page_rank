function R = Algebraic(nume, d)
fid = fopen(nume, 'r');
N = fscanf(fid, '%d', 1);% N = nr pagini 
V = dlmread(fid, ' ', [1 2 N N+1]);% citesc o matrice(vecinii) incepand cu linia 1 coloana 2(de unde incep vecinii), pana la linia N(nr pagini) si coloana (N+1, obtinut din: 1(pagina) + 1(nr vecini) + N-1(nr max de vecini) = N+1

v = size(V);
A = zeros(N);% matricea cu 1 sau 0
K = zeros(N);% matricea diagoanala ce retine nr ul de vecini(excluzand nodurile care au link catre ele insele)
D = zeros(N,1);
I = eye(N);
for i = 1:N % construire matrice A si K
  for k = 1:v(2)
    for j = 1:N
      if( V(i,k) == j && i!=j) % verific daca nodul i are un vecin j (V(i,k)), care este != i
        A(i,j) = 1; 
        K(i,i) = K(i,i) + 1; % cresc nr de vecini al nodului i
        break;
      endif
    endfor
  endfor
endfor
%aplic algoritmul descris de link-ul 1 din tema(prima parte a algoritmului Iterative)
for i=1:N
  D(i) = (1-d) / N;
endfor
M = (PR_Inv(K) * A)'; %M este matricea formata din elementul din A(1 sau 0) / nr de vecini a paginii respective(adica coloana lui M) ca la algoritmul Iterative
R = PR_Inv(I - d*M) * D;% stim ca R = D + d*M*R (ca la Iterative), insa pentru a afla R, ne vom folosi de inversa: R = inv(I - d*M) * D

fclose(fid);
endfunction