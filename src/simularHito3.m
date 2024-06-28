function [instante] = simularHito3(incrementoTiempo, n, TasaIncidencia, Ps, Pe, grafico)
for t = 0:incrementoTiempo:n
    Incidencia = TasaIncidencia * Ps;
    % es la misma fórmula, pero despejada para la I, que es lo que vamos a usar para calcular lo siguiente

    Ps = Ps - Incidencia * incrementoTiempo;
    Pe = Pe + Incidencia * incrementoTiempo;
    %Pe = Ps - Pe;
    %VectorPs(i) = Ps;
    %VectorPe(i) = Pe;
    %i = i + 1;

    Pr = Pe / (Pe+Ps) * 100;

    if Ps == Pe
	instante = t;
    end

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
