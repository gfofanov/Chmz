unit Chmz_Utils;

interface

uses Variants, MSAccess, SysUtils, Forms;

function GetResultSql(Session : TMSConnection; const Sql : string) : Variant;
// ¬ыполн€ет SQL запрос, возвращает поле с именем 'Result'

implementation

function GetResultSql(Session : TMSConnection; const Sql : string) : Variant;
// ¬ыполн€ет SQL запрос, возвращает поле с именем 'Result'
  var
    tmpQuery : TMSQuery;
begin
  Result:=Null;
  tmpQuery:=TMSQuery.Create(Application);
  try
   tmpQuery.Connection:=Session;
   tmpQuery.SQL.Add(Sql);
   tmpQuery.Open;
   if not tmpQuery.EOF then
     Result:=tmpQuery.FieldByName('Result').AsVariant;
  finally
   FreeAndNil(tmpQuery);
  end;
end;

end.
