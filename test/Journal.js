const Journal = artifacts.require("Journal.sol");

contract("Journal", (accounts) => {
    it("Should return the entry", async () => {
        
        // Setup contract with initial state
        const instance = await Journal.deployed();

        const expected_title = 'My first entry!';
        const expected_note = 'I had a wonderful day!';
        const expected_mood = Journal.Mood.Happy;

        // Create journal entry
        await instance.createJournalEntry("I had a wonderful day!", expected_title, Journal.Mood.Happy, { from: accounts[0] });

        // Check if journal title was stored
        const theTitle = await instance.getTitle.call();
        assert.equal(theTitle, expected_title);

        // Check if journal note was stored
        const theNote = await instance.getNote.call();
        assert.equal(theNote, expected_note);

        // Check if journal mood was stored
        const theMood = await instance.getMood.call();
        assert.equal(theMood, expected_mood);
    });
});