/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package programs;

/**
 *
 * @author El Jefe
 */
public class AdventureMovie extends Movie

{
    public AdventureMovie(long programID, String programName, String programPoster, String distributor, String locality, String rentalPrice, String purchasePrice)
            
    {
        super(programID, programName, programPoster, distributor, locality, rentalPrice, purchasePrice);
        this.genre = "adventure"; 
    }

    @Override
    public String getGenre() 
    
    {
        return this.genre;
    }

    @Override
    public void setGenre(String genre) 
    
    {
        this.genre = genre;
    }
    
}
