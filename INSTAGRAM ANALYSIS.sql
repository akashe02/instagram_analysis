CREATE DATABASE instagram_analysis;
USE instagram_analysis;
---- USERS
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    join_date DATE
);
---- POST
CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    user_id INT,
    content TEXT,
    post_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
---- LIKES
CREATE TABLE Likes (
    like_id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    like_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);
---- FOLLOWERS
CREATE TABLE Follows (
    follower_id INT,
    followee_id INT,
    follow_date DATETIME,
    PRIMARY KEY (follower_id, followee_id),
    FOREIGN KEY (follower_id) REFERENCES Users(user_id),
    FOREIGN KEY (followee_id) REFERENCES Users(user_id)
);
---- COMMENTS
CREATE TABLE Comments (
    comment_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    comment_text TEXT,
    comment_date DATETIME,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
---- INSERT DATA USERS
INSERT INTO Users (user_id, username, email, join_date) VALUES
(1, 'alice', 'alice@example.com', '2023-01-10'),
(2, 'bob', 'bob@example.com', '2023-01-15'),
(3, 'carol', 'carol@example.com', '2023-02-01'),
(4, 'dave', 'dave@example.com', '2023-02-05'),
(5, 'eve', 'eve@example.com', '2023-02-10'),
(6, 'frank', 'frank@example.com', '2023-02-20'),
(7, 'grace', 'grace@example.com', '2023-03-01'),
(8, 'heidi', 'heidi@example.com', '2023-03-05'),
(9, 'ivan', 'ivan@example.com', '2023-03-10'),
(10, 'judy', 'judy@example.com', '2023-03-15'),
(11, 'kate', 'kate@example.com', '2023-03-20'),
(12, 'leo', 'leo@example.com', '2023-03-25'),
(13, 'mallory', 'mallory@example.com', '2023-04-01'),
(14, 'nancy', 'nancy@example.com', '2023-04-05'),
(15, 'oscar', 'oscar@example.com', '2023-04-10'),
(16, 'peggy', 'peggy@example.com', '2023-04-15'),
(17, 'quinn', 'quinn@example.com', '2023-04-20'),
(18, 'ruth', 'ruth@example.com', '2023-04-25'),
(19, 'sybil', 'sybil@example.com', '2023-05-01'),
(20, 'trent', 'trent@example.com', '2023-05-05');
---- INSERT DATA POST
INSERT INTO Posts (post_id, user_id, content, post_date) VALUES
(1, 1, 'First post!', '2023-04-01 10:00'),
(2, 2, 'Hello world!', '2023-04-02 11:00'),
(3, 3, 'Enjoying the sunshine', '2023-04-02 12:00'),
(4, 4, 'Reading a new book', '2023-04-03 09:30'),
(5, 5, 'Coffee time', '2023-04-03 14:00'),
(6, 6, 'Workout session', '2023-04-04 08:00'),
(7, 7, 'Good morning!', '2023-04-04 09:15'),
(8, 8, 'Writing some code', '2023-04-05 10:30'),
(9, 9, 'Weekend vibes', '2023-04-06 11:45'),
(10, 10, 'Trying out SQL', '2023-04-07 15:00'),
(11, 11, 'Happy Friday!', '2023-04-07 18:00'),
(12, 12, 'Just chilling', '2023-04-08 13:20'),
(13, 13, 'Learning Python', '2023-04-09 10:10'),
(14, 14, 'Big news today', '2023-04-10 12:45'),
(15, 15, 'On a road trip', '2023-04-11 09:50'),
(16, 16, 'Movie night', '2023-04-12 20:00'),
(17, 17, 'Music time', '2023-04-13 16:35'),
(18, 18, 'Back to work', '2023-04-14 08:30'),
(19, 19, 'Lazy Sunday', '2023-04-15 11:15'),
(20, 20, 'Feeling productive', '2023-04-16 10:10');
---- INSERT DATA LIKES
INSERT INTO Likes (like_id, user_id, post_id, like_date) VALUES
(1, 2, 1, '2023-04-01 11:00'),
(2, 3, 1, '2023-04-01 11:30'),
(3, 4, 2, '2023-04-02 12:30'),
(4, 5, 3, '2023-04-02 13:00'),
(5, 6, 4, '2023-04-03 10:00'),
(6, 7, 5, '2023-04-03 14:15'),
(7, 8, 6, '2023-04-04 08:15'),
(8, 9, 7, '2023-04-04 10:00'),
(9, 10, 8, '2023-04-05 11:00'),
(10, 11, 9, '2023-04-06 12:00'),
(11, 12, 10, '2023-04-07 15:30'),
(12, 13, 11, '2023-04-07 18:30'),
(13, 14, 12, '2023-04-08 14:00'),
(14, 15, 13, '2023-04-09 11:00'),
(15, 16, 14, '2023-04-10 13:00'),
(16, 17, 15, '2023-04-11 10:00'),
(17, 18, 16, '2023-04-12 21:00'),
(18, 19, 17, '2023-04-13 17:00'),
(19, 20, 18, '2023-04-14 09:00'),
(20, 1, 19, '2023-04-15 12:00'),
(21, 2, 20, '2023-04-16 11:00'),
(22, 3, 15, '2023-04-16 11:30'),
(23, 4, 11, '2023-04-16 12:00'),
(24, 5, 1, '2023-04-16 12:30');
---- INSERT DATA COMMENTS
INSERT INTO Comments (comment_id, post_id, user_id, comment_text, comment_date) VALUES
(1, 1, 2, 'Nice post!', '2023-04-01 12:00'),
(2, 1, 3, 'I agree!', '2023-04-01 12:10'),
(3, 2, 4, 'Cool!', '2023-04-02 13:00'),
(4, 3, 5, 'Enjoy!', '2023-04-02 14:00'),
(5, 4, 6, 'Sounds good.', '2023-04-03 11:00'),
(6, 5, 7, 'Yummy!', '2023-04-03 15:00'),
(7, 6, 8, 'Healthy life!', '2023-04-04 09:00'),
(8, 7, 9, 'Good morning!', '2023-04-04 10:30'),
(9, 8, 10, 'Nice code!', '2023-04-05 11:30'),
(10, 9, 11, 'Enjoy!', '2023-04-06 12:30'),
(11, 10, 12, 'SQL is great!', '2023-04-07 15:45'),
(12, 11, 13, 'TGIF!', '2023-04-07 18:45'),
(13, 12, 14, 'Relax!', '2023-04-08 14:30'),
(14, 13, 15, 'Python rules!', '2023-04-09 11:30'),
(15, 14, 16, 'Tell us more!', '2023-04-10 13:15'),
(16, 15, 17, 'Drive safe!', '2023-04-11 10:15'),
(17, 16, 18, 'What movie?', '2023-04-12 21:15'),
(18, 17, 19, 'Love it!', '2023-04-13 17:15'),
(19, 18, 20, 'Work hard!', '2023-04-14 09:30'),
(20, 19, 1, 'Sunday vibes!', '2023-04-15 12:30');
---- INSERT DATA FOLLOWERS
INSERT INTO Follows (follower_id, followee_id, follow_date) VALUES
(1, 2, '2023-01-11'),
(1, 3, '2023-01-12'),
(2, 1, '2023-01-16'),
(2, 3, '2023-01-17'),
(3, 1, '2023-02-02'),
(3, 4, '2023-02-03'),
(4, 5, '2023-02-06'),
(5, 6, '2023-02-11'),
(6, 7, '2023-02-21'),
(7, 8, '2023-03-02'),
(8, 9, '2023-03-06'),
(9, 10, '2023-03-11'),
(10, 1, '2023-03-16'),
(11, 12, '2023-03-21'),
(12, 13, '2023-03-26'),
(13, 14, '2023-04-02'),
(14, 15, '2023-04-06'),
(15, 16, '2023-04-11'),
(16, 17, '2023-04-16'),
(17, 18, '2023-04-21'),
(18, 19, '2023-04-26'),
(19, 20, '2023-05-02'),
(20, 1, '2023-05-06'),
(5, 1, '2023-05-07'),
(6, 1, '2023-05-08');

---- ENGAGEMENT RATE PER POST
SELECT 
    p.post_id,
    u.username,
    COUNT(DISTINCT l.like_id) AS likes,
    COUNT(DISTINCT c.comment_id) AS comments,
    (COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id)) AS engagement_score
