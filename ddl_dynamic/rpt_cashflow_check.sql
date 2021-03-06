if OBJECT_ID('tempdb..#a') is not null drop table #a
select	a.probuild_id
		, record_id
		, Cashflow_Category
		, Month_0
		, row_number() OVER(PARTITION BY a.probuild_id, cashflow_category ORDER BY a.record_id ASC) as Row
into	#a
from	rpt_Cashflow_SMB_ENT as a
	join app_Probuild as b
	on a.probuild_id = b.probuild_id
where isnull(b.legacy,0) = 0

--select * from #a order by Probuild_Id, row

if OBJECT_ID('tempdb..#b') is not null drop table #b
select	a.*
into	#b
from	#a as a
	join (
			select probuild_id, Cashflow_Category, max(row) as mxrow
			from #a
			group by probuild_id, Cashflow_Category
		) as b
	on a.Probuild_Id = b.Probuild_Id 
	and a.row = b.mxrow
	and a.Cashflow_Category = b.Cashflow_Category
where	mxrow > 1

select * from #b

if OBJECT_ID('tempdb..#c') is not null drop table #c
select	a.*
into	#c
from	#a as a
	join (
			select	probuild_id, row - 1 as row
			from	#b as b
		) as b
	on a.Probuild_Id = b.Probuild_Id and a.row = b.row

select b.*, c.*, b.CAR_Value/c.CAR_Value
from	#b as b
	join #c as c
	on b.Probuild_Id = c.Probuild_Id
where c.CAR_Value <> 0
order by b.CAR_Value/c.CAR_Value desc

/*
delete
from rpt_Probuild
where record_id IN (11172)
*/