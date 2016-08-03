//
//  RealmHelper.swift
//  MakeSchoolNotes
//
//  Created by Abigail Chin on 8/2/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    //static methods will go here
    static func addNote(note: Note){
        let realm = try! Realm()
        try! realm.write() {
            realm.add(note)
        }
    }
    static func deleteNote(note:Note){
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(note)
        }
    }
    //updates the noteToBeUpdated in the default realm
    static func updateNote(noteToBeUpdated: Note, newNote: Note){
        let realm = try! Realm()
        try! realm.write() {
            noteToBeUpdated.title = newNote.title
            noteToBeUpdated.content = newNote.content
            noteToBeUpdated.modificationTime = newNote.modificationTime
        }
    }
    //retrieves all notes from the default realm
    static func retrieveNotes() -> Results<Note> {
        let realm = try! Realm()
        return realm.objects(Note).sorted("modificationTime", ascending: false)
    }
}