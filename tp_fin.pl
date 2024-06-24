
%  CONCEPTOS Y PARADIGMAS DE LENGUAJES
%        TRABAJO PRACTICO FINAL

% *** Fabrica de cerveza artesanal "CharlesBeer" ***


% Directiva para declarar los predicados dinamicos
:- dynamic venta/4.
:- dynamic stock/2.



% Definicion de la estructura de datos para las cervezas:
% Cada cerveza se representa como un termino con los siguientes
% atributos: - nombre: Nombre de la cerveza (cadena de texto) -
% ingredientes: Lista de ingredientes, cada uno representado como un
% termino con dos campos: - nombre: Nombre del ingrediente (cadena de
% texto) - cantidad: Cantidad del ingrediente (numero entero) -
% precio: Precio de venta de la cerveza (numero en punto flotante)
cerveza(ipa, [agua(500), malta(200), lupulo(50), levadura(10), azucar(5)], 3000.00).
cerveza(neipa, [agua(500), malta(190), lupulo(55), levadura(9), azucar(3)], 3500.00).
cerveza(stout, [agua(500), malta(250), lupulo(30), levadura(10), azucar(10)], 4000.00).
cerveza(ale, [agua(500), malta(200), lupulo(40), levadura(9), azucar(8)], 3500.00).
cerveza(lager, [agua(500), malta(200), lupulo(35), levadura(10), azucar(6)], 3000.00).
cerveza(pilsner, [agua(500), malta(180), lupulo(40), levadura(10), azucar(7)], 3500.00).
cerveza(porter, [agua(500), malta(240), lupulo(25), levadura(8), azucar(9)], 4000.00).
cerveza(golden, [agua(500), malta(200), lupulo(30), levadura(10), azucar(10)], 3000.00).
cerveza(scotch, [agua(500), malta(200), lupulo(40), levadura(9), azucar(12)], 3500.00).
cerveza(barleywine, [agua(500), malta(300), lupulo(50), levadura(10), azucar(20)], 5000.00).



%Definicion de la estructura de datos para el stock:
% Cada elemento del stock se representa como un termino con dos
% atributos: - nombre: Nombre de la cerveza (cadena de texto) -
% cantidad: Cantidad disponible en stock (numero entero)
stock(ipa, 100).
stock(neipa, 50).
stock(stout, 80).
stock(ale, 90).
stock(lager, 120).
stock(pilsner, 110).
stock(porter, 70).
stock(golden, 85).
stock(scotch, 60).
stock(barleywine, 50).



% Definicion de la estructura de datos para los clientes:
% Cada cliente se representa como un termino con los siguientes
% atributos: - id: Identificador unico del cliente (numero entero) -
% nombre: Nombre del cliente (cadena de texto) - direccion: Direccion
% del cliente (cadena de texto) - telefono: Numero de telefono del
% cliente (numero entero)
cliente(1, 'Matias Ancona', '29 de septiembre 123', 1164943764).
cliente(2, 'Facundo Ibarra', 'Alsina 8798', 1198765432).
cliente(3, 'Luis Plomer', 'Malabia 456', 1178951233).
cliente(4, 'Ana Garro', 'Calle 6 12', 1146857512).
cliente(5, 'Pedro Pedro', 'Camino Negro 789', 1147894232).



% % Definicion de la estructura de datos para venta:
% Cada venta se representa como un termino con los siguientes atributos:
% - fecha: Fecha en que se realizo la venta (date)
% - id_cliente: ID del cliente (numero entero)
% - cerveza: Nombre de la cerveza (cadena de texto)
% - cantidad: Numero de la cantidad de cervezas (numero entero)
venta('2024-06-01', 1, ipa, 5).
venta('2024-06-02', 2, stout, 3).
venta('2024-06-03', 3, ale, 4).
venta('2024-06-04', 1, lager, 6).
venta('2024-06-05', 5, pilsner, 7).
venta('2024-06-06', 1, porter, 2).
venta('2024-06-07', 2, golden, 8).
venta('2024-06-08', 3, scotch, 3).
venta('2024-06-09', 4, neipa, 5).
venta('2024-06-10', 1, barleywine, 1).
venta('2024-06-11', 1, ipa, 11).
venta('2024-06-12', 2, stout, 1).
venta('2024-06-33', 3, ale, 4).
venta('2024-06-14', 4, lager, 6).
venta('2024-06-15', 5, pilsner, 2).
venta('2024-06-26', 1, porter, 2).
venta('2024-06-27', 2, golden, 2).
venta('2024-06-28', 3, scotch, 3).
venta('2024-06-19', 4, neipa, 4).
venta('2024-06-20', 1, barleywine, 6).





