function [PoblacionSusceptible, PoblacionEnferma, Prevalencia, Incidencia] = simulacionHito4(IncrementoTiempo, TiempoMaximo, TasaContagio, PoblacionSusceptibleInicial, PoblacionEnfermaInicial)

PoblacionSusceptible = zeros(1, TiempoMaximo / IncrementoTiempo + 1);
PoblacionEnferma = zeros(1, TiempoMaximo / IncrementoTiempo + 1);
Prevalencia = zeros(1, TiempoMaximo / IncrementoTiempo + 1);

% Como en el primer aparatdo, es la "transición" entre una iteración y otra
Incidencia = zeros(1, TiempoMaximo / IncrementoTiempo);

% simulamos el primer día
PoblacionSusceptible(1) = PoblacionSusceptibleInicial;
PoblacionEnferma(1) = PoblacionEnfermaInicial;
Prevalencia(1) = PoblacionEnferma(1) / (PoblacionEnferma(1) + PoblacionSusceptible(1));

indice = 1;

for tiempo = IncrementoTiempo : IncrementoTiempo : TiempoMaximo
	TasaIncidencia = TasaContagio * Prevalencia(indice);
	Incidencia(indice) = TasaIncidencia * PoblacionSusceptible(indice);

	PoblacionSusceptible(indice + 1) = PoblacionSusceptible(indice) - Incidencia(indice) * IncrementoTiempo;
	PoblacionEnferma(indice + 1) = PoblacionEnferma(indice) + Incidencia(indice) * IncrementoTiempo;
	Prevalencia(indice + 1) = PoblacionEnferma(indice) / (PoblacionEnferma(indice) + PoblacionSusceptible(indice));

	indice = indice + 1;
end

end

