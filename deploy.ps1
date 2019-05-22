# Clean the screen
cls

# Load the source variables
. .\secrets.ps1

$project="DoorKeeper";

# Display all loaded variables
Write-Host "Project : " $project;
Write-Host "Host    : " $rpiHost;
Write-Host "User    : " $rpiUser;
Write-Host "Password: " $rpiPassword;
Write-Host


Write-Host
Write-Host -ForegroundColor Green Publishing to local folder...
dotnet publish -r linux-arm -c Debug -o ".\publish"

pushd
cd publish

Write-Host
Write-Host -ForegroundColor Green Ensuring the project folder exists in the Raspberry Pi...
plink.exe -ssh $rpiUser@$rpiHost -pw $rpiPassword mkdir /home/pi/dev/$project

Write-Host
Write-Host -ForegroundColor Green Copying publish content to Raspberry Pi...
pscp -r -pw $rpiPassword .\ $rpiUser@"$rpiHost":/home/pi/dev/$project/

popd

Write-Host
Write-Host -ForegroundColor Green Making file executable...
plink.exe -ssh $rpiUser@$rpiHost -pw $rpiPassword sudo chmod +x /home/pi/dev/$project/$project

#Write-Host
#Write-Host -ForegroundColor Green Running the published executable...
#plink.exe -ssh $rpiUser@$rpiHost -pw $rpiPassword /home/pi/dev/$project/$project --urls http://*:5000

Write-Host
Write-Host -ForegroundColor Green Now connect with ssh and run command: $project --urls http://*:5000

