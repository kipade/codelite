#ifndef OUTPUTDEBUGSTRINGTHREAD_H
#define OUTPUTDEBUGSTRINGTHREAD_H

#include <wx/thread.h> // Base class: wxThread
#include "cl_command_event.h"

wxDECLARE_EVENT(wxEVT_OUTPUT_DEBUG_STRING, clCommandEvent);
class OutputDebugStringThread : public wxThread
{
#ifdef __WXMSW__
    struct dbwin_buffer {
        DWORD dwProcessId;
        char data[4096 - sizeof(DWORD)];
    };
    HANDLE m_hDBWinMutex;
    HANDLE m_hDBMonBuffer;
    HANDLE m_hEventBufferReady;
    HANDLE m_hEventDataReady;
    dbwin_buffer* m_pDBBuffer;
#endif

public:
    OutputDebugStringThread();
    virtual ~OutputDebugStringThread();

public:
    /**
     * @brief the thread entry point
     */
    virtual void* Entry();

    /**
     * Stops the thread
     * This function returns only when the thread is terminated.
     * \note This call must be called from the context of other thread (e.g. main thread)
     */
    void Stop();

    /**
     * Start the thread as joinable thread.
     * \note This call must be called from the context of other thread (e.g. main thread)
     */
    void Start(int priority = WXTHREAD_DEFAULT_PRIORITY);
};

#endif // OUTPUTDEBUGSTRINGTHREAD_H
