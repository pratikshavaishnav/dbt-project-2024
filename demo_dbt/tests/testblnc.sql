select * from
{{source('clone_database_sample','ordersclone')}}
where O_TOTALPRICE<=1000 