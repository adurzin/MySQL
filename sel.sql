SELECT  
	IF (`message`.to_user_id = 51, `message`.from_user_id, `message`.to_user_id) AS best_friend,
    (SELECT `status` FROM friend_request
    WHERE (from_user_id IN (`message`.from_user_id, `message`.to_user_id) AND
    (to_user_id IN (`message`.from_user_id, `message`.to_user_id)))) AS friend
FROM `message`
WHERE (to_user_id IN (51) OR from_user_id IN (51))
GROUP BY IF (`message`.to_user_id = 51, `message`.from_user_id, `message`.to_user_id)
ORDER BY friend DESC, COUNT(*) DESC

