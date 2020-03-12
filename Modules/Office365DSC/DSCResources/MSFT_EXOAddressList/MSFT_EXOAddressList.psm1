function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (        

        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,
        
        [Parameter()]
        [System.String]
        $ConditionalCompany,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute1,
        
        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute10,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute11,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute12,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute13,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute14,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute15,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute2,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute3,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute4,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute5,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute6,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute7,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute8,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute9,

        [Parameter()]
        [System.String]
        $ConditionalDepartment,

        [Parameter()]
        [System.String]
        $ConditionalStateOrProvince,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [ValidateSet('AllRecipients', 'MailboxUsers', 'MailContacts', 'MailGroups', 'MailUsers', 'Resources')]
        [System.String]
        $IncludedRecipients,

        [Parameter()]
        [System.String]
        $RecipientFilter,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )

    Write-Verbose -Message "Getting configuration of AddressList for $Name"
    #region Telemetry
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $MyInvocation.MyCommand.ModuleName)
    $data.Add("Method", $MyInvocation.MyCommand)
    Add-O365DSCTelemetryEvent -Data $data
    #endregion

    Test-MSCloudLogin -O365Credential $GlobalAdminAccount `
        -Platform ExchangeOnline

    $nullReturn = @{
        Name                         = $Name
        ConditionalCompany           = $ConditionalCompany
        ConditionalCustomAttribute1  = $ConditionalCustomAttribute1
        ConditionalCustomAttribute10 = $ConditionalCustomAttribute10
        ConditionalCustomAttribute11 = $ConditionalCustomAttribute11
        ConditionalCustomAttribute12 = $ConditionalCustomAttribute12
        ConditionalCustomAttribute13 = $ConditionalCustomAttribute13
        ConditionalCustomAttribute14 = $ConditionalCustomAttribute14
        ConditionalCustomAttribute15 = $ConditionalCustomAttribute15
        ConditionalCustomAttribute2  = $ConditionalCustomAttribute2
        ConditionalCustomAttribute3  = $ConditionalCustomAttribute3
        ConditionalCustomAttribute4  = $ConditionalCustomAttribute4
        ConditionalCustomAttribute5  = $ConditionalCustomAttribute5
        ConditionalCustomAttribute6  = $ConditionalCustomAttribute6
        ConditionalCustomAttribute7  = $ConditionalCustomAttribute7
        ConditionalCustomAttribute8  = $ConditionalCustomAttribute8
        ConditionalCustomAttribute9  = $ConditionalCustomAttribute9
        ConditionalDepartment        = $ConditionalDepartment
        ConditionalStateOrProvince   = $ConditionalStateOrProvince
        DisplayName                  = $DisplayName
        IncludedRecipients           = $IncludedRecipients
        RecipientFilter              = $RecipientFilter
        Ensure                       = 'Absent'
        GlobalAdminAccount           = $GlobalAdminAccount
    }

    $AddressLists = Get-AddressList
    $AddressList = $AddressLists | Where-Object -FilterScript { $_.Name -eq $Name }

    if ($null -eq $AddressList)
    {
        Write-Verbose -Message "Address List $($Name) does not exist."
        return $nullReturn
    }
    else
    {
        if ($null -eq $AddressList.IncludedRecipients)
        {
            $IncludedRecipients = "".ToString()
        }
        else
        {
            $IncludedRecipients = $AddressList.IncludedRecipients
        }

        $result = @{
            Name                                 = $Name
            ConditionalCompany                   = $AddressList.ConditionalCompany
            ConditionalCustomeAttribute1         = $AddressList.ConditionalCustomAttribute1
            ConditionalCustomeAttribute10        = $AddressList.ConditionalCustomAttribute10
            ConditionalCustomeAttribute11        = $AddressList.ConditionalCustomAttribute11
            ConditionalCustomeAttribute12        = $AddressList.ConditionalCustomAttribute12
            ConditionalCustomeAttribute13        = $AddressList.ConditionalCustomAttribute13
            ConditionalCustomeAttribute14        = $AddressList.ConditionalCustomAttribute14
            ConditionalCustomeAttribute15        = $AddressList.ConditionalCustomAttribute15
            ConditionalCustomeAttribute2         = $AddressList.ConditionalCustomAttribute2
            ConditionalCustomeAttribute3         = $AddressList.ConditionalCustomAttribute3
            ConditionalCustomeAttribute4         = $AddressList.ConditionalCustomAttribute4
            ConditionalCustomeAttribute5         = $AddressList.ConditionalCustomAttribute5
            ConditionalCustomeAttribute6         = $AddressList.ConditionalCustomAttribute6
            ConditionalCustomeAttribute7         = $AddressList.ConditionalCustomAttribute7
            ConditionalCustomeAttribute8         = $AddressList.ConditionalCustomAttribute8
            ConditionalCustomeAttribute9         = $AddressList.ConditionalCustomAttribute9
            ConditionalDepartment                = $AddressList.ConditionalDepartment
            ConditionalStateOrProvince           = $AddressList.ConditionalStateOrProvince
            DisplayName                          = $AddressList.DisplayName
            IncludedRecipients                   = $IncludedRecipients
            RecipientFilter                      = $AddressList.RecipientFilter
            Ensure                               = 'Present'
            GlobalAdminAccount                   = $GlobalAdminAccount
        }

        Write-Verbose -Message "Found AddressList $($Name)"
        Write-Verbose -Message "Get-TargetResource Result: `n $(Convert-O365DscHashtableToString -Hashtable $result)"
        return $result
    }
}
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (        

        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,
        
        [Parameter()]
        [System.String]
        $ConditionalCompany,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute1,
        
        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute10,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute11,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute12,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute13,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute14,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute15,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute2,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute3,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute4,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute5,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute6,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute7,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute8,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute9,

        [Parameter()]
        [System.String]
        $ConditionalDepartment,

        [Parameter()]
        [System.String]
        $ConditionalStateOrProvince,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [ValidateSet('AllRecipients', 'MailboxUsers', 'MailContacts', 'MailGroups', 'MailUsers', 'Resources')]
        [System.String]
        $IncludedRecipients,

        [Parameter()]
        [System.String]
        $RecipientFilter,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )

    Write-Verbose -Message "Setting Address List configuration for $Name"

    $currentAddressListConfig = Get-TargetResource @PSBoundParameters

    #region Telemetry
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $MyInvocation.MyCommand.ModuleName)
    $data.Add("Method", $MyInvocation.MyCommand)
    Add-O365DSCTelemetryEvent -Data $data
    #endregion

    Test-MSCloudLogin -O365Credential $GlobalAdminAccount `
        -Platform ExchangeOnline

    if ($RecipientFilter)
    {
        $NewAddressListParams = @{
            Name            = $Name
            RecipientFilter = $RecipientFilter
            Confirm         = $false
        }
    }
    else
    {
        $NewAddressListParams = @{
            Name                         = $Name
            ConditionalCompany           = $ConditionalCompany
            ConditionalCustomAttribute1  = $ConditionalCustomAttribute1
            ConditionalCustomAttribute10 = $ConditionalCustomAttribute10
            ConditionalCustomAttribute11 = $ConditionalCustomAttribute11
            ConditionalCustomAttribute12 = $ConditionalCustomAttribute12
            ConditionalCustomAttribute13 = $ConditionalCustomAttribute13
            ConditionalCustomAttribute14 = $ConditionalCustomAttribute14
            ConditionalCustomAttribute15 = $ConditionalCustomAttribute15
            ConditionalCustomAttribute2  = $ConditionalCustomAttribute2
            ConditionalCustomAttribute3  = $ConditionalCustomAttribute3
            ConditionalCustomAttribute4  = $ConditionalCustomAttribute4
            ConditionalCustomAttribute5  = $ConditionalCustomAttribute5
            ConditionalCustomAttribute6  = $ConditionalCustomAttribute6
            ConditionalCustomAttribute7  = $ConditionalCustomAttribute7
            ConditionalCustomAttribute8  = $ConditionalCustomAttribute8
            ConditionalCustomAttribute9  = $ConditionalCustomAttribute9
            ConditionalDepartment        = $ConditionalDepartment
            ConditionalStateOrProvince   = $ConditionalStateOrProvince
            DisplayName                  = $DisplayName
            IncludedRecipients           = $IncludedRecipients
            Confirm                      = $false
        }
    }

    $SetAddressListParams = @{
        Identity                     = $Name
        Name                         = $Name
        ConditionalCompany           = $ConditionalCompany
        ConditionalCustomAttribute1  = $ConditionalCustomAttribute1
        ConditionalCustomAttribute10 = $ConditionalCustomAttribute10
        ConditionalCustomAttribute11 = $ConditionalCustomAttribute11
        ConditionalCustomAttribute12 = $ConditionalCustomAttribute12
        ConditionalCustomAttribute13 = $ConditionalCustomAttribute13
        ConditionalCustomAttribute14 = $ConditionalCustomAttribute14
        ConditionalCustomAttribute15 = $ConditionalCustomAttribute15
        ConditionalCustomAttribute2  = $ConditionalCustomAttribute2
        ConditionalCustomAttribute3  = $ConditionalCustomAttribute3
        ConditionalCustomAttribute4  = $ConditionalCustomAttribute4
        ConditionalCustomAttribute5  = $ConditionalCustomAttribute5
        ConditionalCustomAttribute6  = $ConditionalCustomAttribute6
        ConditionalCustomAttribute7  = $ConditionalCustomAttribute7
        ConditionalCustomAttribute8  = $ConditionalCustomAttribute8
        ConditionalCustomAttribute9  = $ConditionalCustomAttribute9
        ConditionalDepartment        = $ConditionalDepartment
        ConditionalStateOrProvince   = $ConditionalStateOrProvince
        DisplayName                  = $DisplayName
        IncludedRecipients           = $IncludedRecipients
        RecipientFilter              = $RecipientFilter
        Confirm                      = $false
    }

    #Address List doesn't exist but it should
    if ($Ensure -eq "Present" -and $currentAddressListConfig.Ensure -eq "Absent")
    {
        Write-Verbose -Message "The Address List '$($Name)' does not exist bit it should. Creating Address List."
        New-AddressList @NewAddressListParams
    }
    #Address List exists but shouldn't
    elseif ($Ensure -eq "Absent" -and $currentAddressListConfig.Ensure -eq "Present")
    {
        Write-Verbose -Message "Address List '$($Name)' exists but shouldn't. Removing Address List."
        Remove-AddressList -Identity $Name -Confirm:$false
    }
    elseif ($Ensure -eq "Present" -and $currentAddressListConfig.Ensure -eq "Present")
    {
        Write-Verbose -Message "Address List '$($Name)' already exists. Updating settings"
        Write-Verbose -Message "Setting Address List '$($Name)' with values: $(convert-O365DscHastabelToString -Hashtable $SetAddressListParams)"
        Set-AddressList @SetAddressListParams
    }
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (        

        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,
        
        [Parameter()]
        [System.String]
        $ConditionalCompany,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute1,
        
        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute10,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute11,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute12,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute13,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute14,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute15,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute2,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute3,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute4,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute5,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute6,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute7,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute8,

        [Parameter()]
        [System.String]
        $ConditionalCustomAttribute9,

        [Parameter()]
        [System.String]
        $ConditionalDepartment,

        [Parameter()]
        [System.String]
        $ConditionalStateOrProvince,

        [Parameter()]
        [System.String]
        $DisplayName,

        [Parameter()]
        [ValidateSet('AllRecipients', 'MailboxUsers', 'MailContacts', 'MailGroups', 'MailUsers', 'Resources')]
        [System.String]
        $IncludedRecipients,

        [Parameter()]
        [System.String]
        $RecipientFilter,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )

    Write-Verbose -Message "Testing Address List configuration for $Name"

    $CurrentValues = Get-TargetResource @PSBoundParameters

    Write-Verbose -Message "Current Values: $(Convert-O365DscHashtableToString -Hashtable $CurrentValues)"
    Write-Verbose -Message "Target Values: $(Convert-O365DscHashtableToString -Hashtable $PSBoundParameters)"

    $ValuesToCheck = $PSBoundParameters
    $ValuesToCheck.Remove('GlobalAdminAccount') | Out-Null

    $TestResult = Test-Office365DSCParameterState -CurrentValues $CurrentValues `
        -Source $($MyInvocation.MyCommand.Source) `
        -DesiredValues $PSBoundParameters `
        -ValuesToCheck $ValuesToCheck.Keys

    Write-Verbose -Message "Test-TargetResource returned $TestResult"

    return $TestResult
}

