<%@ WebHandler Language="C#" Class="FileUploadHandler" %>

using System;
using System.Web;

public class FileUploadHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        HttpPostedFile file = context.Request.Files[0];
        string fname = context.Server.MapPath("uploads/" + file.FileName);
        file.SaveAs(fname);
        context.Response.ContentType = "text/plain";
        context.Response.Write("File Uploaded Successfully!");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }


}