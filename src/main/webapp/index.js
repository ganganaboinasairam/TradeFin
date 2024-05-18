let noteIdCounter = 0;

function createNote() {
    const noteId = `note_${noteIdCounter}`;
    const noteContent = `
        <div id="${noteId}" class="note">
            <textarea></textarea>
            <button onclick="closeNote('${noteId}')">Close</button>
        </div>
    `;
    document.getElementById('notesContainer').insertAdjacentHTML('beforeend', noteContent);
    noteIdCounter++;
}

function closeNote(noteId) {
    const noteElement = document.getElementById(noteId);
    if (noteElement) {
        noteElement.remove();
    }
}
