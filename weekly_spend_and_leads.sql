create or replace view weekly_leads_and_spend_by_channel
AS
(
select 
 gs.week  
,gs.spend
,count(company_id) as leads
,gs.channel
from growth_operations go
left join growth_spend_clensed_data gs 
on 
  go.channel = gs.channel
  and 
  go.week = gs.week  
  
group by 
gs.spend
,gs.week   
,go.channel
,gs.channel
,go.week
  
order by gs.week asc

)
