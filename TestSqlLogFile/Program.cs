using System;
using System.Data.SqlClient;

namespace TestSqlLogFile
{
    static class Program
    {
        static void Main(string[] args)
        {
            SqlConnection connection = null;
            try
            {
                connection = new SqlConnection("Data Source=STDLHVY5K13\\SQLEXPRESS;Integrated Security=True;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False;Database=StudentCourses");
                connection.Open();
                var insertQry = "INSERT INTO [dbo].[Department] ([DepartmentID],[Name],[Budget],[StartDate],[Administrator])";
                insertQry += " VALUES ";
                insertQry += "(16,'Physics',1000,'2022-05-12',1)";
                SqlCommand command = new SqlCommand(insertQry, connection);
                var rows = command.ExecuteNonQuery();
                connection.Close();
                Console.WriteLine($"Added #rows:{rows}");
                Console.ReadLine();

                
            }
            catch (Exception ex)
            {
                connection.Close();
                Console.WriteLine($"Error message:{ex.Message}");
                Console.WriteLine($"Inner Exception:{ex.InnerException}");
                Console.ReadLine();
            }
        }
    }
}
