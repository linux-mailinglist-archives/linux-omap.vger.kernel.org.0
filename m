Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35C61D7AEA
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 16:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgEROSt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 May 2020 10:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgEROSt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 May 2020 10:18:49 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3FFC05BD0A
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 07:18:49 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id m12so9478947wmc.0
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 07:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9i/NmzGUZyHVy8CrV429bijHCtljbTyuc/Gf8fVseWQ=;
        b=GGEBGh64SnKLqIGOCs81pE28wM5CcQJZmRtwf/R1PC/5wlW19wdpbPaiFTc7T+5iof
         bIQ36TnJAO89g/KFm70VfeKtIYumOOgpk2R7UOg5LL7qLrXNBKEobtO7h0dtZJ7VZbEG
         EQqQWkJi+T6hAin6wWoi9osXDVnf8pNQMLfs6jNsLYhyHxgimMBiA/iZ6xAW5QAPT3K3
         3KVRfKaKsZ3yXuCMMCPMGGmmcHY2j8oJ8zulRgINBilU+RyYyxw1WUFoWpwA/1HpxyMe
         iGZAsHQNkXjzdvfH8nboF45fYhpkUZU4vvupeWZMfgTuH/TMxvKrbk5AhS/aMHXxAW5m
         hbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9i/NmzGUZyHVy8CrV429bijHCtljbTyuc/Gf8fVseWQ=;
        b=orq+/9h8r69pSFqohibwElAPXotButGd/L+mUwlHQDfY0ejfAgOq8IKHUYvI09YGDp
         MWIsvQR6a/60WLpXIKAPldlrIBi7tTJLcexU2asfYcIurOrEl11G5jvSN32o4Yaojzzy
         WJi529I7ttb7AaXwTy9GxTVSmscaBMKt5PhGtWjjIEvX14cIur3GFwNR+QOD3miL46GM
         omOJYq9Op/+vXfNQieu5Is0tdxv0mKdhJaRzx5d1saWwnaqyfwlicwgVxpUCfKfhHG9L
         1Bx2+c3DdjrzcIIG7N5T6LosElizPbajWUKvLhQDOXqGin+UAsY0/kHoD0Ur9nDlWsIh
         nwgQ==
X-Gm-Message-State: AOAM533oxx9nohgtm3/oWyo/wKZrf4HVJkmIqKCGouSJe5UpcgR0j0is
        2kRAp4sUhjVNk0vsF/dvgfhcJA==
X-Google-Smtp-Source: ABdhPJz91RdPCR28u3ce21nZCO1uLODcyh8D0iXOkAXhjWsaYOyOaUSpXroGLFNBTeNBNhOWodK4vw==
X-Received: by 2002:a1c:a74a:: with SMTP id q71mr19554336wme.23.1589811527596;
        Mon, 18 May 2020 07:18:47 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id v11sm16706014wrv.53.2020.05.18.07.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:18:46 -0700 (PDT)
Date:   Mon, 18 May 2020 16:18:43 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: Re: [PATCH] arm: dts: am33xx-bone-common: add gpio-line-names
Message-ID: <20200518141843.GA916914@x1>
References: <20200508165821.GA14555@x1>
 <CACRpkdb+ZP6rfjGg6Ef9_wYvNf6qmSc7LZyYBVKA3XWCtxPfqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb+ZP6rfjGg6Ef9_wYvNf6qmSc7LZyYBVKA3XWCtxPfqQ@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, May 18, 2020 at 09:11:07AM +0200, Linus Walleij wrote:
