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
  end;

  {
    Escribi este metodo
    Anda 11 point
  }


  Function Lista.eliminar(p:PosicionLista) : Errores;
    Procedure correrListado(); //(p:posicionLista;f:integer);
    //var
      //i: posicionLista;
    begin
      //for i := p to f do
      //begin
      //  elementos[i]:= elementos[p+1];
      //  p:=p+1;
      //end;
      writeln(p);
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
        correrListado();
        //elementos[p]:=NULO;
        Qitems:=Qitems-1;
      end;
  end;
end.
