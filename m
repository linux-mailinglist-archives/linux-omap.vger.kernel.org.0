Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 974AEE1AAD
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 14:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389786AbfJWMf2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 08:35:28 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:42181 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731301AbfJWMf1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Oct 2019 08:35:27 -0400
Received: by mail-io1-f52.google.com with SMTP id i26so15370617iog.9;
        Wed, 23 Oct 2019 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+w0YpM/cfcuCW0XdV25Aq9hHQMDz35RkWi0hBLRFRFI=;
        b=Wi4MdyVp9/KdLPR016K23PcaY1ovngGdF4NoN8Oq9YAUTjl6zsL0+CmDrGbj7qY5LC
         x0UNizrQ/K79JTD/ymQOiPWKrkIzK+0gJz1kWvYmOK+D/2EHKvUX8ECft6R9qmhFbp70
         DJf54GnontaMEd2HLmRdE3IoTtNFKyjxGkLYwtrSfzcYmQvHlDSnCI6sssb28yjFwMKy
         MtIjKK2gDtxWiR00/3Ch8LTIKFmNra/EuKKyTGDK8CXL/uP/OuibBk7aZn4/I4fgLnHF
         c4d5R6Y4Jnz7vqhYyAid/6f6bozZU5v9yP2VowvNCkJsuv2LcT6NAXGY/0TaQpQwrkbP
         NSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+w0YpM/cfcuCW0XdV25Aq9hHQMDz35RkWi0hBLRFRFI=;
        b=Ziz5wZTPjZHQ3qsQVviimFL3/wHxkmLm7mCWSxmyIufsuiVewb4MtWDE5GNmb1skJk
         E0b73VCz3bmUTo2SVloQ1myBfDGk06y6ZuXJwdD2qbE0lOsZZNerpdfOacWlQGLh1AQ6
         KlHqQ8uqdBj/YuM1fh5VUAvFG+S0E/eu653EpRNNe4R2sKS/6Ub96wL57p9VZxpRne+H
         QjaFW8a089JSdeCalb/9dDpl+sZJTmQAY2nuXSqwuUH8rWnsEw533IctNMBVnrhofAHO
         3Pv2wYKkm8499foXW2uM+8lVYW4KiGTejaT7dM2yrMOZ9W21/zrErMgCc1yi/n7n2Yez
         P9rg==
X-Gm-Message-State: APjAAAXaoOtkX7Juvq2UioJEFsmhZDNhdZYAoyH20faaWZ8kUhteCtTI
        ZfS0/2yRJjGKUTfQvzd4k4+JEi4Ce5H7JW1t3z3G2sCT
X-Google-Smtp-Source: APXvYqwqcJh68YGZFTDBgbDgu7eKSVSf61EiNnDFRvzzy14hGGSsXKX0i9+xmPRgU1KbiU19lR3tjE3wDTHASs0Scjo=
X-Received: by 2002:a02:40c6:: with SMTP id n189mr9274270jaa.52.1571834124348;
 Wed, 23 Oct 2019 05:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xLMTDondeiYiYHwGG5HYEaRwY9S4uoqQ-Eq6b8ksSS+NA@mail.gmail.com>
 <20191020180248.GD11723@pendragon.ideasonboard.com> <CAHCN7x+rZb5ikUeqhRAg8bVQ1vyYSc-+uVdLXcCV9RVSwt6UfQ@mail.gmail.com>