% Consultas
%
% +: Indica que el argumento es de entrada y debe estar instanciado.
% -: Indica que el argumento es de salida y no necesita estar
% instanciado cuando se llama al predicado.



% - Lista de clientes
% lista_clientes(-Lista)
% Devuelve una lista con todos los clientes en el formato (ID, Nombre, Direccion, Telefono).
lista_clientes(Lista) :- findall((ID, Nombre, Direccion, Telefono), cliente(ID, Nombre, Direccion, Telefono), Lista).

% Listar todos los clientes
% listar_clientes/0 (/0 porq este predicado no toma ningun argumento y
% se usa para imprimir todos los clientes en la consola.).
listar_clientes :-
    lista_clientes(Clientes),
    maplist(writeln, Clientes).


% - Lista de cervezas (Producto)
% lista_cervezas(-Lista)
% Devuelve una lista con todas las cervezas en el formato (Cerveza, Precio).
lista_cervezas(Lista) :- findall((Cerveza, Precio), cerveza(Cerveza, _, Precio), Lista).

% Listar todas las cervezas
% listar_cervezas/0
% Imprime en la consola todas las cervezas con sus precios.
listar_cervezas :-
    lista_cervezas(Cervezas),
    maplist(writeln, Cervezas).



% - Lista de ventas
% lista_ventas(-Lista)
% Devuelve una lista con todas las ventas en el formato (Fecha, ID_Cliente, Cerveza, Cantidad).
lista_ventas(Lista) :- findall((Fecha, ID_Cliente, Cerveza, Cantidad), venta(Fecha, ID_Cliente, Cerveza, Cantidad), Lista).

% Listar todas las ventas
% listar_ventas/0
% Imprime en la consola todas las ventas.
listar_ventas :-
    lista_ventas(Ventas),
    maplist(writeln, Ventas).



% - Lista de stock
% lista_stock(-Lista)
% Devuelve una lista con el stock de todas las cervezas en el formato (Cerveza, Cantidad).
lista_stock(Lista) :- findall((Cerveza, Cantidad), stock(Cerveza, Cantidad), Lista).

% Listar el stock
% listar_stock/0
% Imprime en la consola el stock de todas las cervezas.
listar_stock :-
    lista_stock(Stock),
    maplist(writeln, Stock).



% - Compras de un cliente especifico
% compras_cliente(+ID_Cliente, -Lista)
% Devuelve una lista con todas las compras de un cliente en el formato (Fecha, Cerveza, Cantidad).
compras_cliente(ID_Cliente, Lista) :- findall((Fecha, Cerveza, Cantidad), venta(Fecha, ID_Cliente, Cerveza, Cantidad), Lista).

% Listar todas las compras de un cliente especifico
% listar_compras_cliente(+ID_Cliente)
% Imprime en la consola todas las compras de un cliente.
listar_compras_cliente(ID_Cliente, Nombre) :-
    cliente(ID_Cliente, Nombre, _, _),
    compras_cliente(ID_Cliente, Compras),
    maplist(writeln, Compras).




% - Ventas de una cerveza especifica
% ventas_cerveza(+Cerveza, -Lista)
% Devuelve una lista con todas las ventas de una cerveza en el formato (Fecha, ID_Cliente, Cantidad).
ventas_cerveza(Cerveza, Lista) :- findall((Fecha, ID_Cliente, Cantidad), venta(Fecha, ID_Cliente, Cerveza, Cantidad), Lista).

