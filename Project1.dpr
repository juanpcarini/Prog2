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
  i:integer;
begin
  i:=0;
  E.Inicializar;
  lista.crear();
  for i := 1 to 5 do
  begin
    E.DI := 123 + i;
    EMsg := lista.agregar(E);
  end;

  {writeln(lista.esVacia());
    if EMsg = Errores.OK then
        writeln('Se agrego un elemento a la lista')
          else
              writeln('Algo no funco bro');}
  lista.eliminar(3);
  readln;
end.
