SELECT
COUNT(*) filter( WHERE device_type='laptop') as laptop_views,
COUNT(*) filter( WHERE device_type not in('laptop')) as mobile_views
from viewership;