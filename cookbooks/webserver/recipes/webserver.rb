# Install the necessary Windows Roles and Features
%w(Web-Server).each do |feature|
  dsc_script 'InstallWindowsFeatures' do
    code <<-EOH
    WindowsFeature PreRequisites
    {
      Ensure = "Present"
      Name = "#{feature}"
    }
    EOH
  end
end