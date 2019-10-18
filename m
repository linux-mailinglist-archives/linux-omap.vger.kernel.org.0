Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC4EDCF66
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 21:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443348AbfJRTjL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 15:39:11 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:36680 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2443337AbfJRTjK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 15:39:10 -0400
Received: by mail-io1-f43.google.com with SMTP id b136so8817286iof.3;
        Fri, 18 Oct 2019 12:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=8aMlPecP1SszjzpIifjH9m8749Vfm9vqZkV6kzSfeY0=;
        b=BkqzcsU1zvmBYM2v7Pj9rN9puz0lKZ38gsUE1fB/MIQD3wPbdcxfNJJ96IBJNjjVsq
         YJNeYdaIcgp/+YBKLmf2iDDZooLetG3nc8HIlTTPuNvckaYVSmBu2TPz7x1rAkBGn5dO
         Ndn9blSfsXVK2jZMlibCoXHs146t8wyk6VovmYYfzC78ZFhNlm1b9YJlor78+u2A9jAT
         L6Lkp6v0RZ8BxyY2hbgkU7E94N/NEO/O/GQIr050tIXktNfh7vmJiavc0fNthyxeowMt
         z38jwb2fPfbPTyTnhHHwpf5akOVzjqDP5PTR8V9iaoT5H/wwHklrU/8M5PdlcF+VhVuy
         4IDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=8aMlPecP1SszjzpIifjH9m8749Vfm9vqZkV6kzSfeY0=;
        b=s/lm82ZyahPiFeBEbd6N8/9nAe67AcQBuSaHJunpYv4goq5ugautlD+uL3MglrRgRp
         kbTZ8hsEV7eOIdz/o6T3bRAMK/4DIGHuQPOXCaUQSKw3kH4OrfAESQX8UYXLAtZnmzYX
         EJTxtpCdUjot7w3dUlzOnxyf9SiMaaZ64Q1ZVOkvG3Nii7Tp4mvCROIc+09wLaAziY1b
         aQZGbHrj3DHrd29cY2r0cgm/DCaacETueVifUm8MQdvIKDRC7u8jGO2uM2RsnCibjRN6
         L55MNOYIir1TTcmYn+YPVPnh3y4/o0AIpKVE2Lhbx/Ij6UEUiX0yOyyFbS55+VBYu6Sx
         uLPA==
X-Gm-Message-State: APjAAAURf/NxE8pR0dos7N1/TarChRJ/JghsBE0I032VyqJxJ3tRFTU0
        b8vZbciP6+FbUlPmuzB7jowc+szM8JwYbLIEbj7yrN6m
X-Google-Smtp-Source: APXvYqwJySWniUWivckGdbyIl7/YDmLaPdDCnsNAC+GL7QWaqfoswoRnutyZYPhkDVKDKJkpeY7EPi0XG28BZ3IP1TA=
X-Received: by 2002:a5d:9952:: with SMTP id v18mr9748458ios.58.1571427549282;
 Fri, 18 Oct 2019 12:39:09 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 18 Oct 2019 14:38:57 -0500
Message-ID: <CAHCN7xKiyYGhw4M5G1v8xsrJZxg1eFKEuLvrJf=nDuCKzonnJQ@mail.gmail.com>
Subject: OMAP3 ISP v4l2 inconsistency on DM3730
To:     Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I have a DM3730 with a parallel mt9p031 sensor attached.  I am trying
to troubleshoot some issues with streaming video with G-streamer, but
I I think the issue is in how the ISP driver reports the video info.

I have the pipeline to grab from the resizer:

media-ctl -v -V '"mt9p031 1-0048":0 [SGRBG8 1280x720
(664,541)/1280x720], "OMAP3 ISP CCDC":2 [SGRBG8 1280x720], "OMAP3 ISP
preview":1 [UYVY 1280x720], "OMAP3 ISP resizer":1 [UYVY 480x272]'

This make /dev/video6 the output of the resizer and shows the format
and resolution of the output of the resizer as:

     Setting up format UYVY8_1X16 480x272 on pad OMAP3 ISP resizer/1
     Format set: UYVY8_1X16 480x272

