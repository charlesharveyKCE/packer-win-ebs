Param(
    [ValidateSet(
        "Windows2012r2", 
        "WindowsServer2016"
    )]
    [string]
    $OSName,
    [ValidateSet(
        "ap-northeast-1",   
        "ap-northeast-2",   
        "ap-south-1",
        "ap-southeast-1",
        "ap-southeast-2",
        "ca-central-1",
        "eu-central-1",
        "eu-west-1",
        "eu-west-2",
        "sa-east-1",
        "us-east-1",
        "us-east-2",
        "us-west-1",
        "us-west-2"
    )]
    [string]
    $Region="ap-southeast-2"
) 

# TODO 
# Complete full OS - Region map
$amiMap = @{
    "Windows2012r2" = @{
        "ap-southeast-1" = "ami-435acd20";
        "ap-southeast-2" = "ami-ab928fc8"        
    };
    "Windows2016" = @{
        "ap-southeast-1" = "ami-704fd813";
        "ap-southeast-2" = "ami-bf8895dc"
    }
}

$source_ami = $amiMap[$OSName][$Region]

packer build --var-file .\credentials.json -var os_name=$OSname -var source_ami=$source_ami .\template.json
