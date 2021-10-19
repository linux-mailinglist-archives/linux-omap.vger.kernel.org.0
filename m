Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 869A0434133
	for <lists+linux-omap@lfdr.de>; Wed, 20 Oct 2021 00:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhJSWMp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Oct 2021 18:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbhJSWMo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 Oct 2021 18:12:44 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E87C061768
        for <linux-omap@vger.kernel.org>; Tue, 19 Oct 2021 15:10:30 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 75so20684447pga.3
        for <linux-omap@vger.kernel.org>; Tue, 19 Oct 2021 15:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gcH42ft4PL5Uc/1EXoL8Dp6lDCUUCAQKKLWYXAKG1cg=;
        b=gLWWTkEYbZJ9S5wn4tB9utjlf9XVjePkQgnPtpzqwjV5+Tgd9KNtnGEhYWs+gca1Lh
         rNxbvgYEXhl0I3xqP+Cmu1u86u6h2HL6+AWpTA1fXMnsiEkM3o5cQaKyjsu7nhg3rY91
         gjfn5RrgwxY3j3wjOSMw4nbZQW+p1PmXD32HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gcH42ft4PL5Uc/1EXoL8Dp6lDCUUCAQKKLWYXAKG1cg=;
        b=IF2iGndLKTHhIwgykYP9D24evt2LxUg49IFyjf0HBMlooHmm3sXbLo+NvMImt1cgdn
         hDW73xYZ0NPX93UX7SzCq6h+9+3x/trYRfOY+h9I3ggmt+Y0AEn9bfj8bsp8cGLpC2TA
         lkuVGQuxY7KoygkH+pJ7vudpd8+dT8FCApF4EjBSie3zcphkT7aZXhMfcavYUi4JYwVC
         t1/NvgaxJN7zMTGs9Zv2kdvLie8m2p0nEpdo9wN6Ga8fTc9d/T+hh44JOj6R06KmMqGl
         jJda3eSsIjEJ+BJw+9ZdmGlrw1Rm15i9YLnlzmv+BNUqKHsXzeVEALbbxgAAQMz/r9CA
         6L0A==
X-Gm-Message-State: AOAM530tBq9aPB1oHxdITLcI7PMfZq/jypGaUh/+KY3OTaGDvChRS+o8
        rRWH8CDSdGX3sNIfzOymXUvRBQ==
X-Google-Smtp-Source: ABdhPJz8FQqhb8sxAUF9c1/0TkQZqd983/XaDEdJ60GExi3IhnaND//4FpVJC7NyexgDMDDuQ7+QWQ==
X-Received: by 2002:a63:7f0e:: with SMTP id a14mr24338961pgd.390.1634681430017;
        Tue, 19 Oct 2021 15:10:30 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6c1f:a561:f56:7d16])
        by smtp.gmail.com with UTF8SMTPSA id n207sm203903pfd.143.2021.10.19.15.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 15:10:29 -0700 (PDT)
Date:   Tue, 19 Oct 2021 15:10:25 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Doug Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Peter Chen <peter.chen@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lionel DEBIEVE <lionel.debieve@st.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Martin =?utf-8?Q?J=C3=BCcker?= <martin.juecker@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Olivier MOYSAN <olivier.moysan@st.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Will Deacon <will@kernel.org>,
        William Cohen <wcohen@redhat.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>
Subject: Re: [PATCH v16 0/7] usb: misc: Add onboard_usb_hub driver
Message-ID: <YW9CUabfA0HrtTAq@google.com>
References: <20210813195228.2003500-1-mka@chromium.org>
 <YUoRq1RrOIoiBJ5+@google.com>
 <CAD=FV=WrddUhWT0wUVZD0gN_+8Zy1VGY77LYLYBvhaPQQ_SqZw@mail.gmail.com>
 <YWkiGGBKOVokBye9@kroah.com>
 <03f28680-35eb-25f4-5041-f3a56144da24@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <03f28680-35eb-25f4-5041-f3a56144da24@foss.st.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Oct 19, 2021 at 06:04:06PM +0200, Fabrice Gasnier wrote:
