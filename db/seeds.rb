Request.destroy_all
Service.destroy_all
Category.destroy_all
Neighbourhood.destroy_all
Ward.destroy_all

def fetch_data(url)
    JSON.parse(open(url).read)
end

requests = fetch_data('https://data.winnipeg.ca/resource/4her-3th5.json')

requests.each do |request|
    ward_name = request['ward']
    ward = Ward.find_or_create_by(name: ward_name)

    neighbourhood = ward.neighbourhoods.find_or_create_by(
        name: request['neighbourhood']
    )

    service_category_name = request['service_area']
    category = Category.find_or_create_by(name:service_category_name)

    service = category.services.find_or_create_by(
        service_request: request['service_request']
    )

    request = service.requests.build(
        neighbourhood_id: neighbourhood.id,
        latitude: request['location_1']['latitude'],
        longitude: request['location_1']['longitude'],
        date: request['sr_date']
    )
    request.save
end