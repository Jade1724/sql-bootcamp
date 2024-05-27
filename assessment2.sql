-- Assessment Test #2

-- Q1
SELECT * FROM cd.facilities;
-- Q2
SELECT name, membercost FROM cd.facilities;
-- Q3
SELECT * FROM cd.facilities
WHERE membercost > 0;
-- Q4
SELECT facid, name , membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0
AND membercost < (monthlymaintenance / 50);
-- Q5
SELECT * FROM cd.facilities
WHERE name LIKE '%Tennis%';
-- Q6
SELECT * FROM cd.facilities
WHERE facid in (1, 5);
-- Q7
SELECT * FROM cd.members
WHERE joindate >= '2012-09-01 00:00:00';
-- Q8
SELECT DISTINCT surname FROM cd.members
ORDER BY surname
LIMIT 10;
-- Q9
SELECT MAX(joindate) AS latest_signup
FROM cd.members;
-- Q10
SELECT COUNT(*) FROM cd.facilities
WHERE guestcost >= 10;
-- Q11
SELECT facid, SUM(slots) as total_slots FROM cd.bookings
WHERE starttime BETWEEN '2012-09-01' AND '2012-10-01'
GROUP BY (facid)
ORDER BY total_slots;

-- Correct answer for Q11
SELECT facid, SUM(slots) as total_slots FROM cd.bookings
WHERE starttime >= '2012-09-01' 
AND starttime < '2012-10-01'
GROUP BY (facid)
ORDER BY total_slots;

-- Q12
SELECT facid, total_booking FROM (
	SELECT cd.facilities.facid, SUM(cd.bookings.slots) as total_booking FROM cd.facilities
	INNER JOIN cd.bookings
	ON cd.facilities.facid = cd.bookings.facid
	GROUP BY cd.facilities.facid
)
WHERE total_booking > 1000
ORDER BY facid;

-- Shorter answer for Q12
SELECT facid, SUM(slots) AS total_slots
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY SUM(slots);

-- Q13
SELECT cd.bookings.starttime, cd.facilities.name 
FROM cd.bookings
INNER JOIN cd.facilities
ON cd.facilities.facid = cd.bookings.facid
WHERE cd.bookings.starttime 
BETWEEN '2012-09-21' AND '2012-09-22'
AND cd.facilities.name LIKE 'Tennis Court%'
ORDER BY cd.bookings.starttime;

-- Correct Answer for Q13
SELECT cd.bookings.starttime AS start, cd.facilities.name AS name
FROM cd.facilities
INNER JOIN cd.bookings
ON cd.facilites.facid = cd.bookings.facid
WHERE cd.facilities.facid IN (0, 1) -- Tennis courts facid is 0 and 1
AND cd.bookings.starttime >= '2012-09-21'
AND cd.bookings.starttime < '2012-09-22'
ORDER BY cd.bookings.starttime;

-- Q14
SELECT cd.bookings.starttime
FROM cd.bookings
INNER JOIN cd.members
ON cd.members.memid = cd.bookings.memid
WHERE cd.members.surname = 'Farrell'
AND cd.members.firstname = 'David';






