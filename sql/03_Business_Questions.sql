-- =====================================================
-- Business Question 1
-- Show all registered users
-- =====================================================

SELECT *
FROM Users;

-- =====================================================
-- Business Question 2
-- Show every post with the username of the creator
-- =====================================================

SELECT
    u.Username,
    u.FullName,
    p.Caption,
    p.ContentType,
    p.Location,
    p.PostDate
FROM Users AS u
INNER JOIN Posts AS p
    ON u.UserID = p.UserID;
    
-- =====================================================
-- Business Question 3
-- The marketing team wants to know 
-- how many posts each user has created.
-- =====================================================
SELECT
    u.Username,
    COUNT(p.PostID) AS TotalPosts
FROM Users AS u
INNER JOIN Posts AS p
    ON u.UserID = p.UserID
GROUP BY u.UserID, u.Username;    

-- =====================================================
-- Business Question 4
-- Show all users who have never created a post.
-- =====================================================
SELECT
    u.Username,
    u.FullName
FROM Users AS u
LEFT JOIN Posts AS p
    ON u.UserID = p.UserID
WHERE p.PostID IS NULL;
--  Check the data
SELECT COUNT(*) AS TotalUsers
FROM Users;
SELECT COUNT(DISTINCT UserID) AS UsersWithPosts
FROM Posts;

-- =====================================================
-- Business Question 5
-- Who are the Top 5 creators based on the number of posts?
-- =====================================================
SELECT
    u.UserID,
    u.Username,
    COUNT(p.PostID) AS TotalPosts
FROM Users AS u
INNER JOIN Posts AS p
    ON u.UserID = p.UserID
GROUP BY
    u.UserID,-- Grouping by primary key is best
    u.Username
ORDER BY TotalPosts DESC
LIMIT 5;
    
-- =====================================================
-- Business Question 6
-- Which posts have received the highest number of likes?
-- =====================================================
SELECT
    u.Username,
    p.Caption,
    COUNT(l.LikeID) AS TotalLikes
FROM Users AS u
INNER JOIN Posts AS p
    ON u.UserID = p.UserID
INNER JOIN Likes AS l
    ON p.PostID = l.PostID
GROUP BY
    u.UserID,
    u.Username,
    p.PostID,
    p.Caption
ORDER BY TotalLikes DESC
LIMIT 10;

-- =====================================================
-- Business Question 7
-- Which users gave the most likes?
-- =====================================================
SELECT
    u.Username,
    COUNT(l.LikeID) AS TotalLikesGiven
FROM Users AS u
INNER JOIN Likes AS l
    ON u.UserID = l.UserID
GROUP BY
    u.UserID,
    u.Username
ORDER BY TotalLikesGiven DESC
LIMIT 10;


-- =====================================================
-- Business Question 8
-- Show how many comments each user has written.
-- =====================================================
SELECT
    u.Username,
    COUNT(c.CommentID) AS TotalComments
FROM Users AS u
INNER JOIN Comments AS c
    ON u.UserID = c.UserID
GROUP BY
    u.UserID,
    u.Username
ORDER BY TotalComments DESC;

-- =====================================================
-- Business Question 9
-- Which posts have received the highest number of comments?
-- =====================================================
SELECT
    u.Username,
    p.Caption,
    COUNT(c.CommentID) AS TotalComments
FROM Users AS u
INNER JOIN Posts AS p
    ON u.UserID = p.UserID
INNER JOIN Comments AS c
    ON p.PostID = c.PostID
GROUP BY
    u.UserID,
    u.Username,
    p.PostID,
    p.Caption
ORDER BY TotalComments DESC
LIMIT 10;

-- =====================================================
-- Business Question 10
-- Instagram wants to identify its most engaging creators.
-- =====================================================
SELECT
    u.Username,
    COUNT(DISTINCT p.PostID) AS TotalPosts,
    COUNT(l.LikeID) AS TotalLikesReceived
FROM Users AS u
INNER JOIN Posts AS p
    ON u.UserID = p.UserID
LEFT JOIN Likes AS l
    ON p.PostID = l.PostID
GROUP BY
    u.UserID,
    u.Username
ORDER BY TotalLikesReceived DESC;

