CREATE TABLE [dbo].[Customers](
[Id] [int] IDENTITY(1,1) NOT NULL,
[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED
([Id] ASC)ON [PRIMARY]
)

 
CREATE TABLE [Orders](
[ID] [int] IDENTITY(1,1) NOT NULL,
[CustomerId] [int] NOT NULL
) ON [PRIMARY]

ALTER TABLE [Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers]
FOREIGN KEY([CustomerId])
REFERENCES [Customers] ([Id])

INSERT [Customers] VALUES ('Max');
INSERT [Customers] VALUES ('Pavel');
INSERT [Customers] VALUES ('Ivan');
INSERT [Customers] VALUES ('Leonid');
 

INSERT [Orders] VALUES (2);
INSERT [Orders] VALUES (4);

SELECT  [Name] as [Customers]
FROM  [Customers]
WHERE   ([Id] NOT IN  (SELECT  [CustomerId]   FROM  [Orders]))