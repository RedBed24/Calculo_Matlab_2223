%% Primer Apartado

% datos
PoblacionSusceptibleInicial = 1000;
PoblacionEnfermaInicial = 0;
ValorIncidencia = 50;
IncrementoTiempo = 1;
TiempoMaximo = 50;

% simulación
[PoblacionSusceptibleA, PoblacionEnfermaA, PrevalenciaA, IncidenciaA] = simulacionHito2(IncrementoTiempo, TiempoMaximo, ValorIncidencia, PoblacionSusceptibleInicial, PoblacionEnfermaInicial);

% muestra de resultados
figure(1)
plot(IncrementoTiempo : IncrementoTiempo : TiempoMaximo, IncidenciaA, 'k')
title('Incidencia (personas / día) frente al tiempo (días)')

figure(2)
plot(0 : IncrementoTiempo : TiempoMaximo, PrevalenciaA, 'r')
title('Prevalencia (%) frente al tiempo (días)')

figure(3)
% en verde observamos la población susceptible
% en rojo observamos la población enferma
hold on
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionSusceptibleA, 'g')
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionEnfermaA, 'r')
hold off
title('Población Susceptible y Enferma (personas) frente al tiempo (días)')

%% Segundo Apartado

% simulación con nuevos datos, mostrado con línea discontínua
ValorIncidencia = 40;
[PoblacionSusceptible, PoblacionEnferma, Prevalencia, Incidencia] = simulacionHito2(IncrementoTiempo, TiempoMaximo, ValorIncidencia, PoblacionSusceptibleInicial, PoblacionEnfermaInicial);

% muestra de los nuevos datos
figure(1)
hold on
plot(IncrementoTiempo : IncrementoTiempo : TiempoMaximo, Incidencia, 'k--')
hold off

figure(2)
hold on
plot(0 : IncrementoTiempo : TiempoMaximo, Prevalencia, 'r--')
hold off

figure(3)
hold on
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionSusceptible, 'g--')
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionEnferma, 'r--')
hold off

% mostrado con línea de puntos
ValorIncidencia = 60;
[PoblacionSusceptible, PoblacionEnferma, Prevalencia, Incidencia] = simulacionHito2(IncrementoTiempo, TiempoMaximo, ValorIncidencia, PoblacionSusceptibleInicial, PoblacionEnfermaInicial);

figure(1)
hold on
plot(IncrementoTiempo : IncrementoTiempo : TiempoMaximo, Incidencia,'k:')
hold off

figure(2)
hold on
plot(0 : IncrementoTiempo : TiempoMaximo, Prevalencia, 'r:')
hold off

figure(3)
hold on
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionSusceptible, 'g:')
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionEnferma, 'r:')
hold off

%% Tercer Apartado

% lo inicializamos de nuevo porque ha sido alterado en el apartado 2
ValorIncidencia = 50;

% Cambiamos la población inicial
PoblacionEnfermaInicial = 30;

[PoblacionSusceptible, PoblacionEnferma, Prevalencia, Incidencia] = simulacionHito2(IncrementoTiempo, TiempoMaximo, ValorIncidencia, PoblacionSusceptibleInicial, PoblacionEnfermaInicial);

% usamos nuevas figuras para no quitar las gráficas del apartado A y B
figure(4)
hold on
plot(IncrementoTiempo : IncrementoTiempo : TiempoMaximo, IncidenciaA, 'k')
plot(IncrementoTiempo : IncrementoTiempo : TiempoMaximo, Incidencia, 'k--')
hold off
title('C) Incidencia (personas / días) frente al tiempo (días)')

figure(5)
hold on
plot(0 : IncrementoTiempo : TiempoMaximo, PrevalenciaA, 'r')
plot(0 : IncrementoTiempo : TiempoMaximo, Prevalencia, 'r--')
hold off
title('C) Prevalencia (%) frente al tiempo (días)')

figure(6)
hold on
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionSusceptibleA, 'g')
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionEnfermaA, 'r--')

plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionSusceptible, 'g')
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionEnferma, 'r--')
hold off
title('C) Población Susceptible y Enferma (personas) frente al tiempo (días)')

