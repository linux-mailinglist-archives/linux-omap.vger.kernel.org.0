Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E341DC1B8
	for <lists+linux-omap@lfdr.de>; Thu, 21 May 2020 00:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgETWCJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 May 2020 18:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbgETWCI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 20 May 2020 18:02:08 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D194C05BD43
        for <linux-omap@vger.kernel.org>; Wed, 20 May 2020 15:02:08 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id x20so6187009ejb.11
        for <linux-omap@vger.kernel.org>; Wed, 20 May 2020 15:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zb7O+OsRlJ4ZhW1N495+RjDIqGKHuZiwClTZ+SkOEVo=;
        b=GUYHGAJ/HZdlTz7FAL3kk1Q1ZKredBwA78I2wjW6Qe6iDcBlNTUAgHtpRtnD2XwOzD
         PZc/2vtLlgy5Z3Gp2OvfAyF2skRpoA3PmJzy3YQQ+j8oCRN1/qm2GK3XdFQLW68yHLqm
         6HXncPCDT5Q5zy+uVH2gQRzLVKbMu9Vz3zcCPzDG/I7NoiR7H8jO1m+xrFlnZA2KOCUU
         friZf8XqGJY6n80MFrhBLl1npN10BCJRzxOlaTFc/dqWG7i4Sy4AwX29Zr+RyQVwxm4A
         CbP5clCQjJQ1Iu4VwS8xqKpxaLdENXW2tLnpek4+sLubnRM/J1/XKxaIRoDqf8gvPBsz
         iPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zb7O+OsRlJ4ZhW1N495+RjDIqGKHuZiwClTZ+SkOEVo=;
        b=JWlhx0E6Gshiml0UhpI3P2nZMzg3r2Qvqj6sX2LCx5xknocB0YmVrYXWTtXEL/1Seh
         qMQnrH4KEAYY/TjgQR20+GrKw3DIYxnAbaudig26dOQDFyq5Sei6Ao7fNeyiKB2POvUp
         kr7R9VuNc9oxknIwtw+lFlsGispZaQInRvVmnZNC0FuSCJ05/VgpCFrhw++e3fSqg/xs
         wQGX8N3d+JEgt+DeFzJLVM9/1f7gwyQc/QSThAaScL65DEbRX3dK7a3P1LJJtWBLyLRT
         uT3Vzxm7EeWWX/gN0cqEXa9pzFkcE3BXKHcKEn4c/UF4eUpwkNQlB0IgT7pyp/pDkWMs
         Pu5Q==
X-Gm-Message-State: AOAM533ipQ7re2t481/M4cxDpMgtAF88yw4BcsTuRkbXYwzKYcdhXhBn
        8BNRxShUrP+70s3hMJsRI/S+9Q==
X-Google-Smtp-Source: ABdhPJydr2OxyDSE1NNU/8zJYhWpt8hsi8i5qypj2a/FIrillUdRhiXkFiLgeiTx532XbbKT+FTZ/w==
X-Received: by 2002:a17:906:b79a:: with SMTP id dt26mr992211ejb.121.1590012126776;
        Wed, 20 May 2020 15:02:06 -0700 (PDT)
Received: from x1 ([2001:16b8:5c90:fc01:e5e5:b2fe:677e:9a51])
        by smtp.gmail.com with ESMTPSA id i2sm2747185edy.30.2020.05.20.15.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 15:02:05 -0700 (PDT)
Date:   Thu, 21 May 2020 00:02:03 +0200
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
Message-ID: <20200520220203.GA363398@x1>
References: <20200508165821.GA14555@x1>
 <CACRpkdb+ZP6rfjGg6Ef9_wYvNf6qmSc7LZyYBVKA3XWCtxPfqQ@mail.gmail.com>
 <20200518141843.GA916914@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518141843.GA916914@x1>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, May 18, 2020 at 04:18:43PM +0200, Drew Fustini wrote:
