
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="client.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Series | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../../chilli.png"/>
<meta charset="utf-8" /> 
<link rel="stylesheet" type="text/css" href="../../store.css">
<script type="text/javascript" src="../../store.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

</head>

<body>
  
  <header>
      
    <div class="head">
      
    <a href="../../index.jsp"><img class="bol" src="../../chillon.png" alt="bol"></a>
        
    
        
            <nav class="nav">
                
                <ul>
                    <li><a href="../../signin.jsp" >Sign In</a></li>
                    <li><a href="../../register.jsp" >Register</a></li>
                    <li><a href="../../giveaways.jsp" >Store Giveaways</a></li>
                    <li><a href="../../store.jsp" id="page">Store</a></li>
                    <li><a href="../../index.jsp" >Packages</a></li>
                    <li><a href="../../stream.jsp" >Streaming</a></li>
                    <li><a href="../../distribute.jsp" >Distribute</a></li>
                </ul>
                    
            </nav>
      
    </div>
      
      <div class="subheader">
          
          <div class="skew">
          
          <form class="flexsearch--form" action="#" method="post">
                <div class="flexsearch">
                      <div class="flexsearch--wrapper">

                                      <div class="flexsearch--input-wrapper">
                                              <input class="flexsearch--input" type="search" placeholder="Search for a program">
                                      </div>


                      </div>
                    </div>


                    <select name="department" class="search-dept">
                      <option value="all">in All Departments</option>
                      <option value="channels">in Channels</option>
                      <option value="sounds">in Sounds</option>
                      <option value="videos">in Videos</option>
                      <option value="movies">in Movies</option>
                      <option value="series">in Series</option>
                      <option value="music">in Music</option>
                      <option value="games">in Games</option>
                    </select>
                    <input type="submit" value="Search" class="search-button">
          </form>
          </div>
      </div>
      
  </header>
  
    <div class="announcement">Find connections, create boards, and rent programs for individual and group enjoyment.
        <button class="button2"><a href="../../register.jsp" class="chillonline">Start your free content trial</a></button></div>
      
      <div class="store">
    
    
    <script>
        
        $('body').on('contextmenu', 'img', function(e) {return false;});
        $('body').on('contextmenu', 'video', function(e) {return false;});
        
    </script>
          
          <form id="series_form" method="post" action="../../series/checkout.jsp">
                
                <input type='number' id="packageID" name="packageID">
                <input type='text' id="department" name="department">
                <input type="submit" id="submit-form-button">
                
            </form>
        
        <div class="store-selector">
            <div class=""></div>
            <div class=""><h3> &nbsp; Browse by department</h3></div>
            <div class="dept-nav-place">
                <nav class="dept-nav">
                
                <ul>
                    <li><a href="../../movies/index.jsp" >&nbsp; Movies</a></li>
                    <li class="genre"><a href="../../movies/kids/index.jsp" >&nbsp; Kids</a></li>
                    <li class="genre"><a href="../../movies/action/index.jsp" >&nbsp; Action</a></li>
                    <li class="genre"><a href="../../movies/comedy/index.jsp" >&nbsp; Comedy</a></li>
                    <li class="genre"><a href="../../movies/romance/index.jsp" >&nbsp; Romance</a></li>
                    <li class="genre"><a href="../../movies/horror/index.jsp" >&nbsp; Horror</a></li>
                    <li class="genre"><a href="../../movies/documentary/index.jsp" >&nbsp; Documentary</a></li>
                    <li class="genre"><a href="../../movies/adventure/index.jsp" >&nbsp; Adventure</a></li>
                    <li><a href="../../series/index.jsp">&nbsp; Series</a></li>
                    <li class="genre"><a href="../../series/kids/index.jsp" >&nbsp; Kids</a></li>
                    <li class="genre"><a href="../../series/action/index.jsp" >&nbsp; Action</a></li>
                    <li class="genre"><a href="../../series/comedy/index.jsp" >&nbsp; Comedy</a></li>
                    <li class="genre"><a href="../../series/romance/index.jsp" >&nbsp; Romance</a></li>
                    <li class="genre"><a href="../../series/horror/index.jsp" >&nbsp; Horror</a></li>
                    <li class="genre"><a href="../../series/documentary/index.jsp" >&nbsp; Documentary</a></li>
                    <li class="genre"><a href="../../series/adventure/index.jsp" class="current">&nbsp; Adventure</a></li>
                    <li><a href="../../videos/index.jsp" >&nbsp; Videos</a></li>
                    <li><a href="../../music/index.jsp" >&nbsp; Music</a></li>
                    <li><a href="../../channels/index.jsp" >&nbsp; TV channels</a></li>
                    <li><a href="../../sounds/index.jsp" >&nbsp; Radio channels</a></li>
                    <li><a href="../../games/index.jsp" >&nbsp; Games</a></li>
                </ul>
                    
                </nav>
            </div>
            <div class="">
                
                <div class=""><h3> &nbsp; Browse by locality</h3></div>
                
                <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program" name="country" value="country"> United Kingdom</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> United States</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program" checked> Canada</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Germany</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> France</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Ireland</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> China</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Japan</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> South Korea</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Nigeria</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> South Africa</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Argentina</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Brazil</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Mexico</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="Refresh" class="button2"></div>
                
            </div>
            <div class=""></div>
            <div class=""></div>
        </div>
          
          
          
          
        <div class="store-content">
            <div class="hottest"><div class="advert"></div></div>
        <div class="browsed">    
            
            <%
                    
                    TVSeriesList series = new TVSeriesList();
                    
                    
                    
                    %>
                    
                    <%
                        int count = 0;
                        
                        for (count = 20; count < 38; count++) {
                        %>
            
            <div class="product">
                
                    <div class="poster">
                        
                        <a href="javascript:transferSeriesByID(<%= series.getTVSeries(count).getTvSeriesID() %>);" id="product-anchor">
                        <img src="<%= series.getTVSeries(count).getTvSeriesPoster() %>" alt="agri" id="product-poster2" title="Play Trailer">
                        </a>
                    </div>
                   
                <div class="definition"><a class="definition-style"><span id="shelf1-title"><%= series.getTVSeries(count).getTvSeriesName() %></span></a></div>
                <div class="distributor"><%= series.getTVSeries(count).getDistributor() %></div>
                <div class="loves-n-seeds"><a class="loves-style"><%= series.getTVSeries(count).getLocality() %></a></div>
                <div class="commentaries"><a class="definition-style"><span id="shelf1-price"><%= series.getTVSeries(count).getRentalPrice() %></span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
                        
                        <%
                            }
                            %>
                            
                            <!--
                        
            <div class="product">
                        <a href=""><div class="poster">
                    
                        <img src="posters/avengers.jpg" alt="agri" id="product-poster2" title="Play Trailer">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf2-title">Avengers</span></a></div>
                <div class="distributor">Bailey's Farms Inc.</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf2-price">USD$4.99</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                        <a href=""><div class="poster">
                    
                        <img src="posters/battlestargalactica.jpg" alt="agri" id="product-poster2" title="Play Trailer">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf3-title">Battlestar Galactica</span></a></div>
                <div class="distributor">Birds Nest</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf3-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/birthofabeauty.jpg" alt="agri" id="product-poster2" title="Play Trailer">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf4-title">Birth Of A Beauty</span></a></div>
                <div class="distributor">Honeywell</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf4-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/cheerup.jpg" alt="agri" id="product-poster2" title="Play Trailer">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf5-title">Cheer Up</span></a></div>
                <div class="distributor">Painters United</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf5-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/chuck.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf6-title">Chuck</span></a></div>
                <div class="distributor">Albatross Media</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf6-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/chuck1.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf7-title">Chuck Season 1</span></a></div>
                <div class="distributor">Birds Nest</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf7-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/chuck2.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf8-title">Chuck Season 2</span></a></div>
                <div class="distributor">Universal Studios</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf8-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/dhousewife.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf9-title">The Housewife</span></a></div>
                <div class="distributor">Precision Inc.</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf9-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/dusktilldawn.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf10-title">Dusk Till Dawn</span></a></div>
                <div class="distributor">Britney's Burgers</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf10-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/empire.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf11-title">Empire</span></a></div>
                <div class="distributor">Mystiques Network</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf11-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/fangoria.png" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf12-title">Fangoria</span></a></div>
                <div class="distributor">Sports Evaluators LLC</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf12-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/fantastic4.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf13-title">Fantastic Four</span></a></div>
                <div class="distributor">Metropolis Studios</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf13-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/gameofthrones.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf14-title">Game Of Thrones</span></a></div>
                <div class="distributor">Precision Inc.</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf14-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/geeks.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf15-title">Geeks</span></a></div>
                <div class="distributor">Vision Entertainment</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf15-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/girlmeetsworld.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf16-title">Girl Meets World</span></a></div>
                <div class="distributor">Black River Entertainment</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf16-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/guardians.jpg" alt="agri" id="product-poster2" title="Channel Icon">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf17-title">Guardians</span></a></div>
                <div class="distributor">Metropolis Studios</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf17-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
            <div class="product">
                <a href=""><div class="poster">
                    
                        <img src="posters/heroes.jpg" alt="agri" id="product-poster2" title="Play Trailer">
                        
                    </div></a>
                <div class="definition"><a href="" class="definition-style"><span id="shelf18-title">Heroes</span></a></div>
                <div class="distributor">Zoo Kids</div>
                <div class="loves-n-seeds"><a href="" class="loves-style">United States</a></div>
                <div class="commentaries"><a href="" class="definition-style"><span id="shelf18-price">FREE</span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
                            
                            -->
                            
        </div>
                    <div class="hottest"><div class="browsing">
                            <div class="browsing-place"><button onclick="displayPreviousShelves()">< Previous</button></div>
                            <div class="browsing-place">1 of 31</div>
                            <div class="browsing-place"><button onclick="displayNextShelves()">Next ></button></div>
                </div></div>
        </div>
        
    </div>
    
    <script type="text/javascript" src="series.js"></script>
  
  <footer>
    
      
    <div class="copyright">
        
        <div class="footnotes"><h4>Users</h4>
          <a class="notes" href=""><p>Channels</p></a>
          <a class="notes" href=""><p>Series</p></a>
          <a class="notes" href=""><p>Movies</p></a>
          <a class="notes" href=""><p>Videos</p></a>
          <a class="notes" href=""><p>Music</p></a>
          <a class="notes" href=""><p>Games</p></a>
        </div>
      <div class="footnotes"><h4>Distributors</h4>
          <a class="notes" href=""><p>Channels</p></a>
          <a class="notes" href=""><p>Series</p></a>
          <a class="notes" href=""><p>Movies</p></a>
          <a class="notes" href=""><p>Videos</p></a>
          <a class="notes" href=""><p>Music</p></a>
          <a class="notes" href=""><p>Games</p></a>
      </div>
      <div class="footnotes"><h4>Legal</h4>
          <a class="notes" href="../terms.jsp"><p>Terms of Service</p></a>
          <a class="notes" href="../privacy_policy.jsp"><p>Privacy Policy</p></a>
          <a class="notes" href="../eula.jsp"><p>EULA</p></a>
          <a class="notes" href="../distribution-agreement.jsp"><p>Distribution Agreement</p></a>
      </div>
      <div class="footnotes"><h4>About</h4>
          <a class="notes" href=""><p>Founder</p></a>
          <a class="notes" href=""><p>Investors</p></a>
          <a class="notes" href=""><p>Mission</p></a>
          <a class="notes" href=""><p>Vendors</p></a>
      </div>
      <div class="footnotes"><h4>Contact</h4>
          <a class="notes" href=""><p>Head Office</p></a>
          <a class="notes" href=""><p>Jobs</p></a>
          <a class="notes" href=""><p>Phone</p></a>
          <a class="notes" href=""><p>Email</p></a>
      </div>
        <hr>
        <p>&copy; 2016 Chill Technologies Inc. All Rights Reserved.</p></div>
    
    
  </footer>

</body>
</html>

