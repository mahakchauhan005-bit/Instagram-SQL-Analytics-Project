-- ==========================
-- Insert Users
-- ==========================
INSERT INTO Users
(Username, Email, PasswordHash, FullName, Bio, DateOfBirth, Country)
VALUES
('ashutosh01','ashutosh01@gmail.com','hash001','Ashutosh Rana','Learning SQL every day.','2001-05-18','India'),
('emma_w','emma.w@gmail.com','hash002','Emma Watson','Travel Lover','1998-11-22','USA'),
('david99','david99@gmail.com','hash003','David Miller','Coffee & Code','1997-03-14','UK'),
('sophia_m','sophia.m@gmail.com','hash004','Sophia Martin','Fitness Enthusiast','1999-07-08','Canada'),
('liam07','liam07@gmail.com','hash005','Liam Johnson','Photographer','2000-02-10','Australia'),
('olivia','olivia@gmail.com','hash006','Olivia Brown','Nature Explorer','1998-06-30','Germany'),
('noah','noah@gmail.com','hash007','Noah Wilson','Food Blogger','1996-09-12','France'),
('isabella','isabella@gmail.com','hash008','Isabella Garcia','Book Reader','1999-12-03','Brazil'),
('ethan','ethan@gmail.com','hash009','Ethan Thomas','Tech Geek','2001-01-21','Japan'),
('mia','mia@gmail.com','hash010','Mia Anderson','Digital Artist','2002-04-15','Singapore'),
('aarav','aarav@gmail.com','hash011','Aarav Sharma','Cricket Fan','2000-10-11','India'),
('priya','priya@gmail.com','hash012','Priya Verma','UI Designer','1999-08-24','India'),
('rohan','rohan@gmail.com','hash013','Rohan Kapoor','Music Lover','1998-02-18','India'),
('ananya','ananya@gmail.com','hash014','Ananya Singh','Data Analyst','2001-06-07','India'),
('michael','michael@gmail.com','hash015','Michael Scott','Business Manager','1995-09-20','USA'),
('charlotte','charlotte@gmail.com','hash016','Charlotte Lee','Photographer','1997-04-09','South Korea'),
('daniel','daniel@gmail.com','hash017','Daniel Clark','Gym Freak','1996-11-28','USA'),
('emily','emily@gmail.com','hash018','Emily Davis','Fashion Blogger','1998-01-16','UK'),
('lucas','lucas@gmail.com','hash019','Lucas Silva','Football Player','1997-05-13','Brazil'),
('ava','ava@gmail.com','hash020','Ava Wilson','Traveler','2000-07-27','Canada');

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
    'john_test',
    'john@test.com',
    '123456',
    'John Test',
    'Testing inactive user',
    '2000-01-01',
    'India'
);
INSERT INTO Users
(Username, Email, PasswordHash, FullName, Country)
VALUES
('new_creator',
 'newcreator@gmail.com',
 'pass123',
 'New Creator',
 'India');
 INSERT INTO Users (Username, Email, PasswordHash, FullName, Country)
VALUES
('travel_with_riya', 'riya@gmail.com', 'pass123', 'Riya Sharma', 'India'),

('fitness_amit', 'amit@gmail.com', 'pass123', 'Amit Verma', 'India'),

('foodie_neha', 'neha@gmail.com', 'pass123', 'Neha Kapoor', 'India'),

('tech_guru', 'techguru@gmail.com', 'pass123', 'Rohit Singh', 'India'),

('nature_clicks', 'nature@gmail.com', 'pass123', 'Anjali Mehta', 'India'),

('coding_life', 'coding@gmail.com', 'pass123', 'Siddharth Jain', 'India'),

('daily_quotes', 'quotes@gmail.com', 'pass123', 'Karan Malhotra', 'India'),

('fashion_vibes', 'fashion@gmail.com', 'pass123', 'Priya Arora', 'India'),

('music_world', 'music@gmail.com', 'pass123', 'Rahul Khanna', 'India'),

