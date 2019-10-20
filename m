Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF3F0DE097
	for <lists+linux-omap@lfdr.de>; Sun, 20 Oct 2019 23:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726301AbfJTVDP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 20 Oct 2019 17:03:15 -0400
Received: from retiisi.org.uk ([95.216.213.190]:54664 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726005AbfJTVDP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Sun, 20 Oct 2019 17:03:15 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 8B6B7634C87;
        Mon, 21 Oct 2019 00:03:06 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1iMILx-0000Mo-K4; Mon, 21 Oct 2019 00:03:05 +0300
Date:   Mon, 21 Oct 2019 00:03:05 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-media@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: OMAP3 ISP v4l2 inconsistency on DM3730
Message-ID: <20191020210305.GA864@valkosipuli.retiisi.org.uk>
References: <CAHCN7xKiyYGhw4M5G1v8xsrJZxg1eFKEuLvrJf=nDuCKzonnJQ@mail.gmail.com>
 <20191018210020.GG4735@valkosipuli.retiisi.org.uk>
 <CAHCN7xJ6yphLvTo2wG4=5HHQ=t+MsBuvZBFRv4EksHYU3fnO4w@mail.gmail.com>
 <20191018211651.GH4735@valkosipuli.retiisi.org.uk>
 <CAHCN7xKYYStpJu91i6ReDQVxdxfZiK_jEg9AHHFiaHGvo8JC1w@mail.gmail.com>
 <20191020053532.GC4991@pendragon.ideasonboard.com>
 <e82419ee-1441-a1d8-4bd7-025b7999e406@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e82419ee-1441-a1d8-4bd7-025b7999e406@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Hans,

On Sun, Oct 20, 2019 at 07:26:20PM +0200, Hans Verkuil wrote:
> On 10/20/19 7:35 AM, Laurent Pinchart wrote:
> > Hi Adam,
> > 
> > On Sat, Oct 19, 2019 at 11:14:03AM -0500, Adam Ford wrote:
> >> On Fri, Oct 18, 2019 at 4:17 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >>> On Fri, Oct 18, 2019 at 04:10:23PM -0500, Adam Ford wrote:
> >>>> On Fri, Oct 18, 2019 at 4:00 PM Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >>>>> On Fri, Oct 18, 2019 at 02:38:57PM -0500, Adam Ford wrote:
> >>>>>> I have a DM3730 with a parallel mt9p031 sensor attached.  I am trying
> >>>>>> to troubleshoot some issues with streaming video with G-streamer, but
> >>>>>> I I think the issue is in how the ISP driver reports the video info.
> >>>>>>
> >>>>>> I have the pipeline to grab from the resizer:
> >>>>>>
> >>>>>> media-ctl -v -V '"mt9p031 1-0048":0 [SGRBG8 1280x720
> >>>>>> (664,541)/1280x720], "OMAP3 ISP CCDC":2 [SGRBG8 1280x720], "OMAP3 ISP
> >>>>>> preview":1 [UYVY 1280x720], "OMAP3 ISP resizer":1 [UYVY 480x272]'
> >>>>>>
> >>>>>> This make /dev/video6 the output of the resizer and shows the format
> >>>>>> and resolution of the output of the resizer as:
> >>>>>>
> >>>>>>      Setting up format UYVY8_1X16 480x272 on pad OMAP3 ISP resizer/1
> >>>>>>      Format set: UYVY8_1X16 480x272
> >>>>>>
> >>>>>> I used 480x272 because it's the resolution of my LCD, and I was hoping
> >>>>>> the resizer would be able to scale this so the ARM would not need to
> >>>>>> do the work, and it appears to not have any issues with this
> >>>>>> resolution.
> >>>>>>
> >>>>>> However, if I query the video format, I don't get UYVY:
> >>>>>>
> >>>>>> # v4l2-ctl  -d6 --list-formats-ext
> >>>>>> ioctl: VIDIOC_ENUM_FMT
> >>>>>>         Type: Video Capture
> >>>>>>
> >>>>>>         [0]: 'RGB3' (RGB3, emulated)
> >>>>>>         [1]: 'BGR3' (BGR3, emulated)
> >>>>>>         [2]: 'YU12' (YU12, emulated)
> >>>>>>         [3]: 'YV12' (YV12, emulated)
> >>>>>>
> >>>>>> This becomes an issue when I attempt to stream video from my camera to
> >>>>>> anything, include fake sink:
> >>>>>>
> >>>>>> gst-launch-1.0 -v v4l2src device=/dev/video6 ! fakesink
> >>>>>> Tried to capture in RGB3, but device returned format UYVY
> >>>>>>
> >>>>>> So for some reason, when queried, it reports different values than
> >>>>>> UYVY, but when attempting to set the video capture to the listed
> >>>>>> formats, it returns an error.
> >>>>>>
> >>>>>> gst-launch-1.0 -v v4l2src device=/dev/video6 ! video/x-raw,
> >>>>>> format=UYVY ! fakesink
> >>>>>
> >>>>> I don't have any experience on v4l2src recently but I can comment on the
> >>>>> omap3isp driver.
> >>>>>
> >>>>> In general, the format the omap3isp may produce on a given video node
> >>>>> depends on the format of data which the block associated with the video
> >>>>> node is fed with.
> >>>>>
> >>>>> For instance, in case of the raw Bayer formats, the pixel order does not
> >>>>> change, and thus the pixel order remains all the way from the sensor to the
> >>>>> video node.
> >>>>
> >>>> From what I can tell, it looks like the output of the resizer is only
> >>>> capable of two formats,
> >>>> from ispresizer.c:
> >>>>
> >>>>      /* resizer pixel formats */
> >>>>      static const unsigned int resizer_formats[] = {
> >>>>      MEDIA_BUS_FMT_UYVY8_1X16,
> >>>>      MEDIA_BUS_FMT_YUYV8_1X16,
> >>>>      };
> >>>>
> >>>> Also:
> >>>>
> >>>>  * resizer_try_format - Handle try format by pad subdev method
> >>>>  * @res   : ISP resizer device
> >>>>  * @cfg: V4L2 subdev pad configuration
> >>>>  * @pad   : pad num
> >>>>  * @fmt   : pointer to v4l2 format structure
> >>>>  * @which : wanted subdev format
> >>>>
> >>>> switch (pad) {
> >>>> case RESZ_PAD_SINK:
> >>>>      if (fmt->code != MEDIA_BUS_FMT_YUYV8_1X16 &&
> >>>>          fmt->code != MEDIA_BUS_FMT_UYVY8_1X16)
> >>>>               fmt->code = MEDIA_BUS_FMT_YUYV8_1X16;
> >>>>
> >>>> So it looks to me like if we're trying to do anything other than
> >>>> either of those,we set it to MEDIA_BUS_FMT_YUYV8_1X16
> >>>>
> >>>> Am I missing something?
> >>>
> >>> I guess for this particular video node there's no need for V4L2 extensions
> >>> to implement ENUM_FMT. Ideally the other nodes would support ENUM_FMT that
> >>> could provide meaningful information as well.
> >>
> >> I applied a variation of the patch in question, and I was able to both
> >> successfully use g-streamer-1.0 and I was able to see UYVY appear in
> >> the list.  in fact, G-Streamer-1.0 was faster than FFPEG with less
> >> lag.
> >>
> >> ioctl: VIDIOC_ENUM_FMT
> >>         Type: Video Capture
> >>
> >>         [0]: 'UYVY' (UYVY 4:2:2)
> >>         [1]: 'RGB3' (RGB3, emulated)
> >>         [2]: 'BGR3' (BGR3, emulated)
> >>         [3]: 'YU12' (YU12, emulated)
> >>         [4]: 'YV12' (YV12, emulated)
> >>
> >> I don't know enough about VL2.  It looks like all the V4L stuff is in
> >> the common isp files and not unique to the preview output, resizer
> >> output or the CCDC output.  I don't have a CSI camera, so I cannot
> >> test anything.
> >>
> >> I checked all the video outputs, and they are all showing the same
> >> information.  I realize the patch I found won't be accepted upstream
> >> as-is, but it would be nice to have some mechanism in place that can
> >> determine which output node is being used and somehow return the
> >> correct data for each node.
> >>
> >> I would like to do something to help improve this driver and/or make
> >> it more compatible with some of the V4L tools (like G-Streamer), so if
> >> someone has a recommendation on how we could move forward, I'm willing
> >> work on it.
> > 
> > While I'm not totally opposed to implementing VIDIOC_ENUM_FMT for the
> > resizer video node, I'm not sure it would be the best solution to your
> > problem. Sure, it will fix an existing issue, but we already know that
> > it won't scale, as the other video nodes can't be supported the same
> > way.
> > 
> > So far, our position was mostly that userspace should grow support for
> > MC-based devices where VIDIOC_ENUM_FMT isn't implemented. Maybe I'm
> 
> Well, I disagree: implementing G/S/TRY_FMT without ENUM_FMT is out-of-spec.
> The v4l2-compliance utility would flunk any driver that tries that.
> Unfortunately, v4l2-compliance didn't exist (or was in its infancy) when
> omap3isp was written.
> 
> I didn't even know that ENUM_FMT wasn't implemented for the omap3 ISP.
> 
> It makes no sense either: the driver is smart enough to validate the
> pixelformat, but not smart enough to be able to enumerate the list of
> valid formats for the current pipeline configuration?

As noted earlier, there's a dependency to the source media bus format. That
needs to be specified in order to come up with the pixelformat that the
device can actually produce. This is not really a problem with driver
implementation but the lack of an API to get this done.

Also, this isn't specific to omap3isp either: any device where the capture
format depends on pipeline configuration has the same issue.

Since no better solutions have been suggested, I'd be in favour of
extending ENUM_FMT to cover MC-enabled drivers by using one of the reserved
fields for the source media bus code.

-- 
Regards,

Sakari Ailus
