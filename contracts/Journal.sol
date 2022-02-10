// SPDX-License-Identifier: MIT
pragma solidity 0.8.11;


contract Journal {

    enum Mood { Anxious, Happy, Sad, Melancholy}

    struct Entry {
        string title;
        string note; // write how you are feeling, etc.
        address owner;
        Mood mood;
        uint entry_id;
    }

    Entry entry;

    uint public entryCount = 0;
    mapping(uint => Entry) public entries;

    event Submitted(Entry);

    function createJournalEntry(string memory _note, string memory _title, Mood _mood) public {
        // Require valid entry items
        require(bytes(_note).length > 0 && bytes(_title).length > 0);
    
        // Create a journal entry
        entry = Entry(_title, _note, msg.sender, _mood, entryCount);
        // Trigger event
        emit Submitted(entry);
        // Increase entry count
        entryCount++;
    }

    function getTitle() public view returns (string memory) {
        return entry.title;
    }

    function getNote() public view returns (string memory) {
        return entry.note;
    }

    function getMood() public view returns (Mood) {
        return entry.mood;
    }

}