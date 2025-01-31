-- list all the books that falls under the categories fantasy, nonfiction and fiction
SELECT b.title, c.category_name
FROM book b
JOIN category c
ON b.category_id = c.category_id
WHERE c.category_name IN ('Fantasy', 'Non-Fiction', 'Fiction');


-- Write a query to find the top 5 members who have borrowed the most books
select m.first_name, m.last_name, count(*) as borrowed_books_count
from member m
inner join transactionlog t
on m.member_id = t.member_id
where t.transaction_type = 'Borrow'
group by m.member_id
order by borrowed_books_count desc 
LIMIT 5;


--  Write a SQL query to find the total number of times each book has been borrowed, along with the transaction dates, ordered by the total borrow count in descending order.
select b.title, t.transaction_date, count(*) over (partition by b.book_id) as total_borrowed_count
from Book b
join transactionlog t
on b.book_id = t.book_id
where t.transaction_type = 'Borrow'
order by total_borrowed_count DESC;


-- List the members who have returned books late along with the fine amount.
select m.first_name, m.last_name, t.fine_amount
from member m
join transactionlog t
on m.member_id = t.member_id
where t.fine_amount is not null and t.fine_amount <> 0;


-- Find the books that have never been borrowed
select b.title
from Book b
left join transactionlog t
on b.book_id = t.book_id
where t.book_id is null;

--  Find the books that have the same genre as another book
select b1.title as "Book 1 Title", b2.title as "Book 2 Title", c.category_name
from book b1
join book b2 on b1.book_id <> b2.book_id
join category c on b1.category_id = c.category_id and b2.category_id = c.category_id;



-- Find all book titles in the Book table that contain the word "Harry" and "Game" anywhere in the title
select b.title
from Book b
where b.title like '%Harry%' or b.title like '%Game%';


-- Write a SQL query to categorize books based on their genres and count how many books belong to each genre.
select c.category_name, count(*) as "total_book_count"
from book  b
inner join category c
on b.category_id = c.category_id
group by b.category_id;


-- Count the number of books each author has written
select a.first_name, a.last_name, count(*) as number_of_books
from author a 
join bookauthor b
on a.author_id = b.author_id
group by a.author_id;


-- Write a SQL query to find books with limited availability (less than 5 copies) and categorize them based on their category.
with book_categories as ( 
    select b.title, b.copies_available, c.category_name, 
        case when c.category_name='Fiction' then 'Limited stock in Fiction category'
        when c.category_name='Non-Fiction' then 'Limited stock in NonFiction category'
        when c.category_name='Science Fiction' then 'Limited stock in ScienceFiction category'
        when c.category_name='Fantasy' then 'Limited stock in Fantasy category'
        when c.category_name='Biography' then 'Limited stock in Biography category'
        when c.category_name='History' then 'Limited stock in History category'
        when c.category_name='Technology' then 'Limited stock in Technology category'
        when c.category_name='Self-help' then 'Limited stock in Self Help category'
        when c.category_name='Health' then 'Limited stock in Health category'
        else  'Limited stock in Romance category'
        end as stock_status
    from book b
    inner join category c on b.category_id = c.category_id
)

select title, copies_available, category_name
from book_categories
where copies_available < 5;


