%% Primer Apartado

% datos
PoblacionSusceptibleInicial = 1000;
PoblacionEnfermaInicial = 0;
TasaContagio = 0.5;
IncrementoTiempo = 1;
TiempoMaximo = 50;

% simulación
[PoblacionSusceptible, PoblacionEnferma, Prevalencia, Incidencia] = simulacionHito4(IncrementoTiempo, TiempoMaximo, TasaContagio, PoblacionSusceptibleInicial, PoblacionEnfermaInicial);

% muestra de resultados
figure(1)
plot(IncrementoTiempo : IncrementoTiempo : TiempoMaximo, Incidencia, 'k')
title('Incidencia (personas / día) frente al tiempo (días)')

figure(2)
plot(0 : IncrementoTiempo : TiempoMaximo, Prevalencia, 'r')
title('Prevalencia (%) frente al tiempo (días)')

figure(3)
% en verde observamos la población susceptible
% en rojo observamos la población enferma
hold on
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionSusceptible, 'g')
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionEnferma, 'r')
hold off
title('Población Susceptible y Enferma (personas) frente al tiempo (días)')

% Sí tiene sentido, no hay niguna persona enferma, nadie puede enfermar
% Al calcular la incidencia (el número de personas que enferma en un cambio)
% se multiplica la tasa de contagio por la PoblacionEnferma, lo cual da 0 (TasaIncidencia)
% que cuando se multiplica por la PoblacionSusceptible también dará 0
% resultando en que 0 personas enfermarán durante ese cambio

%% Segundo Apartado

% simulación con nuevos datos, mostrado con línea discontínua
PoblacionEnfermaInicial = 50;
TasaContagio = 0.033;

[PoblacionSusceptible, PoblacionEnferma, Prevalencia, Incidencia] = simulacionHito4(IncrementoTiempo, TiempoMaximo, TasaContagio, PoblacionSusceptibleInicial, PoblacionEnfermaInicial);

% muestra de los nuevos datos, borrando los anteriores
figure(1)
plot(IncrementoTiempo : IncrementoTiempo : TiempoMaximo, Incidencia, 'k--')

figure(2)
plot(0 : IncrementoTiempo : TiempoMaximo, Prevalencia, 'r--')

figure(3)
clf
hold on
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionSusceptible, 'g--')
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionEnferma, 'r--')
hold off

% mostrado con línea de puntos
PoblacionEnfermaInicial = 10;
TasaContagio = 0.3;
[PoblacionSusceptible, PoblacionEnferma, Prevalencia, Incidencia] = simulacionHito4(IncrementoTiempo, TiempoMaximo, TasaContagio, PoblacionSusceptibleInicial, PoblacionEnfermaInicial);

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

% Consideramos los datos del principio de nuevo
PoblacionEnfermaInicial = 1;
TasaContagio = 0.5;

[PoblacionSusceptible, PoblacionEnferma, Prevalencia, Incidencia] = simulacionHito4(IncrementoTiempo, TiempoMaximo, TasaContagio, PoblacionSusceptibleInicial, PoblacionEnfermaInicial);

% mostramos los datos de este aparatdo
figure(4)
plot(IncrementoTiempo : IncrementoTiempo : TiempoMaximo, Incidencia, 'k--')
title('C) Incidencia (personas / días) frente al tiempo (días)')

figure(5)
plot(0 : IncrementoTiempo : TiempoMaximo, Prevalencia, 'r--')
title('C) Prevalencia (%) frente al tiempo (días)')

figure(6)
clf
hold on
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionSusceptible, 'g')
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionEnferma, 'r--')
hold off
title('C) Población Susceptible y Enferma (personas) frente al tiempo (días)')

[maximo, indice, ] = max(Incidencia);
display("El día con mayor incidencia fue " + indice * IncrementoTiempo)

PrevalenciaMayor90 = find(Prevalencia > 0.9);
display("El día en el que la prevalencia empezó a superar el 90% fue " + (PrevalenciaMayor90(1) - 1) * IncrementoTiempo)

