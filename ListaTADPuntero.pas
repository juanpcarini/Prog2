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
    Function insertar(x:TipoElemento;p:PosicionLista):Errores;
    Function llenarRandom(rangoHasta:longInt): Errores;
    Function cantidadElementos():longInt;
    Function actualizar(x:TipoElemento;p:PosicionLista): Errores;
    Function validarPosicion(p:PosicionLista):boolean;
    Function ordinal(PLogica:integer):PosicionLista;
{    Function retornarString():String;
                        
                            
                                
                                //    Function buscar(x:TipoElemento;ComparaPor:CampoComparar):Errores;
                                    
                                        }
  end;

implementation

Function lista.validarPosicion(p:PosicionLista):boolean;
var
  flag:boolean;
  x:PosicionLista;
begin
  x:=inicio;
  if lista.esVacia then
    flag:=false
  else
  begin
    while (flag = false) and (x <> nulo) do
    begin
      if x = p then
        flag:= true
      else
        x:=x^.siguiente;
    end;
    validarPosicion:=flag;
  end;
  
end;

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
      new(PL);
      PL^.datos:=x;      
      PL^.anterior=nulo;
      PL^.siguiente=nulo;
      inicio:=PL;
      final:=PL;
      Qitems:=Qitems+1;
      resultado:=OK;      
    end
    else
    begin
      new(PL);
      PL^.datos:=x;
      PL^.anterior:=final;
      PL^.siguiente:=nil;
      final^.siguiente:=PL;
      final:=PL;
      Qitems:=Qitems+1;
      resultado:=OK;
    end;
    
  end;
  agregar:=resultado;
end;

Function lista.eliminar(p: PosicionLista):Errores;
var
  resultado:Errores;
  elementoAnt,elementoSig:PosicionLista;
begin
   resultado:=CError;
  if lista.validarPosicion(p) then
  begin
    if p = inicio then
    begin
      elementoSig:=p^.siguiente;
      elementoSig^.anterior:=NULO;
      inicio:=elementoSig;
      Qitems:=Qitems-1;
      resultado:=OK;
    end;
      
    if p = final then
    begin
      elementoAnt:=p^.anterior;
      elementoAnt^.siguiente:=NULO;
      final:=elementoAnt;
      Qitems:=Qitems-1;
      resultado:=OK;      
    end;
      

    if (p <>inicio) and (p<> final) then
    begin
      elementoAnt:=p^.anterior;
      elementoSig:=p^.siguiente;

      elementoAnt^.siguiente:=elementoSig;
      elementoSig^.anterior:=elementoAnt;
      Qitems:=Qitems-1;
      resultado:=OK;
    end;
    
  end
  else
    resultado:=PosicionInvalida;
  eliminar:=resultado;
end;


Function lista.siguiente(p: PosicionLista):PosicionLista;
begin
  if lista.validarPosicion(p^.siguiente) then
    siguiente:=p^.siguiente
  else
    siguiente:=NULO;
end;
                                      //En caso de que nos pidan el anterior del primero, deberia devolver NULO , pero si esta vacia tambien retorna NULO?
                                            //de igual forma que si fuera el siguiente del ultimo, deberia retornar NULO,pero si esta vacia y no hay elementos es NULO tambien ??
                                            
Function lista.anterior(p: PosicionLista):PosicionLista;
begin
  if lista.validarPosicion(p^.anterior) then
    anterior:=p^.anterior
  else
    anterior:=NULO;
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
Function lista.insertar(x:TipoElemento;p:PosicionLista):Errores;
  Function enlazarInsercion():Errores;
  var
    resultado:Errores;
    nuevo,anterior:PosicionLista;
  begin
    resultado:=CError;
    if lista.esLlena then
      resultado:=LLena
    else
    begin
      if lista.validarPosicion then
      begin
        new(nuevo);
        nuevo^.datos:=x;
        if (Qitems = 1) then
        begin
          nuevo^.anterior:=p^.anterior;
          p^.anterior:=nuevo;
          nuevo^.siguiente:=p;
          Qitems:=Qitems+1;    
          resultado:=OK;
        end
        else
        begin
          anterior:=p^.anterior;
          anterior^.siguiente:=nuevo;
          nuevo^.anterior:=anterior;
          nuevo^.siguiente:=p;
          p^.anterior:=nuevo;      
          Qitems:=Qitems+1;
          resultado:=OK;
        end;
      end
      else
        resultado:=CError;
      
    end;
    enlazarInsercion:=resultado;
  end;
begin
  insertar:=enlazarInsercion();
end;

Function lista.llenarRandom(rangoHasta:longInt): Errores;
var
  resultado:Errores;
  x:TipoElemento;
  elemento,elementoSig:PosicionLista;
begin
  resultado:=CError;
  if lista.esVacia then
    resultado:=Vacia
  else
  begin
    new(elemento);
    new(elementoSig);
    elemento:=inicio;
    while elemento <= final do
    begin
      x.DI:=random(rangoHasta);
      elemento^.datos:=x;
      elementoSig:=elemento^.siguiente;
      elemento:= elementoSig;
    end;
  end;
end;

Function lista.cantidadElementos():longInt;
begin
  cantidadElementos:=Qitems;
end;

Function lista.actualizar(x:TipoElemento;p:PosicionLista): Errores;
var
  resultado:Errores;
begin
  if lista.validarPosicion(p) then
  begin
    p^.datos:=x;
    resultado:=OK;
  end
  else
    resultado:=CError;
  actualizar:= resultado;
end;

Function lista.ordinal(PLogica:integer):PosicionLista;
begin
  if lista.validarPosicion(PLogica) then
    ordinal:=PLogica
  else
    ordinal:=NULO;
  
end;
end.
