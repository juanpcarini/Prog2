unit ListaTAD;

interface
uses
    Tipos,system.sysutils;

const
    MIN= 1;
    MAX= 100;
    NULO = 0;
type
  PosicionLista = LongInt;
  Lista = object

  private
    inicio: PosicionLista;
    final: PosicionLista;

    elementos : array [MIN..MAX] of TipoElemento;
  public
    Qitems: integer;
    Procedure crear();
    Function esVacia():boolean;
    Function esLlena():boolean;
    Function agregar(x:TipoElemento) : Errores;
//    Function retornarString():String;
    Function eliminar(p:PosicionLista) : Errores;
    Function siguiente(p:PosicionLista) : PosicionLista;
    Function anterior(p:PosicionLista) : PosicionLista;
    Function actualizar(x:TipoElemento;p:PosicionLista): Errores;
  end;
implementation

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
    if Lista.esVacia then
      resultado := Vacia;
    if (p<inicio) or (p>final) then
      resultado:= CError
    else
      begin
        if Qitems = 1 then
        begin
          correrListado();
          inicio:= NULO;
          final:=NULO;
          Qitems:= Qitems-1;
        end
        else
        begin
          correrListado();
          final := final - 1;
          Qitems:=Qitems-1;
        end;
      end;
  end;

  Function Lista.siguiente(p:PosicionLista): PosicionLista;
  begin
    siguiente:= p+1;
  end;

  Function Lista.anterior(p:PosicionLista):PosicionLista;
  begin
    anterior:= p-1;
  end;

  Function Lista.actualizar(x: TipoElemento; p: PosicionLista):Errores;
  var
    resultado: Errores;
  begin
    resultado := CError;
    if Lista.esVacia then
      resultado:= Vacia
    else
    begin
      if (p>MIN) and (p<MAX) then
      begin
         elementos[p]:=x;
         resultado:= OK;
      end
      else
        resultado:=PosicionInvalida;
    end;
    actualizar:=resultado;
  end;

end.
