unit ListaCursor;

interface
uses
  Tipos,system.sysutils;

const
  MIN=0;
  MAX=10;
  NULO=0;

type
  PosicionLista=LongInt;
  NodoLista = object
    datos: TipoElemento;
    anterior:PosicionLista;
    siguiente: PosicionLista;
  end;

  Lista = object

  private
    inicio: PosicionLista;
    final: PosicionLista;
    libre : PosicionLista;
    Qitems: LongInt;
    cursor : array [MIN..MAX] of NodoLista;

  public
    Procedure crear();                                  //.
    Function esVacia():boolean;                           //.
    Function esLlena():boolean;                              //.
    Function agregar(x:TipoElemento) : Errores;              //.
    Function retornarString():String;
    Function eliminar(p:PosicionLista) : Errores;
    Function siguiente(p:PosicionLista) : PosicionLista;        //.
    Function anterior(p:PosicionLista) : PosicionLista;            //.
    Function actualizar(x:TipoElemento;p:PosicionLista): Errores;
    Function insertar(x:TipoElemento;p:PosicionLista):Errores;
    Function comienzo():PosicionLista;                                 //.
    Function fin():PosicionLista;                                         //.
    Function cantidadElementos():longInt;                                    //.
    Function llenarRandom(rangoHasta:longInt): Errores;
  //Function buscar(x:TipoElemento;ComparaPor:CampoComparar):Errores;
    Function ordinal(PLogica:integer):PosicionLista;
    Function validarPosicion(p:PosicionLista):boolean;
  end;
implementation

Function lista.validarPosicion(p:PosicionLista):boolean;
begin
  if lista.esVacia then
    validarPosicion:=false
  else
    begin
      validarPosicion:=(p>=inicio) and (p<=final);
    end;
end;


Procedure lista.crear();
var
  Q:PosicionLista;
begin
  for Q := MIN to MAX-1 do
    cursor[Q].siguiente:=Q+1;
  cursor[MAX].siguiente:=NULO;
  Qitems:=0;
  inicio:=NULO;
  final:=NULO;
  libre:=MIN;

end;

Function lista.esVacia():boolean;
begin
  esVacia:=(Qitems=0) and (inicio = NULO) and (final = NULO);
end;

Function lista.esLlena():boolean;
begin
  esLlena:=(Qitems= MAX) and (libre=NULO);
end;

Function lista.siguiente(p:PosicionLista) : PosicionLista;
begin
  if lista.validarPosicion then
    siguiente:=cursor[p].siguiente
  else
    siguiente:=NULO;
end;

Function lista.anterior(p:PosicionLista) : PosicionLista;
begin
  if lista.validarPosicion then
    anterior:=cursor[p].anterior
  else
    anterior:=NULO;
end;

Function lista.agregar(x:TipoElemento) : Errores;
var
  resultado:Errores;
  nuevo:PosicionLista;
begin
  resultado:=CError;
  if lista.esLlena then
    resultado:=Llena
  else
  begin
    nuevo:=libre;
    libre:=cursor[libre].siguiente;
    cursor[libre].datos:= x;
    cursor[libre].siguiente:=NULO;
    cursor[libre].anterior:=final;
    if lista.esVacia then
      inicio:=nuevo
    else
      cursor[final].siguiente:=nuevo;
    final:=nuevo;
    Qitems:=Qitems+1;
    resultado:=OK;
  end;
  agregar:=resultado;
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

Function lista.cantidadElementos():longInt;
begin
    if lista.esVacia then
      cantidadElementos:=NULO
    else
      cantidadElementos:=Qitems;
end;



Function lista.eliminar(p:PosicionLista) : Errores;
var
  resultado:Errores;
  posicion,anterior,siguiente:PosicionLista;
begin
  resultado:=CError;
  if lista.validarPosicion(p) then
  begin
    if (Qitems = 0) and (p=inicio) and (p=final) then
    begin
        lista.crear();
    end;
    
    if p=inicio then
    begin
      siguiente:=cursor[p].siguiente;
      cursor[siguiente].anterior:=NULO;
      inicio:=siguiente;
    end;

    if p=final then
    begin
      anterior:=cursor[p].anterior;
      cursor[anterior].siguiente:=NULO;
      final:=anterior;
      Qitems:=Qitems-1;
      
    end;
    
    if (p>inicio) and (p<final) then
    begin
      anterior:=cursor[p].anterior;
      siguiente:=cursor[p].siguiente;
      cursor[anterior].siguiente:=siguiente;
      cursor[siguiente].anterior:=anterior;
      Qitems:=Qitems-1;
    end;
    //AGREGA UNA POSICION LIBRE PARA UTILIZAR
    posicion:=libre;
    libre:=p;
    cursor[libre].siguiente:=posicion;
    
    resultado:=OK;
  end
  else
    resultado:=PosicionInvalida;
    
  eliminar:=resultado;
  
end;

Function lista.llenarRandom(rangoHasta:longInt): Errores;
var
  resultado:Errores;
  x:TipoElemento;
begin
  resultado:=CError;
  randomize;
  if not lista.esVacia then
    resultado:=CError
  else
  begin
    while not lista.esLlena do
    begin
      x.DI:=random(rangoHasta);
      lista.agregar(x);
    end;
    resultado:=OK;
  end;
  llenarRandom:=resultado;
end;

Function lista.retornarString():String;
var
  x:PosicionLista;
  concatenado:string;
begin
  if not lista.esVacia then
  begin
    x:=inicio;
      while x<>NULO do
      begin
      concatenado:=concatenado + ','+ cursor[x].datos.ArmarString + ',';
      x:=cursor[x].siguiente;
      end;
    retornarString:=concatenado;
  end;
end;
end.