> On Mon, May 18, 2020 at 09:11:07AM +0200, Linus Walleij wrote:
> > On Fri, May 8, 2020 at 6:57 PM Drew Fustini <drew@beagleboard.org> wrote:
> > 
> > > Add gpio-line-names properties to the gpio controller nodes.
> > > BeagleBone boards have P8 and P9 headers [0] which expose many the
> > > AM3358 SoC balls to stacking expansion boards called "capes", or to
> > > other external connections like jumper wires to a breadboard.
> > >
> > > Many of the P8/P9 header pins can muxed to a gpio line.  The
> > > gpio-line-names describe which P8/P9 pin that line goes to and the
> > > default mux for that P8/P9 pin.  Some lines are not routed to the
> > > P8/P9 headers, but instead are dedicated to some functionality such as
> > > status LEDs.  The line name will indicate this.  Some line names are
> > > left empty as the corresponding AM3358 balls are not connected.
> > >
> > > The goal is to make it easier for a user viewing the output of gpioinfo
> > > to determine which P8/P9 pin is connected to a line.  The output of
> > > gpioinfo on a BeagleBone Black will now look like this:
> > >
> > > gpiochip0 - 32 lines:
> > >         line   0:   "ethernet"       unused   input  active-high
> > >         line   1:   "ethernet"       unused   input  active-high
> > 
> > Why are the ethernet lines not tagged with respective signal name
> > when right below the SPI lines are explicitly tagged with
> > sclk, cs0 etc?
> > 
> > Ethernet is usually RGMII and has signal names like
> > tx_clk, tx_d0, tx_en etc.
> 
> Thank you for the feedback, Linus.
> 
> My desire is to communicate that the AM3358 balls corresponding to these
> GPIO lines are being used for Ethernet and not exposed to the P8 and P9
> expansion headers.
> 
> I am happy to switch these labels to the actual Ethernet signals such as
> RGMII and MDIO signal names if you think that is better.
> 
> For example, AM3358 ZCZ ball M17 is both gpio0_0 and mdio_data [0].  On 
> BeagleBone, the ball is routed to the Ethernet PHY and used for MDIO [1]
> Thus gpiochio 0 line 0 is not connected to the P8 or P9 expansion header.
> 
> Which of the following line name would be best?
> 
> 1) "[MDIO_DATA]"
> 
> precise signal name, placed in brackets to denote is not possible to 
> use as GPIO on the P8 or P9 headers
> 
> 2) "[ethernet]" 
> 
> instead of the precise signal name, just indicate that it is used for
> Ethernet and is not usable for GPIO on the P8 or P9 headers
> 
> 3) ""
> 
> no label as this gpio line is not connected to the P8/P9 and is
> hardwired in the PCB layout for Ethernet (MDIO).
> 
> > Also some lines seem to be tagged with the pin number
> > like P9_22, P2_21 below, it seems a bit inconsistent
> > to have much information on some pins and very sketchy
> > information on some.
> 
> The goal for these line names is make it easier for a BeagleBone user to
> identify which GPIO lines are connected to the P8 and P9 expansion
> headers.  Our users are most likely to refer to cape-headers.png [2] as
> it is part of the bone101 out-of-the-box tutorial [3]. 
> 
> Some GPIO lines are free to be used for GPIO in the default
> configuration.  For example, gpiochip 1 line 12 is connected to P8_12
> and it is not used by another peripheral by default. I used the label:
> "P8_12 gpio"
> 
> However, gpiochip 1 line 0 is connected to P8_25 but is also used by the
> on-board eMMC.  The eMMc is enabled by default so this line can not be
> used for GPIO unless the user modifies the pinmux in the device tree.  
> 
> Thus, I used this label: "P8_25 emmc"
> 
> Maybe a better label would be "P8_25 [EMMC]"?
> 
> > 
> > >         line  18:        "usb"       unused   input  active-high
> > >         line  19:       "hdmi"       unused   input  active-high
> > 
> > Similar comments for these.
> 
> 
> These are similar to the Ethernet MDIO example above.  The balls
> corresponding to these GPIO lines are not connected to the P8 or P9 
> headers and are hardwired on the PCB for other peripherals like USB
> and HDMI.
> 
> For example, gpiochip 0 line 18 is USB0_DRVVBUS so I simplified it to
> "usb" to indicate it can not be used for GPIO. Maybe "[USB]" is better?
> 
> gpiochip 0 line 19 is AM3358 ZCZ ball A15 and the BeagleBone Black
> schematic shows that this is connected to the CEC clock for the HDMI
> framer [4].  I though "hdmi" was a nice way to summarize that this is
> used for HDMI and can not be changed, though maybe "[HDMI]" is better
> or no label at all.
> 
> In conclusion, the motivation of these line names is to be a quick
> reference for a user to find GPIO lines on the P8 and P9 headers.
> 
> Thanks,
> Drew
> 
> [0] http://www.ti.com/lit/ds/symlink/am3358.pdf
> [1] https://github.com/beagleboard/beaglebone-black/wiki/System-Reference-Manual#ethernet-processor-interface
> [2] http://beagleboard.org/static/images/cape-headers.png
> [3] https://beagleboard.org/Support/bone101
> [4] https://github.com/beagleboard/beaglebone-black/blob/master/BBB_SCH.pdf
> 

I've posted a v2 which I hope improves the intent of the line names. [0]

I'm happy to integrate any feedback and create a v3 - especially if it
is prefered for me to list the specific peripherial signals instead of
an abstract term like "[ethernet]" or "[emmc]".  This is for lines that
can not be used because they are not routed to the expansion headers.

thanks,
drew

[0] https://lore.kernel.org/linux-omap/20200520214757.GA362547@x1/T/#u
