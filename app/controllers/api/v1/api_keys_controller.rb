class Api::V1::ApiKeysController < Api::V1::ApiController
    def find_duplicates
        response = {};

        begin
            #check if the parameter api_key exists
            if params[:api_key].present?
                api_key = params[:api_key]
                #Remove Key (first and last characters)
                data = params[:data][1..-2]
                #Get array
                data_array = data.split(',')
                #Get string unique
                data_uniq = data_array.uniq

                #Get the number of times the chains are repeated
                #receives as arguments: string uniques and all string
                duplicates = get_duplicate_data(data_uniq, data_array)

                #Get api_key record by key field
                api_key_record = ApiKey.where(key: api_key).first

                #Consult if there is registration
                if api_key_record
                    total_use = api_key_record.total_use
                    total_use += 1

                    #Update only total_use param
                    if api_key_record.update_attribute(:total_use, total_use)
                        response = {
                            code: "200",
                            status: "success",
                            duplicates: duplicates
                        }
                    else
                        response = {
                            code: "401",
                            status: "unauthorized",
                            message: "Num request can't update"
                        }
                    end
                else
                    response = {
                        code: "401",
                        status: "unauthorized",
                        message: "api_key does not exist"
                    }
                end

            else
                response = {
                    code: "401",
                    status: "unauthorized",
                    message: "api_key parameter not present"
                }
            end
        rescue Exception => e
            response = {
                code: "401",
                status: "unauthorized",
                message: e.message
            }
        end

        render json: response
    end

    #Returns the number of times the chains are repeated
    #receives as params: string uniques and all string
    def get_duplicate_data(data_uniq, data)
        duplicates = []

        data_uniq.each do |string_item|
            position = 0
            positions = []

            data.each do |string_item_children|
                if string_item == string_item_children
                    positions << position
                end
                position += 1
            end

            string_item_custom = string_item.delete(' ') == "" ? "Text empty" : string_item
            raw = {
                word: string_item_custom[1..-2],
                positions: "{#{positions.join(',')}}"
            }

            logger.info raw
            duplicates << raw
        end

        duplicates
    end
end