FROM Posts p
LEFT JOIN Likes l ON p.post_id = l.post_id
LEFT JOIN Comments c ON p.post_id = c.post_id
JOIN Users u ON p.user_id = u.user_id
GROUP BY p.post_id, u.username
ORDER BY engagement_score DESC
LIMIT 5;
---- TOP INFLUENCERS BY TOTAL ENGAGEMENT
SELECT 
    u.user_id,
    u.username,
    COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id) AS total_engagement
FROM Users u
JOIN Posts p ON u.user_id = p.user_id
LEFT JOIN Likes l ON p.post_id = l.post_id
LEFT JOIN Comments c ON p.post_id = c.post_id
GROUP BY u.user_id, u.username
ORDER BY total_engagement DESC
LIMIT 5;
----- MOST FOLLOWED USER
SELECT 
    u.user_id,
    u.username,
    COUNT(f.follower_id) AS followers
FROM Users u
LEFT JOIN Follows f ON u.user_id = f.followee_id
GROUP BY u.user_id, u.username
ORDER BY followers DESC
LIMIT 5;
---- Most Active Users (by number of posts, likes, comments)
SELECT 
    u.user_id,
    u.username,
    COUNT(DISTINCT p.post_id) AS post_count,
    COUNT(DISTINCT l.like_id) AS likes_given,
    COUNT(DISTINCT c.comment_id) AS comments_given
FROM Users u
LEFT JOIN Posts p ON u.user_id = p.user_id
LEFT JOIN Likes l ON u.user_id = l.user_id
LEFT JOIN Comments c ON u.user_id = c.user_id
GROUP BY u.user_id, u.username
ORDER BY post_count DESC, likes_given DESC, comments_given DESC;
---- Posts with Highest Comments
SELECT 
    p.post_id,
    u.username,
    p.content,
    COUNT(c.comment_id) AS comment_count
FROM Posts p
JOIN Users u ON p.user_id = u.user_id
LEFT JOIN Comments c ON p.post_id = c.post_id
GROUP BY p.post_id, u.username, p.content
ORDER BY comment_count DESC
LIMIT 5;
----- Daily New Users Joined
SELECT 
    join_date,
    COUNT(user_id) AS new_users
FROM Users
GROUP BY join_date
ORDER BY join_date;
---- Top 5 Users Who Like the Most
SELECT 
    u.user_id,
    u.username,
    COUNT(l.like_id) AS total_likes_given
FROM Users u
JOIN Likes l ON u.user_id = l.user_id
GROUP BY u.user_id, u.username
ORDER BY total_likes_given DESC
LIMIT 5;


