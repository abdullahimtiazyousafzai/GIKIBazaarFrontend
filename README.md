## GIKI BAZAR

A semester project for Database Management Systems. This is an online buy/sell app for GIK Institute.

## Entity Relation Diagram:

### Entities:

1. **Users**
   - Attributes:
     - phone_number: INT (Primary Key) 
     - email: VARCHAR (NOT NULL, UNIQUE)
     - username: VARCHAR (NOT NULL, UNIQUE)
     - profile_pic: BYTEA/BLOB

2. **Products**
   - Attributes:
     - prod_id: INT (Primary Key)
     - phone_number: INT (Foreign Key)
     - prod_title: VARCHAR (NOT NULL)
     - prod_description: VARCHAR (NOT NULL)
     - prod_price: INT (NOT NULL)
     - contact_note: VARCHAR
     - product_pic: BYTEA/BLOB (NOT NULL)
     - prod_available_campus: BOOLEAN (NOT NULL)
     - upload1-date DATE (NOT NULL)

### Relationships:
1)Buy/Sell
- **User <-> Product**
  - User to product: Optional (zero-to-Many)
  - Product to User: Mandatory (one-to-one)

## Figma Design
![image](https://github.com/abdullahimtiazyousafzai/gikibazar/assets/126229662/2cdf1fa5-1f43-47be-87b2-bc4080162898)

## Flutter Code
Flutter code is uploaded in the flutter/ directory.
