function [] = simularHito2(incrementoTiempo,n , ValorIncidencia, Ps, Pe, grafico)
for t = 0:incrementoTiempo:n
    Incidencia = min(ValorIncidencia, Ps / incrementoTiempo);

    Ps = Ps - Incidencia * incrementoTiempo;
    Pe = Pe + Incidencia * incrementoTiempo;
    %Pe = Ps - Pe;
    %VectorPs(i) = Ps;
    %VectorPe(i) = Pe;
    %i = i + 1;

    Pr = Pe / (Pe+Ps) * 100;

    figure(1)
    hold on
    plot(t, Incidencia, grafico, 'Color', 'k')
    title('Incidencia / tiempo')

    figure(2)
    hold on
    plot(t, Pr, grafico,'Color', 'r')
    title('Prevalencia / tiempo')

    figure(3)
    % en verde observamos la población susceptible
    % en rojo observamos la población enferma
    hold on
    plot(t, Ps, grafico, 'Color', 'g')
    plot(t, Pe, grafico, 'Color', 'r')
    title('Población susceptible y enferma / tiempo')
end
end

