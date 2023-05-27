function filter = create_filter(M, N, u0, v0, Do)
    [u, v] = meshgrid(1:N, 1:M);
    D1 = sqrt((u - M/2 + ((-1)^1) * u0).^2 + (v - N/2 + ((-1)^1) * v0).^2);
    D2 = sqrt((u - M/2 + ((-1)^2) * u0).^2 + (v - N/2 + ((-1)^2) * v0).^2);
    filter = 1 - exp(-0.5 * ((D1 .* D2) / Do^2));
end
