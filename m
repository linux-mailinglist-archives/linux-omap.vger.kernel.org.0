Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92CBDDD0C3
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 23:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732529AbfJRVA5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 17:00:57 -0400
Received: from retiisi.org.uk ([95.216.213.190]:55552 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731817AbfJRVA4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 18 Oct 2019 17:00:56 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 10181634C87;
        Sat, 19 Oct 2019 00:00:20 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iLZMC-0001fx-Le; Sat, 19 Oct 2019 00:00:20 +0300
Date:   Sat, 19 Oct 2019 00:00:20 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: OMAP3 ISP v4l2 inconsistency on DM3730
Message-ID: <20191018210020.GG4735@valkosipuli.retiisi.org.uk>
References: <CAHCN7xKiyYGhw4M5G1v8xsrJZxg1eFKEuLvrJf=nDuCKzonnJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xKiyYGhw4M5G1v8xsrJZxg1eFKEuLvrJf=nDuCKzonnJQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

HI Adam,

On Fri, Oct 18, 2019 at 02:38:57PM -0500, Adam Ford wrote:
> I have a DM3730 with a parallel mt9p031 sensor attached.  I am trying
> to troubleshoot some issues with streaming video with G-streamer, but
> I I think the issue is in how the ISP driver reports the video info.
> 
> I have the pipeline to grab from the resizer:
> 
> media-ctl -v -V '"mt9p031 1-0048":0 [SGRBG8 1280x720
> (664,541)/1280x720], "OMAP3 ISP CCDC":2 [SGRBG8 1280x720], "OMAP3 ISP
> preview":1 [UYVY 1280x720], "OMAP3 ISP resizer":1 [UYVY 480x272]'
> 
> This make /dev/video6 the output of the resizer and shows the format
> and resolution of the output of the resizer as:
> 
>      Setting up format UYVY8_1X16 480x272 on pad OMAP3 ISP resizer/1
>      Format set: UYVY8_1X16 480x272
> 
> I used 480x272 because it's the resolution of my LCD, and I was hoping
> the resizer would be able to scale this so the ARM would not need to
> do the work, and it appears to not have any issues with this
> resolution.
> 
> However, if I query the video format, I don't get UYVY:
> 
> # v4l2-ctl  -d6 --list-formats-ext
> ioctl: VIDIOC_ENUM_FMT
>         Type: Video Capture
> 
>         [0]: 'RGB3' (RGB3, emulated)
>         [1]: 'BGR3' (BGR3, emulated)
>         [2]: 'YU12' (YU12, emulated)
>         [3]: 'YV12' (YV12, emulated)
> 
> This becomes an issue when I attempt to stream video from my camera to
> anything, include fake sink:
> 
> gst-launch-1.0 -v v4l2src device=/dev/video6 ! fakesink
> Tried to capture in RGB3, but device returned format UYVY
> 
> So for some reason, when queried, it reports different values than
> UYVY, but when attempting to set the video capture to the listed
> formats, it returns an error.
> 
> gst-launch-1.0 -v v4l2src device=/dev/video6 ! video/x-raw,
> format=UYVY ! fakesink

I don't have any experience on v4l2src recently but I can comment on the
omap3isp driver.

In general, the format the omap3isp may produce on a given video node
depends on the format of data which the block associated with the video
node is fed with.

For instance, in case of the raw Bayer formats, the pixel order does not
change, and thus the pixel order remains all the way from the sensor to the
video node.

This also means that there is no way to provide an enumeration of supported
formats without knowing the media bus format. There have been proposals to
support ENUM_FMT in such cases by providing the source media bus format,
but those proposals haven't materialised into patches.

So for now, the format needs to be simply set using S_FMT.

> 
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Internal data stream error.
> Additional debug info:
> gstbasesrc.c(3055): gst_base_src_loop ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> streaming stopped, reason not-negotiated (-4)
> 
> This leads me to believe that v4l2 is trying to set the format to
> something it does not think it is able to negotiate, and it's being
> rejected.
> 
> I can even explicitly set the output video format to UYVY with:
> 
> v4l2-ctl -d /dev/video6
> --set-fmt-video=width=480,height=272,pixelformat=UYVY --verbose
> 
> VIDIOC_QUERYCAP: ok
> VIDIOC_G_FMT: ok
> VIDIOC_S_FMT: ok
> Format Video Capture:
>         Width/Height      : 480/272
>         Pixel Format      : 'UYVY'
>         Field             : None
>         Bytes per Line    : 960
>         Size Image        : 261120
>         Colorspace        : JPEG
>         Transfer Function : Default (maps to sRGB)
>         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
>         Quantization      : Default (maps to Full Range)
>         Flags             :
> #
> 
> This shows me the UYVY format, but upon a follow-up query, it does not
> appear to retain the pixel format of UYVY.
> 
> v4l2-ctl -d /dev/video6 --list-formats-ext
> ioctl: VIDIOC_ENUM_FMT
>         Type: Video Capture
> 
>         [0]: 'RGB3' (RGB3, emulated)
>         [1]: 'BGR3' (BGR3, emulated)
>         [2]: 'YU12' (YU12, emulated)
>         [3]: 'YV12' (YV12, emulated)
> #
> 
> If I use ffmpeg to stream video, I the video codec there recognizes it
> as uyvy and I can convert it to RGB to display on my LCD, but it has
> limited framerate, and it seems to me like this should be do-able in
> G-Streamer with v4l2src.
> 
> # ffmpeg -an -re -i /dev/video6 -f v4l2 -vcodec rawvideo -pix_fmt bgra
> -f fbdev /dev/fb0
> 
> Input #0, video4linux2,v4l2, from '/dev/video6':
>   Duration: N/A, start: 908.826490, bitrate: N/A
>     Stream #0:0: Video: rawvideo (UYVY / 0x59565955), uyvy422,
> 480x272, 17.42 tbr, 1000k tbn, 1000k tbc
> Stream mapping:
>   Stream #0:0 -> #0:0 (rawvideo (native) -> rawvideo (native))
> Press [q] to stop, [?] for help
> Output #0, fbdev, to '/dev/fb0':
>   Metadata:
>     encoder         : Lavf57.83.100
>     Stream #0:0: Video: rawvideo (BGRA / 0x41524742), bgra, 480x272,
> q=2-31, 72765 kb/s, 17.42 fps, 17.42 tbn, 17.42 tbc
>     Metadata:
>       encoder         : Lavc57.107.100 rawvideo
> 
> 
> This shows me the information is available in some ways from v4l2, but
> I wonder if there is a missing IOCTL for VIDIOC_ENUM_FMT for the isp
> driver somewhere.  Shouldn't VIDIOC_ENUM_FMT  return UYVY?
> 
> I noticed vpbe_display.c has a function that appears to correspond to
> this.  There is a patch at [1] for an older kernel.  Is this something
> worth pursuing?
> 
> [1] - https://stackoverflow.com/questions/20693155/gstreamer-failed-to-enumerate-video-formats-and-inappropriate-ioctl-for-device

-- 
Kind regards,

Sakari Ailus