> On 10/15/21 8:39 AM, Greg Kroah-Hartman wrote:
> > On Thu, Oct 14, 2021 at 02:38:55PM -0700, Doug Anderson wrote:
> >> Hi,
> >>
> >> On Tue, Sep 21, 2021 at 10:09 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >>>
> >>> Hi Greg,
> >>>
> >>> are there any actions pending or can this land in usb-testing?
> >>>
> >>> I confirmed that this series can be rebased on top of v5.15-rc2
> >>> without conflicts.
> >>
> >> I'm quite interested to know what the next action items are, too. This
> >> is one of the very few patches we have for trogdor (excluding MIPI
> >> camera, which is a long story) that we're carrying downstream, so I'm
> >> keenly interested in making sure it's unblocked (if, indeed, it's
> >> blocked on anything).
> >>
> >> If folks feel that this needs more review eyes before landing again
> >> then I'll try to find some time in the next week or two. If it's just
> >> waiting for the merge window to open/close so it can have maximal bake
> >> time, that's cool too. Please yell if there's something that I can do
> >> to help, though! :-)
> > 
> > I would love more review-eyes on this please.
> > 
> 
> Hi,
> 
> I noticed this series some time ago, and wanted to take a closer look.
> 
> The same issue this series address is seen on stm32 board for instance.
> (arch/arm/boot/dts/stm32mp15xx-dkx.dtsi). On board HUB (not described in
> the DT) is supplied by an always-on regulator.
> So it could could be interesting/useful to address the same case ,
> on stm32 boards, where USB2 (ehci-platform driver) is used currently.
> 
> I noticed a few things, especially on the dt-bindings. I've some
> questions here.
> 
> In this series, RTS5411 is used. The dt-bindings documents it as a child
> node of the USB controller. E.g.
> 
> &usb {
> 	usb_hub_2_0: hub@1 {
> 		...
> 	};
> 
> 	usb_hub_3_0: hub@2 {
> 	};
> }
> 
> I had a quick look at RTS5411 datasheet. It looks like there's an i2c
> interface too.
> - I guess the I2C interface isn't used in your case ?
>   (I haven't checked what it could be used for...)

Correct, the i2c interface isn't used on my board.

Also the binding isn't completely new, it is based on the generic USB
binding (https://www.kernel.org/doc/Documentation/devicetree/bindings/usb/usb-device.txt)

> In the stm32 boards (stm32mp15xx-dkx), there's an usb2514b chip
> - that also could be wired on I2C interface (0R mount option)
> - unused on stm32 boards by default
> 
> usb2514b chip already has a dt-bindings (with compatible), and a driver:
> - drivers/usb/misc/usb251xb.c
> - Documentation/devicetree/bindings/usb/usb251xb.txt
> 
> It is defined more as an i2c chip, so I'd expect it as an i2c child,
> e.g. like:
> 
> &i2c {
> 	usb2514b@2c {
> 		compatible = "microchip,usb2514b";
> 		...
> 	};
> };
> 
> 
> This way, I don't see how it could be used together with onboard_usb_hub
> driver ? (But I may have missed it)

Indeed, you can either use the i2c driver for the hub or the onboard_usb_hub
driver, but not both at the same time. The i2c driver requires the hub to be
powered before communicating with it over i2c, hence the power sequence
should not be delegated to the onboard_usb_hub driver.

> Is it possible to use a phandle, instead of a child node ?

The child node is part of the generic USB binding. The onboard_usb_hub
driver needs it to find the USB device(s) that correspond to the hub,
to optionally power the hub off during system suspend when no wakeup
capable devices are connected.

> However, in the stm32mp15xx-dkx case, i2c interface isn't wired/used by
> default. So obviously the i2c driver isn't used. In this case, could the
> "microchip,usb2514b" be listed in onboard_usb_hub driver ?
> (wouldn't it be redundant ?)

You would use the compatible string of the generic USB binding, i.e.
"usbVID,PID", which would have to be added to the onboard_usb_hub driver.

> In this case it would be a child node of the usb DT node... Maybe that's
> more a question for Rob: would it be "legal" regarding existing
> dt-bindings ?

The USB node is always there implicitly (the USB device exists), the only
difference is that the node is added explicitly (plus additional
properties).

There was a somewhat related long-winded discussion with Rob on an earlier
version of the driver/binding:
https://lore.kernel.org/linux-usb/1613055380.685661.519681.nullmailer@robh.at.kernel.org/
