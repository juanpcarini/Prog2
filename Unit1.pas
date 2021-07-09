unit Unit1;



interface
uses
  System.SysUtils;

type
  Cliente = object


  private
  id: integer;
  Procedure setId(idRecibido:integer);


  public
  nombre :String;
  Procedure crear ();
  Function prueba(): Integer;
  Function getId (): integer;

  //Function getSaldo ():integer;
  end;

implementation
  Procedure Cliente.crear();
  begin
    setId(20);
  end;
  Function Cliente.prueba():integer;
    begin
      prueba:= 10;
    end;

  Procedure Cliente.setId(idRecibido:integer);
  begin
    id:= idRecibido;
  end;
  Function Cliente.getId:integer;
  begin
    getId:= id;
  end;
  {Function Cliente.getSaldo():integer;
  begin

  end;}
end.
