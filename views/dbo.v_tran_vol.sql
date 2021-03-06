/*****************************************************************************************************************
NAME:    dbo.v_tran_vol
PURPOSE: Create the dbo.v_tran_vol

SUPPORT: Bruno Agostinho

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       07/25/2020   BAGOSTINHO      1. Built this view


RUNTIME: 
1 min

NOTES: 
The idea is that a small number of load Product Detail Codes were found in more than one source system. 
When we observe these N:N relationships during the recent past the count of Accounts is how we can resolve them.

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/
USE [DFNB2]
GO

/****** Object:  View [dbo].[v_tran_vol]    Script Date: 7/26/2020 2:46:40 PM ******/
DROP VIEW [dbo].[v_tran_vol]
GO

/****** Object:  View [dbo].[v_tran_vol]    Script Date: 7/26/2020 2:46:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_tran_vol]
AS
(
    SELECT bd.[branch_code], 
           ttd.[tran_type_desc], 
           COUNT(tf.[tran_date]) AS number_of_tran
    FROM [dbo].[t_tran_fact] AS tf
         LEFT JOIN [dbo].[t_branch_dim] AS bd ON tf.branch_id = bd.branch_id
         JOIN [dbo].[t_tran_type_dim] AS ttd ON tf.tran_type_id = ttd.tran_type_id
  WHERE DATEPART(year, tf.[tran_date]) = 2019
    GROUP BY bd.[branch_code], 
             ttd.[tran_type_desc], 
             DATEPART(year, tf.[tran_date])
);
GO


