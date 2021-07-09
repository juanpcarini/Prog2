program Project1;

uses
  System.SysUtils,
  //Unit1 in 'Unit1.pas',
  ListaTAD in 'ListaTAD.pas',
  Tipos;

var
  lista:ListaTAD.Lista;
  E:TipoElemento;
  EMsg:Errores;

begin
  E.TipoDatoClave('a');
  lista.crear();
  //writeln(lista.esVacia());
  EMsg := lista.agregar(E);
  if EMsg = Errores.OK then
    writeln('Se agrego un elemento a la lista')
  else
    writeln('Algo no funco bro');
  lista.eliminar(1);
  readln;
end.
