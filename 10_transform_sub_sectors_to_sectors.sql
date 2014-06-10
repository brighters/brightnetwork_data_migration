insert into users_to_sectors (user_resource_id, sector_id) (select resource_id as 'user_resource_id', ss.sector_id from sub_sectors_raw ssr
join sub_sector_to_sector_mapping ss on ssr.sub_sector_id = ss.sub_sector_id
group by user_resource_id, sector_id)