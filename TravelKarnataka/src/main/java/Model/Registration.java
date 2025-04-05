package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Model.AdminBook;

import Model.BookStatus;

import Model.BookingDB;
import Model.Packages;

import jakarta.servlet.http.HttpSession;
import Model.Ratings;
import Model.User;

public class Registration {
	private Connection con;
	HttpSession se;
	public Registration(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/TravelKarnataka","root","tiger" );
			se=session;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String Registration(String name,String phone,String email,String password) {
		PreparedStatement ps=null;
		String status="";
		String query="SELECT * FROM USER WHERE phone='"+phone + "'or email='"+email+"';";
		try {
			Statement st = null;
			ResultSet rs = null;
			st=con.createStatement();
			rs=st.executeQuery(query);
			boolean b = rs.next();
			if(b) {
				status="existed";
			}
			else {
				ps=con.prepareStatement("insert into user values(0,?,?,?,?,now())");
				ps.setString(1, name);
				ps.setString(2, phone);
				ps.setString(3, email);
				ps.setString(4, password);
				int a=ps.executeUpdate();
				if(a>0) {
					status="success";
				}else {
					status="failure";
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
		
	}
	public String login(String email,String pass) {
		String status1="" ,id="";
		String uname="" ,emails="";
		String query="SELECT * FROM USER WHERE EMAIL='"+email +"'and Password='"+pass+"';";

		try {
		Statement st=null;
		ResultSet rs=null;
		st=con.createStatement();
		rs=st.executeQuery(query);
		boolean b=rs.next();
		if(b==true) {
			id=rs.getString("id");
			
			uname=rs.getString("name");
			emails=rs.getString("email");
			se.setAttribute("uname", uname);
			se.setAttribute("email", emails);
			se.setAttribute("id", id);
			
			status1="success";
			
		}
		else {
			status1="failure";
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}

		return status1;
	}
	public ArrayList<Packages> get_all_packagesinfo() {
	    ArrayList<Packages> packageList = new ArrayList<>();
	    String query = "SELECT * FROM packages"; 

	    try (Statement stmt = con.createStatement(); 
	         ResultSet rs = stmt.executeQuery(query)) {

	        while (rs.next()) {
	           
	            Packages p = new Packages();
	            p.setP_id(rs.getInt("p_id"));
	            p.setP_name(rs.getString("p_name"));
	            p.setP_image(rs.getString("p_image"));
	            p.setP_price(rs.getDouble("p_price"));
	            p.setP_duration(rs.getString("p_duration"));
	            p.setP_destination(rs.getString("p_destination"));
	            p.setP_activities(rs.getString("p_activities"));
	            p.setP_accommodation(rs.getString("p_accommodation")); 
	            p.setP_inclusion(rs.getString("p_inclusion"));         

	            // Add the package to the list
	            packageList.add(p);
	        }

	    } catch (SQLException e) {
	        System.err.println("Error retrieving package information: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return packageList;
	}

	
    
	public boolean deletePackage(int pId) {
        String query = "DELETE FROM packages WHERE p_id = ?";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, pId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

	public boolean addPackages(Packages p) {
	   
		String query = "INSERT INTO packages (p_name, p_image, p_price, p_duration, p_destination, p_activities, p_accommodation, p_inclusion) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	    
	    try (PreparedStatement pstmt = con.prepareStatement(query)) {
	        // Set the parameters for the prepared statement from the Packages object
	        pstmt.setString(1, p.getP_name());
	        pstmt.setString(2, p.getP_image());
	        pstmt.setDouble(3, p.getP_price());
	        pstmt.setString(4, p.getP_duration());
	        pstmt.setString(5, p.getP_destination());
	        pstmt.setString(6, p.getP_activities());
	        pstmt.setString(7, p.getP_accommodation());
	        pstmt.setString(8, p.getP_inclusion());

	        int rowsAffected = pstmt.executeUpdate();
	        return rowsAffected > 0;

	    } catch (SQLException e) {
	        // Print the error message for debugging
	        System.out.println("Error executing query: " + e.getMessage());
	        e.printStackTrace();  // Print the stack trace for detailed debugging
	        return false;
	    }
	}
	
	
	
	
	public Packages getPackageById(int id) {
		 Packages pkg = null; // Initialize the package object
		    try {
		        String query = "SELECT * FROM packages WHERE p_id = ?";
		        PreparedStatement ps = con.prepareStatement(query);
		        ps.setInt(1, id);
		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            pkg = new Packages();
		            pkg.setP_id(rs.getInt("p_id"));
		            pkg.setP_name(rs.getString("p_name"));
		            pkg.setP_image(rs.getString("p_image"));
		            pkg.setP_price(rs.getDouble("p_price"));
		            pkg.setP_duration(rs.getString("p_duration"));
		            pkg.setP_destination(rs.getString("p_destination"));
		            pkg.setP_activities(rs.getString("p_activities"));
		            pkg.setP_accommodation(rs.getString("p_accommodation"));
		            pkg.setP_inclusion(rs.getString("p_inclusion"));
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return pkg; // Always return the package object, even if null
    }

    public boolean updatePackage(Packages p) {
        String query = "UPDATE packages SET p_name=?, p_image=?, p_price=?, p_duration=?, p_destination=?, p_activities=?, p_accommodation=?, p_inclusion=? WHERE p_id=?";
        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setString(1, p.getP_name());
            stmt.setString(2, p.getP_image());
            stmt.setDouble(3, p.getP_price());
            stmt.setString(4, p.getP_duration());
            stmt.setString(5, p.getP_destination());
            stmt.setString(6, p.getP_activities());
            stmt.setString(7, p.getP_accommodation());
            stmt.setString(8, p.getP_inclusion());
            stmt.setInt(9, p.getP_id());
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
	
    public ArrayList<Packages> get_packagesinfo(String duration) {
		 Statement st = null;
		 ResultSet rs = null;
	        ArrayList<Packages> al = new ArrayList<Packages>();
	        try {
	            st = con.createStatement();
	            String qry = "select * from packages where p_duration='" + duration + "';";
	            rs = st.executeQuery(qry);
	            while (rs.next()) {
	            	Packages p = new Packages();
	            	 p.setP_id(rs.getInt("p_id"));
	 	            p.setP_name(rs.getString("p_name"));
	 	            p.setP_image(rs.getString("p_image"));
	 	            p.setP_price(rs.getDouble("p_price"));
	 	            p.setP_duration(rs.getString("p_duration"));
	 	            p.setP_destination(rs.getString("p_destination"));
	 	            p.setP_activities(rs.getString("p_activities"));
	 	            p.setP_accommodation(rs.getString("p_accommodation")); 
	 	            p.setP_inclusion(rs.getString("p_inclusion"));  
	                
	                al.add(p);
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return al;
	    }
    public String booking(String p_id,String person) {
        String status = "";
        try {
            Statement st = null;
            st = (Statement) con.createStatement();
            String qry = "insert into booking select 0,p_name,p_image,p_price,'" + se.getAttribute("uname") + "'," + se.getAttribute("id") + ",0,'pending',"+person+" from packages where p_id=" + p_id + ";";
            int a = st.executeUpdate(qry);
            status = "success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public ArrayList<BookingDB> getbookinfo() {
		 Statement st = null;
		 ResultSet rs = null;
	        ArrayList<BookingDB> al = new ArrayList<BookingDB>();
	        try {
	            st = con.createStatement();
	            String qry = ("select *  from booking where uid=" + se.getAttribute("id") + " and status='pending';");
	            rs = st.executeQuery(qry);
	            while (rs.next()) {
	            	BookingDB p = new BookingDB();
	                p.setb_id(rs.getString("b_id"));
	                p.setb_image(rs.getString("b_image"));
	                p.setb_name(rs.getString("b_name"));
	                p.setb_price(rs.getString("b_price"));
	                p.setPerson(rs.getString("person"));
	                al.add(p);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return al;
	    }
    public int delete(int b_id) {
        int status = 0;
        try {
            Statement st = null;
            st = (Statement) con.createStatement();
            String qry = "update booking set status='deleted' where b_id='" + b_id + "'";
            status = st.executeUpdate(qry);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
        
    }
    public String details(String name, String city, String state, String tprice,String date) {
		 Statement st = null;
		 ResultSet rs = null;
	        String status = "", b_id = "";
	        int book_id = 0;
	        try {
	            
	            PreparedStatement ps;
	            st = (Statement) con.createStatement();
	            ps = (PreparedStatement) con.prepareStatement("insert into bookstatus select 0,?, ?, ?,group_concat(b_id),'" + tprice + "',?,'" + se.getAttribute("uname") + "','booked',now()," + se.getAttribute("id") + " from booking where uid= " + se.getAttribute("id") + " and status='pending';");
	            ps.setString(1, name);
	            ps.setString(2, city);
	            ps.setString(3, state);
	            ps.setString(4,date);
	            int a = ps.executeUpdate();
	            if (a > 0) {
	                status = "success";
	            } else {
	                status = "failure";
	            }  
	            String qry1 = "select book_id,b_id from bookstatus where uid=" + se.getAttribute("id") + " and status='booked' order by book_id desc limit 1;";
	            rs = st.executeQuery(qry1);
	            while (rs.next()) {
	                book_id = rs.getInt("book_id");
	                b_id = rs.getString("b_id");
	            }
	            String qry = "update booking set status='booked',book_id='" + book_id + "' where b_id in (" + b_id + ") and uid=" + se.getAttribute("id") + " and status='pending';";
	            int b = st.executeUpdate(qry);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return status;//last order of my id with status=ordered,
    }
   
    
    public ArrayList<BookStatus> getmybookinfo() {
        Statement st = null;
        ResultSet rs = null;
        ArrayList<BookStatus> al = new ArrayList<>();
        try {
            st = con.createStatement();
            String qry = "SELECT * FROM bookstatus WHERE uid='" + se.getAttribute("id") + "';";
            
            rs = st.executeQuery(qry);
            while (rs.next()) {
                BookStatus p = new BookStatus();
                p.setBook_id(rs.getInt("book_id"));
                p.setBs_date(rs.getString("bs_date"));
                p.setDate(rs.getString("date"));
                p.setStatus(rs.getString("status"));
                al.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }


    public ArrayList<BookStatus> getbookinfotrip(int bs_id) {
        Statement st = null;
        ResultSet rs = null;
        ArrayList<BookStatus> al = new ArrayList<>();
        try {
            st = con.createStatement();
            String qry = "SELECT * FROM booking WHERE uid='" + se.getAttribute("id") + "' AND book_id=" + bs_id + ";";
            
            rs = st.executeQuery(qry);
            while (rs.next()) {
                BookStatus p = new BookStatus();
                p.setP_image(rs.getString("b_image"));
                p.setB_name(rs.getString("b_name"));
                p.setB_price(rs.getString("b_price"));
                p.setPerson(rs.getString("person"));
                
       
                al.add(p);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return al;
    }
    public int deletebook(int bookid) {
        int status = 0;
        try {
            Statement st = null;
            st = (Statement) con.createStatement();
            String qry = "update bookstatus set status='Cancelled' where book_id='" + bookid + "'";
            status = st.executeUpdate(qry);
            String qry1 = "update booking set status='Cancelled' where book_id='" + bookid + "'";
            status = st.executeUpdate(qry1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    public ArrayList<Packages> getpackagedetails(int pid){
    	Statement st = null;
    	ResultSet rs = null;
    	ArrayList<Packages> al = new ArrayList<Packages>();
    	try {
    		st=con.createStatement();
    		String qry=("SELECT * FROM packages WHERE p_id="+pid+";");
    		System.out.println("Query"+qry);
    		 rs = st.executeQuery(qry);
	            while (rs.next()) {
	            	Packages p = new Packages();
	            	p.setP_id(rs.getInt("p_id"));
	 	            p.setP_name(rs.getString("p_name"));
	 	            p.setP_image(rs.getString("p_image"));
	 	            p.setP_price(rs.getDouble("p_price"));
	 	            p.setP_duration(rs.getString("p_duration"));
	 	            p.setP_destination(rs.getString("p_destination"));
	 	            p.setP_activities(rs.getString("p_activities"));
	 	            p.setP_accommodation(rs.getString("p_accommodation")); 
	 	            p.setP_inclusion(rs.getString("p_inclusion"));  
	               
	                al.add(p);
	            }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return al;
    }
    public ArrayList<User> getClients() {
		ArrayList<User> al = new ArrayList<User>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from user;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				User d = new User(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setId(rs.getString("id"));
				d.setName(rs.getString("name"));
				d.setEmail(rs.getString("email"));
				d.setDate(rs.getString("date"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
    public String deleteuser(int id) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from user where " + "uid='" + id + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
    public ArrayList<AdminBook> getbookeddata() {
    	Statement st = null;
    	ResultSet rs = null;
        ArrayList<AdminBook> al = new ArrayList<AdminBook>();
        try {
            st = con.createStatement();
            String qry = "select * from bookstatus;";
            System.out.println("Query"+qry);
            rs = st.executeQuery(qry);
            while (rs.next()) {
            	AdminBook p = new AdminBook();
                p.setBook_id(rs.getString("book_id"));
                p.setUname(rs.getString("uname"));
                p.setB_id(rs.getString("b_id"));
                p.setB_price(rs.getString("b_price"));
                p.setB_name(rs.getString("b_name"));
                p.setBs_city(rs.getString("bs_city"));
                p.setBs_state(rs.getString("bs_state"));
                p.setStatus(rs.getString("status"));
                
                al.add(p);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    public int acceptBook(int book_id) {
	    int status = 0;
	    String query = "UPDATE bookstatus SET status = 'BookConfirm' WHERE book_id = ?";
 try (PreparedStatement pst = con.prepareStatement(query)) {
	        pst.setInt(1, book_id);  // Setting the order_id to the query
	        status = pst.executeUpdate();  // Executing the update
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status;
	}
	public int cancelBook(int book_id) {
	    int status = 0;
	    String query = "UPDATE bookstatus SET status = 'Cancelled' WHERE book_id = ?";

	    try (PreparedStatement pst = con.prepareStatement(query)) {
	        pst.setInt(1, book_id);  // Set the order_id to the query parameter
	        status = pst.executeUpdate();  // Execute the update query
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status;
	}
	public String review(String name, String email, String rating, String opinion) {

		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			ps = (PreparedStatement) con.prepareStatement("insert into review values (0,?,?,?,?,now())");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, rating);
			ps.setString(4, opinion);
			int a = ps.executeUpdate();
			if (a > 0)
				status = "Successful";
			else
				status = "Failed";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public ArrayList<Ratings> getReviewList() {
		ArrayList<Ratings> al = new ArrayList<Ratings>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1 from review;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Ratings d = new Ratings(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setRid(rs.getString("review_id"));
				d.setUname(rs.getString("uname"));
				d.setEmail(rs.getString("email"));
				d.setRating(rs.getString("rating"));
				d.setMessage(rs.getString("message"));
				d.setDate(rs.getString("date"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	public String forgot(String mail, String pw) {
	       String status = "";
	       try {
	           Statement st = con.createStatement();

	           int rspw = st.executeUpdate("update user  set password='" + pw + "' where email='" + mail + "';");
	           if (rspw > 0) {
	               status = "success";
	           } else {
	               status = "failure";
	           }
	       } catch (Exception e) {
	           e.printStackTrace();
	       }
	       return status;
	   }
	public String getPassword(String email,String oldPass) {
		String status="";
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query="select * from user where email=? and password=?";
		try {
		ps=con.prepareStatement(query);
		ps.setString(1, email);
		ps.setString(2, oldPass);
		rs=ps.executeQuery();
		if(rs.next()) {
			status="success";
		}
		else {
			status="failed";
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
		return status;
	}
	public String resetPassword(String email,String pwd) {
		String status="";
		PreparedStatement ps = null;
		boolean res;
		try {
			ps=con.prepareStatement("update user set password=? where email=?");
			ps.setString(1, pwd);
			ps.setString(2, email);
			int rc=ps.executeUpdate();
			if(rc>0) {
				status="success";
			}
			else {
				status="failure";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}

    
}