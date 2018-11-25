function get_blob(blob, directory, container, storageaccount, storagekey, resourcegroup)
    #TODO: Check input
    blobdir = blob_to_url(directory, blob)
    bloburl = string("https://", storageaccount,
                     ".blob.core.windows.net/", container, "/", blobdir)

    datestamp = string(http_date(Dates.now()), " GMT")

    signature = azure_signature(bloburl, "GET", storageaccount, storagekey,
                            container, datestamp, "", string("/", blobdir))
    token = string("SharedKey ", storageaccount, ":", signature)

    header = [
        "Authorization" => token, 
        "Content-Length" => "0",
        "x-ms-version" => "2017-04-17", 
        "x-ms-date" => datestamp
    ]

    r = HTTP.request("GET", bloburl, header)
end

function blob_to_url(directory, blob)
    string(directory, "/", blob)
end
