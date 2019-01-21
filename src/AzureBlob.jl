module AzureBlob

import Base64
import Nettle
import Dates
using Pipe
import HTTP

export 
    azure_signature,
    get_blob,
    http_date,
    put_blob

const X_MS_VERSION = "2017-04-17"

include("rest.jl")
include("signature.jl")

end # module