-- =====================================================
-- Business Question 11
-- Instagram wants to identify influencers.
-- =====================================================
SELECT
    u.Username,
    COUNT(DISTINCT p.PostID) AS Posts,
    COUNT(DISTINCT f.FollowerUserID) AS Followers
FROM Users AS u
LEFT JOIN Posts AS p
    ON u.UserID = p.UserID
LEFT JOIN Followers AS f
    ON u.UserID = f.UserID
GROUP BY
    u.UserID,
    u.Username
HAVING
    Followers > 5
    AND Posts >= 2;
-- Check Followers
SELECT
    UserID,
    COUNT(*) AS TotalFollowers
FROM Followers
GROUP BY UserID;
-- check posts
SELECT
    UserID,
    COUNT(*) AS TotalPosts
FROM Posts
GROUP BY UserID;

-- =====================================================
-- Business Question 12
-- Instagram wants to identify viral posts.
-- =====================================================
SELECT
    u.Username,
    p.Caption,
    COUNT(DISTINCT l.LikeID) AS TotalLikes,
    COUNT(DISTINCT c.CommentID) AS TotalComments
FROM Users AS u
INNER JOIN Posts AS p
    ON u.UserID = p.UserID
LEFT JOIN Likes AS l
    ON p.PostID = l.PostID
LEFT JOIN Comments AS c
    ON p.PostID = c.PostID
GROUP BY
    u.UserID,
    u.Username,
    p.PostID,
    p.Caption
HAVING
    TotalLikes >= 2
    AND TotalComments > 1
ORDER BY
    TotalLikes DESC;
    
-- =====================================================
-- Business Question 13
-- Instagram wants to identify users who have never liked any post.
-- =====================================================
SELECT
    u.Username,
    u.FullName
FROM Users AS u
LEFT JOIN Likes AS l
    ON u.UserID = l.UserID
WHERE l.LikeID IS NULL;

-- =====================================================
-- Business Question 14
-- Find users who have never created a post.
-- =====================================================
SELECT
    u.Username,
    u.FullName
FROM Users AS u
LEFT JOIN Posts AS p
    ON u.UserID = p.UserID
WHERE p.PostID IS NULL;

-- =====================================================
-- Business Question 15
-- Find the user who has received the highest total likes
-- across all of their posts.
-- =====================================================
SELECT
    u.Username,
    COUNT(l.LikeID) AS TotalLikesReceived
FROM Users AS u
LEFT JOIN Posts AS p
    ON u.UserID = p.UserID
LEFT JOIN Likes AS l
    ON p.PostID = l.PostID
GROUP BY
    u.UserID,
    u.Username
ORDER BY
    TotalLikesReceived DESC
LIMIT 1;

-- =====================================================
-- Business Question 16
-- Find users who have created posts but have never received
-- a single like on any of their posts.
-- =====================================================
SELECT
    u.Username,
    u.FullName
FROM Users AS u
LEFT JOIN Posts AS p
    ON u.UserID = p.UserID
LEFT JOIN Likes AS l
    ON p.PostID = l.PostID
WHERE
    p.PostID IS NOT NULL
    AND l.LikeID IS NULL
GROUP BY
    u.UserID,
    u.Username,
    u.FullName;
    
-- =====================================================
-- Business Question 17
-- Find users who have liked their own posts.
-- =====================================================

SELECT
    u.Username,
    p.Caption
FROM Users AS u

INNER JOIN Posts AS p
    ON u.UserID = p.UserID

INNER JOIN Likes AS l
    ON p.PostID = l.PostID
WHERE
    p.UserID = l.UserID;
    
-- =====================================================
-- Business Question 18
-- Find the average number of likes received per post
-- by each user.
-- =====================================================
SELECT
    u.Username,

    COUNT(DISTINCT p.PostID) AS TotalPosts,

    COUNT(DISTINCT l.LikeID) AS TotalLikes,

    CASE
        WHEN COUNT(DISTINCT p.PostID) = 0 THEN 0
        ELSE ROUND(
            COUNT(DISTINCT l.LikeID) /
            COUNT(DISTINCT p.PostID),
            2
        )
    END AS AvgLikesPerPost

