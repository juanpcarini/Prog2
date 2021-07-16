unit ListaTADPuntero;

interface
uses
  Tipos,system.sysutils;

const
  MIN=0;
  MAX=10;
  NULO=nil;

type
  PosicionLista = ^NodoLista;
  NodoLista = object
    datos: TipoElemento;
    anterior:PosicionLista;
    siguiente: PosicionLista;
  end;
  lista = object


 private
    inicio: PosicionLista;
    final: PosicionLista;
    Qitems: integer;
//    elementos : array [MIN..MAX] of TipoElemento;
  //  Function validar(x:TipoElemento;min,max:integer):boolean;
  public

    Procedure crear();
    Function esVacia():boolean;
    Function esLlena():boolean;
    Function agregar(x:TipoElemento) : Errores;
    Function eliminar(p:PosicionLista) : Errores;
    Function siguiente(p:PosicionLista) : PosicionLista;
    Function anterior(p:PosicionLista) : PosicionLista;
    Function comienzo():PosicionLista;
    Function fin():PosicionLista;
{    Function retornarString():String;
            Function actualizar(x:TipoElemento;p:PosicionLista): Errores;
                Function insertar(x:TipoElemento;p:PosicionLista):Errores;
                    Function comienzo():PosicionLista;
                        Function fin():PosicionLista;
                            Function cantidadElementos():longInt;
                                Function llenarRandom(rangoHasta:longInt): Errores;
                                //    Function buscar(x:TipoElemento;ComparaPor:CampoComparar):Errores;
                                    Function ordinal(PLogica:integer):PosicionLista;
                                        Function validarPosicion(p:PosicionLista):boolean;}
  end;

implementation

Procedure lista.crear();
begin
  Qitems:=0;
  inicio:=nil;
  final:=nil;
end;

Function lista.esVacia():boolean;
begin
  esVacia:= (Qitems = 0) and (inicio = nil);
end;

Function lista.esLlena;
begin
  esLlena:= (Qitems=MAX);
end;

Function lista.agregar(x:TipoElemento): Errores;
var
  resultado:Errores;
  PL:PosicionLista;
begin
  if lista.esLlena then
    resultado:=CError
  else
  begin
    if lista.esVacia then
    begin
    
    end;
    new(PL);
    PL^.datos(x);
    PL^.anterior(final);
    PL^.siguiente(nil);
    final^.siguiente(PL);
    final:=PL;
    Qitems:=Qitems+1;
    resultado:=OK
  end;
  agregar:=resultado;
end;

Function lista.eliminar(p: PosicionLista):Errores;
var
  resultado:Errores;
  elementoAnt,elementoSig:PosicionLista;
begin
  resultado:=CError;
  if lista.esVacia then
    resultado:=Vacia
  else
  begin
    new(elementoAnt);
    new(elementoSig);
    elementoAnt:=p^.anterior;
    elementoSig:=p^.siguiente;

    elementoAnt^.siguiente:=elementoSig;
    elementoSig^.anterior:=elementoAnt;
    resultado:=OK;
  end;
  eliminar:=resultado;
  end;

Function lista.siguiente(p: PosicionLista):PosicionLista;
begin
  if lista.esVacia then
    siguiente:=NULO
  else
  begin
      siguiente:=p^.siguiente;
  end;
end;
                                            //En caso de que nos pidan el anterior del primero, deberia devolver NULO , pero si esta vacia tambien retorna NULO?
                                            //de igual forma que si fuera el siguiente del ultimo, deberia retornar NULO,pero si esta vacia y no hay elementos es NULO tambien ??
                                            
Function lista.anterior(p: PosicionLista):PosicionLista;
begin
  if lista.esVacia then
    anterior:=NULO
  else
  begin
      anterior:=p^.anterior;
  end;
end;

Function lista.comienzo():PosicionLista;
begin
  if lista.esVacia then
    comienzo:=NULO
  else
    comienzo:=inicio;
end;

Function lista.fin():PosicionLista;
begin
  if lista.esVacia then
    fin:=NULO
  else
    fin:=final;  
end;
begin

end;
end.
