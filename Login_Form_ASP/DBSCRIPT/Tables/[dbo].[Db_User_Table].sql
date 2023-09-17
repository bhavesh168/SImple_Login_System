/****** Object:  Table [dbo].[Db_User_Table]    Script Date: 17-09-2023 12:24:41 PM ******/
/****** 

	Developed By : Bhavesh D. Rathod 
	Designation: Jr. NET Developer
	Linkedin Profile: @bhaveshdrathod01 (https://www.linkedin.com/in/bhaveshdrathod01)
******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Db_User_Table](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

