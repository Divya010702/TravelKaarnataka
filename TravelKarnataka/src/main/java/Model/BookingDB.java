package Model;

public class BookingDB {
	 private String b_id;
	    private String b_name;
	    private String b_image;
	    private String b_price;
	    private String person;
	    public String getPerson() {
			return person;
		}
		public void setPerson(String person) {
			this.person = person;
		}
		// Constructor
	    public BookingDB(String b_id, String b_name, String b_image, String b_price,String person) {
	        this.b_id = b_id;
	        this.b_name = b_name;
	        this.b_image = b_image;
	        this.b_price = b_price;
	        this.person = person; 
	    }
	    public BookingDB() {
	    	
	    }

	    // Getters and Setters
	    public String getb_id() {
	        return b_id;
	    }

	    public void setb_id(String b_id) {
	        this.b_id = b_id;
	    }

	    public String getb_name() {
	        return b_name;
	    }

	    public void setb_name(String b_name) {
	        this.b_name = b_name;
	    }

	    public String getb_image() {
	        return b_image;
	    }

	    public void setb_image(String b_image) {
	        this.b_image = b_image;
	    }

	    public String getb_price() {
	        return b_price;
	    }

	    public void setb_price(String b_price) {
	        this.b_price = b_price;
	    }
	    public int getTotalPrice() {
	        return Integer.parseInt(b_price) * Integer.parseInt(person);
	    }
	    
	}




