-- =====================================================
-- Transaction Question 1
-- Instagram administrators want to ensure that
-- when a user creates a post,
-- the post and its hashtags are inserted together.
--
-- Business Rule:
-- If hashtag insertion fails,
-- the post should also be rolled back.
-- =====================================================
START TRANSACTION;

-- Insert new post
INSERT INTO Posts
(
    UserID,
    Caption,
    ContentType,
    MediaURL,
    Location
)
VALUES
(
    44,
    'Transaction Test Post',
    'Image',
    'transaction.jpg',
    'Delhi'
);

-- Save generated PostID
SET @NewPostID = LAST_INSERT_ID();

-- Link hashtags
INSERT INTO PostHashtags
(
    PostID,
    HashtagID
)
VALUES
(@NewPostID,1),
(@NewPostID,3),
(@NewPostID,8);

COMMIT;

-- Rollback example
START TRANSACTION;

INSERT INTO Posts
(
    UserID,
    Caption,
    ContentType,
    MediaURL,
    Location
)
VALUES
(
    44,
    'Rollback Test',
    'Image',
    'rollback.jpg',
    'Delhi'
);

SET @NewPostID = LAST_INSERT_ID();

-- Invalid HashtagID
INSERT INTO PostHashtags
(
    PostID,
    HashtagID
)
VALUES
(@NewPostID,9999);

ROLLBACK;
SELECT *
FROM Posts
WHERE Caption = 'Rollback Test';

-- =====================================================
-- Transaction Question 2
-- Instagram administrators want to safely delete a post.
--
-- Business Rule:
-- When deleting a post, remove:
-- 1. Likes
-- 2. Comments
-- 3. Saved Posts
-- 4. Post Views
-- 5. Post Hashtags
-- 6. Finally delete the Post
--
-- If any step fails,
-- rollback everything.
-- =====================================================
START TRANSACTION;

DELETE FROM Likes
WHERE PostID = 25;

DELETE FROM Comments
WHERE PostID = 25;

DELETE FROM SavedPosts
WHERE PostID = 25;

DELETE FROM PostViews
WHERE PostID = 25;

DELETE FROM PostHashtags
WHERE PostID = 25;

DELETE FROM Posts
WHERE PostID = 25;

COMMIT;

-- verify
SELECT *
FROM Posts
WHERE PostID = 25;

-- =====================================================
-- Transaction Question 3
-- Instagram administrators want to safely transfer
-- ownership of a post from one user to another.
--
-- Business Rule:
-- If the new UserID does not exist,
-- ownership should not change.
-- =====================================================
DELIMITER $$

CREATE PROCEDURE TransferPostOwnership(
    IN p_PostID INT,
    IN p_NewUserID INT
)
BEGIN
    DECLARE UserExists INT;

    START TRANSACTION;

    SELECT COUNT(*)
    INTO UserExists
    FROM Users
    WHERE UserID = p_NewUserID;

    IF UserExists > 0 THEN
        UPDATE Posts
        SET UserID = p_NewUserID
        WHERE PostID = p_PostID;

        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END $$

DELIMITER ;
CALL TransferPostOwnership(26, 45);

-- =====================================================
-- Transaction Question 4
-- Instagram administrators want to safely archive
-- a post instead of deleting it.
--
-- Business Rule:
-- When a post is archived:
-- 1. Mark the post as archived.
-- 2. Update the owner's LastActive timestamp.
-- 3. Commit only if both operations succeed.
-- =====================================================
START TRANSACTION;

-- Archive the post
UPDATE Posts
SET IsArchived = TRUE
WHERE PostID = 28;

-- Update the owner's LastActive
UPDATE Users
SET LastActive = NOW()
WHERE UserID =
(
    SELECT UserID
    FROM Posts
    WHERE PostID = 28
);

COMMIT;

-- Check the post
SELECT
    PostID,
    Caption,
    IsArchived
FROM Posts
WHERE PostID = 28;

-- check the user
SELECT
    UserID,
    UserName,
    LastActive
FROM Users
WHERE UserID = 45;

-- =====================================================
-- Transaction Question 5
-- Instagram administrators want to ensure that
-- when a user follows another user,
-- both operations happen together.
--
-- Business Rule:
-- 1. Insert the follower relationship.
-- 2. Create a notification.
-- 3. If notification creation fails,
--    the follow should also be rolled back.
-- =====================================================
START TRANSACTION;

INSERT INTO Followers
(
    UserID,
    FollowerUserID
)
VALUES
(
    48,
    46
);

INSERT INTO Notifications
(
    UserID,
    Message
)
VALUES
(
    48,
    'User 46 started following you.'
);

COMMIT;

-- Verify Followers
SELECT *
FROM Followers
WHERE UserID = 48
  AND FollowerUserID = 44;
  
-- Verify notifications
SELECT *
FROM Notifications
WHERE UserID = 48
ORDER BY NotificationID DESC;