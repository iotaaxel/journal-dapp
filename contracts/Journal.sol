// SPDX-License-Identifier: MIT
pragma solidity 0.8.11;


contract Journal {

    address public owner;
    string public title;

    enum Mood { Anxious, Happy, Sad, Melancholy}

    struct Entry {
        string title;
        string note; // write how you are feeling, etc.
        address owner;
        Mood mood;
    }

    uint public entryCount = 0;
    mapping(uint => Entry) public entries;

    event Submitted(string title, string note, address owner, Mood mood);

    function createJournalEntry(string memory _note, string memory _title, Mood _mood) public {
        // Require valid entry items
        require(bytes(_note).length > 0 && bytes(_title).length > 0);
        // Increase entry count
        entryCount++;
        // Create a journal entry
        entries[entryCount] = Entry(_title, _note, msg.sender, _mood);
        // Trigger event
        emit Submitted(_title, _note, msg.sender, _mood);
    }

}