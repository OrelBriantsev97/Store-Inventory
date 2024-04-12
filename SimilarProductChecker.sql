-- Create ProductBundle table
CREATE TABLE ProductBundle (
    ProductId INT IDENTITY(1,1) PRIMARY KEY,
    ProductOldId INT,
    ProductNumber VARCHAR(10),
    ProductType VARCHAR(10),
    ProductTypeId INT,
    MachineActivity VARCHAR(10),
    ProductSubType VARCHAR(50),
    SubTypeId INT,
    DepartmentManager VARCHAR(50),
    DepartmentManagerId INT,
    SubTypeManager VARCHAR(50),
    SubTypeManagerId INT,
    ExpirationDate DATE
);

-- Insert 30 random products with expiration dates
INSERT INTO ProductBundle (ProductOldId, ProductNumber, ProductType, ProductTypeId, MachineActivity, ProductSubType, SubTypeId, DepartmentManager, DepartmentManagerId, SubTypeManager, SubTypeManagerId, ExpirationDate)
VALUES
-- 10 Dairy products
(12345, 'P000001D', 'Dairy', 1, 'DM', 'Yogurt', 1, 'Dairy Manager John', 1, 'Yogurt Manager Alice', 1, '2024-04-30'),
(12346, 'P000002D', 'Dairy', 1, 'DM', 'Cheese', 2, 'Dairy Manager John', 1, 'Cheese Manager Bob', 2, '2024-05-15'),
(12347, 'P000003D', 'Dairy', 1, 'DM', 'Milk', 3, 'Dairy Manager John', 1, 'Milk Manager Charlie', 3, '2024-05-20'),
(12348, 'P000004D', 'Dairy', 1, 'DM', 'Butter', 4, 'Dairy Manager John', 1, 'Butter Manager David', 4, '2024-06-10'),
(12349, 'P000005D', 'Dairy', 1, 'DM', 'Cream', 5, 'Dairy Manager John', 1, 'Cream Manager Eve', 5, '2024-06-15'),
(12350, 'P000006D', 'Dairy', 1, 'DM', 'Yogurt Drink', 6, 'Dairy Manager John', 1, 'Yogurt Drink Manager Frank', 6, '2024-07-01'),
(12351, 'P000007D', 'Dairy', 1, 'DM', 'Cheese Spread', 7, 'Dairy Manager John', 1, 'Cheese Spread Manager Grace', 7, '2024-07-10'),
(12352, 'P000008D', 'Dairy', 1, 'DM', 'Ice Cream', 8, 'Dairy Manager John', 1, 'Ice Cream Manager Henry', 8, '2024-07-20'),
(12353, 'P000009D', 'Dairy', 1, 'DM', 'Cottage Cheese', 9, 'Dairy Manager John', 1, 'Cottage Cheese Manager Irene', 9, '2024-08-05'),
(12354, 'P000010D', 'Dairy', 1, 'DM', 'Sour Cream', 10, 'Dairy Manager John', 1, 'Sour Cream Manager Jack', 10, '2024-08-15'),

-- 10 Fruit products
(12355, 'P000011F', 'Fruit', 2, 'FM', 'Apple', 11, 'Fruit Manager Kate', 2, 'Apple Manager Lily', 11, '2024-04-25'),
(12356, 'P000012F', 'Fruit', 2, 'FM', 'Banana', 12, 'Fruit Manager Kate', 2, 'Banana Manager Mike', 12, '2024-05-05'),
(12357, 'P000013F', 'Fruit', 2, 'FM', 'Orange', 13, 'Fruit Manager Kate', 2, 'Orange Manager Nancy', 13, '2024-05-10'),
(12358, 'P000014F', 'Fruit', 2, 'FM', 'Grape', 14, 'Fruit Manager Kate', 2, 'Grape Manager Oscar', 14, '2024-05-20'),
(12359, 'P000015F', 'Fruit', 2, 'FM', 'Strawberry', 15, 'Fruit Manager Kate', 2, 'Strawberry Manager Peter', 15, '2024-06-01'),
(12360, 'P000016F', 'Fruit', 2, 'FM', 'Pineapple', 16, 'Fruit Manager Kate', 2, 'Pineapple Manager Quinn', 16, '2024-06-10'),
(12361, 'P000017F', 'Fruit', 2, 'FM', 'Mango', 17, 'Fruit Manager Kate', 2, 'Mango Manager Rose', 17, '2024-06-20'),
(12362, 'P000018F', 'Fruit', 2, 'FM', 'Watermelon', 18, 'Fruit Manager Kate', 2, 'Watermelon Manager Sam', 18, '2024-06-25'),
(12363, 'P000019F', 'Fruit', 2, 'FM', 'Kiwi', 19, 'Fruit Manager Kate', 2, 'Kiwi Manager Tom', 19, '2024-07-05'),
(12364, 'P000020F', 'Fruit', 2, 'FM', 'Peach', 20, 'Fruit Manager Kate', 2, 'Peach Manager Vicky', 20, '2024-07-15'),

-- 10 Vegetable products
(12365, 'P000021V', 'Vegetable', 3, 'VM', 'Carrot', 21, 'Vegetable Manager Will', 3, 'Carrot Manager Xander', 21, '2024-04-30'),
(12366, 'P000022V', 'Vegetable', 3, 'VM', 'Tomato', 22, 'Vegetable Manager Will', 3, 'Tomato Manager Yolanda', 22, '2024-05-10'),
(12367, 'P000023V', 'Vegetable', 3, 'VM', 'Broccoli', 23, 'Vegetable Manager Will', 3, 'Broccoli Manager Zoe', 23, '2024-05-15'),
(12368, 'P000024V', 'Vegetable', 3, 'VM', 'Lettuce', 24, 'Vegetable Manager Will', 3, 'Lettuce Manager Aaron', 24, '2024-05-25'),
(12369, 'P000025V', 'Vegetable', 3, 'VM', 'Bell Pepper', 25, 'Vegetable Manager Will', 3, 'Bell Pepper Manager Bella', 25, '2024-06-05'),
(12370, 'P000026V', 'Vegetable', 3, 'VM', 'Cucumber', 26, 'Vegetable Manager Will', 3, 'Cucumber Manager Charlie', 26, '2024-06-10'),
(12371, 'P000027V', 'Vegetable', 3, 'VM', 'Onion', 27, 'Vegetable Manager Will', 3, 'Onion Manager Danny', 27, '2024-06-20'),
(12372, 'P000028V', 'Vegetable', 3, 'VM', 'Garlic', 28, 'Vegetable Manager Will', 3, 'Garlic Manager Emma', 28, '2024-06-25'),
(12373, 'P000029V', 'Vegetable', 3, 'VM', 'Spinach', 29, 'Vegetable Manager Will', 3, 'Spinach Manager Felix', 29, '2024-07-05'),
(12374, 'P000030V', 'Vegetable', 3, 'VM', 'Cabbage', 30, 'Vegetable Manager Will', 3, 'Cabbage Manager Gina', 30, '2024-07-15');
