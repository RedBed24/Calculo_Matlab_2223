function [] = simularHito4(incrementoTiempo, n, TasaContagio, Ps, Pe, grafico)

% tenemos que calcularlo al principio porque ahora va a influir en Tasa de incidencia, por tanto en la incidencia
Pr = Pe / (Pe+Ps);
% YA NO USAMOS EL POR 100 POR QUE LO VAMOS A USAR PARA CÁLCULOS
% antes lo multiplicábamos porque era un porcentaje y queríamos verlo como tal
% ahora en vez de estar en por 100, está en por 1

for t = 0:incrementoTiempo:n
    TasaInicidencia = TasaContagio * Pr;
    Incidencia = TasaInicidencia * Ps;

    Ps = Ps - Incidencia * incrementoTiempo;
    Pe = Pe + Incidencia * incrementoTiempo;

    Pr = Pe / (Pe+Ps);

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

