-- =====================================================
-- View Question 1
-- Instagram managers want a reusable report that shows
-- every user along with the total number of posts they
-- have created.
-- =====================================================
CREATE VIEW UserPostSummary AS

SELECT
    u.UserName,
    u.FullName,
    COUNT(p.PostID) AS TotalPosts
FROM Users AS u

LEFT JOIN Posts AS p
    ON u.UserID = p.UserID

GROUP BY
    u.UserID,
    u.UserName,
    u.FullName;
SELECT *
FROM UserPostSummary
ORDER BY TotalPosts DESC;

-- =====================================================
-- View Question 2
-- Instagram managers want a reusable report that shows
-- every post along with its total likes and total comments.
-- =====================================================
CREATE VIEW PostEngagementSummary AS

SELECT
    p.PostID,
    u.UserName,
    p.Caption,
    COUNT(DISTINCT l.LikeID) AS TotalLikes,
    COUNT(DISTINCT c.CommentID) AS TotalComments

FROM Posts p

LEFT JOIN Users u
    ON p.UserID = u.UserID

LEFT JOIN Likes l
    ON p.PostID = l.PostID

LEFT JOIN Comments c
    ON p.PostID = c.PostID

GROUP BY
    p.PostID,
    u.UserName,
    p.Caption;
SELECT *
FROM PostEngagementSummary
ORDER BY TotalLikes DESC;
-- =====================================================
-- View Question 3
-- Instagram managers want a reusable report that shows
-- every user along with the total number of followers
-- and the total number of users they are following.
-- =====================================================
CREATE VIEW UserFollowerSummary AS

SELECT
    u.UserID,
    u.UserName,
    COUNT(DISTINCT f1.FollowerUserID) AS TotalFollowers,
    COUNT(DISTINCT f2.UserID) AS TotalFollowing

FROM Users u

LEFT JOIN Followers f1
    ON u.UserID = f1.UserID

LEFT JOIN Followers f2
    ON u.UserID = f2.FollowerUserID

GROUP BY
    u.UserID,
    u.UserName;
SELECT *
FROM UserFollowerSummary
ORDER BY TotalFollowers DESC;

-- =====================================================
-- View Question 4
-- Instagram managers want a reusable report that shows
-- every post along with:
--   - Username
--   - Caption
--   - Total Likes
--   - Total Comments
--   - Total Views
--
-- The report should include posts even if they have
-- zero likes, zero comments, or zero views.
-- =====================================================
CREATE VIEW PostPerformanceSummary AS

SELECT
    u.UserName,
    p.Caption,
    COUNT(DISTINCT l.LikeID) AS TotalLikes,
    COUNT(DISTINCT c.CommentID) AS TotalComments,
    COUNT(DISTINCT pv.ViewID) AS TotalViews

FROM Posts AS p

LEFT JOIN Users AS u
    ON p.UserID = u.UserID

LEFT JOIN Likes AS l
    ON p.PostID = l.PostID

LEFT JOIN Comments AS c
    ON p.PostID = c.PostID

LEFT JOIN PostViews AS pv
    ON p.PostID = pv.PostID

GROUP BY
    p.PostID,
    u.UserID,
    u.UserName,
    p.Caption;
SELECT *
FROM PostPerformanceSummary
ORDER BY TotalLikes DESC;

-- =====================================================
-- View Question 5
-- Instagram managers want a reusable report that shows
-- users who have created posts but have never received
-- a single like on any of their posts.
-- =====================================================
CREATE VIEW UsersWithoutLikes AS

SELECT
    u.UserID,
    u.UserName,
    u.FullName,
    COUNT(DISTINCT l.LikeID) AS TotalLikes

FROM Users u

INNER JOIN Posts p
    ON u.UserID = p.UserID

LEFT JOIN Likes l
    ON p.PostID = l.PostID

GROUP BY
    u.UserID,
    u.UserName,
    u.FullName

HAVING COUNT(DISTINCT l.LikeID) = 0;
SELECT * FROM 
   UsersWithoutLikes;
-- =====================================================
-- View Question 6
-- Instagram managers want a reusable report that shows
-- the top hashtags along with the total number of posts
-- using each hashtag.
-- =====================================================
CREATE VIEW HashtagPostSummary AS

SELECT
    h.HashtagName,
    COUNT(DISTINCT ph.PostID) AS TotalPosts

FROM Hashtags AS h

LEFT JOIN PostHashtags AS ph
    ON h.HashtagID = ph.HashtagID

GROUP BY
    h.HashtagID,
    h.HashtagName;
SELECT *
FROM HashtagPostSummary
ORDER BY TotalPosts DESC;

-- =====================================================
-- View Question 7
-- Instagram managers want a reusable report that shows
-- every user along with:
--   - Total Posts
--   - Total Followers
--   - Total Following
--   - Total Likes Received
--
-- This report will be used for the admin dashboard.
-- =====================================================
CREATE VIEW DashboardView AS

SELECT
    u.UserName,

    COUNT(DISTINCT p.PostID) AS TotalPosts,

    COUNT(DISTINCT f1.FollowerUserID) AS TotalFollowers,

    COUNT(DISTINCT f2.UserID) AS TotalFollowing,

    COUNT(DISTINCT l.LikeID) AS TotalLikesReceived

FROM Users u

LEFT JOIN Posts p
    ON u.UserID = p.UserID

LEFT JOIN Likes l
    ON p.PostID = l.PostID

LEFT JOIN Followers f1
    ON u.UserID = f1.UserID

LEFT JOIN Followers f2
    ON u.UserID = f2.FollowerUserID

GROUP BY
    u.UserID,
    u.UserName;
SELECT *
FROM DashboardView
ORDER BY TotalLikesReceived DESC;

-- =====================================================
-- View Question 8
-- Instagram managers want a reusable report that shows
-- the top 10 most popular posts based on:
--
--   - Likes
--   - Comments
--   - Views
--
-- Display:
--   Username
--   Caption
--   TotalLikes
--   TotalComments
--   TotalViews
-- =====================================================
DROP VIEW IF EXISTS TopPosts;
CREATE VIEW TopPosts AS

SELECT
    p.PostID,
    u.UserName,
    p.Caption,
    COUNT(DISTINCT l.LikeID) AS TotalLikes,
    COUNT(DISTINCT c.CommentID) AS TotalComments,
    COUNT(DISTINCT v.ViewID) AS TotalViews

FROM Posts p

LEFT JOIN Users u
    ON p.UserID = u.UserID

LEFT JOIN Likes l
    ON p.PostID = l.PostID

LEFT JOIN Comments c
    ON p.PostID = c.PostID

LEFT JOIN PostViews v
    ON p.PostID = v.PostID

GROUP BY
    p.PostID,
    u.UserID,
    u.UserName,
    p.Caption;
SELECT *
FROM TopPosts
ORDER BY TotalLikes DESC, TotalViews DESC
LIMIT 10;