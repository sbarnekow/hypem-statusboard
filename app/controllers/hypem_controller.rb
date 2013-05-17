class HypemController < ApplicationController
attr_accessor :page_results, :flattened_page
  def search
    the_search = Hypem.new
    @page_results = the_search.search
    page_results.shift
    @songdata = @page_results['0']['title']
        @jsondata = 
        { "graph" => {
        "title" => "Today's popular songs!",
        "datasequences" => [
          { 
            "title" => "Each song's loved_count",
            "color" => "green",
            "type" => "bar",
            "total" => false,
            "refreshEveryNSeconds" => 60,
            "datapoints" => [
            { "title" => page_results['0']['title'], "value" => @page_results['0']['loved_count'] },
            { "title" => page_results['1']['title'], "value" => @page_results['1']['loved_count'] },
            { "title" => page_results['2']['title'], "value" => @page_results['2']['loved_count'] },
            { "title" => page_results['3']['title'], "value" => @page_results['3']['loved_count'] },
            { "title" => page_results['4']['title'], "value" => @page_results['4']['loved_count'] },
            ]
          },
          { 
            "title" => "Each song's posted_count",
            "color" => "purple",
            "type" => "bar",
            "total" => false,
            "refreshEveryNSeconds" => 60,
            "datapoints" => [
            { "title" => page_results['0']['title'], "value" => @page_results['0']['posted_count'] },
            { "title" => page_results['1']['title'], "value" => @page_results['1']['posted_count'] },
            { "title" => page_results['2']['title'], "value" => @page_results['2']['posted_count'] },
            { "title" => page_results['3']['title'], "value" => @page_results['3']['posted_count'] },
            { "title" => page_results['4']['title'], "value" => @page_results['4']['posted_count'] },
            ]
          }
        ]
      }
    }

    render :json => @jsondata
 end 
end

  # def find_daft_punk
  #  @flattened_page = @page_results
  # end