('photography_pro', 'photo@gmail.com', 'pass123', 'Sneha Gupta', 'India');
-- ==========================
-- Insert Posts
-- ==========================
INSERT INTO Posts
(UserID, Caption, ContentType, MediaURL, Location)
VALUES
(1,'Learning SQL every day!','Image','images/post1.jpg','Jaipur'),
(2,'Beautiful sunset at the beach','Image','images/post2.jpg','California'),
(3,'Morning coffee before coding','Image','images/post3.jpg','London'),
(4,'Leg day completed','Image','images/post4.jpg','Toronto'),
(5,'Nature is the best therapy','Image','images/post5.jpg','Sydney'),
(6,'Weekend road trip','Carousel','images/post6.jpg','Berlin'),
(7,'Trying Italian pizza','Image','images/post7.jpg','Paris'),
(8,'Reading a new novel','Image','images/post8.jpg','Rio de Janeiro'),
(9,'Working on my new tech project','Reel','videos/reel1.mp4','Tokyo'),
(10,'Digital painting finished','Image','images/post10.jpg','Singapore'),
(11,'Cricket practice today','Video','videos/video1.mp4','Delhi'),
(12,'New UI design completed','Image','images/post12.jpg','Mumbai'),
(13,'Listening to my favorite playlist','Image','images/post13.jpg','Bangalore'),
(14,'Data Analytics is fun','Image','images/post14.jpg','Pune'),
(15,'Office meeting today','Image','images/post15.jpg','New York'),
(16,'Captured a beautiful mountain','Image','images/post16.jpg','Seoul'),
(17,'Back workout completed','Video','videos/video2.mp4','Chicago'),
(18,'Fashion photoshoot today','Carousel','images/post18.jpg','Manchester'),
(19,'Football training','Video','videos/video3.mp4','São Paulo'),
(20,'Vacation begins today','Image','images/post20.jpg','Vancouver');
-- ADD new insert in post
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
    43,
    'My first Instagram post!',
    'Image',
    'images/test.jpg',
    'Delhi'
);
INSERT INTO Posts (UserID, Caption, ContentType, MediaURL, Location)
VALUES
(44, 'Sunrise in Manali 🌄', 'Image', 'travel1.jpg', 'Manali'),
(44, 'Road trip memories 🚗', 'Image', 'travel2.jpg', 'Shimla'),

(45, 'Leg day complete 💪', 'Image', 'fitness1.jpg', 'Delhi'),
(45, 'Morning workout routine', 'Video', 'fitness2.mp4', 'Delhi'),

(46, 'Best homemade pasta 🍝', 'Image', 'food1.jpg', 'Mumbai'),
(46, 'Street food review 🌮', 'Video', 'food2.mp4', 'Mumbai'),

(47, 'Top 5 Python Tips 🐍', 'Image', 'tech1.jpg', 'Bangalore'),
(47, 'AI is changing everything', 'Video', 'tech2.mp4', 'Bangalore'),

(48, 'Beautiful waterfall 💚', 'Image', 'nature1.jpg', 'Kerala'),
(48, 'Mountain hiking day', 'Image', 'nature2.jpg', 'Himachal');
-- ==========================================
-- Additional Posts (Users 49–53)
-- ==========================================

INSERT INTO Posts
(UserID, Caption, ContentType, MediaURL, Location)
VALUES

-- User 49 (Nature)
(49,'Peace begins in nature 🌿','Image','nature3.jpg','Rishikesh'),
(49,'Sunset by the river 🌅','Image','nature4.jpg','Haridwar'),

-- User 50 (Coding)
(50,'Python automation project 🐍','Image','coding1.jpg','Delhi'),
(50,'Learning SQL JOINs today 💻','Image','coding2.jpg','Delhi'),

-- User 51 (Quotes)
(51,'Success comes with consistency ✨','Image','quote1.jpg','India'),
(51,'Dream big. Start small.','Image','quote2.jpg','India'),

-- User 52 (Fashion)
(52,'Weekend outfit check 👗','Image','fashion1.jpg','Mumbai'),
(52,'Street fashion vibes 😎','Image','fashion2.jpg','Mumbai'),

-- User 53 (Photography)
(53,'Golden hour photography 📸','Image','photo1.jpg','Jaipur'),
(53,'Night city lights ✨','Image','photo2.jpg','Delhi');
-- ==========================
-- Insert Followers
-- ==========================