> On Fri, May 8, 2020 at 6:57 PM Drew Fustini <drew@beagleboard.org> wrote:
> 
> > Add gpio-line-names properties to the gpio controller nodes.
> > BeagleBone boards have P8 and P9 headers [0] which expose many the
> > AM3358 SoC balls to stacking expansion boards called "capes", or to
> > other external connections like jumper wires to a breadboard.
> >
> > Many of the P8/P9 header pins can muxed to a gpio line.  The
> > gpio-line-names describe which P8/P9 pin that line goes to and the
> > default mux for that P8/P9 pin.  Some lines are not routed to the
> > P8/P9 headers, but instead are dedicated to some functionality such as
> > status LEDs.  The line name will indicate this.  Some line names are
> > left empty as the corresponding AM3358 balls are not connected.
> >
> > The goal is to make it easier for a user viewing the output of gpioinfo
> > to determine which P8/P9 pin is connected to a line.  The output of
> > gpioinfo on a BeagleBone Black will now look like this:
> >
> > gpiochip0 - 32 lines:
> >         line   0:   "ethernet"       unused   input  active-high
> >         line   1:   "ethernet"       unused   input  active-high
> 
> Why are the ethernet lines not tagged with respective signal name
> when right below the SPI lines are explicitly tagged with
> sclk, cs0 etc?
> 
> Ethernet is usually RGMII and has signal names like
> tx_clk, tx_d0, tx_en etc.

Thank you for the feedback, Linus.

My desire is to communicate that the AM3358 balls corresponding to these
GPIO lines are being used for Ethernet and not exposed to the P8 and P9
expansion headers.

I am happy to switch these labels to the actual Ethernet signals such as
RGMII and MDIO signal names if you think that is better.

For example, AM3358 ZCZ ball M17 is both gpio0_0 and mdio_data [0].  On 
BeagleBone, the ball is routed to the Ethernet PHY and used for MDIO [1]
Thus gpiochio 0 line 0 is not connected to the P8 or P9 expansion header.

Which of the following line name would be best?

1) "[MDIO_DATA]"

precise signal name, placed in brackets to denote is not possible to 
use as GPIO on the P8 or P9 headers

2) "[ethernet]" 

instead of the precise signal name, just indicate that it is used for
Ethernet and is not usable for GPIO on the P8 or P9 headers

3) ""

no label as this gpio line is not connected to the P8/P9 and is
hardwired in the PCB layout for Ethernet (MDIO).

> Also some lines seem to be tagged with the pin number
> like P9_22, P2_21 below, it seems a bit inconsistent
> to have much information on some pins and very sketchy
> information on some.

The goal for these line names is make it easier for a BeagleBone user to
identify which GPIO lines are connected to the P8 and P9 expansion
headers.  Our users are most likely to refer to cape-headers.png [2] as
it is part of the bone101 out-of-the-box tutorial [3]. 

Some GPIO lines are free to be used for GPIO in the default
configuration.  For example, gpiochip 1 line 12 is connected to P8_12
and it is not used by another peripheral by default. I used the label:
"P8_12 gpio"

However, gpiochip 1 line 0 is connected to P8_25 but is also used by the
on-board eMMC.  The eMMc is enabled by default so this line can not be
used for GPIO unless the user modifies the pinmux in the device tree.  

Thus, I used this label: "P8_25 emmc"

Maybe a better label would be "P8_25 [EMMC]"?

> 
> >         line  18:        "usb"       unused   input  active-high
> >         line  19:       "hdmi"       unused   input  active-high
> 
> Similar comments for these.


These are similar to the Ethernet MDIO example above.  The balls
corresponding to these GPIO lines are not connected to the P8 or P9 
headers and are hardwired on the PCB for other peripherals like USB
and HDMI.

For example, gpiochip 0 line 18 is USB0_DRVVBUS so I simplified it to
"usb" to indicate it can not be used for GPIO. Maybe "[USB]" is better?

gpiochip 0 line 19 is AM3358 ZCZ ball A15 and the BeagleBone Black
schematic shows that this is connected to the CEC clock for the HDMI
framer [4].  I though "hdmi" was a nice way to summarize that this is
used for HDMI and can not be changed, though maybe "[HDMI]" is better
or no label at all.

In conclusion, the motivation of these line names is to be a quick
reference for a user to find GPIO lines on the P8 and P9 headers.

Thanks,
Drew

[0] http://www.ti.com/lit/ds/symlink/am3358.pdf
[1] https://github.com/beagleboard/beaglebone-black/wiki/System-Reference-Manual#ethernet-processor-interface
[2] http://beagleboard.org/static/images/cape-headers.png
[3] https://beagleboard.org/Support/bone101
[4] https://github.com/beagleboard/beaglebone-black/blob/master/BBB_SCH.pdf

