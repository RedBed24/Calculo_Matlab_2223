% Hito 1
%Apartado 1:Tomando las constantes ∆t = 0.1s., N∗ = 0.25 litros y k = 0.1 simular el sistema durante 25s.
%Representar gráficamente la evoluci´on del flujo y del nivel respecto al tiempo.

%Apartado 2:¿Qué cantidad de agua contiene el vaso a los 10s y a los 20s.? ¿En que instante el flujo del
%grifo empieza a ser menor que 0.01 litros/s.?

%Apartado 1
inct = 0.1;
k = 0.1;
Ndes = 0.25;
N=0;

nseg=25;
s=1;
f=-1;
hold on;
for t = 0:inct:nseg
    plot(t, N, '.', 'Color', 'b');

    D = Ndes - N; %Cantidad de agua que falta

    F = k * D; %Flujo de agua
    plot(t, F, '.', 'Color', 'g');

    if t == 10
        i = N; %Apartado 2(10s)
        disp('Cantidad a los 10s: ' + i);
        plot(t, N, 'o', 'Color', 'k');
    elseif t == 20
        j = N; %Apartado 2(20s)
        plot(t, N, 'o', 'Color', 'k');
    end

    N = N + F * inct; %Cantidad de agua en el vaso
     
    if F <= 0.01 && f<0
        f = t; %Apartado 2 (flujo)
        plot(t, F, 'o', 'Color', 'k');
    end
end
hold off;

%%%%%%%%
%Apartado 2:¿Qué cantidad de agua contiene el vaso a los 10s y a los 20s.? ¿En que instante el flujo del
%grifo empieza a ser menor que 0.01 litros/s.?

display("Cantidad a los 10s: " + i);

display("Cantidad a los 20s: " + j);

display("Instante flujo menor que 0.01 L/s: " + f);

title ('Llenado del vaso');
xlabel('Tiempo(s)');
ylabel('Agua(L)');
