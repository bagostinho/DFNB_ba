USE [DFNB2]
GO

/****** Object:  Table [dbo].[t_tran_type_dim]    Script Date: 7/26/2020 1:42:10 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_tran_type_dim]') AND type in (N'U'))
DROP TABLE [dbo].[t_tran_type_dim]
GO

/****** Object:  Table [dbo].[t_tran_type_dim]    Script Date: 7/26/2020 1:42:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_tran_type_dim](
	[tran_type_id] [int] NOT NULL,
	[tran_type_code] [char](10) NOT NULL,
	[tran_type_desc] [char](100) NOT NULL,
	[tran_fee_prct] [char](10) NOT NULL,
	[cur_cust_req_ind] [char](10) NOT NULL,
 CONSTRAINT [PK_t_tran_type_dim] PRIMARY KEY CLUSTERED 
(
	[tran_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


