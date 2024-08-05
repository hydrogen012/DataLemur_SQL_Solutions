SELECT page_id 
FROM pages
WHERE page_id 
    NOT IN
    (SELECT DISTINCT(page_id) from page_likes);