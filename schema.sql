-- Users Table
CREATE TABLE Users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    profile_picture TEXT,
    bio TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Books Table
CREATE TABLE Books (
    book_id VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    authors TEXT, -- Stored as a comma-separated list or JSON array
    published_date DATE,
    description TEXT,
    isbn_10 VARCHAR(10),
    isbn_13 VARCHAR(13),
    page_count INT,
    categories TEXT, -- Stored as a comma-separated list or JSON array
    thumbnail_url TEXT,
    language VARCHAR(10)
);

-- Posts Table
CREATE TABLE Posts (
    post_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES Users(user_id) ON DELETE CASCADE,
    book_id VARCHAR(255) REFERENCES Books(book_id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Comments Table
CREATE TABLE Comments (
    comment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    post_id UUID REFERENCES Posts(post_id) ON DELETE CASCADE,
    user_id UUID REFERENCES Users(user_id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- BookClubs Table
CREATE TABLE BookClubs (
    club_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- BookClubMemberships Table
CREATE TABLE BookClubMemberships (
    membership_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    club_id UUID REFERENCES BookClubs(club_id) ON DELETE CASCADE,
    user_id UUID REFERENCES Users(user_id) ON DELETE CASCADE,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trades Table
CREATE TABLE Trades (
    trade_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    book_id VARCHAR(255) REFERENCES Books(book_id) ON DELETE CASCADE,
    offered_by UUID REFERENCES Users(user_id) ON DELETE CASCADE,
    interested_users TEXT, -- Stored as a comma-separated list or JSON array
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
