CREATE VIEW dbo.vwStudentCourseDepartment
AS
SELECT p.PersonID, p.LastName, p.FirstName, p.HireDate, p.EnrollmentDate, p.Discriminator, c.CourseID, c.Title, c.Credits, c.DepartmentID, d.Name, d.Budget, d.StartDate, d.Administrator, sg.Grade, oc.Location, oc.Days, ol.URL
FROM     dbo.Person AS p LEFT OUTER JOIN
                  dbo.CourseInstructor AS ci ON ci.PersonID = p.PersonID LEFT OUTER JOIN
                  dbo.Course AS c ON c.CourseID = ci.CourseID LEFT OUTER JOIN
                  dbo.Department AS d ON d.DepartmentID = c.DepartmentID LEFT OUTER JOIN
                  dbo.StudentGrade AS sg ON sg.StudentID = p.PersonID LEFT OUTER JOIN
                  dbo.OnsiteCourse AS oc ON c.CourseID = oc.CourseID LEFT OUTER JOIN
                  dbo.OnlineCourse AS ol ON c.CourseID = ol.CourseID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 264
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 255
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ci"
            Begin Extent = 
               Top = 7
               Left = 537
               Bottom = 257
               Right = 731
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 7
               Left = 779
               Bottom = 256
               Right = 973
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sg"
            Begin Extent = 
               Top = 7
               Left = 1021
               Bottom = 254
               Right = 1215
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "oc"
            Begin Extent = 
               Top = 7
               Left = 1263
               Bottom = 170
               Right = 1457
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ol"
            Begin Extent = 
               Top = 175
               Left = 1263
               Bottom = 294
               Right = 1457
            End
            DisplayFlags = 280
            TopColumn = 0
         E', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwStudentCourseDepartment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'nd
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 19
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwStudentCourseDepartment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwStudentCourseDepartment';

