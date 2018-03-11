CREATE TABLE [dbo].[EMPLOYEE](
	[Fname] [varchar](15) NOT NULL,
	[Mname] [varchar](15) NULL,
	[Lname] [varchar](15) NOT NULL,
	[ID] [int] NOT NULL,
	[Title] [varchar](30) NULL,
	[Hire_Date] [date] NULL,
	[Street] [varchar](25) NULL,
	[City] [varchar](10) NULL,
	[Zip] [varchar](5) NULL,
	[State] [varchar](20) NULL,
	[Email] [varchar](30) NULL,
	[Phone#] [int] NULL,
	[Gender] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE CUSTOMER(
	ID INT NOT NULL UNIQUE,
	Fname VARCHAR(30) NOT NULL,
	Mname VARCHAR(30),
	Lname VARCHAR(30) NOT NULL,
	StreetAddress VARCHAR(50) NOT NULL,
	CityAddress VARCHAR(30) NOT NULL,
	ZipAddress int NOT NULL,
	StateAddress VARCHAR(20) NOT NULL,
	Phone VARCHAR(20) NOT NULL,
	Email VARCHAR(50),
	MembershipType VARCHAR(20),
	ExpirationDate DATE,
	PRIMARY KEY(ID)
);
CREATE TABLE STORE(
ID              		int             		NOT NULL       	UNIQUE,
Name		varchar(25),
Type            	varchar(15),
Manager         	int,
Manager_date   	date);

ALTER TABLE STORE
ADD CONSTRAINT FK_ManagerStore
FOREIGN KEY (Manager) REFERENCES Employee(ID);

ALTER TABLE STORE
ADD PRIMARY KEY (ID);

ALTER TABLE STORE
ADD CHECK (Type IN('Ticket_booth', 'Gift_shop', 'Restaurant'));

CREATE TABLE [dbo].[ATTRACTION](
	[ID] [int] NOT NULL,
	[Name] [varchar](30) NULL,
	[Description] [varchar](50) NULL,
	[Open_time] [time](7) NULL,
	[Close_time] [time](7) NULL,
	[Days] [varchar](20) NULL,
	[Open_closed] [varchar](6) NULL,
	[Open_closed_date] [date] NULL,
	[Manager_date] [date] NULL,
	[Manager] [int] NULL,
 CONSTRAINT [PK_ATTRACTION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ATTRACTION]  WITH CHECK ADD  CONSTRAINT [FK_ManagerAttraction] FOREIGN KEY([Manager])
REFERENCES [dbo].[EMPLOYEE] ([ID])
GO

ALTER TABLE [dbo].[ATTRACTION] CHECK CONSTRAINT [FK_ManagerAttraction]
GO

ALTER TABLE [dbo].[ATTRACTION]  WITH CHECK ADD CHECK  (([Open_closed]='Closed' OR [Open_closed]='Open'))
GO
CREATE TABLE [dbo].[ANIMAL](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Species] [nvarchar](50) NULL,
	[Taxology] [nvarchar](50) NULL,
	[Birth Location] [nvarchar](50) NULL,
	[Birth Date] [date] NULL,
	[Status] [nchar](10) NULL,
	[Status Date] [date] NULL,
	[Health] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[Height] [decimal](18, 0) NULL,
	[Weight] [decimal](18, 0) NULL,
	[Attraction] [int] NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ANIMAL]  WITH CHECK ADD  CONSTRAINT [FK_AnimalHomeID] FOREIGN KEY([Attraction])
REFERENCES [dbo].[ATTRACTION] ([ID])
GO

ALTER TABLE [dbo].[ANIMAL] CHECK CONSTRAINT [FK_AnimalHomeID]
GO
CREATE TABLE PURCHASES(
receiptNum INTEGER PRIMARY KEY,
time TIME,
amount MONEY,
payOption varchar(20),
Date DATE
);
CREATE TABLE PRODUCT(
	ID INT NOT NULL,
	Name VARCHAR(15),
	Quantity INT,
	OnOrder INT,
	Price DECIMAL NOT NULL,
	Description VARCHAR(30),
	PRIMARY KEY (ID)
);
CREATE TABLE PURCHASE_INFO(
Price  MONEY,
 	Quantity INT,
 	receiptNum INT
    	REFERENCES purchases(receiptNum) ON DELETE CASCADE,
 	ID INT PRIMARY KEY REFERENCES
    	Product(ID) ON DELETE CASCADE,
);
