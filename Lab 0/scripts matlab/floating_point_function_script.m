



X = [floating_point_function(16.078125);floating_point_function(-63.9136);floating_point_function(96.0153)];






function [P] = floating_point_function(N)
  
    if N > 0
      sign = '0'; 
    else
        sign = '1'; 
    end 
    B = fix(abs(N));
    bin_decimal = dec2bin(B);
%ahora se va a sacar la parte decimal
    bin_fraction = '';
    p_fraction = abs(N) - abs(fix(N));
while p_fraction > 0
        p_fraction = p_fraction * 2;
    if p_fraction<1 
        bin_fraction = strcat(bin_fraction,'0');
    else 
        bin_fraction = strcat(bin_fraction,'1');
        p_fraction = p_fraction - fix(p_fraction);
    end 
end 

binario = strcat(bin_decimal,'.',bin_fraction);
punto_frac =  strfind(binario, '.') - 2; 
bias = 2^(6)- 1; %en este caso el exponente tiene reservado 7 bits.
exponent = dec2bin(punto_frac + bias);
binario(punto_frac + 2) = []; 
binario(1) = [];
binario(9:end) = [];
s = sprintf('%f',N);
P = s + convertCharsToStrings(strcat('===',sign,exponent,binario));     
end 


















