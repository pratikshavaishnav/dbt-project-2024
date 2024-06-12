select N_NATIONKEY,N_NAME,count(1) as cnt from {{ref("nationdetail")}}
group by 1,2
having cnt>1