FROM Users AS u

LEFT JOIN Posts AS p
    ON u.UserID = p.UserID

LEFT JOIN Likes AS l
    ON p.PostID = l.PostID

GROUP BY
    u.UserID,
    u.Username;
    
-- =====================================================
-- Business Question 19
-- Find the most commented post for each user.
-- =====================================================
SELECT 
    u.Username,

   p.Caption,

   COUNT(DISTINCT c.CommentID) AS TotalComments
FROM Users AS u

INNER JOIN Posts AS p
    ON u.UserID = p.UserID

LEFT JOIN Comments AS c
    ON p.PostID = c.PostID

GROUP BY 
    u.UserID,
    u.Username,
    p.PostID,
    p.Caption
    
ORDER BY  TotalComments DESC;

-- =====================================================
-- Business Question 20
-- Find users whose posts have never received a comment.
-- =====================================================
SELECT
    u.Username,
    p.Caption
FROM Users AS u

INNER JOIN Posts AS p
    ON u.UserID = p.UserID

LEFT JOIN Comments AS c
    ON p.PostID = c.PostID

WHERE c.CommentID IS NULL;

-- =====================================================
-- Business Question 21
-- Find users whose total likes received are greater than
-- the average likes received by all users.
-- =====================================================
SELECT
    u.Username,
    COUNT(l.LikeID) AS TotalLikesReceived
FROM Users u
JOIN Posts p
    ON u.UserID = p.UserID
LEFT JOIN Likes l
    ON p.PostID = l.PostID
GROUP BY
    u.UserID,
    u.Username
HAVING COUNT(l.LikeID) >
(
    SELECT AVG(UserLikes)
    FROM
    (
        SELECT COUNT(l2.LikeID) AS UserLikes
        FROM Users u2
        JOIN Posts p2
            ON u2.UserID = p2.UserID
        LEFT JOIN Likes l2
            ON p2.PostID = l2.PostID
        GROUP BY u2.UserID
    ) AS AvgTable
)
ORDER BY TotalLikesReceived DESC;

-- =====================================================
-- Business Question 22
-- Find all users who have created at least one post.
-- (Using a Subquery)
-- =====================================================
SELECT
    u.Username,
    u.FullName
FROM Users AS u
WHERE u.UserID IN
(
    SELECT p.UserID
    FROM Posts AS p
);

-- =====================================================
-- Business Question 23
-- Find users who have never created a post.
-- (Using NOT IN Subquery)
-- =====================================================
SELECT
    u.Username,
    u.FullName
FROM Users AS u
WHERE u.UserID NOT IN
(
    SELECT p.UserID
    FROM Posts AS p
);

-- =====================================================
-- Business Question 24
-- Find posts that have received more likes than the
-- average number of likes per post.
-- =====================================================

SELECT
    p.PostID,
    p.Caption,
    COUNT(l.LikeID) AS TotalLikes
FROM Posts AS p

LEFT JOIN Likes AS l
    ON p.PostID = l.PostID

GROUP BY
    p.PostID,
    p.Caption

HAVING COUNT(l.LikeID) >
(
    SELECT AVG(PostLikes)
    FROM
    (
        SELECT
            COUNT(LikeID) AS PostLikes
        FROM Likes
        GROUP BY PostID
    ) AS AvgTable
)

ORDER BY TotalLikes DESC;

-- =====================================================
-- Business Question 25
-- Find the user(s) who have created the maximum number
-- of posts.
-- =====================================================

SELECT
    u.Username,
    COUNT(p.PostID) AS TotalPosts
FROM Users AS u

INNER JOIN Posts AS p
    ON u.UserID = p.UserID

GROUP BY
    u.UserID,
    u.Username

HAVING COUNT(p.PostID) =
(
    SELECT MAX(PostCount)
    FROM
    (
        SELECT
            COUNT(PostID) AS PostCount
        FROM Posts
        GROUP BY UserID
    ) AS MaxPosts
);

-- =====================================================
-- Business Question 26
-- Show all users ranked by the number of posts they
-- have created.
-- =====================================================
SELECT
    ROW_NUMBER() OVER (ORDER BY COUNT(p.PostID) DESC) AS Ranking,

    u.Username,

    COUNT(p.PostID) AS TotalPosts

