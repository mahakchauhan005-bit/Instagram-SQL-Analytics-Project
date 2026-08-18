-- =====================================================
-- Index Question 1
-- Create an index to speed up searching posts
-- by the user who created them.
-- =====================================================
CREATE INDEX idx_posts_userid
ON Posts(UserID);
SELECT *
FROM Posts
WHERE UserID = 44;

-- =====================================================
-- Index Question 2
-- Create an index to improve searching likes
-- for a particular post.
-- =====================================================

CREATE INDEX idx_likes_postid
ON Likes(PostID);

-- Test the index
SELECT *
FROM Likes
WHERE PostID = 44;

-- =====================================================
-- Index Question 3
-- Instagram administrators want to improve the
-- performance of retrieving all comments
-- for a specific post.
-- =====================================================
CREATE INDEX idx_comments_postid
ON Comments(PostID);
SELECT *
FROM Comments
WHERE PostID = 1;

-- =====================================================
-- Index Question 4
-- Instagram administrators want to improve
-- searching followers of a user.
-- =====================================================
CREATE INDEX idx_followers_userid
ON Followers(UserID);
SELECT *
FROM Followers
WHERE UserID = 44;

-- =====================================================
-- Index Question 5
-- Instagram administrators want to improve
-- searching messages sent by a particular user.
-- =====================================================
CREATE INDEX idx_messages_senderid
ON Messages(SenderID);
SELECT *
FROM Messages
WHERE SenderID = 1;

-- =====================================================
-- Index Question 6
-- Instagram administrators want to improve
-- hashtag-based searches.
--
-- Business Rule:
-- Users frequently search posts using hashtags,
-- so searching by HashtagID should be faster.
-- =====================================================
CREATE INDEX idx_posthashtags_hashtagid
ON PostHashtags(HashtagID);
SELECT *
FROM PostHashtags
WHERE HashtagID = 1;

-- =====================================================
-- Index Question 7
-- Instagram administrators frequently search users
-- by their username during login and profile search.
--
-- Business Rule:
-- Searching by Username should be fast.
-- =====================================================
CREATE INDEX idx_users_username
ON Users(UserName);
SELECT *
FROM Users
WHERE UserName = 'ashutosh01';