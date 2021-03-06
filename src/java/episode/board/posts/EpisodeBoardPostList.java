/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package episode.board.posts;

import client.ClientRetrieve;
import episode.EpisodeRetrieve;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class EpisodeBoardPostList 

{
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    private Connection moviesConnection = null;
    private PreparedStatement moviesStatement = null;
    private ResultSet movieSet = null;
    
    private long boardID;
    private int size;
    private EpisodeBoardPost[] movies;
    
    public EpisodeBoardPostList(long boardID)
    {
        this.boardID = boardID;
        this.size = getEpisodeBoardPostCount();
        this.movies = new EpisodeBoardPost[size];
        
        
        try
        {
            moviesConnection = DriverManager.getConnection(URL, userName, password);
            moviesStatement = moviesConnection.prepareStatement("SELECT episodeID, clientID, creationTime, message, numberOfPeppers, numberOfComments FROM episode_board_posts "
                    + "WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        populateMovieBoardPosts();
        
    }
    
    private ResultSet getMovies()
    {
        try
        {
            movieSet = moviesStatement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return movieSet;

    }
    
    private void populateMovieBoardPosts()
            
    {
        int count;
        long nextCount = 0;
        ResultSet moviesSet = getMovies();
        EpisodeRetrieve retrieve = null;
        ClientRetrieve clientRetrieve = null;
        
        try
            
        {
                        
            for (count = 0; (count < this.size) && (moviesSet.next() == true); count++) 

            {
                nextCount = Long.parseLong(moviesSet.getString("episodeID"));
                movies[count] = new EpisodeBoardPost(nextCount, boardID, Long.parseLong(moviesSet.getString("clientID")), moviesSet.getString("creationTime"), moviesSet.getString("message"));
                this.movies[count].setNumberOfPostPeppers(Long.parseLong(moviesSet.getString("numberOfPeppers")));
                this.movies[count].setNumberOfPostComments(Long.parseLong(moviesSet.getString("numberOfComments")));
                
                retrieve = new EpisodeRetrieve(nextCount);
                
                this.movies[count].setContent(retrieve.getPodcast());
                this.movies[count].setThumbnail(retrieve.getThumbnail());
                this.movies[count].setEpisodeName(retrieve.getEpisodeName());
                this.movies[count].setSeriesPoster(retrieve.getSeriesPoster());
                this.movies[count].setSeriesID(retrieve.getSeriesID());
                
                clientRetrieve = new ClientRetrieve(Long.parseLong(moviesSet.getString("clientID")), "client");
                
                this.movies[count].setClientName(clientRetrieve.getClientName());
                this.movies[count].setClientProfilePicture(clientRetrieve.getProfilePicture());
                this.movies[count].setClientGender(clientRetrieve.getGender());
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public EpisodeBoardPost getEpisodeBoardPost(int count)
            
    {
        return movies[count];
    }
    
    public long length()
            
    {
        return movies.length;
    }
    
    private int getEpisodeBoardPostCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(creationTime) FROM episode_board_posts WHERE boardID=" + this.boardID);
            
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
        {
            resultSet = statement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
            
        {

            if (resultSet.next() == true) 

            {
                
                count = Integer.parseInt(resultSet.getString("COUNT(creationTime)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    public int getSize()
            
    {
        return this.size;
    }
    
}
