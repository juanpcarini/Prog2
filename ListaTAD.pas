unit ListaTAD;

interface
uses
    Tipos,system.sysutils;

const
    MIN= 1;
    MAX= 10;
    NULO = 0;
type
  PosicionLista = LongInt;
  Lista = object

  private
    inicio: PosicionLista;
    final: PosicionLista;
    Qitems: integer;
    elementos : array [MIN..MAX] of TipoElemento;
  public

    Procedure crear();
    Function esVacia():boolean;
    Function esLlena():boolean;
    Function agregar(x:TipoElemento) : Errores;
    Function retornarString():String;
    Function eliminar(p:PosicionLista) : Errores;
    Function siguiente(p:PosicionLista) : PosicionLista;
    Function anterior(p:PosicionLista) : PosicionLista;
    Function actualizar(x:TipoElemento;p:PosicionLista): Errores;
    Function insertar(x:TipoElemento;p:PosicionLista):Errores;
    Function comienzo():PosicionLista;
    Function fin():PosicionLista;
    Function cantidadElementos():longInt;
    Function llenarRandom(rangoHasta:longInt): Errores;
//    Function buscar(x:TipoElemento;ComparaPor:CampoComparar):Errores;
    Function ordinal(PLogica:integer):PosicionLista;
    Function validarPosicion(p:PosicionLista):boolean;

  end;
implementation

   Function lista.validarPosicion(p: PosicionLista):boolean;
  begin
      if lista.esVacia then
        validarPosicion:=false
      else
      validarPosicion:= (p>=inicio) and (p<=final);
  end;

  Procedure Lista.crear;
  begin
    Qitems:= 0;
    inicio := NULO;
    final := NULO;
  end;

  Function Lista.esVacia():boolean;
  begin
    esVacia:= Qitems = 0;
  end;

  Function Lista.esLlena():boolean;
  begin
      esLlena := Qitems = MAX;
  end;

  Function Lista.agregar(x:TipoElemento) : Errores;
  var
    resultado: Errores;
  begin
    resultado:= CError;
    if Lista.esLlena then
      resultado := LLena
    else
    begin
      final:= final +1;
      elementos[final]:=x;
      if Lista.esVacia then
        inicio:= final;
      Qitems:= Qitems+1;
      resultado:= OK;
   end;
    agregar:=resultado;
  end;


  Function Lista.eliminar(p:PosicionLista) : Errores;
    Procedure correrListado(); //(p:posicionLista;f:integer);
    var
      i: posicionLista;
    begin
      for i := p to final-1 do
      begin
        elementos[i]:= elementos[i+1];
      end;

    end;

  var
    resultado: Errores;
  begin
    resultado:= CError;
    if not lista.validarPosicion(p) then
      resultado:= PosicionInvalida
    else
      begin
        if Qitems = 1 then
        begin
          Lista.crear();
          resultado:= OK;
        end
        else
        begin
          correrListado();
          final := final - 1;
          Qitems:=Qitems-1;
          resultado:= OK;
        end;
      end;
    eliminar:=resultado;
  end;

  Function Lista.siguiente(p:PosicionLista): PosicionLista;
  begin
      if Lista.validarPosicion(p+1) then
        siguiente:= p+1
      else
        siguiente:=NULO;


  end;

  Function Lista.anterior(p:PosicionLista):PosicionLista;
  begin

      if Lista.validarPosicion(p-1) then
        anterior:= p-1
      else
        anterior:=NULO;

  end;

  Function Lista.actualizar(x: TipoElemento; p: PosicionLista):Errores;
  var
    resultado: Errores;
  begin
    resultado := CError;

    if lista.validarPosicion(p) then
    begin
      elementos[p]:=x;
      resultado:= OK;
    end
    else
    resultado:=PosicionInvalida;

    actualizar:=resultado;
  end;
    //para insertar deberia hacer otro validar posicion ya que si tengo que insertar un elemento en el array vacio me da false y si fuera mal la posicion tambien me daria false, por lo tanto no puedo comprobar cuando es vacia y cuando mal
  Function lista.insertar(x: TipoElemento; p:PosicionLista):Errores;
  var
    resultado: Errores;


    Function correrListado():Errores;
    var
    resultado: Errores;
    i:PosicionLista;
    begin
      i:=final;

      while i>=(p) do
      begin
        elementos[i+1]:=elementos[i];
        i:= i-1;
      end;
      elementos[p]:=x;
      final:=final+1;
      correrListado:=OK;

      end;

  begin
    resultado:=CError;
    if lista.validarPosicion(p) then
    begin
      if lista.esLlena then
      resultado:=Llena
      else
      begin
         if Lista.esVacia then
        begin
          elementos[p]:=x;
          inicio:=p;
          final:=p;
          resultado:=OK;
        end
        else
          resultado:=correrListado();

        Qitems:=Qitems+1;
      end;

    end
    else
      resultado;

    insertar:=resultado;
  end;



  Function Lista.comienzo():PosicionLista;
  begin
    comienzo:=inicio;
  end;

  Function Lista.fin():PosicionLista;
  begin
    fin:=final;
  end;

  Function Lista.cantidadElementos():longInt;
  begin
    cantidadElementos:=Qitems;
  end;

  Function lista.llenarRandom(rangoHasta: LongInt):Errores;
  var
    resultado:Errores;
    i:integer;
  begin
    resultado:=CError;
    if not lista.esVacia then
      resultado:=CError
    else
    begin
      for i:=1 to MAX do
      begin
        elementos[i].DI:=random(rangoHasta);
        final:= i;
        Qitems:=Qitems+1;
      end;
      inicio:=MIN;
//      final:=MAX;                //SI YO LLENO LA LISTA FINAL DEBERIA SER IGUAL A MAX CONSIDERANDO QUE LA LISTA ESTA VACIA AL IGUAL Qitems
        {  Qitems:=final;}
      resultado:= OK;
    end;
    llenarRandom:=resultado;
  end;



  Function lista.ordinal(PLogica: Integer):PosicionLista;
  begin
    if lista.validarPosicion(PLogica) then
      ordinal:=PLogica;
  end;


{     Function buscar(x:TipoElemento;ComparaPor:CampoComparar):Errores;
 Function lista.buscar(x: TipoElemento; ComparaPor: CampoComparar):PosicionLista;
   Function devolverResultado():Comparacion;
     var
         i:integer;
             resultado: Comparacion;
               begin
                 for i := inicio to final do
                   begin
                       if elementos[i] = x then
                             resultado:=elementos[i].CompararTE(x,ComparaPor);

                               end;
                                  end;
{                                  }
 {begin

   end;}

  Function Lista.retornarString():String;
  var
    i:integer;
    elementosString: string;
  begin
    if not lista.esVacia then
    begin
      for i := inicio to final do
        elementosString:= elementosString+ elementos[i].ArmarString +',';
    end;
  retornarString:= elementosString;
  end;
end.
