/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import aws.AWSUploadUtility;
import client.ClientUpdate;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.model.ObjectMetadata;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author El Jefe
 */
@WebServlet(name = "HomeCoverUpload", urlPatterns = {"/HomeCoverUpload"})
public class HomeCoverUpload extends HttpServlet 

{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    
    {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        
        {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeCoverUpload</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeCoverUpload at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    
    {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    
    {
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        Iterator<FileItem> iterator = null;
        String documentType = null;
        InputStream fileIS = null;
        String fileName = null;
        String directoryName = null;
        ClientUpdate clientUpdate = null;
        long accountNumber = -1;
        String uploadedPicture = null;
        String fieldValue = null;
        
        
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString  = dateFormat.format(calendar.getTime());
        
        
        try
            
        {
            iterator = upload.parseRequest(request).iterator();
        }
        
        catch (FileUploadException e)
            
        {
            e.printStackTrace();
        }
        
        while (iterator.hasNext())
            
        {
            FileItem item = iterator.next();
            
            if (!item.isFormField())
                
            {
                
                documentType = item.getContentType();
                fileIS = item.getInputStream();
                fileName = dateString + "-" + item.getName();
                AWSCredentials credentials = new BasicAWSCredentials("AKIAJYXF6XQQ4UH7QAIQ", "aKTWqYHHdybdxYwaS+4yMs80EDABjnBF+NWKApj6");
                String bucketName = "pegbucket";
                AWSUploadUtility s3Client = new AWSUploadUtility();
                ObjectMetadata metadata = new ObjectMetadata();
                metadata.setContentLength(Long.valueOf(fileIS.available()));
                directoryName = "clients/wallpapers/" + fileName;
                
                System.out.println("Trying to upload " + directoryName + " to account " + accountNumber);
                
                if (accountNumber != -1)
                    
                {
                    s3Client.uploadfile(credentials, bucketName, directoryName, fileIS, metadata);
                    uploadedPicture = "https://s3.ca-central-1.amazonaws.com/pegbucket/clients/wallpapers/" + fileName;
                    clientUpdate = new ClientUpdate(accountNumber);
                    clientUpdate.setWallPaper(uploadedPicture);
                    System.out.println("Upload file: " + uploadedPicture);
                }
                
                
            }
            
            else
                
            {
                
                String fieldName = item.getFieldName();
                fieldValue = item.getString();
                
                if (fieldName.equalsIgnoreCase("account-number"))
                    
                {
                    accountNumber = Long.parseLong(fieldValue);
                }
                
            }
            
        }
        
        
        
        response.sendRedirect("clients/home.jsp");
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() 
    
    {
        return "Short description";
    }// </editor-fold>

}