% Listar todas las ventas de una cerveza especifica
% listar_ventas_cerveza(+Cerveza)
% Imprime en la consola todas las ventas de una cerveza.
listar_ventas_cerveza(Cerveza) :-
    ventas_cerveza(Cerveza, Ventas),
    maplist(writeln, Ventas).



% - Ventas entre dos fechas
% ventas_entre_fechas(+FechaInicio, +FechaFin, -Lista)
% Devuelve una lista con todas las ventas entre dos fechas en el formato
% (Fecha, ID_Cliente, Cerveza, Cantidad).
ventas_entre_fechas(FechaInicio, FechaFin, Lista) :-
    findall((Fecha, ID_Cliente, Cerveza, Cantidad),
        (venta(Fecha, ID_Cliente, Cerveza, Cantidad),
         Fecha @>= FechaInicio, Fecha @=< FechaFin),
         Lista).

% Listar todas las ventas entre dos fechas
% listar_ventas_entre_fechas(+FechaInicio, +FechaFin)
% Imprime en la consola todas las ventas entre dos fechas.
listar_ventas_entre_fechas(FechaInicio, FechaFin) :-
    ventas_entre_fechas(FechaInicio, FechaFin, Ventas),
    maplist(writeln, Ventas).



% - Cliente con mas compras (cantidad de compras realizadas)
% cliente_mas_compras
% Devuelve el nombre del cliente con mas compras y la cantidad de
% compras realizadas.
cliente_mas_compras :-
    findall(ID_Cliente, venta(_, ID_Cliente, _, _), Lista),
    msort(Lista, Ordenada),
    sort(Ordenada, ClientesUnicos),
    maplist(count_ocurrences(Ordenada), ClientesUnicos, Cantidades),
    max_member(MaxCompras, Cantidades),
    nth1(Index, Cantidades, MaxCompras),
    nth1(Index, ClientesUnicos, ID_Cliente),
    cliente(ID_Cliente, Nombre, _, _),
    format('Cliente con mas compras: ~w~nCantidad de compras: ~w~n', [Nombre, MaxCompras]),
    !.% Cut operator para evitar que Prolog busque más soluciones

% Predicado para contar las ocurrencias de un cliente en una lista
count_ocurrences(Lista, Cliente, Count) :-
    include(=(Cliente), Lista, Filtered),
    length(Filtered, Count).




% - Cliente con la compra mayor (monto)
% cliente_compra_mayor(-Nombre, -MaxMonto)
% Devuelve el nombre del cliente con la compra mayor y el monto de esa compra.
cliente_compra_mayor(Nombre, MaxMonto) :-
    findall(Monto-ClienteID,
        (venta(_, ClienteID, Cerveza, Cantidad),
         cerveza(Cerveza, _, Precio),
         Monto is Precio * Cantidad),
         Lista),
    max_member(MaxMonto-ClienteID, Lista),
    cliente(ClienteID, Nombre, _, _).

% Predicado para imprimir el cliente con la compra mayor y el monto
cliente_compra_mayor :-
    cliente_compra_mayor(Nombre, MaxMonto),
    write('Cliente con la mayor compra: '), writeln(Nombre),
    write('Monto de la mayor compra: '), writeln(MaxMonto).




% - Ventas con montos mayores y menores determinados

% Ventas con montos MAYORES a un valor determinado
% ventas_monto_mayor(+MontoMin, -Lista)
% Devuelve una lista con todas las ventas con montos mayores o iguales
% a un valor determinado en el formato (Fecha, ID_Cliente, Cerveza,
% Cantidad).
ventas_monto_mayor(MontoMin, Lista) :-
    findall((Fecha, ID_Cliente, Cerveza, Cantidad),
        (venta(Fecha, ID_Cliente, Cerveza, Cantidad),
         cerveza(Cerveza, _, Precio),
         Monto is Precio * Cantidad,
         Monto >= MontoMin),
         Lista).