INSERT INTO Followers
(UserID, FollowerUserID)
VALUES
(1,2),
(1,3),
(1,4),
(2,1),
(2,5),
(2,6),
(3,1),
(3,7),
(3,8),
(4,2),
(4,9),
(5,1),
(5,10),
(6,2),
(6,11),
(7,3),
(7,12),
(8,4),
(8,13),
(9,5),
(9,14),
(10,6),
(10,15),
(11,7),
(11,16),
(12,8),
(12,17),
(13,9),
(13,18),
(14,10),
(14,19),
(15,11),
(15,20),
(16,12),
(17,13),
(18,14),
(19,15),
(20,16);
INSERT INTO Followers (UserID, FollowerUserID)
VALUES

(44,48),
(44,49),

(45,47),
(45,50),

(46,48),
(46,51),

(47,48),
(47,52),

(48,53),

(49,44),
(49,45),
(49,53),

(50,44),
(50,47),
(50,53),

(51,44),
(51,48),
(51,49),

(52,44),
(52,45),
(52,46),

(53,44),
(53,45),
(53,47),
(53,48);
-- ==========================
-- Insert Likes
-- ==========================

INSERT INTO Likes
(PostID, UserID)
VALUES
(1,2),
(1,3),
(1,4),
(2,1),
(2,5),
(2,6),
(3,1),
(3,7),
(3,8),
(4,2),
(4,9),
(5,1),
(5,10),
(6,2),
(6,11),
(7,3),
(7,12),
(8,4),
(8,13),
(9,5),
(9,14),
(10,6),
(10,15),
(11,7),
(11,16),
(12,8),
(12,17),
(13,9),
(13,18),
(14,10),
(14,19),
(15,11),
(15,20),
(16,12),
(17,13),
(18,14),
(19,15),
(20,16),
(1,17),
(2,18),
(3,19),
(4,20),
(5,2),
(6,3),
(7,4),
(8,5),
(9,6),
(10,7),
(11,8),
(12,9);
INSERT INTO Likes (PostID, UserID)
VALUES
-- Post 25 (User 44)
(25,44),(25,45),(25,46),(25,47),(25,48),

-- Post 26 (User 44)
(26,44),(26,45),(26,47),(26,48),

-- Post 27 (User 45)
(27,45),(27,44),(27,46),(27,47),

-- Post 28 (User 45)
(28,45),(28,46),(28,48),

-- Post 29 (User 46)
(29,46),(29,44),(29,45),(29,47),(29,48),

-- Post 30 (User 46)
(30,46),(30,45),(30,48),

-- Post 31 (User 47)
(31,47),(31,44),(31,45),(31,46),

-- Post 32 (User 47)
(32,47),(32,44),(32,48),

-- Post 33 (User 48)
(33,48),(33,44),(33,45),(33,46),

-- Post 34 (User 48)
(34,48),(34,45),(34,47);
-- ==========================
-- Insert Comments
-- ==========================

INSERT INTO Comments
(PostID, UserID, CommentText)
VALUES
(1,2,'Amazing post!'),
(1,3,'Keep it up!'),
(2,1,'Beautiful picture'),
(2,5,'Love this!'),
(3,4,'Nice work!'),
(3,6,'Very informative.'),
(4,2,'Awesome!'),
(4,7,'Looking great!'),
(5,8,'Wonderful view'),
(5,9,'Fantastic!'),
(6,10,'Where is this place?'),
(6,11,'Looks amazing!'),
(7,12,'Yummy!'),
(7,13,'Now I am hungry.'),
(8,14,'Interesting read.'),
(8,15,'Thanks for sharing.'),
(9,16,'Tech is awesome!'),
(9,17,'Cannot wait to try this.'),
(10,18,'Beautiful artwork.'),
(10,19,'Super creative!'),
(11,20,'Well played.'),
(12,1,'Nice design!'),
(13,2,'Love this music.'),
(14,3,'Very useful SQL tip!'),
(15,4,'Business goals.'),
(16,5,'Great photography.'),
(17,6,'Gym motivation.'),
(18,7,'Looking stylish.'),
(19,8,'Go team!'),
(20,9,'Have a safe trip.');
-- Cmment of owner on their own post
INSERT INTO Comments
(PostID, UserID, CommentText)
VALUES
(1, 1, 'My own post!');
-- ==========================================
-- Comments for new users' posts
-- ==========================================

INSERT INTO Comments (PostID, UserID, CommentText)
VALUES

