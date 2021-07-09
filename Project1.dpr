program Project1;

uses
  System.SysUtils,
  //Unit1 in 'Unit1.pas',
  ListaTAD in 'ListaTAD.pas',
  Tipos;

var
  lista:ListaTAD.Lista;
  E:TipoElemento;

begin
  E.TipoDatoClave('a');
  lista.crear();
  //writeln(lista.esVacia());
  lista.agregar(E);
  lista.eliminar(1);
  readln;
end.
