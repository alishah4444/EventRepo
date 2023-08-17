using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class DBController
{
    string connection = ConfigurationManager.ConnectionStrings["ebsconnection"].ConnectionString;
    SqlConnection db = null;
    public DBController()
    {
        db = new SqlConnection(connection);
    }
    public SqlDataReader getSingleRecordById(string query, Dictionary<string, string> keyvaluepair = null)
    {
        if (db.State == System.Data.ConnectionState.Open)
        {
            db.Close();
        }
        db.Open();
        SqlCommand cmd = new SqlCommand(query, db);
        if (keyvaluepair != null)
        {
            foreach (var pair in keyvaluepair)
            {
                cmd.Parameters.AddWithValue(pair.Key, pair.Value);
            }
        }
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }
    public int CreateRecord(string query, Dictionary<string, object> keyvaluepair)
    {
        if (db.State == System.Data.ConnectionState.Open)
        {
            db.Close();
        }
        db.Open();
        SqlCommand cmd = new SqlCommand(query, db);

        foreach (var pair in keyvaluepair)
        {
            // Check if the value is a DateTime and handle accordingly
            if (pair.Value is DateTime)
            {
                SqlParameter parameter = new SqlParameter(pair.Key, System.Data.SqlDbType.DateTime);
                parameter.Value = pair.Value;
                cmd.Parameters.Add(parameter);
            }
            else
            {
                cmd.Parameters.AddWithValue(pair.Key, pair.Value);
            }
        }

        return cmd.ExecuteNonQuery();
    }
}