(25,45,'Amazing view!'),
(25,46,'Beautiful place!'),
(25,44,'Thanks everyone'),

(26,47,'Road trips are the best!'),
(26,48,'Looks awesome'),

(27,44,'Keep grinding'),
(27,46,'Nice workout!'),
(27,45,'Never skip leg day'),

(28,47,'Great routine!'),
(28,48,'Very motivating!'),

(29,44,'Looks delicious'),
(29,45,'Recipe please!'),
(29,46,'Glad you liked it!'),

(30,47,'Street food is the best!'),
(30,48,'Now I am hungry'),

(31,44,'Very useful tips.'),
(31,46,'Thanks for sharing!'),

(32,45,'AI is the future'),
(32,47,'Completely agree!'),

(33,44,'Beautiful capture'),
(33,45,'Nature is amazing!'),

(34,46,'I would love to visit there.'),
(34,48,'Thanks everyone');
-- ==========================================
-- Insert Stories
-- ==========================================

INSERT INTO Stories
(UserID, MediaType, MediaURL, ExpiryDate)
VALUES
(1,'Image','stories/story1.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(2,'Image','stories/story2.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(3,'Video','stories/story3.mp4',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(4,'Image','stories/story4.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(5,'Video','stories/story5.mp4',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(6,'Image','stories/story6.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(7,'Image','stories/story7.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(8,'Video','stories/story8.mp4',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(9,'Image','stories/story9.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(10,'Image','stories/story10.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(11,'Video','stories/story11.mp4',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(12,'Image','stories/story12.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(13,'Image','stories/story13.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(14,'Video','stories/story14.mp4',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(15,'Image','stories/story15.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(16,'Image','stories/story16.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(17,'Video','stories/story17.mp4',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(18,'Image','stories/story18.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(19,'Image','stories/story19.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(20,'Video','stories/story20.mp4',DATE_ADD(NOW(),INTERVAL 24 HOUR));
-- ==================================================
-- ADDDING MORE STORIES =====
-- ===================================================
INSERT INTO Stories
(UserID, MediaType, MediaURL, ExpiryDate)
VALUES
(44,'Image','stories/story21.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(45,'Video','stories/story22.mp4',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(46,'Image','stories/story23.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(47,'Image','stories/story24.jpg',DATE_ADD(NOW(),INTERVAL 24 HOUR)),
(48,'Video','stories/story25.mp4',DATE_ADD(NOW(),INTERVAL 24 HOUR));
-- ==========================================
-- Insert Messages
-- ==========================================

INSERT INTO Messages
(SenderID, ReceiverID, MessageText)
VALUES
(1,2,'Hi Emma, how are you?'),
(2,1,'I am good, thanks!'),
(3,4,'Are you joining the meeting today?'),
(4,3,'Yes, I will be there.'),
(5,6,'Lets plan a trip this weekend.'),
(6,5,'Sounds great!'),
(7,8,'Did you watch the match yesterday?'),
(8,7,'Yes, it was amazing!'),
(9,10,'Can you review my project?'),
(10,9,'Sure, I will check it tonight.'),
(11,12,'Happy Birthday!'),
(12,11,'Thank you so much!'),
(13,14,'Are you free tomorrow?'),
(14,13,'Yes, after 5 PM.'),
(15,16,'Lets catch up soon.'),
(16,15,'Definitely!'),
(17,18,'Nice post today!'),
(18,17,'Thank you!'),
(19,20,'Good luck for your interview!'),
(20,19,'Thanks, I appreciate it!');

-- ==========================================
-- Insert Hashtags
-- ==========================================

INSERT INTO Hashtags (HashtagName)
VALUES
('SQL'),
('DataAnalytics'),
('Coding'),
('Technology'),
('AI'),
('MachineLearning'),
('Python'),
('MySQL'),
('PowerBI'),
('BusinessIntelligence'),
('Travel'),
('Photography'),
('Fitness'),
('Food'),
('Music'),
('Nature'),
('Sports'),
('Education'),
('Career'),
('Programming');
-- ==========================================
-- Insert PostHashtags
-- ==========================================

INSERT INTO PostHashtags
(PostID, HashtagID)
VALUES
(1,1),
(1,3),
(1,8),
(2,11),
(2,12),
(3,3),
(3,7),
(4,13),
(5,16),
(6,11),
(7,14),
(8,18),
(9,4),
(9,5),
(9,6),
(10,12),
(11,17),
(12,9),
(12,10),
(13,15),
(14,2),
(14,18),
(15,10),
(16,12),
(16,16),
(17,13),
(18,12),
(19,17),
(20,11),
(20,19);
-- ==========================================
-- Hashtags for New Posts
-- ==========================================

INSERT INTO PostHashtags (PostID, HashtagID)
VALUES

-- User 44 (Travel)
(25,1),   -- travel
(25,16),  -- mountains
(26,1),
(26,19),  -- vacation

-- User 45 (Fitness)
(27,13),  -- fitness
(28,13),

-- User 46 (Food)
(29,14),  -- food
(30,14),

-- User 47 (Coding)
(31,3),   -- coding
(31,5),   -- sql
(32,4),   -- python
(32,6),   -- ai

-- User 48 (Nature)
(33,2),   -- nature
(33,16),  -- mountains
(34,2),

-- User 49 (Nature)
(35,2),
(36,19),

-- User 50 (Coding)
(37,3),
(37,4),
(38,5),

-- User 51 (Quotes)
(39,8),   -- motivation
(40,8),

-- User 52 (Fashion/Lifestyle)
(41,12),  -- lifestyle
(42,12),

-- User 53 (Photography)
(43,11),  -- photography
(44,11);
-- ==========================================
-- Insert Notifications
-- ==========================================

INSERT INTO Notifications
(UserID, Message)
VALUES
(1,'Emma liked your post.'),
(2,'Ashutosh started following you.'),
(3,'Sophia commented on your post.'),
(4,'David liked your reel.'),
(5,'Liam started following you.'),
(6,'Olivia commented on your photo.'),
(7,'You have a new message from Isabella.'),
(8,'Your story received 10 views.'),
(9,'Michael liked your post.'),
(10,'Emily mentioned you in a comment.'),
(11,'Aarav followed you.'),
(12,'Priya liked your post.'),
(13,'Daniel sent you a message.'),
(14,'Lucas commented on your post.'),
(15,'Charlotte started following you.'),
(16,'Your post reached 100 likes.'),
(17,'New follower: Mia.'),
(18,'Your story expires in 1 hour.'),
(19,'Someone mentioned you in a comment.'),
(20,'Welcome to Instagram Analytics!');

-- ==========================================
-- Insert Notifications
-- ==========================================
INSERT INTO SavedPosts
(UserID, PostID)
VALUES
(1,2),
(2,5),
(3,1),
(4,8),
(5,10),
(6,3),
(7,4),
(8,6),
(9,7),
(10,9),
(11,11),
(12,12),
(13,14),
(14,15),
(15,13),
(16,18),
(17,17),
(18,16),
(19,20),
(20,19),
(1,5),
(2,6),
(3,8),
(4,10),
(5,1);
-- ==========================================
-- Additional Saved Posts (New Users)
-- ==========================================

INSERT INTO SavedPosts (UserID, PostID)
VALUES

(44,29),
(44,31),

(45,25),
(45,33),

(46,26),
(46,35),

(47,29),
(47,37),

(48,31),
(48,39),

(49,25),
(49,41),

(50,27),
(50,43),

(51,30),
(51,44),

(52,32),
(52,35),

(53,33),
(53,36);
-- ==========================================
-- Insert PostViews
-- ==========================================

INSERT INTO PostViews
(PostID, UserID)
VALUES
(1,2),
(1,3),
(1,4),
(1,5),
(2,1),
(2,3),
(2,6),
(3,5),
(3,7),
(3,8),
(4,2),
(4,9),
(5,10),
(5,11),
(6,12),
(6,13),
(7,14),
(7,15),
(8,16),
(8,17),
(9,18),
(9,19),
(10,20),
(10,1),
(11,2),
(11,3),
(12,4),
(12,5),
(13,6),
(13,7),
(14,8),
(14,9),
(15,10),
(15,11),
(16,12),
(16,13),
(17,14),
(18,15),
(19,16),
(20,17),
(20,18),
(19,19),
(18,20),
(17,1),
(16,2),
(15,3),
(14,4),
(13,5),
(12,6),
(11,7);