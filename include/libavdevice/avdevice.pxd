
cdef extern from "libavdevice/avdevice.h" nogil:

    cdef struct AVDeviceInfo:
        char *device_name  # device name, format depends on device
        char *device_description  # human friendly name

    cdef struct AVDeviceInfoList:
        AVDeviceInfo **devices  # list of autodetected devices
        int nb_devices  # number of autodetected devices
        int default_device  # index of default device or -1 if no default

    cdef int   avdevice_version()
    cdef char* avdevice_configuration()
    cdef char* avdevice_license()

    void avdevice_register_all()

    AVInputFormat * av_input_audio_device_next(AVInputFormat *d)
    AVInputFormat * av_input_video_device_next(AVInputFormat *d)
    AVOutputFormat * av_output_audio_device_next(AVOutputFormat *d)
    AVOutputFormat * av_output_video_device_next(AVOutputFormat *d)
    int avdevice_list_devices(AVFormatContext *s, AVDeviceInfoList **device_list)