In-Reply-To: <CAHCN7x+rZb5ikUeqhRAg8bVQ1vyYSc-+uVdLXcCV9RVSwt6UfQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 23 Oct 2019 07:35:13 -0500
Message-ID: <CAHCN7x+Yzj3UJXPobCWa_VL9ONLMCz=QAghoZ0j2KQ6ZNq0K6w@mail.gmail.com>
Subject: Re: V4L2 runs out of memory when OMAP3 ISP parallel pixel clock is high
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Oct 20, 2019 at 2:16 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Sun, Oct 20, 2019 at 1:02 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Adam,
> >
> > On Sun, Oct 20, 2019 at 09:45:25AM -0500, Adam Ford wrote:
> > > I am running a DM3730 connected to an mt9p031 sensor, and the ISP is
> > > running in 8-bit parallel mode.
> > >
> > > I have the sensor endpoint configured as:
> > >
> > > mt9p031_out: endpoint {
> > >      input-clock-frequency =3D <24000000>;
> > >      pixel-clock-frequency =3D <72000000>;
> > >      remote-endpoint =3D <&ccdc_ep>;
> > > };
> > >
> > > I was looking through the datasheet, and it appears as if the pixel
> > > clock frequency can go up to 96MHz, so I tried to increase the
> > > pixel-clock-frequency to 96MHz, but v4l2 seems to get an out of memor=
y
> > > error.
> > >
> > > libv4l2: error turning on stream: No space left on device
> > > ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Faile=
d
> > > to allocate required memory.
> > > Additional debug info:
> > > gstv4l2src.c(658): gst_v4l2src_decide_allocation ():
> > > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> > > Buffer pool activation failed
> > > Execution ended after 0:00:00.019073486
> >
> > The error code may be misleading. ENOSPC is used here to report that th=
e
> > maximum CCDC bandwidth has been exceeded, not that the driver is runnin=
g
> > out of memory.
> >
> > The check is performed in isp_video_check_external_subdevs(), and the
> > maximum CCDC bandwidth is calculated by omap3isp_ccdc_max_rate():
> >
> >         /*
> >          * TRM says that for parallel sensors the maximum data rate
> >          * should be 90% form L3/2 clock, otherwise just L3/2.
> >          */
> >         if (ccdc->input =3D=3D CCDC_INPUT_PARALLEL)
> >                 rate =3D pipe->l3_ick / 2 * 9 / 10;
> >         else
> >                 rate =3D pipe->l3_ick / 2;
> >
> > Could you point me to the part of the OMAP3 datasheet that you think
> > allows for 96 MHz ?
>
> The DM3730 TRM (SPRUGN4R =E2=80=93 May 2010 =E2=80=93 Revised September 2=
012) doesn't
> use the 90% rule mentioned above from what I can see. Maybe it's
> somewhere else, but I didn't see it.  It does state the folllowing in
> Section 6.3.1.1:
> Camera ISP Clocks Parallel interface clock domain. This frequency
> depends on the imaging sensor type and size, its frame rate and its
> blanking time. The functional clock is required to be at least 2x
> faster than the pixel clock when the bridge is disabled and a least
> equal when it is enabled.
>
> When I queried the cam_ick, it returned 100MHz, so I expected 96MHz to
> be tolerated.
>
> # cat cat /sys/kernel/debug/clk/l3_ick/clk_rate
> 200000000
>
> # cat /sys/kernel/debug/clk/cam_ick/clk_rate
> 100000000
>
> For what it's worth, I removed the 90% calculation and just use the L3
> / 2.  With that done, I was able to push the camera to 96MHz, and the
> frame rate increased
>
> Can you point me to where this 90% requirement is located?
>

Laurent,

I think I figured out where the 90% calculation is located, but I can
only see it in the OMAP3530 TRM and not in the DM3730.

In the OMAP3530, Section 12.4.6.1.1 CCDC Features:

=E2=80=93 Data up to 8-bit at 130 MHz can be transferred to memory.
=E2=80=93 Data up to 10-bit at 75 MHz can be processed by the image pipelin=
e
or transferred to memory.
=E2=80=93 Data up to 12-bit at 75 MHz can be transferred to memory or
internally converted into 10-bit data to be processed by the image
pipeline.

If we assume the L3 is running at 166, then 166/2 =3D 83 and 83 * .9 =3D 74=
.7.

Does this seem like the right place?  If so,  then my impression is
that we should check for 10 or 12-bit mode before doing this math.  If
we're running at 8-bit, it seems to me like we can run at 130MHz for
the OMAP35, and potentially at 166MHz for the DM3730.

The Resizer has some of its own limitations, so when its invoked it
appears to have it's own limitations per section 6.4.7.2.1:

The horizontal resizer output rate must not exceed half the functional
clock; Moreover, the horizontal resizer output rate must not exceed
100M pixels/s. This limitation applies only for the on-the-fly
processing input source.

Either way, this is still 1/2 the clock rate of L3 and not 90% of that.

If you'll permit me, I'd like to add some code to if we're an
omap36xx.  Is so, I'd like to skip the 90% calculation for those
devices.  I have already been able to show that with it removed, I can
still capture paralell images at 96MHz.

adam
> adam
> >
> > > Through trial and error, I was able to get push the sensor's
> > > pixel-clock-frequency to work at 90MHz, but no higher.  I have also
> > > tried experimenting with the input clock frequency without success.
> > >
> > > If I can get the clock to run at 96MHz, which the ISP and sensor
> > > documentation appears to permit, I am hoping to be able to achieve a
> > > little higher frame rate.
> > >
> > > Is there something I need to do to allocate more memory to V4L2 or is
> > > there some other limitation causing the out of memory at higher pixel
> > > clock frequencies?
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
