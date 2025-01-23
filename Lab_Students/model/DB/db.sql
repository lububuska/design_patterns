CREATE TABLE students (
    id SERIAL PRIMARY KEY,           
    surname VARCHAR(100) NOT NULL,   
    name VARCHAR(100) NOT NULL,      
    fathername VARCHAR(100) NOT NULL,    
    tel VARCHAR(15) UNIQUE,      
    tg VARCHAR(50) UNIQUE,            
    email VARCHAR(255) UNIQUE,              
    git VARCHAR(255) UNIQUE,
    birthday BIGINT NOT NULL             
);