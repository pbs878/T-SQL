

--print dbo.FCN_FechaTexto ('20190513')

ALTER FUNCTION FCN_FechaTexto(@fecha datetime)

RETURNS varchar(60)
AS

BEGIN

declare @dia varchar(20)
declare @mes varchar(20)
declare @fechatexto varchar(50)

set @dia = (CASE WHEN datepart(dw,@fecha)=1 then 'Domingo '+convert(char(2),datepart(dd,@fecha))
				 WHEN datepart(dw,@fecha)=2 then 'Lunes '+convert(char(2),datepart(dd,@fecha))
				 WHEN datepart(dw,@fecha)=3 then 'Martes '+convert(char(2),datepart(dd,@fecha))
				 WHEN datepart(dw,@fecha)=4 then 'Mi�rcoles '+convert(char(2),datepart(dd,@fecha))
				 WHEN datepart(dw,@fecha)=5 then 'Jueves '+convert(char(2),datepart(dd,@fecha))
				 WHEN datepart(dw,@fecha)=6 then 'Viernes '+convert(char(2),datepart(dd,@fecha))
				 WHEN datepart(dw,@fecha)=7 then 'Sabado '+convert(char(2),datepart(dd,@fecha))
			END)

set @mes = (CASE WHEN datepart(mm,@fecha) = 1 THEN 'Enero'
				 WHEN datepart(mm,@fecha) = 2 THEN 'Febrero'
				 WHEN datepart(mm,@fecha) = 3 THEN 'Marzo'
				 WHEN datepart(mm,@fecha) = 4 THEN 'Abril'
				 WHEN datepart(mm,@fecha) = 5 THEN 'Mayo'
				 WHEN datepart(mm,@fecha) = 6 THEN 'Junio'
				 WHEN datepart(mm,@fecha) = 7 THEN 'Julio'
				 WHEN datepart(mm,@fecha) = 8 THEN 'Agosto'
				 WHEN datepart(mm,@fecha) = 9 THEN 'Septiembre'
				 WHEN datepart(mm,@fecha) = 10 THEN 'Octubre'
				 WHEN datepart(mm,@fecha) = 11 THEN 'Noviembre'
				 WHEN datepart(mm,@fecha) = 12 THEN 'Diciembre'
               END)
set @fechatexto = @dia + ' de ' + @mes
RETURN @fechatexto

END