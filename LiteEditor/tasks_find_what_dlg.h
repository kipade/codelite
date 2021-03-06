//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//
// copyright            : (C) 2013 by Eran Ifrah
// file name            : tasks_find_what_dlg.h
//
// -------------------------------------------------------------------------
// A
//              _____           _      _     _ _
//             /  __ \         | |    | |   (_) |
//             | /  \/ ___   __| | ___| |    _| |_ ___
//             | |    / _ \ / _  |/ _ \ |   | | __/ _ )
//             | \__/\ (_) | (_| |  __/ |___| | ||  __/
//              \____/\___/ \__,_|\___\_____/_|\__\___|
//
//                                                  F i l e
//
//    This program is free software; you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation; either version 2 of the License, or
//    (at your option) any later version.
//
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

#ifndef __tasks_find_what_dlg__
#define __tasks_find_what_dlg__

/**
@file
Subclass of TasksFindWhatDlgBase, which is generated by wxFormBuilder.
*/

#include "tasksfindwhatdlgbase.h"

/** Implementing TasksFindWhatDlgBase */
class TasksFindWhatDlg : public TasksFindWhatDlgBase
{
protected:
	// Handlers for TasksFindWhatDlgBase events.
	void OnNewTask( wxCommandEvent& event );
	void OnDeleteTask( wxCommandEvent& event );
	void OnDeleteTaskUI( wxUpdateUIEvent& event );
	void OnEditTask( wxCommandEvent& event );
	void OnEditTaskUI( wxUpdateUIEvent& event );
	void OnButtonOk( wxCommandEvent& event );

private:
	void DoAddLine(const wxString &name, const wxString &regex, bool enabled);
	void DoSaveList();

public:
	/** Constructor */
	TasksFindWhatDlg( wxWindow* parent );
	virtual ~TasksFindWhatDlg();
};

#endif // __tasks_find_what_dlg__
