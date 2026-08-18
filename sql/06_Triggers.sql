-- =====================================================
-- Trigger Question 1
-- Whenever a new post is created,
-- update the user's LastActive timestamp.
-- =====================================================
DROP TRIGGER IF EXISTS UpdateUserLastActive;
-- Run ONLY ONCE
ALTER TABLE Users
ADD COLUMN LastActive DATETIME NULL;
DELIMITER $$

CREATE TRIGGER UpdateUserLastActive

AFTER INSERT
ON Posts

FOR EACH ROW

BEGIN

    UPDATE Users
    SET LastActive = NOW()
    WHERE UserID = NEW.UserID;

END $$

DELIMITER ;
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
    'Testing Trigger',
    'Image',
    'trigger.jpg',
    'Delhi'
);
SELECT
    UserID,
    UserName,
    LastActive
FROM Users
WHERE UserID = 44;
-- =====================================================
-- Trigger Question 2
-- Prevent users from following themselves.
--
-- Business Rule:
-- A user cannot follow their own account.
-- =====================================================
DELIMITER $$

CREATE TRIGGER PreventSelfFollow

BEFORE INSERT
ON Followers

FOR EACH ROW

BEGIN

    IF NEW.UserID = NEW.FollowerUserID THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A user cannot follow themselves';

    END IF;

END $$

DELIMITER ;
-- Test 1
INSERT INTO Followers
(
    UserID,
    FollowerUserID
)
VALUES
(
    44,
    44
);
-- Test 2
INSERT INTO Followers
(
    UserID,
    FollowerUserID
)
VALUES
(
    48,
    47
);
SELECT *
FROM Followers
ORDER BY UserID, FollowerUserID;
-- =====================================================
-- Trigger Question 3
-- Instagram administrators want the database to
-- automatically create a notification whenever
-- someone likes another user's post.
--
-- Business Rule:
-- When a user likes a post,
-- insert a notification for the owner
-- of that post.
-- =====================================================
DELIMITER $$

CREATE TRIGGER NotifyPostLike

AFTER INSERT
ON Likes

FOR EACH ROW

BEGIN

    INSERT INTO Notifications
    (
        UserID,
        Message
    )

    SELECT
        p.UserID,
        CONCAT('Your post was liked by User ', NEW.UserID)

    FROM Posts p

    WHERE p.PostID = NEW.PostID

      AND p.UserID <> NEW.UserID;

END $$

DELIMITER ;
CALL LikePost(44,27);
SELECT *
FROM Notifications
ORDER BY NotificationID DESC;

-- =====================================================
-- Trigger Question 4
-- Instagram administrators want the database to
-- automatically create a notification whenever
-- someone comments on another user's post.
--
-- Business Rule:
-- When a user comments on a post,
-- automatically notify the owner of that post.
-- =====================================================
DELIMITER $$

CREATE TRIGGER NotifyPostComment

AFTER INSERT
ON Comments

FOR EACH ROW

BEGIN

    INSERT INTO Notifications
    (
        UserID,
        Message
    )

    SELECT
        p.UserID,
        CONCAT('Your post received a new comment from User ', NEW.UserID)

    FROM Posts p

    WHERE p.PostID = NEW.PostID

      AND p.UserID <> NEW.UserID;

END $$

DELIMITER ;
-- Insert
INSERT INTO Comments
(
    PostID,
    UserID,
    CommentText
)
VALUES
(
    27,
    44,
    'Awesome workout! 💪'
);
-- View 
SELECT *
FROM Notifications
ORDER BY NotificationID DESC;

-- =====================================================
-- Trigger Question 5
-- Instagram administrators want to prevent users
-- from commenting on archived posts.
--
-- Business Rule:
-- If a post is archived,
-- no new comments should be allowed.
-- =====================================================
DELIMITER $$

CREATE TRIGGER PreventCommentOnArchivedPost

BEFORE INSERT
ON Comments

FOR EACH ROW

BEGIN

    IF EXISTS
    (
        SELECT 1
        FROM Posts
        WHERE PostID = NEW.PostID
          AND IsArchived = TRUE
    )
    THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot comment on archived posts.';

    END IF;

END $$

DELIMITER ;
-- Archive  a Post
UPDATE Posts
SET IsArchived = TRUE
WHERE PostID = 27;
-- Insert
INSERT INTO Comments
(
    PostID,
    UserID,
    CommentText
)
VALUES
(
    27,
    44,
    'Nice post!'
);

-- =====================================================
-- Trigger Question 6
-- Instagram administrators want to automatically
-- archive deleted posts before they are removed.
--
-- Business Rule:
-- Before a post is deleted,
-- save its complete information into
-- an archive table.
-- =====================================================

-- Create Archive table
CREATE TABLE DeletedPosts
(
    ArchiveID INT AUTO_INCREMENT PRIMARY KEY,

    PostID INT,
    UserID INT,

    Caption VARCHAR(500),

    ContentType ENUM('Image','Video','Reel','Carousel'),

    MediaURL VARCHAR(255),

    Location VARCHAR(100),

    PostDate DATETIME,

    DeletedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- Create trigger
DELIMITER $$

CREATE TRIGGER ArchiveDeletedPost

BEFORE DELETE
ON Posts

FOR EACH ROW

BEGIN

    INSERT INTO DeletedPosts
    (
        PostID,
        UserID,
        Caption,
        ContentType,
        MediaURL,
        Location,
        PostDate
    )

    VALUES
    (
        OLD.PostID,
        OLD.UserID,
        OLD.Caption,
        OLD.ContentType,
        OLD.MediaURL,
        OLD.Location,
        OLD.PostDate
    );

END $$

DELIMITER ;

-- DELETE A POST
DELETE
FROM Posts
WHERE PostID = 27;

-- CHECK ARCHIVE
SELECT *
FROM DeletedPosts
ORDER BY ArchiveID DESC;