Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8F1DDE02D
	for <lists+linux-omap@lfdr.de>; Sun, 20 Oct 2019 21:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbfJTTQ3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 20 Oct 2019 15:16:29 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:38811 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfJTTQ2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 20 Oct 2019 15:16:28 -0400
Received: by mail-il1-f195.google.com with SMTP id y5so10065361ilb.5;
        Sun, 20 Oct 2019 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A6Rl+yIjZcDJ6lZinhx62wc8Hg0mf3rtlyT+aTBQ+BE=;
        b=OLpcYgYpOXdWAhWfJAtyey/htAbBJzoaRSdY9rx9OHjzFOTk/bQmJx9nbZPcBMblH3
         lOGbI3Ish870gb0Nn/LUBX274UloOZHh83R2Adu7363TLVuI8f+I8ZdCnD5VQj7IOYph
         6SXz6aRtOxu11zIevOWv7gYOwG8OgFcPAhtf9PdRBswg2iD4gmOSMld4zQAVimlmGif1
         c1kkiL28sJWYTekWe3/eKw6cAL8W1mr3Og46GTPrhijNSk/YAu0HDw1JJvzV4FZ1yz13
         X642GGHKEu+e92R7YYvQ/Dt5Mc3Tg2IDkRHvBWzJvcYbusyxBw/PwHHLlZia3LRJ9cgM
         gvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A6Rl+yIjZcDJ6lZinhx62wc8Hg0mf3rtlyT+aTBQ+BE=;
        b=lrMwaAx7s8WW/8FOQUETR4wdYlV869DIsOsDCNtY4ARQKAanfjt9nD7jY2Dwn33yK+
         KwLwDsLBxJ2yr187XRD4wmS5Bs32KxpKTzi6rmUQI4oweGXx1GGjpGZEwaMujxiFgaG+
         DW8xoYQcRJUzhLSE9XMIRrkuOwlk0Wls1eAtrF26lFmIavSBxQUjsy78Tz697ZRG7xe4
         sX2LN5ewmFKvLUbm5FGjYRTfskKdCqHZrc4H2YE4pw34I6ZnxacX8q70GRSzttXnuUNh
         stY8fThP8SG/LMleGUIn503B1ShCYrNEpiCZ5n3/Fcqw9iBwev0sV9YzoG6UKdlUvjcM
         BZQw==
X-Gm-Message-State: APjAAAVMecankvYHmK2R6CVg+cmJjgk+81885yFCxmJ04oj7pWlr8kjr
        CyWVX9LDKbaevTr7vFazwb5EHGzK78J9k7yTlDs=
X-Google-Smtp-Source: APXvYqyndOpvnIdoihDg8nxsIE0hr2RVf3LZLOUDlrrsNZViW4aWPU+W+InKlNn9otDGtIZGrQCFsBMVrWSSkJKrR9g=
X-Received: by 2002:a92:d652:: with SMTP id x18mr20928897ilp.58.1571598987457;
 Sun, 20 Oct 2019 12:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xLMTDondeiYiYHwGG5HYEaRwY9S4uoqQ-Eq6b8ksSS+NA@mail.gmail.com>
 <20191020180248.GD11723@pendragon.ideasonboard.com>
In-Reply-To: <20191020180248.GD11723@pendragon.ideasonboard.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 20 Oct 2019 14:16:15 -0500
Message-ID: <CAHCN7x+rZb5ikUeqhRAg8bVQ1vyYSc-+uVdLXcCV9RVSwt6UfQ@mail.gmail.com>
Subject: Re: V4L2 runs out of memory when OMAP3 ISP parallel pixel clock is high
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Oct 20, 2019 at 1:02 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Adam,
>
> On Sun, Oct 20, 2019 at 09:45:25AM -0500, Adam Ford wrote:
> > I am running a DM3730 connected to an mt9p031 sensor, and the ISP is
> > running in 8-bit parallel mode.
> >
> > I have the sensor endpoint configured as:
> >
> > mt9p031_out: endpoint {
> >      input-clock-frequency =3D <24000000>;
> >      pixel-clock-frequency =3D <72000000>;
> >      remote-endpoint =3D <&ccdc_ep>;
> > };
> >
> > I was looking through the datasheet, and it appears as if the pixel
> > clock frequency can go up to 96MHz, so I tried to increase the
> > pixel-clock-frequency to 96MHz, but v4l2 seems to get an out of memory
> > error.
> >
> > libv4l2: error turning on stream: No space left on device
> > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
> > to allocate required memory.
> > Additional debug info:
> > gstv4l2src.c(658): gst_v4l2src_decide_allocation ():
> > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > Buffer pool activation failed
> > Execution ended after 0:00:00.019073486
>
> The error code may be misleading. ENOSPC is used here to report that the
> maximum CCDC bandwidth has been exceeded, not that the driver is running
> out of memory.
>
> The check is performed in isp_video_check_external_subdevs(), and the
> maximum CCDC bandwidth is calculated by omap3isp_ccdc_max_rate():
>
>         /*
>          * TRM says that for parallel sensors the maximum data rate
>          * should be 90% form L3/2 clock, otherwise just L3/2.
>          */
>         if (ccdc->input =3D=3D CCDC_INPUT_PARALLEL)
>                 rate =3D pipe->l3_ick / 2 * 9 / 10;
>         else
>                 rate =3D pipe->l3_ick / 2;
>
> Could you point me to the part of the OMAP3 datasheet that you think
> allows for 96 MHz ?

The DM3730 TRM (SPRUGN4R =E2=80=93 May 2010 =E2=80=93 Revised September 201=
2) doesn't
use the 90% rule mentioned above from what I can see. Maybe it's
somewhere else, but I didn't see it.  It does state the folllowing in
Section 6.3.1.1:
Camera ISP Clocks Parallel interface clock domain. This frequency
depends on the imaging sensor type and size, its frame rate and its
blanking time. The functional clock is required to be at least 2x
faster than the pixel clock when the bridge is disabled and a least
equal when it is enabled.

When I queried the cam_ick, it returned 100MHz, so I expected 96MHz to
be tolerated.

# cat cat /sys/kernel/debug/clk/l3_ick/clk_rate
200000000

# cat /sys/kernel/debug/clk/cam_ick/clk_rate
100000000

For what it's worth, I removed the 90% calculation and just use the L3
/ 2.  With that done, I was able to push the camera to 96MHz, and the
frame rate increased

Can you point me to where this 90% requirement is located?

adam
>
> > Through trial and error, I was able to get push the sensor's
> > pixel-clock-frequency to work at 90MHz, but no higher.  I have also
> > tried experimenting with the input clock frequency without success.
> >
> > If I can get the clock to run at 96MHz, which the ISP and sensor
> > documentation appears to permit, I am hoping to be able to achieve a
> > little higher frame rate.
> >
> > Is there something I need to do to allocate more memory to V4L2 or is
> > there some other limitation causing the out of memory at higher pixel
> > clock frequencies?
>
> --
> Regards,
>
> Laurent Pinchart
