-- =====================================================
-- Stored Procedure 1
-- Add a New User
-- Instagram administrators want a reusable procedure
-- that inserts a new user into the Users table.
-- =====================================================

DELIMITER $$

CREATE PROCEDURE AddNewUser(
    IN p_Username VARCHAR(50),
    IN p_Email VARCHAR(100),
    IN p_PasswordHash VARCHAR(255),
    IN p_FullName VARCHAR(100),
    IN p_Bio VARCHAR(255),
    IN p_DateOfBirth DATE,
    IN p_Country VARCHAR(50)
)

BEGIN

    INSERT INTO Users
    (
        Username,
        Email,
        PasswordHash,
        FullName,
        Bio,
        DateOfBirth,
        Country
    )
    VALUES
    (
        p_Username,
        p_Email,
        p_PasswordHash,
        p_FullName,
        p_Bio,
        p_DateOfBirth,
        p_Country
    );

END $$

DELIMITER ;
CALL AddNewUser(
'Rahul123',
'rahul123@gmail.com',
'hash123',
'Rahul Sharma',
'Learning SQL',
'2001-08-10',
'India'
);
SELECT *
FROM Users
ORDER BY UserID DESC
LIMIT 1;
-- =====================================================
-- Stored Procedure 2
-- Instagram administrators want a reusable procedure
-- that creates a new post for a user.
-- =====================================================
DELIMITER $$

CREATE PROCEDURE AddNewPost(

    IN p_UserID INT,
    IN p_Caption VARCHAR(500),
    IN p_ContentType ENUM('Image','Video','Reel','Carousel'),
    IN p_MediaURL VARCHAR(255),
    IN p_Location VARCHAR(100)

)

BEGIN

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
        p_UserID,
        p_Caption,
        p_ContentType,
        p_MediaURL,
        p_Location
    );

END $$

DELIMITER ;

CALL AddNewPost(

44,
'Learning Stored Procedures!',
'Image',
'images/sp.jpg',
'Delhi'

);
SELECT *
FROM Posts
ORDER BY PostID DESC
LIMIT 1;

-- =====================================================
-- Stored Procedure Question 3
-- Instagram administrators want a reusable procedure
-- that allows a user to like a post.
--
-- Business Rule:
-- A user should be able to like a post by providing:
--   - UserID
--   - PostID
-- =====================================================
DROP PROCEDURE IF EXISTS LikePost;
DELIMITER $$

CREATE PROCEDURE LikePost(

    IN p_UserID INT,
    IN p_PostID INT

)

BEGIN

    IF EXISTS
    (
        SELECT 1
        FROM Likes
        WHERE UserID = p_UserID
          AND PostID = p_PostID
    )

    THEN

        SELECT 'Already Liked' AS Message;

    ELSE

        INSERT INTO Likes
        (
            UserID,
            PostID
        )
        VALUES
        (
            p_UserID,
            p_PostID
        );

        SELECT 'Like Added Successfully' AS Message;

    END IF;

END $$

DELIMITER ;
CALL LikePost(45,27);
SELECT *
FROM Likes
WHERE UserID = 45
  AND PostID = 27;

-- =====================================================
-- Stored Procedure Question 5
-- Instagram administrators want a reusable procedure
-- that returns the complete analytics of a user.
-- =====================================================
DELIMITER $$

CREATE PROCEDURE GetUserAnalytics(
    IN p_UserID INT
)

BEGIN

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

    WHERE u.UserID = p_UserID

    GROUP BY
        u.UserID,
        u.UserName;

END $$

DELIMITER ;

CALL GetUserAnalytics(44);

-- =====================================================
-- Stored Procedure 6
-- Instagram administrators want a reusable procedure
-- that returns the complete analytics of a post.
--
-- Input:
--     PostID
--
-- Output:
--     Caption
--     Username
--     Total Likes
--     Total Comments
--     Total Views
-- =====================================================

DELIMITER $$

CREATE PROCEDURE GetPostAnalytics(
    IN p_PostID INT
)

BEGIN

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

    WHERE p.PostID = p_PostID

    GROUP BY
        p.PostID,
        u.UserID,
        u.UserName,
        p.Caption;

END $$

DELIMITER ;

CALL GetPostAnalytics(27);