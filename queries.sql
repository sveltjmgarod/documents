create table #usuarios (name varchar(255))
insert into #usuarios values
('Leanne Graham'),
('Ervin Howell'),
('Clementine Bauch'),
('Patricia Lebsack'),
('Chelsey Dietrich'),
('Mrs. Dennis Schulist'),
('Kurtis Weissnat'),
('Nicholas Runolfsdottir V'),
('Glenna Reichert'),
('Clementina DuBuque'),
('maharG ennaeL'),
('llewoH nivrE'),
('hcuaB enitnemelC'),
('kcasbeL aicirtaP'),
('hcirteiD yeslehC'),
('tsiluhcS sinneD .srM'),
('tanssieW sitruK');

with cte1 as (
	select *, row_number() over (order by (select null))n1
	from copia where comment=''
),
cte2 as (
	select *, row_number() over (order by (select null))n2
	from #usuarios
)
--select *, concat(name+' ',n1)FullName from comentarios 
update copia set comment=concat(cte2.name+' ',n1) from copia
inner join cte1 on concat(cte1.No_,cte1.[Line No_])=concat(copia.No_,copia.[Line No_])
inner join cte2 on cte2.n2=cte1.n1

with cte(n) as (
	select 1
	union all
	select n+1 from cte where n<20
)select * from copia
where 
	substring(comment,len(comment)-1,2) in (select iif(n<10,' ','')+cast(n as varchar(2)) from cte)
