/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board.stream;


import series.TVSeries;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class TVSeriesStream 

{
    private long programID;
    private String department;
    private String programName;
    private String programPoster;
    private long programDistributorID;
    private String programDistributorName;
    private String programDistributorPicture;
    private String programLocality;
    private String thumbnail;
    private String teaser;
    private long numberOfTeaserFeeds;
    private long numberOfTeaserPeppers;
    private long numberOfTeaserShares;
    private String programDescription;
    private String rentalPrice;
    private String purchasePrice;
    private String podcast;
    private String podcastName;
    private long numberOfPodcastFeeds;
    private long numberOfPodcastPeppers;
    private long numberOfPodcastShares;
    private long podcastListID;
    private TVSeries[] podcastList;
    
    private TVSeries tvSeries;
    private TVSeries[] otherTVSeries;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    Connection tvSeriesConnection = null;
    PreparedStatement tvSeriesStatement = null;
    ResultSet tvSeriesSet = null;
    
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 6;
    private int size;
    private long startID;
    private long endID;
    
    public TVSeriesStream()
            
    {
        this.programID = -1;
        this.department = "series";
        this.programName = null;
        this.programPoster = null;
        this.programDistributorID = -1;
        this.programDistributorName = null;
        this.programDistributorPicture = null;
        this.programLocality = null;
        this.thumbnail = null;
        this.teaser = null;
        this.numberOfTeaserFeeds = 0;
        this.numberOfTeaserPeppers = 0;
        this.numberOfTeaserShares = 0;
        this.programDescription = null;
        this.rentalPrice = null;
        this.purchasePrice = null;
        this.podcast = null;
        this.podcastName = null;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        this.podcastListID = -1;
        this.podcastList = null;
        
        this.tvSeries = null;
        this.otherTVSeries = null;
        this.size = getTVSeriesCount();
    }
    
    public TVSeriesStream(long programID)
            
    {
        this.programID = programID;
        this.department = "series";
        this.programName = null;
        this.programPoster = null;
        this.programDistributorID = -1;
        this.programDistributorName = null;
        this.programDistributorPicture = null;
        this.programLocality = null;
        this.thumbnail = null;
        this.teaser = null;
        this.numberOfTeaserFeeds = 0;
        this.numberOfTeaserPeppers = 0;
        this.numberOfTeaserShares = 0;
        this.programDescription = null;
        this.rentalPrice = null;
        this.purchasePrice = null;
        this.podcast = null;
        this.podcastName = null;
        this.numberOfPodcastFeeds = 0;
        this.numberOfPodcastPeppers = 0;
        this.numberOfPodcastShares = 0;
        this.podcastListID = -1;
        this.podcastList = null;
        
        this.tvSeries = null;
        this.otherTVSeries = new TVSeries[NUMBER_OF_PROGRAMS_PER_PAGE];
        this.size = getTVSeriesCount();
        this.startID = getRandomProgramID(this.programID);
        this.endID = this.startID + 5;
        
        constructProgram();
        constructDistributor();
        this.tvSeries = new TVSeries(programID, programName, programPoster, this.programDistributorName, this.programLocality, this.rentalPrice, this.purchasePrice);
        
        try
        {
            tvSeriesConnection = DriverManager.getConnection(URL, userName, password);
            tvSeriesStatement = tvSeriesConnection.prepareStatement("SELECT seriesID, seriesPoster, seriesName, distributor, locality, rentalPrice, purchasePrice FROM series "
                    + "WHERE seriesID>=" + this.startID + " AND seriesID<=" + this.endID);
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        populateTVSeriesPage();
        
    }
    
    private void constructProgram()
            
    {
        Connection programConnection = null;
        PreparedStatement programStatement = null;
        ResultSet programSet = null;
        int count;

        try
        {
            programConnection = DriverManager.getConnection(URL, userName, password);


            if (department.equals("movie"))
            {
                programStatement = programConnection.prepareStatement("SELECT movieID, moviePoster, movieName, distributorID, rentalPrice, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM movies WHERE movieID=" + programID );
            }

            else if (department.equals("series"))
            {
                programStatement = programConnection.prepareStatement("SELECT seriesID, seriesPoster, seriesName, distributorID, rentalPrice, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, numberOfTeaserShares FROM series WHERE seriesID=" + programID );
            }

            else if (department.equals("video"))
            {
                programStatement = programConnection.prepareStatement("SELECT videoID, videoPoster, videoName, distributorID, purchasePrice, thumbnail, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, numberOfPodcastFeeds, numberOfPodcastPeppers, numberOfPodcastShares "
                        + "FROM videos WHERE videoID=" + programID );
            }

            else if (department.equals("music"))
            {
                programStatement = programConnection.prepareStatement("SELECT musicID, musicPoster, musicName, distributorID, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcastListID FROM music WHERE musicID=" + programID );
            }

            else if (department.equals("tv"))
            {
                programStatement = programConnection.prepareStatement("SELECT channelID, channelPoster, channelName, distributorID, rentalPrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM tv WHERE channelID=" + programID );
            }

            else if (department.equals("radio"))
            {
                programStatement = programConnection.prepareStatement("SELECT radioID, radioPoster, radioName, distributorID, rentalPrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM radio WHERE radioID=" + programID );
            }

            else if (department.equals("game"))
            {
                programStatement = programConnection.prepareStatement("SELECT gameID, gamePoster, gameName, distributorID, purchasePrice, description, locality"
                        + ", teaser, numberOfTeaserFeeds, numberOfTeaserPeppers, podcast, podcastName, numberOfPodcastFeeds, numberOfPodcastPeppers FROM games WHERE gameID=" + programID );
            }


        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
        {
            programSet = programStatement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
            
        {

            for (count = 0; (count < 1) && (programSet.next() == true); count++) 

            {

                if (department.equals("movie"))
                {
                    programID = Long.parseLong(programSet.getString("movieID"));
                    programName = programSet.getString("movieName"); 
                    programPoster = programSet.getString("moviePoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    rentalPrice = programSet.getString("rentalPrice");
                    purchasePrice = programSet.getString("purchasePrice");
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    programDescription = programSet.getString("description");
                    podcast = programSet.getString("podcast");
                    podcastName = programSet.getString("podcastName");
                    numberOfPodcastFeeds = Long.parseLong(programSet.getString("numberOfPodcastFeeds"));
                    numberOfPodcastPeppers = Long.parseLong(programSet.getString("numberOfPodcastPeppers"));
                    podcastList = null;
                }

                else if (department.equals("series"))
                {
                    programID = Long.parseLong(programSet.getString("seriesID"));
                    programName = programSet.getString("seriesName"); 
                    programPoster = programSet.getString("seriesPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    rentalPrice = programSet.getString("rentalPrice");
                    purchasePrice = programSet.getString("purchasePrice");
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    numberOfTeaserShares = Long.parseLong(programSet.getString("numberOfTeaserShares"));
                    podcastListID = 0;
                }

                else if (department.equals("video"))
                {
                    programID = Long.parseLong(programSet.getString("videoID"));
                    programName = programSet.getString("videoName"); 
                    programPoster = programSet.getString("videoPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    purchasePrice = programSet.getString("purchasePrice");
                    thumbnail = programSet.getString("thumbnail");
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    programDescription = programSet.getString("description");
                    podcast = teaser;
                    podcastName = programName;
                    numberOfPodcastFeeds = Long.parseLong(programSet.getString("numberOfPodcastFeeds"));
                    numberOfPodcastPeppers = Long.parseLong(programSet.getString("numberOfPodcastPeppers"));
                    numberOfPodcastShares = Long.parseLong(programSet.getString("numberOfPodcastShares"));
                    podcastList = null;
                }

                else if (department.equals("music"))
                {
                    programID = Long.parseLong(programSet.getString("musicID"));
                    programName = programSet.getString("musicName"); 
                    programPoster = programSet.getString("musicPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    purchasePrice = programSet.getString("purchasePrice");
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    programDescription = programSet.getString("description");
                    podcastListID = Long.parseLong(programSet.getString("podcastListID"));
                }

                else if (department.equals("tv"))
                {
                    programID = Long.parseLong(programSet.getString("channelID"));
                    programName = programSet.getString("channelName"); 
                    programPoster = programSet.getString("channelPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    rentalPrice = programSet.getString("rentalPrice");
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    programDescription = programSet.getString("description");
                    podcast = programSet.getString("podcast");
                    podcastName = programSet.getString("podcastName");
                    numberOfPodcastFeeds = Long.parseLong(programSet.getString("numberOfPodcastFeeds"));
                    numberOfPodcastPeppers = Long.parseLong(programSet.getString("numberOfPodcastPeppers"));
                    podcastList = null;
                }

                else if (department.equals("radio"))
                {
                    programID = Long.parseLong(programSet.getString("radioID"));
                    programName = programSet.getString("radioName"); 
                    programPoster = programSet.getString("radioPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    rentalPrice = programSet.getString("rentalPrice");
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    programDescription = programSet.getString("description");
                    podcast = programSet.getString("podcast");
                    podcastName = programSet.getString("podcastName");
                    numberOfPodcastFeeds = Long.parseLong(programSet.getString("numberOfPodcastFeeds"));
                    numberOfPodcastPeppers = Long.parseLong(programSet.getString("numberOfPodcastPeppers"));
                    podcastList = null;
                }

                else if (department.equals("game"))
                {
                    programID = Long.parseLong(programSet.getString("gameID"));
                    programName = programSet.getString("gameName"); 
                    programPoster = programSet.getString("gamePoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programDescription = programSet.getString("description");
                    programLocality = programSet.getString("locality");
                    purchasePrice = programSet.getString("purchasePrice"); 
                    teaser = programSet.getString("teaser");
                    numberOfTeaserFeeds = Long.parseLong(programSet.getString("numberOfTeaserFeeds"));
                    numberOfTeaserPeppers = Long.parseLong(programSet.getString("numberOfTeaserPeppers"));
                    programDescription = programSet.getString("description");
                    podcast = programSet.getString("podcast");
                    podcastName = programSet.getString("podcastName");
                    numberOfPodcastFeeds = Long.parseLong(programSet.getString("numberOfPodcastFeeds"));
                    numberOfPodcastPeppers = Long.parseLong(programSet.getString("numberOfPodcastPeppers"));
                    podcastList = null;
                } 

            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
    }
    
    private void constructDistributor()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT distributorLogo, distributorName FROM distributors WHERE distributorID=" + programDistributorID );
            
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

            for (count = 0; (count < 1) && (resultSet.next() == true); count++) 

            {
                
                programDistributorName = resultSet.getString("distributorName"); 
                programDistributorPicture = resultSet.getString("distributorLogo");
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    private ResultSet getTVSeriesList()
            
    {
        try
        {
            tvSeriesSet = tvSeriesStatement.executeQuery();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return tvSeriesSet;

    }
    
    private void populateTVSeriesPage()
            
    {
        int count;
        long nextCount = 0;
        ResultSet tvSeriesListSet = getTVSeriesList();
        
        try
            
        {
                        
            for (count = 0; (count < NUMBER_OF_PROGRAMS_PER_PAGE) && (tvSeriesListSet.next() == true); count++) 

            {
                
                nextCount = Long.parseLong(tvSeriesListSet.getString("seriesID"));
                this.otherTVSeries[count] = new TVSeries(nextCount, tvSeriesListSet.getString("seriesName"), tvSeriesListSet.getString("seriesPoster"), tvSeriesListSet.getString("distributor"), tvSeriesListSet.getString("locality"), tvSeriesListSet.getString("rentalPrice"), tvSeriesListSet.getString("purchasePrice"));
                
            }
        
        }
        
        catch(SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public TVSeries getTVSeries(int count)
            
    {
        return this.otherTVSeries[count];
    }
    
    public long length()
            
    {
        return this.otherTVSeries.length;
    }
    
    private int getTVSeriesCount()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count = 0;

        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT COUNT(seriesPoster) FROM series");
            
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
                
                count = Integer.parseInt(resultSet.getString("COUNT(seriesPoster)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    public long getRandomProgramID(long exception)
            
    {
        long randomID;
        
        randomID = 1;
        
        if (this.size > 2)
            
        {
            randomID = (long) Math.ceil(Math.random() * this.size); 

            while (randomID == exception)

            {
                randomID = (long) Math.ceil(Math.random() * this.size); 
            }
            
        }
        
        return randomID;
        
    }
    
    public long search(String seriesName)
            
    {
        long seriesID;
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        seriesID = 1;
        seriesName = seriesName.trim();
        seriesName = modifyChars(seriesName);
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT seriesID FROM series WHERE seriesName='" + seriesName + "'");
            
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
                
                seriesID = Long.parseLong(resultSet.getString("seriesID")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return seriesID;
        
    }
    
    private String modifyChars(String seriesName)
            
    {
        String modification;
        char[] prohibitedChars = new char[19];
        int count;
        int index;
        boolean prohibitedExists = false;
        
        modification = "";
        prohibitedChars[0] = '@';
        prohibitedChars[1] = '#';
        prohibitedChars[2] = '%';
        prohibitedChars[3] = '^';
        prohibitedChars[4] = '&';
        prohibitedChars[5] = '*';
        prohibitedChars[6] = '(';
        prohibitedChars[7] = ')';
        prohibitedChars[8] = '+';
        prohibitedChars[9] = '=';
        prohibitedChars[10] = ';';
        prohibitedChars[11] = ':';
        prohibitedChars[12] = '`';
        prohibitedChars[13] = '~';
        prohibitedChars[14] = '\\';
        prohibitedChars[15] = '/';
        prohibitedChars[16] = '>';
        prohibitedChars[17] = '<';
        prohibitedChars[18] = '\"';
        
        modification = "";
        
        for (count = 0; count < seriesName.length(); count++)
            
        {
            
            if (seriesName.charAt(count) == '\'')
            
            {
                modification = modification + '\\'; 
            }
            
            for (index = 0; index < prohibitedChars.length; index++)
                
            {
                
                if (seriesName.charAt(count) == prohibitedChars[index])

                {
                    prohibitedExists = true;
                }
                
            }
            
            if (prohibitedExists == false)
                
            {
                modification = modification + seriesName.charAt(count);
            }
            
        }
        
        return modification;
        
    }
    
    public int getSize()
            
    {
        return this.size;
    }

    public long getProgramID() 
    
    {
        return programID;
    }

    public String getDepartment() 
    
    {
        return department;
    }

    public String getProgramName() 
    
    {
        return programName;
    }

    public String getProgramPoster() 
    
    {
        return programPoster;
    }

    public long getProgramDistributorID() 
    
    {
        return programDistributorID;
    }

    public String getProgramDistributorName() 
    
    {
        return programDistributorName;
    }

    public String getProgramDistributorPicture() 
    
    {
        return programDistributorPicture;
    }

    public String getProgramLocality() 
    
    {
        return programLocality;
    }

    public String getTeaser() 
    
    {
        return teaser;
    }

    public long getNumberOfTeaserFeeds() 
    
    {
        return numberOfTeaserFeeds;
    }

    public long getNumberOfTeaserPeppers() 
    
    {
        return numberOfTeaserPeppers;
    }

    public String getProgramDescription() 
    
    {
        return programDescription;
    }

    public String getRentalPrice() 
    
    {
        return rentalPrice;
    }

    public String getPurchasePrice() 
    
    {
        return purchasePrice;
    }

    public String getThumbnail() 
    
    {
        return thumbnail;
    }

    public String getPodcast() 
    
    {
        return podcast;
    }

    public String getPodcastName() 
    
    {
        return podcastName;
    }

    public long getNumberOfPodcastFeeds() 
    
    {
        return numberOfPodcastFeeds;
    }

    public long getNumberOfPodcastPeppers() 
    
    {
        return numberOfPodcastPeppers;
    }

    public long getNumberOfPodcastShares() 
    
    {
        return numberOfPodcastShares;
    }    

    public TVSeries getTvSeries() 
    
    {
        return tvSeries;
    }
    
}
