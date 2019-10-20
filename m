Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94666DDEC6
	for <lists+linux-omap@lfdr.de>; Sun, 20 Oct 2019 16:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfJTOF0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 20 Oct 2019 10:05:26 -0400
Received: from mail-il1-f175.google.com ([209.85.166.175]:42554 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfJTOF0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 20 Oct 2019 10:05:26 -0400
Received: by mail-il1-f175.google.com with SMTP id o16so1540488ilq.9;
        Sun, 20 Oct 2019 07:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v5Y6wxq55zSpocWsw1YFYqJcx0BH9MR4ICbfGKjmGJk=;
        b=E3RlhNfZUhOf1PdH0poKLGmZsQK0Bg5ohTHnRwiAboBLwaJrOobAiC/dCtbWLySlrE
         G6AriGr/eAiahOw5wv6TG2d3zIaXFrVi79BWqx4CIg0VJ3bx67wJOU4mrTqqimrsfC6c
         kc9drHSDUC/MEfb7pcgEXMGA1RvRDW9Ph916nLyZYh0W0My1bqA/TNoQo1jz0QpHPwXT
         EyEQnwhyJ/7t1fEjBz9sQ3FZKcKyzgZnIVH4MhgIrdyY7bKMvQrp8Kxrk2lWSZYzF5Df
         z8zI4BPsOztA07NSiRlk7AF50XvMVQ0zA5lAKstbreOQn/bhbUovWfBRM5/R40Nt6sqh
         0Y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v5Y6wxq55zSpocWsw1YFYqJcx0BH9MR4ICbfGKjmGJk=;
        b=tPGVh2dLxB3Gtcphfl147iOhBYM83pFooyzQsh0KsuYp+GG3Y/w+bIqTuOgB+EH43S
         7smbbXSrNrUCjJ/lo60ZWbesDOS9fbPtTM7jE10g8i3rv3EV5nk11ZByP1hlCWWKKTNu
         q8m6ooXp7nyb57leRf/RM/rhEXHTFE0KHNTm7X8nOExiAtsdcd8vMofImerHiT/saPP7
         aDUd7rZ7oDw+qx/QjbG4HjIUBLtTMdeyFZ8d78aqNR6zFmRhl2FKZnZ8Mi3KqiK3+7P6
         PC4Qy+6H2t15lCIOaXw4zT/BZhSv7mXtPh1IWM/b5tTBeqTcBPEkn1j3pqNRGdeaIwzL
         ZqPg==
X-Gm-Message-State: APjAAAXSERZVQF2aBpBsEywSuJT/Bq45/fQbatl8N7KmZGVQGfva1G+p
        BFeWkypYBjWkJrGHRy3eVEgweM5x7BkeRzQA694=
X-Google-Smtp-Source: APXvYqxOIrHWIUlb7CrJLL/li+ixOVI4x7YDptvZ4mbNf886w6UelCClsKH6Z4JDzU3nEzwCVnl1ZOlDJu5/uH3QrJw=
X-Received: by 2002:a92:8384:: with SMTP id p4mr20215154ilk.276.1571580324343;
 Sun, 20 Oct 2019 07:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xKiyYGhw4M5G1v8xsrJZxg1eFKEuLvrJf=nDuCKzonnJQ@mail.gmail.com>
 <20191018210020.GG4735@valkosipuli.retiisi.org.uk> <CAHCN7xJ6yphLvTo2wG4=5HHQ=t+MsBuvZBFRv4EksHYU3fnO4w@mail.gmail.com>
 <20191018211651.GH4735@valkosipuli.retiisi.org.uk> <CAHCN7xKYYStpJu91i6ReDQVxdxfZiK_jEg9AHHFiaHGvo8JC1w@mail.gmail.com>
 <20191020053532.GC4991@pendragon.ideasonboard.com>
In-Reply-To: <20191020053532.GC4991@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 20 Oct 2019 09:05:12 -0500
Message-ID: <CAHCN7xKCZHQ-eD_Pom_u83tuQrhh8kkO6YqNor7XjP3zV_0=hA@mail.gmail.com>
Subject: Re: OMAP3 ISP v4l2 inconsistency on DM3730
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-media@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Oct 20, 2019 at 12:35 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> On Sat, Oct 19, 2019 at 11:14:03AM -0500, Adam Ford wrote:
> > On Fri, Oct 18, 2019 at 4:17 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > > On Fri, Oct 18, 2019 at 04:10:23PM -0500, Adam Ford wrote:
> > >> On Fri, Oct 18, 2019 at 4:00 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > >>> On Fri, Oct 18, 2019 at 02:38:57PM -0500, Adam Ford wrote:
> > >>>> I have a DM3730 with a parallel mt9p031 sensor attached.  I am trying
> > >>>> to troubleshoot some issues with streaming video with G-streamer, but
> > >>>> I I think the issue is in how the ISP driver reports the video info.
> > >>>>
> > >>>> I have the pipeline to grab from the resizer:
> > >>>>
> > >>>> media-ctl -v -V '"mt9p031 1-0048":0 [SGRBG8 1280x720
> > >>>> (664,541)/1280x720], "OMAP3 ISP CCDC":2 [SGRBG8 1280x720], "OMAP3 ISP
> > >>>> preview":1 [UYVY 1280x720], "OMAP3 ISP resizer":1 [UYVY 480x272]'
> > >>>>
> > >>>> This make /dev/video6 the output of the resizer and shows the format
> > >>>> and resolution of the output of the resizer as:
> > >>>>
> > >>>>      Setting up format UYVY8_1X16 480x272 on pad OMAP3 ISP resizer/1
> > >>>>      Format set: UYVY8_1X16 480x272
> > >>>>
> > >>>> I used 480x272 because it's the resolution of my LCD, and I was hoping
> > >>>> the resizer would be able to scale this so the ARM would not need to
> > >>>> do the work, and it appears to not have any issues with this
> > >>>> resolution.
> > >>>>
> > >>>> However, if I query the video format, I don't get UYVY:
> > >>>>
> > >>>> # v4l2-ctl  -d6 --list-formats-ext
> > >>>> ioctl: VIDIOC_ENUM_FMT
> > >>>>         Type: Video Capture
> > >>>>
> > >>>>         [0]: 'RGB3' (RGB3, emulated)
> > >>>>         [1]: 'BGR3' (BGR3, emulated)
> > >>>>         [2]: 'YU12' (YU12, emulated)
> > >>>>         [3]: 'YV12' (YV12, emulated)
> > >>>>
> > >>>> This becomes an issue when I attempt to stream video from my camera to
> > >>>> anything, include fake sink:
> > >>>>
> > >>>> gst-launch-1.0 -v v4l2src device=/dev/video6 ! fakesink
> > >>>> Tried to capture in RGB3, but device returned format UYVY
> > >>>>
> > >>>> So for some reason, when queried, it reports different values than
> > >>>> UYVY, but when attempting to set the video capture to the listed
> > >>>> formats, it returns an error.
> > >>>>
> > >>>> gst-launch-1.0 -v v4l2src device=/dev/video6 ! video/x-raw,
> > >>>> format=UYVY ! fakesink
> > >>>
> > >>> I don't have any experience on v4l2src recently but I can comment on the
> > >>> omap3isp driver.
> > >>>
> > >>> In general, the format the omap3isp may produce on a given video node
> > >>> depends on the format of data which the block associated with the video
> > >>> node is fed with.
> > >>>
> > >>> For instance, in case of the raw Bayer formats, the pixel order does not
> > >>> change, and thus the pixel order remains all the way from the sensor to the
> > >>> video node.
> > >>
> > >> From what I can tell, it looks like the output of the resizer is only
> > >> capable of two formats,
> > >> from ispresizer.c:
> > >>
> > >>      /* resizer pixel formats */
> > >>      static const unsigned int resizer_formats[] = {
> > >>      MEDIA_BUS_FMT_UYVY8_1X16,
> > >>      MEDIA_BUS_FMT_YUYV8_1X16,
> > >>      };
> > >>
> > >> Also:
> > >>
> > >>  * resizer_try_format - Handle try format by pad subdev method
> > >>  * @res   : ISP resizer device
> > >>  * @cfg: V4L2 subdev pad configuration
> > >>  * @pad   : pad num
> > >>  * @fmt   : pointer to v4l2 format structure
> > >>  * @which : wanted subdev format
> > >>
> > >> switch (pad) {
> > >> case RESZ_PAD_SINK:
> > >>      if (fmt->code != MEDIA_BUS_FMT_YUYV8_1X16 &&
> > >>          fmt->code != MEDIA_BUS_FMT_UYVY8_1X16)
> > >>               fmt->code = MEDIA_BUS_FMT_YUYV8_1X16;
> > >>
> > >> So it looks to me like if we're trying to do anything other than
> > >> either of those,we set it to MEDIA_BUS_FMT_YUYV8_1X16
> > >>
> > >> Am I missing something?
> > >
> > > I guess for this particular video node there's no need for V4L2 extensions
> > > to implement ENUM_FMT. Ideally the other nodes would support ENUM_FMT that
> > > could provide meaningful information as well.
> >
> > I applied a variation of the patch in question, and I was able to both
> > successfully use g-streamer-1.0 and I was able to see UYVY appear in
> > the list.  in fact, G-Streamer-1.0 was faster than FFPEG with less
> > lag.
> >
> > ioctl: VIDIOC_ENUM_FMT
> >         Type: Video Capture
> >
> >         [0]: 'UYVY' (UYVY 4:2:2)
> >         [1]: 'RGB3' (RGB3, emulated)
> >         [2]: 'BGR3' (BGR3, emulated)
> >         [3]: 'YU12' (YU12, emulated)
> >         [4]: 'YV12' (YV12, emulated)
> >
> > I don't know enough about VL2.  It looks like all the V4L stuff is in
> > the common isp files and not unique to the preview output, resizer
> > output or the CCDC output.  I don't have a CSI camera, so I cannot
> > test anything.
> >
> > I checked all the video outputs, and they are all showing the same
> > information.  I realize the patch I found won't be accepted upstream
> > as-is, but it would be nice to have some mechanism in place that can
> > determine which output node is being used and somehow return the
> > correct data for each node.
> >
> > I would like to do something to help improve this driver and/or make
> > it more compatible with some of the V4L tools (like G-Streamer), so if
> > someone has a recommendation on how we could move forward, I'm willing
> > work on it.
>
> While I'm not totally opposed to implementing VIDIOC_ENUM_FMT for the
> resizer video node, I'm not sure it would be the best solution to your
> problem. Sure, it will fix an existing issue, but we already know that
> it won't scale, as the other video nodes can't be supported the same
> way.
>
> So far, our position was mostly that userspace should grow support for
> MC-based devices where VIDIOC_ENUM_FMT isn't implemented. Maybe I'm
> relaxing my standards because I'm growing older and wiser (or possibly
> just older and lazier :-)), but we need a better solution than this in
> any case. Compared to the last time I made this statement, we now have
> one possible solution in view in the form of libcamera ([1]). The
> project is still young, doesn't support the OMAP3 ISP, and isn't
> integrated with GStreamer, but fixing all that is on our roadmap.
>
> What I would like to know is whether libcamera would fit your use cases,
> or if you have needs that would require a different solution.
>

