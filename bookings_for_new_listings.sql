select market,count(*) as bookings
  ,count(case when created_date> '2013-05-01' then 1 end) as bookings_to_new_listings
  ,count(case when created_date<= '2013-05-01' then 1 end) as bookings_to_old_listings
  ,count(case when created_date> '2013-05-01' then 1 end)/count(*) as pct_bookings_to_new_listings
from reservation2s r
join hostings_summary h
on h.hosting_id = r.hosting_id 
where r.status = 1
and market in ('Santander',
'Riviera Romagnola',
'Fuerteventura',
'Boracay',
'Mumbai',
'Belo Horizonte',
'Kazan',
'Queenstown',
'Pattaya',
'Antalya',
'La Baule and Noirmoutier',
'Royan and Lacanau',
'Rhodes',
'Yogyakarta',
'Busan',
'Gijon',
'Cebu City',
'Blue Mountains',
'Maastricht',
'Osaka',
'West Coast North',
'Savannah',
'Salzburg',
'Belfast',
'Oxford',
'Sevastopol',
'Campos do Jordao',
'Nantucket Region',
'Hualien',
'Aarhus',
'Beijing',
'Sochi',
'North Corsica',
'Utrecht',
'Manchester',
'Stuttgart')
and date(pending_began_at) between '2013-06-01' and '2013-07-01'
group by 1
