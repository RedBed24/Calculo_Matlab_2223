%% Primer Apartado
Ps = 1000;
Pe = 0;
ValorIncidencia = 50;
incrementoTiempo = 1;
n = 50;
grafico = '.';

simularHito2(incrementoTiempo, n, ValorIncidencia, Ps, Pe, grafico)

%% Segundo Apartado
for ValorIncidencia = [25, 50, 75]
  switch ValorIncidencia
      case 25
          grafico = 'x';
          % Cuando vayamos a hacer los gráficos con el valor de incidencia
          % < que 50, lo mostraremos con una x
      case 50
          grafico = '.';
      case 75
          grafico = 'o';
  end

  simularHito2(incrementoTiempo, n, ValorIncidencia, Ps, Pe, grafico)
end

%% Tercer Apartado

% lo inicializamos de nuevo porque ha sido alterado en el apartado 2
ValorIncidencia = 50;

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
    simularHito2(incrementoTiempo, n, ValorIncidencia, Ps - Pe, Pe, grafico)
end