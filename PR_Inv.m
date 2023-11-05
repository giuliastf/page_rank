function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% A = QR => inv(A) = inv(R)inv(Q) = inv(R) Q'
  % sistemul este: A*B = I;stim ca A = Q*R => sistemul este echivalent cu Q*R*B = I <=> RB = Q'
  m = size(A);
  R = zeros(m(1));
  B = zeros(m(1));
  Q = zeros(m(1));
  
  for i = 1:m(1) %aflu Q si R aplicand algoritmul Gram-Schmidt modificat
    R(i,i) = norm(A(:,i));
    Q(:,i) = A(:,i)/R(i,i);
    for j = i+1:m(1)
      R(i,j) = (Q(:,i)')*A(:,j);
      A(:,j) = A(:,j) - Q(:,i)*R(i,j);
    endfor
  endfor
  
  Q = Q';
  for i = m(1) : -1: 1 %aflu B(i,:), formula fiind dedusa matematic(explicatii in readme)
    s = zeros(1,m(1));
    for j = i+1 : m(1)
      s = s + B(j,:) * R(i,j);
    endfor
    B(i,:) =  (Q(i, :) - s ) / R(i,i);
  endfor

endfunction