Logic PD is a manufacturer of system-on-modules and the use case
varies for us based on customers.  My goal is to try and use as many
industry-standard tools to show off the functionality of the hardware
by showing demos, and writing user guides with basic instructions.  We
have an iMX6 based SOM  now that uses G-Streamer and G-Streamer with
the hack seems to show much better performance that the ffpmeg demo I
was using before on the DM3730.  For simplicity, I like the hack, but
I totally understand it's not necessarily easy to scale.

Do you know if there is a gstreamer plug-in that uses the libcamera
driver?  I would open to using it or an alternative tool if it's
compatible with standard tools (like v4l2, g-streamer, etc) , but we
have two more SOM's in development, and I am leaning toward using
G-Streamer because it doesn't involve us writing much custom code,
because our focus isn't necessarily software, but just to give
customers the basics and let them decide on a direction.  Because the
other SOM's will support G-Streamer, our goal is to have as much
consistency as we can in how I write the manuals and user guides.  I
would prefer not to have different methods to do the same thing for
different products.

I will be posting a related, but different question regarding the ISP
clocking once I have more data to present.

adam

> [1] https://www.libcamera.org/
>
> > >>> This also means that there is no way to provide an enumeration of supported
> > >>> formats without knowing the media bus format. There have been proposals to
> > >>> support ENUM_FMT in such cases by providing the source media bus format,
> > >>> but those proposals haven't materialised into patches.
> > >>>
> > >>> So for now, the format needs to be simply set using S_FMT.
> > >>>
> > >>>>
> > >>>> Setting pipeline to PAUSED ...
> > >>>> Pipeline is live and does not need PREROLL ...
> > >>>> Setting pipeline to PLAYING ...
> > >>>> New clock: GstSystemClock
> > >>>> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > >>>> Internal data stream error.
> > >>>> Additional debug info:
> > >>>> gstbasesrc.c(3055): gst_base_src_loop ():
> > >>>> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > >>>> streaming stopped, reason not-negotiated (-4)
> > >>>>
> > >>>> This leads me to believe that v4l2 is trying to set the format to
> > >>>> something it does not think it is able to negotiate, and it's being
> > >>>> rejected.
> > >>>>
> > >>>> I can even explicitly set the output video format to UYVY with:
> > >>>>
> > >>>> v4l2-ctl -d /dev/video6
> > >>>> --set-fmt-video=width=480,height=272,pixelformat=UYVY --verbose
> > >>>>
> > >>>> VIDIOC_QUERYCAP: ok
> > >>>> VIDIOC_G_FMT: ok
> > >>>> VIDIOC_S_FMT: ok
> > >>>> Format Video Capture:
> > >>>>         Width/Height      : 480/272
> > >>>>         Pixel Format      : 'UYVY'
> > >>>>         Field             : None
> > >>>>         Bytes per Line    : 960
> > >>>>         Size Image        : 261120
> > >>>>         Colorspace        : JPEG
> > >>>>         Transfer Function : Default (maps to sRGB)
> > >>>>         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> > >>>>         Quantization      : Default (maps to Full Range)
> > >>>>         Flags             :
> > >>>> #
> > >>>>
> > >>>> This shows me the UYVY format, but upon a follow-up query, it does not
> > >>>> appear to retain the pixel format of UYVY.
> > >>>>
> > >>>> v4l2-ctl -d /dev/video6 --list-formats-ext
> > >>>> ioctl: VIDIOC_ENUM_FMT
> > >>>>         Type: Video Capture
> > >>>>
> > >>>>         [0]: 'RGB3' (RGB3, emulated)
> > >>>>         [1]: 'BGR3' (BGR3, emulated)
> > >>>>         [2]: 'YU12' (YU12, emulated)
> > >>>>         [3]: 'YV12' (YV12, emulated)
> > >>>> #
> > >>>>
> > >>>> If I use ffmpeg to stream video, I the video codec there recognizes it
> > >>>> as uyvy and I can convert it to RGB to display on my LCD, but it has
> > >>>> limited framerate, and it seems to me like this should be do-able in
> > >>>> G-Streamer with v4l2src.
> > >>>>
> > >>>> # ffmpeg -an -re -i /dev/video6 -f v4l2 -vcodec rawvideo -pix_fmt bgra
> > >>>> -f fbdev /dev/fb0
> > >>>>
> > >>>> Input #0, video4linux2,v4l2, from '/dev/video6':
> > >>>>   Duration: N/A, start: 908.826490, bitrate: N/A
> > >>>>     Stream #0:0: Video: rawvideo (UYVY / 0x59565955), uyvy422,
> > >>>> 480x272, 17.42 tbr, 1000k tbn, 1000k tbc
> > >>>> Stream mapping:
> > >>>>   Stream #0:0 -> #0:0 (rawvideo (native) -> rawvideo (native))
> > >>>> Press [q] to stop, [?] for help
> > >>>> Output #0, fbdev, to '/dev/fb0':
> > >>>>   Metadata:
> > >>>>     encoder         : Lavf57.83.100
> > >>>>     Stream #0:0: Video: rawvideo (BGRA / 0x41524742), bgra, 480x272,
> > >>>> q=2-31, 72765 kb/s, 17.42 fps, 17.42 tbn, 17.42 tbc
> > >>>>     Metadata:
> > >>>>       encoder         : Lavc57.107.100 rawvideo
> > >>>>
> > >>>>
> > >>>> This shows me the information is available in some ways from v4l2, but
> > >>>> I wonder if there is a missing IOCTL for VIDIOC_ENUM_FMT for the isp
> > >>>> driver somewhere.  Shouldn't VIDIOC_ENUM_FMT  return UYVY?
> > >>>>
> > >>>> I noticed vpbe_display.c has a function that appears to correspond to
> > >>>> this.  There is a patch at [1] for an older kernel.  Is this something
> > >>>> worth pursuing?
> > >>>>
> > >>>> [1] - https://stackoverflow.com/questions/20693155/gstreamer-failed-to-enumerate-video-formats-and-inappropriate-ioctl-for-device
>
> --
> Regards,
>
> Laurent Pinchart
