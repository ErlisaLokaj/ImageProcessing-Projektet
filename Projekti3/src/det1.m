pkg load image


function zhurma(Shperndarja, x, y, z, k, s, a, b)
    % Gjenerimi i dimensioneve të zhurmës
    numri_rreshtave = abs(z - x) + 1;
    numri_shtyllave = abs(k - y) + 1;
    
    % Krijimi i matricës së zhurmës me dimensionet e përcaktuara
    zhurma = zeros(numri_rreshtave, numri_shtyllave, s);
    
    % Përcaktimi i zhurmës sipas shpërndarjes së zgjedhur
    if strcmp(Shperndarja, 'Rayleigh')
        for i = 1:s
            zhurma(:,:,i) = sqrt(-2 * a^2 * log(1 - rand([numri_rreshtave, numri_shtyllave])));
        end
    elseif strcmp(Shperndarja, 'Eksponenciale')
        for i = 1:s
            zhurma(:,:,i) = -a * log(1 - rand([numri_rreshtave, numri_shtyllave]));
        end
    elseif strcmp(Shperndarja, 'LogNormal')
        for i = 1:s
            zhurma(:,:,i) = exp(b * randn([numri_rreshtave, numri_shtyllave]) + a);
        end
    elseif strcmp(Shperndarja, 'Salt&Pepper')
        for i = 1:s
            zhurma(:,:,i) = imnoise(zhurma(:,:,i), 'salt & pepper', a);
        end
    elseif strcmp(Shperndarja, 'Erlang')
        for i = 1:s
            zhurma(:,:,i) = -a * sum(log(1 - rand([numri_rreshtave, numri_shtyllave])), 3);
        end
    else
        error('Shpërndarja e zgjedhur nuk është e vlefshme.');
    end
    
    % Paraqitja e zhurmës
    disp(zhurma);
end



% Gjenerimi i zhurmës me shpërndarje Rayleigh
disp("Shperndarja Rayleigh");
zhurma('Rayleigh', 1, 1, 3, 3, 3, 1.5, 0);
disp("///////////////////////////////");

% Gjenerimi i zhurmës me shpërndarje LogNormal
disp("Shperndarja LogNormal");
zhurma('LogNormal', 1, 1, 3, 3, 3, 1, 0.5);
disp("///////////////////////////////");

% Gjenerimi i zhurmës me shpërndarje Erlang
disp("Shperndarja Erlang");
zhurma('Erlang', 1, 1, 3, 3, 3, 3, 2);
disp("///////////////////////////////");

% Gjenerimi i zhurmës me shpërndarje Eksponenciale
disp("Shperndarja Eksponenciale");
zhurma('Eksponenciale', 1, 1, 3, 3, 3, 1.5, 0);
disp("///////////////////////////////");

% Gjenerimi i zhurmës me shpërndarje Salt&Pepper
disp("Shperndarja Salt&Pepper");
zhurma('Salt&Pepper', 1, 1, 3, 3, 3, 0.1, 0);
disp("///////////////////////////////");

