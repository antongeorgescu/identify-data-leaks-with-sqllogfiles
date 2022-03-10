CREATE VIEW db_owner.vwAllCourses
AS
SELECT p.PersonID, p.LastName, p.FirstName, NULL AS HireDate, p.EnrollmentDate, p.Discriminator, c.CourseID, c.Title, c.Credits, sg.Grade, NULL AS Department, NULL AS Budget,NULL AS StartDate, oc.Location, oc.Days, ol.URL
FROM     dbo.Person AS p LEFT OUTER JOIN
                  dbo.StudentGrade AS sg ON sg.StudentID = p.PersonID AND sg.StudentID = p.PersonID RIGHT OUTER JOIN
                  dbo.Course AS c ON sg.CourseID = c.CourseID LEFT OUTER JOIN
                  dbo.OnsiteCourse AS oc ON c.CourseID = oc.CourseID LEFT OUTER JOIN
                  dbo.OnlineCourse AS ol ON c.CourseID = ol.CourseID
WHERE  (p.Discriminator = 'Student')
UNION
SELECT p.PersonID, p.LastName, p.FirstName, p.HireDate, NULL AS EnrollmentDate,p.Discriminator, c.CourseID, c.Title, c.Credits, NULL AS Grade, d.Name AS Department, d.Budget, d.StartDate, oc.Location, oc.Days, ol.URL
FROM     dbo.Course AS c RIGHT OUTER JOIN
                  dbo.Person AS p LEFT OUTER JOIN
                  dbo.CourseInstructor AS ci ON ci.PersonID = p.PersonID ON c.CourseID = ci.CourseID LEFT OUTER JOIN
                  dbo.Department AS d ON d.DepartmentID = c.DepartmentID LEFT OUTER JOIN
                  dbo.OnsiteCourse AS oc ON c.CourseID = oc.CourseID LEFT OUTER JOIN
                  dbo.OnlineCourse AS ol ON c.CourseID = ol.CourseID
WHERE  (p.Discriminator = 'Instructor')

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
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
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
', @level0type = N'SCHEMA', @level0name = N'db_owner', @level1type = N'VIEW', @level1name = N'vwAllCourses';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'db_owner', @level1type = N'VIEW', @level1name = N'vwAllCourses';

