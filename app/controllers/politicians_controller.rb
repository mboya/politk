class PoliticiansController < ApplicationController
  def index
  	@contest_type= params[:contest_type]
    @political_party_id =  params[:political_party_id]
    @county_id= params[:county_id]
    @constituency_id= params[:constituency_id]

    querystring = ''
    !@filter_letter.nil? ?  querystring << " AND (surname follow  '#{@filter_letter}%' OR other_name follow  '#{@filter_letter}%')" : ""
    !@contest_type.nil? ?   querystring << " AND contest_type =  #{@contest_type}" : ""
    !@political_party_id.nil? ?  querystring <<  " AND political_party_id =  #{@political_party_id}" : ""
    !@county_id.nil? ?  querystring << " AND contests.county_id  =  #{@county_id}" : ""
    !@constituency_id.nil? ?  querystring << " AND  contests.constituency_id =  #{@constituency_id}" : ""

    querystring = querystring.slice(5, querystring.length)
    @politicians = Politician.joins(:contest).where(querystring).order('surname').paginate(:page => params[:page])
      
    @page_title = ''; 
    
    if !@political_party_id.nil?
    	@page_title << PoliticalParty.find(@political_party_id).name.to_str.capitalize! + ' '
       	@page_desc = @page_title
      	@tags = @page_title 
    end
  
    if !@county_id.nil?
    	@page_title << County.find(@county_id).name.to_str.capitalize! + ' County'
      	@page_desc = @page_title
      	@tags = @page_title 
    end

    if !@constituency_id.nil?
    	@page_title << Constituency.find(@constituency_id).name.to_str.capitalize! + ' Constituency'
       	@page_desc = @page_title
      	@tags = @page_title 
    end

    if @contest_type == '1'
       	@page_title  << 'President & Deputy President'
       	@page_desc = 'Politk provides the names of the president and deputy president and links to their profiles and affiliated political parties.'
       	@tags = 'Uhuru, Ruto, Kenya\'s president, TNA, URP'
    elsif @contest_type == '2'
       	@page_title << 'Gubernatorial Politicians '
       	@page_desc = 'Politk provides  the list of the governors and links to their profiles and affiliated political parties.'
       	@tags = 'Kenyan governors, counties, TNA, URP, ODM, Wiper'
    elsif  @contest_type == '3'
       	@page_title << 'Senatorial Politicians '
       	@page_desc = 'Politk provides  the list of the senators and links to their profiles and affiliated political parties.'
       	@tags = 'Kenyan senators, senate, counties, TNA, URP, ODM, Wiper'
    elsif @contest_type == '4'
      	@page_title << 'National Assembly Rep Politicians '
      	@page_desc = ' Politk provides  the list of the National Assembly reps and links to their profiles and affiliated political parties.'
       	@tags = 'Kenyan MPs, Kenyan constituencies, National Assembly, TNA, URP, ODM, Wiper'
    elsif @contest_type == '5'
     	@page_title << 'Women Rep Politicians '
     	@page_desc = 'Politk provides  the list of the women representatives  and links to their profiles and affiliated political parties.'
      	@tags = 'Women representatives, counties, senate, TNA, URP, ODM, Wiper'
    end
       
  	respond_to do |format|
    	format.html
        format.js # add this line for your js template
    end

  end

  def show
  end
end
