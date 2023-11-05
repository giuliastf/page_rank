function R = Iterative(nume, d, eps)
fid = fopen(nume, 'r');
N = fscanf(fid, '%d', 1);% N = nr pagini 
V = dlmread(fid, ' ', [1 2 N N+1]);% citesc incepand cu linia 1 coloana 2(de unde incep vecinii), pana la linia N si coloana N+1

v = size(V);
A = zeros(N);% matricea cu 1 sau 0
K = zeros(N);% matricea diagoanala ce retine nr ul de vecini(excluzand nodurile care au link catre ele insele)
R = zeros(N,1);
D = zeros(N,1);
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

%aplic algoritmul descris de link-ul 1 din tema
M = (inv(K)*A)';
for i = 1:N
  R(i) = 1 / N;
  D(i) = (1-d) / N;
endfor
aux = d*M*R + D;
while norm(aux - R) >= eps
  R = aux;
  aux = d*M*R + D;
endwhile

fclose(fid);
endfunction;