FROM Users AS u

LEFT JOIN Posts AS p
    ON u.UserID = p.UserID

GROUP BY
    u.UserID,
    u.Username;
-- =====================================================
-- Business Question 27
-- Find the latest post made by every user.
-- =====================================================
SELECT *
FROM
(
    SELECT
        u.Username,
        p.Caption,
        p.PostDate,

        ROW_NUMBER() OVER
        (
            PARTITION BY u.UserID
            ORDER BY p.PostDate DESC
        ) AS RowNum

    FROM Users AS u

    INNER JOIN Posts AS p
        ON u.UserID = p.UserID

) AS LatestPosts

WHERE RowNum = 1;
-- =====================================================
-- Business Question 28
-- Find the users whose total posts are above the
-- average number of posts.
-- (Using a CTE)
-- =====================================================
WITH UserPosts AS
(
    SELECT
        u.UserID,
        u.Username,
        COUNT(p.PostID) AS TotalPosts
    FROM Users AS u

    LEFT JOIN Posts AS p
        ON u.UserID = p.UserID

    GROUP BY
        u.UserID,
        u.Username
)

SELECT *
FROM UserPosts

WHERE TotalPosts >
(
    SELECT AVG(TotalPosts)
    FROM UserPosts
);
-- =====================================================
--  Question 28
-- Find the top 3 users who have received the most likes
-- on their posts.
-- =====================================================
SELECT
    u.UserID,
    u.UserName,
    COUNT(l.LikeID) AS TotalLikes
FROM Users u
JOIN Posts p
    ON u.UserID = p.UserID
LEFT JOIN Likes l
    ON p.PostID = l.PostID
GROUP BY
    u.UserID,
    u.UserName
ORDER BY
    TotalLikes DESC
LIMIT 3;
-- =====================================================
--  Question 29
-- Find the latest comment made by every user.
-- =====================================================
SELECT
    UserName,
    CommentText,
    CommentDate
FROM (
    SELECT
        u.UserName,
        c.CommentText,
        c.CommentDate,
        ROW_NUMBER() OVER (
            PARTITION BY c.UserID
            ORDER BY c.CommentDate DESC
        ) AS rn
    FROM Users u
    JOIN Comments c
        ON u.UserID = c.UserID
) t
WHERE rn = 1;
-- =====================================================
-- Question 30
-- Find posts that have more comments than likes.
-- =====================================================
SELECT
    p.PostID,
    p.Caption
FROM Posts p
LEFT JOIN (
    SELECT
        PostID,
        COUNT(*) AS CommentCount
    FROM Comments
    GROUP BY PostID
) c
ON p.PostID = c.PostID
LEFT JOIN (
    SELECT
        PostID,
        COUNT(*) AS LikeCount
    FROM Likes
    GROUP BY PostID
) l
ON p.PostID = l.PostID
WHERE COALESCE(c.CommentCount, 0) > COALESCE(l.LikeCount, 0);
-- =====================================================
-- Question 31
-- Find users who have liked every post they created.
-- =====================================================
SELECT
    u.UserID,
    u.Username
FROM Users u

JOIN Posts p
    ON u.UserID = p.UserID

LEFT JOIN Likes l
    ON p.PostID = l.PostID
   AND l.UserID = u.UserID

GROUP BY
    u.UserID,
    u.Username

HAVING
COUNT(DISTINCT p.PostID)
=
COUNT(DISTINCT l.PostID);

-- =====================================================
-- Business Question 32
-- Find users who have commented on every one of their own posts.
-- =====================================================

SELECT
    u.UserID,
    u.Username,
    COUNT(DISTINCT p.PostID) AS TotalPosts,
    COUNT(DISTINCT c.PostID) AS OwnCommentedPosts

FROM Users AS u

INNER JOIN Posts AS p
    ON u.UserID = p.UserID

LEFT JOIN Comments AS c
    ON p.PostID = c.PostID
   AND c.UserID = u.UserID

GROUP BY
    u.UserID,
    u.Username

HAVING
    COUNT(DISTINCT p.PostID)
    =
    COUNT(DISTINCT c.PostID);