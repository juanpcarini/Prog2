program Project1;

uses
  System.SysUtils,
  //Unit1 in 'Unit1.pas',
  ListaTAD in 'ListaTAD.pas',
  Tipos;

var
  lista:ListaTAD.Lista;
  E,valor:TipoElemento;
  EMsg:Errores;
  i:integer;
  vacio,lleno:boolean;
begin
  i:=0;
  valor.DI:=2;
  E.Inicializar;
  lista.crear();
  for i := 1 to 5 do
  begin
    E.DI := 123 + i;
    EMsg := lista.agregar(E);
  end;

  if lista.esVacia then
    writeln('esta vacia')
  else
    writeln('no esta vacia');

  if lista.esLlena then
    writeln('esta llena')
  else
    writeln('no esta llena');


  lista.actualizar(valor,2);
  //lista.eliminar(3);
  lista.insertar(valor,2);
  writeln(lista.siguiente(3));
  writeln(lista.anterior(3));
  readln;
end.