function Export-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.String])]
    param (
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $GlobalAdminAccount
    )
    $InformationPreference = 'Continue'
    
    #region Telemetry
    $data = [System.Collections.Generic.Dictionary[[String], [String]]]::new()
    $data.Add("Resource", $MyInvocation.MyCommand.ModuleName)
    $data.Add("Method", $MyInvocation.MyCommand)
    Add-O365DSCTelemetryEvent -Data $data
    #endregion
    
    Test-MSCloudLogin -O365Credential $GlobalAdminAccount `
        -Platform ExchangeOnline
    $dscContent = ""
    $i = 1
    [array]$addressLists = Get-Addresslist
    $content = ''

    foreach ($addressList in $addressLists)
    {
        Write-Information "    [$i/$($addressLists.Count)] $($addressList.Name)"
        $params = @{
            Name           = $addressList.Name
            GlobalAdminAccount = $GlobalAdminAccount
        }
        $result = Test-TargetResource @params
        $result.GlobalAdminAccount = Resolve-Credentials -UserName 'globaladmin'
        $content += "      EXOAddressList" + (New-Guid).ToString() + "`r`n"
        $content += "      {`r`n"
        $currentDSCBlock = Get-DSCBlock -Params $result -ModulePath $PSScriptRoot
        $content += Convert-DSCStringParamToVariable -DSCBlock $currentDSCBlock -ParameterName "GlobalAdminAccount"
        $content += "      }`r`n"
        $dscContent += $content
        $i ++
    }
    return $content
}

Export-ModuleMember -Function *-TargetResource