% Ventas con montos MENORES a un valor determinado
% ventas_monto_menor(+MontoMax, -Lista)
% Devuelve una lista con todas las ventas con montos menores o iguales a un valor determinado en el formato (Fecha, ID_Cliente, Cerveza, Cantidad).
ventas_monto_menor(MontoMax, Lista) :-
    findall((Fecha, ID_Cliente, Cerveza, Cantidad),
        (venta(Fecha, ID_Cliente, Cerveza, Cantidad),
         cerveza(Cerveza, _, Precio),
         Monto is Precio * Cantidad,
         Monto =< MontoMax),
         Lista).



% - Listar cada producto y los componentes necesarios para elaborarlo
% lista_cervezas_ingredientes(-Lista)
% Devuelve una lista con todas las cervezas y sus ingredientes en el formato (Cerveza, Ingredientes).
lista_cervezas_ingredientes(Lista) :-
    findall((Cerveza, Ingredientes), cerveza(Cerveza, Ingredientes, _), Lista).

% Listar todas las cervezas y sus ingredientes
% listar_cervezas_ingredientes/0
% Imprime en la consola todas las cervezas y sus ingredientes.
listar_cervezas_ingredientes :-
    lista_cervezas_ingredientes(CervezasIngredientes),
    maplist(writeln, CervezasIngredientes).



% ingredientes_cerveza(+Cerveza, -Ingredientes)
% Devuelve los ingredientes de una cerveza específica.
ingr_cerveza(Cerveza, Ingredientes) :-
    cerveza(Cerveza, Ingredientes, _).

% listar_ingredientes_cerveza(+Cerveza)
% Imprime en la consola los ingredientes de la cerveza especificada, uno por línea.
ingredientes_cerveza(Cerveza) :-
    ingr_cerveza(Cerveza, Ingredientes),
    format('Ingredientes de ~w:~n', [Cerveza]),
    maplist(writeln, Ingredientes).






% - Tambien todas las consultas que se puedan obtener de las relaciones
% realizadas.

% Regla para actualizar el stock tras una venta
% actualizar_stock(+Cerveza, +CantidadVendida)
% Actualiza el stock de una cerveza restando la cantidad vendida.
actualizar_stock(Cerveza, CantidadVendida) :-
    stock(Cerveza, CantidadActual),
    CantidadActual >= CantidadVendida,  % Verificar que haya suficiente stock
    NuevaCantidad is CantidadActual - CantidadVendida,
    retract(stock(Cerveza, CantidadActual)),
    assert(stock(Cerveza, NuevaCantidad)).




% Ejemplo de una venta
% nueva_venta(+Fecha, +ID_Cliente, +Cerveza, +Cantidad)
% Registra una nueva venta y actualiza el stock de la cerveza vendida.
nueva_venta(Fecha, ID_Cliente, Cerveza, Cantidad) :-
    actualizar_stock(Cerveza, Cantidad),  % Actualizar stock despues de verificar que hay suficiente
    assert(venta(Fecha, ID_Cliente, Cerveza, Cantidad)).




% Puede vender: Verificar si hay suficiente stock antes de realizar la venta
% puede_vender(+Fecha, +ID_Cliente, +Cerveza, +Cantidad)
% Verifica si hay suficiente stock para vender la cantidad deseada de
% una cerveza especifica.
puede_vender(Fecha, ID_Cliente, Cerveza, CantidadVenta) :-
    stock(Cerveza, CantidadActual),
    CantidadActual >= CantidadVenta,
    nueva_venta(Fecha, ID_Cliente, Cerveza, CantidadVenta).




% Realizar venta: Verificar stock y realizar la venta si es posible
% realizar_venta(+Fecha, +ID_Cliente, +Cerveza, +Cantidad)
% Verifica si se puede realizar una venta y lo hace si hay suficiente stock.
realizar_venta(Fecha, ID_Cliente, Cerveza, Cantidad) :-
    (   puede_vender(Fecha, ID_Cliente, Cerveza, Cantidad)
    ->  write('Venta realizada con exito.')
    ;   write('No hay suficiente stock para '), write(Cerveza), write('.'), nl
    ).








