pragma solidity >= 0.7.0 < 0.8.0;

// Build the Contract
contract StudentManagementSystem
{
    struct Document
    {
        uint ID;
        string name;
        string IPFSid;
    }

    struct UserDetails{
        address addr;
        string name;
        string password;
        bool isLoggedIn;
    }

//OWNER(ADMIN)
    address author;

    //USERS
    mapping(address => UserDetails) users;

    uint public docCount = 0;
    mapping(int => Document) public docRecords;

    constructor()
    {
        author = msg.sender;
    }

function signUp(address addr,string memory name,string memory password) public{
        
        //Should not be already present in DB
        require(users[addr].addr != null);

        users[addr] = UserDetails(addr,name,password,false);
    }

    function signIn(address addr) public{
        users[addr].isLoggedIn = true;
    }

    function logout(address addr) public{
        users[addr].isLoggedIn = false;
    }

function addNewDocument(uint _ID, string memory _name, string memory IPFSid) public
    {
        docRecords = docRecords + 1;
        docRecords[docRecords] = Document({ID : _ID, name : _name, IPFSid : _IPFSid});
    }

    function getFileIPFS(uint fileId) public returns(string memory)({
        return docRecords[fileId].IPFSid;
    }

    
}