%% Primer Apartado
Ps = 1000;
Pe = 0;
TasaInicidencia = 0.1;
incrementoTiempo = 1;
n = 50;
grafico = '.';

instante = simularHito3(incrementoTiempo, n, TasaInicidencia, Ps, Pe, grafico);
display("Instante en el que la población susceptible y enferma contienen el mismo número de personas: " + instante);

%% Segundo Apartado
for TasaInicidencia = [0.1, 0.2, 0.5]
  switch TasaInicidencia
      case 0.1
          grafico = 'x';
          % Cuando vayamos a hacer los gráficos con el valor de incidencia
          % < que 50, lo mostraremos con una x
      case 0.2
          grafico = '.';
      case 0.5
          grafico = 'o';
  end

  simularHito3(incrementoTiempo, n, TasaInicidencia, Ps, Pe, grafico);
end

%% Tercer Apartado

% lo inicializamos de nuevo porque ha sido alterado en el apartado 2
TasaInicidencia = 0.1;

for Pe = [0, 15]
  switch Pe
      case 0
          grafico = 'x';
          % Cuando vayamos a hacer los gráficos con el valor de incidencia
          % < que 50, lo mostraremos con una x
      case 15
          grafico = '.';
  end

    % mantenemos la población total a 1000, para ello, en vez de empezar con 1000 personas sanas, empezamos con 1000 - Pe
    simularHito3(incrementoTiempo, n, TasaInicidencia, Ps - Pe, Pe, grafico);
end