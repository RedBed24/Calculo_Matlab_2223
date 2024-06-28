function [PoblacionSusceptible, PoblacionEnferma, Prevalencia, Incidencia] = simulacionHito3(IncrementoTiempo, TiempoMaximo, TasaIncidencia, PoblacionSusceptibleInicial, PoblacionEnfermaInicial)

PoblacionSusceptible = zeros(1, TiempoMaximo / IncrementoTiempo + 1);
PoblacionEnferma = zeros(1, TiempoMaximo / IncrementoTiempo + 1);

% Como en el primer aparatdo, es la "transición" entre una iteración y otra
Incidencia = zeros(1, TiempoMaximo / IncrementoTiempo);

% simulamos el primer día
PoblacionSusceptible(1) = PoblacionSusceptibleInicial;
PoblacionEnferma(1) = PoblacionEnfermaInicial;

indice = 1;

for tiempo = IncrementoTiempo : IncrementoTiempo : TiempoMaximo
	Incidencia(indice) = TasaIncidencia * PoblacionSusceptible(indice);

	PoblacionSusceptible(indice + 1) = PoblacionSusceptible(indice) - Incidencia(indice) * IncrementoTiempo;
	PoblacionEnferma(indice + 1) = PoblacionEnferma(indice) + Incidencia(indice) * IncrementoTiempo;

	indice = indice + 1;
end

Prevalencia = PoblacionEnferma ./ (PoblacionEnferma + PoblacionSusceptible);

end

