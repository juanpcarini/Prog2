program Project1;

uses
  System.SysUtils,
  ListaTAD in 'ListaTAD.pas',
  Tipos;
 // ListaTADPuntero in 'ListaTADPuntero.pas';

var
 // lista:ListaTADPuntero.Lista;
  lista:ListaTAD.Lista;
  E,valor,valor1:TipoElemento;
  EMsg:Errores;
  p:PosicionLista;
  i:integer;
  vacio,lleno:boolean;
begin
  i:=0;
  valor.DI:=2;
  valor1.DI:=4;
  E.Inicializar;
  lista.crear();
  for i := 1 to 5 do
   begin
       E.DI := 123 + i;
           EMsg := lista.agregar(E);
             end;

  //lista.llenarRandom(30);
  if lista.esVacia then
      writeln('esta vacia')
        else
            writeln('no esta vacia');

              if lista.esLlena then
                  writeln('esta llena')
                    else
                        writeln('no esta llena');

                           writeln(lista.retornarString);

 // lista.agregar(valor);
  lista.insertar(valor1,1);
  lista.fin();

  {lista.actualizar(valor,2);
    //lista.eliminar(3);
      lista.insertar(valor,4);
         writeln(lista.siguiente(3));
           writeln(lista.anterior(3));}
  readln;
end.
