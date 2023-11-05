function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  output_name = strcat(nume, '.out');
  out = fopen(output_name, 'w');
  in = fopen(nume, 'r');
  
  N = fscanf(in, '%d', 1); %N = nr pagini `
  aux = dlmread(in,' ', [1 0 N 1+N]); %citesc o matrice incepand cu linia 1 coloana 0, pana la linia N(nr pagini) si coloana (N+1, obtinut din: 1(pagina) + 1(nr vecini) + N-1(nr max de vecini) = N+1
  val1 = fscanf(in, '%f', 1); %citesc val1 si val2
  val2 = fscanf(in, '%f', 1);
  
  R1 = Iterative(nume, d, eps);
  R2 = Algebraic(nume, d);
  [PR1 index] = sort(R2, 'descend'); %sorteaza in ordine descrescatoare elementele din R2, punandu-le in PR1, iar index reprezinta indicele elementului mutat
  F = zeros(N, 1);
  for i = 1:N %aplic functia Apartenenta lui PR1, punand rezultatul in F
    F(i) = Apartenenta(PR1(i), val1, val2);
  endfor
  index1 = (1:N)'; %vector coloana cu numere de la 1 la N
  
  fprintf(out,'%d\n', N);
  dlmwrite(out, R1, 'precision', '%.6f');
  fprintf(out, '\n');
  dlmwrite(out, R2, 'precision', '%.6f' );
  fprintf(out, '\n');
  for i = 1:N
    fprintf(out, '%d %d %.6f\n', index1(i), index(i), F(i));
  endfor  
  
  fclose(in);
  fclose(out);
endfunction
  
  