I used 480x272 because it's the resolution of my LCD, and I was hoping
the resizer would be able to scale this so the ARM would not need to
do the work, and it appears to not have any issues with this
resolution.

However, if I query the video format, I don't get UYVY:

# v4l2-ctl  -d6 --list-formats-ext
ioctl: VIDIOC_ENUM_FMT
        Type: Video Capture

        [0]: 'RGB3' (RGB3, emulated)
        [1]: 'BGR3' (BGR3, emulated)
        [2]: 'YU12' (YU12, emulated)
        [3]: 'YV12' (YV12, emulated)

This becomes an issue when I attempt to stream video from my camera to
anything, include fake sink:

gst-launch-1.0 -v v4l2src device=/dev/video6 ! fakesink
Tried to capture in RGB3, but device returned format UYVY

So for some reason, when queried, it reports different values than
UYVY, but when attempting to set the video capture to the listed
formats, it returns an error.

gst-launch-1.0 -v v4l2src device=/dev/video6 ! video/x-raw,
format=UYVY ! fakesink

Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Internal data stream error.
Additional debug info:
gstbasesrc.c(3055): gst_base_src_loop ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
streaming stopped, reason not-negotiated (-4)

This leads me to believe that v4l2 is trying to set the format to
something it does not think it is able to negotiate, and it's being
rejected.

I can even explicitly set the output video format to UYVY with:

v4l2-ctl -d /dev/video6
--set-fmt-video=width=480,height=272,pixelformat=UYVY --verbose

VIDIOC_QUERYCAP: ok
VIDIOC_G_FMT: ok
VIDIOC_S_FMT: ok
Format Video Capture:
        Width/Height      : 480/272
        Pixel Format      : 'UYVY'
        Field             : None
        Bytes per Line    : 960
        Size Image        : 261120
        Colorspace        : JPEG
        Transfer Function : Default (maps to sRGB)
        YCbCr/HSV Encoding: Default (maps to ITU-R 601)
        Quantization      : Default (maps to Full Range)
        Flags             :
#

This shows me the UYVY format, but upon a follow-up query, it does not
appear to retain the pixel format of UYVY.

v4l2-ctl -d /dev/video6 --list-formats-ext
ioctl: VIDIOC_ENUM_FMT
        Type: Video Capture

        [0]: 'RGB3' (RGB3, emulated)
        [1]: 'BGR3' (BGR3, emulated)
        [2]: 'YU12' (YU12, emulated)
        [3]: 'YV12' (YV12, emulated)
#

If I use ffmpeg to stream video, I the video codec there recognizes it
as uyvy and I can convert it to RGB to display on my LCD, but it has
limited framerate, and it seems to me like this should be do-able in
G-Streamer with v4l2src.

# ffmpeg -an -re -i /dev/video6 -f v4l2 -vcodec rawvideo -pix_fmt bgra
-f fbdev /dev/fb0

Input #0, video4linux2,v4l2, from '/dev/video6':
  Duration: N/A, start: 908.826490, bitrate: N/A
    Stream #0:0: Video: rawvideo (UYVY / 0x59565955), uyvy422,
480x272, 17.42 tbr, 1000k tbn, 1000k tbc
Stream mapping:
  Stream #0:0 -> #0:0 (rawvideo (native) -> rawvideo (native))
Press [q] to stop, [?] for help
Output #0, fbdev, to '/dev/fb0':
  Metadata:
    encoder         : Lavf57.83.100
    Stream #0:0: Video: rawvideo (BGRA / 0x41524742), bgra, 480x272,
q=2-31, 72765 kb/s, 17.42 fps, 17.42 tbn, 17.42 tbc
    Metadata:
      encoder         : Lavc57.107.100 rawvideo


This shows me the information is available in some ways from v4l2, but
I wonder if there is a missing IOCTL for VIDIOC_ENUM_FMT for the isp
driver somewhere.  Shouldn't VIDIOC_ENUM_FMT  return UYVY?

I noticed vpbe_display.c has a function that appears to correspond to
this.  There is a patch at [1] for an older kernel.  Is this something
worth pursuing?

[1] - https://stackoverflow.com/questions/20693155/gstreamer-failed-to-enumerate-video-formats-and-inappropriate-ioctl-for-device

adam
