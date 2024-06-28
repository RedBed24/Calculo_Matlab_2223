%% Primer Apartado

% datos
PoblacionSusceptibleInicial = 1000;
PoblacionEnfermaInicial = 0;
TasaIncidencia = 0.1;
IncrementoTiempo = 1;
TiempoMaximo = 50;

% simulación
[PoblacionSusceptibleA, PoblacionEnfermaA, PrevalenciaA, IncidenciaA] = simulacionHito3(IncrementoTiempo, TiempoMaximo, TasaIncidencia, PoblacionSusceptibleInicial, PoblacionEnfermaInicial);

% muestra de resultados
figure(1)
plot(IncrementoTiempo : IncrementoTiempo : TiempoMaximo, IncidenciaA, 'Color', 'k')
title('Incidencia (personas / día) frente al tiempo (días)')

figure(2)
plot(0 : IncrementoTiempo : TiempoMaximo, PrevalenciaA, 'Color', 'r')
title('Prevalencia (%) frente al tiempo (días)')

figure(3)
% en verde observamos la población susceptible
% en rojo observamos la población enferma
hold on
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionSusceptibleA, 'Color', 'g')
plot(0 : IncrementoTiempo : TiempoMaximo, PoblacionEnfermaA, 'Color', 'r')
hold off
title('Población Susceptible y Enferma (personas) frente al tiempo (días)')

% calcular el instante en el que la PoblacionSusceptible y la PoblacionEnferma son iguales
for i = 1 : size(PoblacionSusceptibleA, 2) - 1
	% si el instante es en un día en específico
	if PoblacionSusceptibleA(i) == PoblacionEnfermaA(i)
		display("En el día " + (i - 1) * IncrementoTiempo + " había el mismo número de enfermos como de sanos")
	
	% si el instante es entre 2 días
	% uno es estrictamente decreciente y el otro estrictamente creciente, respectivamente
	elseif PoblacionSusceptibleA(i) > PoblacionEnfermaA(i) && PoblacionSusceptibleA(i + 1) < PoblacionEnfermaA(i + 1)
		display("Entre los días " + (i - 1) * IncrementoTiempo + " e " + i * IncrementoTiempo + " había el mismo número de enfermos como de sanos")
	end
end

%% Segundo Apartado

% simulación con nuevos datos, mostrado con línea discontínua
TasaIncidencia = 0.033;
[PoblacionSusceptible, PoblacionEnferma, Prevalencia, Incidencia] = simulacionHito3(IncrementoTiempo, TiempoMaximo, TasaIncidencia, PoblacionSusceptibleInicial, PoblacionEnfermaInicial);

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
TasaIncidencia = 0.3;
[PoblacionSusceptible, PoblacionEnferma, Prevalencia, Incidencia] = simulacionHito3(IncrementoTiempo, TiempoMaximo, TasaIncidencia, PoblacionSusceptibleInicial, PoblacionEnfermaInicial);

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
TasaIncidencia = 0.1;

% Cambiamos la población inicial
PoblacionEnfermaInicial = 30;

[PoblacionSusceptible, PoblacionEnferma, Prevalencia, Incidencia] = simulacionHito3(IncrementoTiempo, TiempoMaximo, TasaIncidencia, PoblacionSusceptibleInicial, PoblacionEnfermaInicial);

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

