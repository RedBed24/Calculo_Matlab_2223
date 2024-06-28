%% Datos

AguaInicial = 0;
AguaDeseada = 0.25;

IncrementoTiempo = 0.1;
TiempoMaximo = 25;

k = 0.1;

%% Simulación

Flujo = zeros(1, TiempoMaximo / IncrementoTiempo);
AguaActual = zeros(1, TiempoMaximo / IncrementoTiempo + 1);
AguaActual(1) = AguaInicial;

indice = 1;

% el instante 0 está ya simulado en la línea 14

for tiempo = IncrementoTiempo : IncrementoTiempo : TiempoMaximo
	Discrepancia = AguaDeseada - AguaActual(indice);

	Flujo(indice) = k * Discrepancia;

	AguaActual(indice + 1) = AguaActual(indice) + Flujo(indice) * IncrementoTiempo;
	indice = indice + 1;
end

%% Mostrar los resultados

% Agua
figure(1)
plot(0 : IncrementoTiempo : TiempoMaximo, AguaActual);
xlabel("Tiempo (s)");
ylabel("Agua (L)");

% Flujo

% El flujo son las transiciones en cada instante de tiempo, por eso hay uno menos
figure(2)
plot(IncrementoTiempo : IncrementoTiempo : TiempoMaximo, Flujo);
xlabel("Tiempo (s)");
ylabel("Flujo (L/s)");

%% Apartado 2

% para obtener el índice nos preguntamos en qué iteración del bucle fue
% + 1 porque los índices empiezan en 1
display("El agua a los 10 segundos es: " + AguaActual(10 / IncrementoTiempo + 1) + "L")
display("El agua a los 20 segundos es: " + AguaActual(20 / IncrementoTiempo + 1) + "L")

FlujoMenor001 = find(Flujo < 0.01);
% para obtener el tiempo, hacemos el proceso inverso
% no le restamos 1 porque lo hemos empezado a dibujar desde IncrementoTiempo
display("El flujo empezó a ser menor de 0.01L/s a los " + FlujoMenor001(1) * IncrementoTiempo + "s")

