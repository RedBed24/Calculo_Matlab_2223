%% Primer Apartado
Ps = 1000;
Pe = 0;
TasaContagio = 0.5;
incrementoTiempo = 1;
n = 50;
grafico = '.';

simularHito4(incrementoTiempo, n, TasaContagio, Ps, Pe, grafico);
disp("No tendría sentido realizar la simulación porque se mantendría todo el ratoa 0.");

%% Segundo Apartado
Pe = 15;
Ps = 1000;

for TasaContagio = [0.1, 0.3]
  switch TasaContagio
      case 0.1
          grafico = 'x';
          % Cuando vayamos a hacer los gráficos con el valor de incidencia
          % < que 50, lo mostraremos con una x
      case 0.3
          grafico = '.';
  end

  simularHito4(incrementoTiempo, n, TasaContagio, Ps - Pe, Pe, grafico);
end

%% Tercer Apartado

Ps = 1000;
Pe = 1;
TasaContagio = 0.5;

% igual que en el hito 1, para que nos quedemos sólo con el primer valor
diaPrevalenciaMayor90 = -1;

incidenciaMaxima = -1;

% tenemos que calcularlo al principio porque ahora va a influir en Tasa de incidencia, por tanto en la incidencia
Pr = Pe / (Pe+Ps);

for t = 0:incrementoTiempo:n
    TasaInicidencia = TasaContagio * Pr;
    Incidencia = TasaInicidencia * Ps;

    Ps = Ps - Incidencia * incrementoTiempo;
    Pe = Pe + Incidencia * incrementoTiempo;

    Pr = Pe / (Pe+Ps);

    if Incidencia > incidenciaMaxima
        incidenciaMaxima = Incidencia;
	diaIncidenciaMaxima = t;
    end

    if Pr > 0.9 && diaPrevalenciaMayor90 < 0
        diaPrevalenciaMayor90 = t;
    end
end

display("El día con mayor incidencia fue: " + diaIncidenciaMaxima)
display("El día que la prevalencia sobrepasa el 90% de la población es: " + diaPrevalenciaMayor90)