/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loggedout;

/**
 *
 * @author El Jefe
 */
public class Movie extends Program

{
    private String rentalPrice;
    private String purchasePrice;
    private String promoPoster;
    private String genre;
    private String runTime;
    
    public Movie(long programID, String programName, String programPoster, String distributor, String locality, String rentalPrice, String purchasePrice)
            
    {
        super(programID, programName, programPoster, distributor, locality);
        this.rentalPrice = rentalPrice;
        this.purchasePrice = purchasePrice;
        this.genre = null;
        this.promoPoster = null;
        this.runTime = null;  
    }

    public String getRentalPrice() 
    
    {
        return rentalPrice;
    }

    public void setRentalPrice(String rentalPrice) 
    
    {
        this.rentalPrice = rentalPrice;
    }

    public String getPurchasePrice() 
    
    {
        return purchasePrice;
    }

    public void setPurchasePrice(String purchasePrice) 
    
    {
        this.purchasePrice = purchasePrice;
    }

    public String getPromoPoster() 
    
    {
        return promoPoster;
    }

    public void setPromoPoster(String promoPoster) 
    
    {
        this.promoPoster = promoPoster;
    }

    public String getGenre() 
    
    {
        return genre;
    }

    public void setGenre(String genre) 
    
    {
        this.genre = genre;
    }

    public String getRunTime() 
    
    {
        return runTime;
    }

    public void setRunTime(String runTime) 
    
    {
        this.runTime = runTime;
    }
    
}
