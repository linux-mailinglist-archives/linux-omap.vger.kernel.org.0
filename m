Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF2CC435184
	for <lists+linux-omap@lfdr.de>; Wed, 20 Oct 2021 19:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbhJTRnu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Oct 2021 13:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbhJTRnt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 20 Oct 2021 13:43:49 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8832C061753
        for <linux-omap@vger.kernel.org>; Wed, 20 Oct 2021 10:41:34 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id pi19-20020a17090b1e5300b0019fdd3557d3so2953433pjb.5
        for <linux-omap@vger.kernel.org>; Wed, 20 Oct 2021 10:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tLS8+kBpzekWeBdekKGTRJk0E4srTCOVGmq4Px1Q8VQ=;
        b=gJbARJpG2w9XXkcZ6CSy2/THoVI0FcFNYFPuofYL8NVisjqdt0X0eq+HH+reaQpVXm
         5MI+SplxtlxvZ1E0OLUyfIl/XiVcXduiwQnprTmO3DEStW4HT30c1IoDI1oVZxm+iOAV
         3/XJwkPNgY1b56D39N24JZYm6H5qZHpfKUBzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tLS8+kBpzekWeBdekKGTRJk0E4srTCOVGmq4Px1Q8VQ=;
        b=AfNzKCSIvf/+Wo72Dm0zXDvkDeA0MiM3qAjzwgci8LGaMmCx/R3N5iQab257RhOX9i
         YwsH6WOZzrShDq2OzP1ey6+zGCfsTuhi6IXkCuTkALJSMAborTw0RhTP6HbiChHXA737
         Em73d8OHuNZdb+4E90eH6pCpuWgOL/kigiGSmA/hZqFn4Uhjs6apgoMjr5bSEYkV5S/k
         w9eCVEl/NgcB2TySv1IOqeyEVqLIWs3L8wwAx82IlavycFjSYv6IW2pXgz4tDAt2lMPc
         gIY0FZMlhzFvHfRr333ovfjs0iy1yzDHUoqO68ucR14gr8Yve+kLE2Jr3MIBB/+3TKY9
         BLRA==
X-Gm-Message-State: AOAM531dEsV30Xmc0N7a4j1pJBX9TlgNRMnW6QCR+kOzkQUiSqemTzy2
        715fagTlSVluKADO/v5BX23Hlw==
X-Google-Smtp-Source: ABdhPJzlGMQDOJLoQZpO+D08HsHF1MsykzBHtuqJvEm206lRGp9Qb3pe7UydXadxkqIvENvT61l62w==
X-Received: by 2002:a17:903:1ca:b0:13e:f367:9361 with SMTP id e10-20020a17090301ca00b0013ef3679361mr507344plh.3.1634751694235;
        Wed, 20 Oct 2021 10:41:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d5fe:85e9:caf2:ec4e])
        by smtp.gmail.com with UTF8SMTPSA id i128sm3148602pfc.47.2021.10.20.10.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 10:41:33 -0700 (PDT)
Date:   Wed, 20 Oct 2021 10:41:31 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <YXBUywpxasyTtSCr@google.com>
References: <20210813195228.2003500-1-mka@chromium.org>
 <YUoRq1RrOIoiBJ5+@google.com>
 <CAD=FV=WrddUhWT0wUVZD0gN_+8Zy1VGY77LYLYBvhaPQQ_SqZw@mail.gmail.com>
 <YWkiGGBKOVokBye9@kroah.com>
 <03f28680-35eb-25f4-5041-f3a56144da24@foss.st.com>
 <0739e563-c8e7-2a19-e440-4f32e7de3917@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0739e563-c8e7-2a19-e440-4f32e7de3917@xilinx.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 20, 2021 at 08:21:21AM +0200, Michal Simek wrote:
> 
> 
> On 10/19/21 18:04, Fabrice Gasnier wrote:
> > On 10/15/21 8:39 AM, Greg Kroah-Hartman wrote:
> > > On Thu, Oct 14, 2021 at 02:38:55PM -0700, Doug Anderson wrote:
> > > > Hi,
> > > > 
> > > > On Tue, Sep 21, 2021 at 10:09 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > > > 
> > > > > Hi Greg,
> > > > > 
> > > > > are there any actions pending or can this land in usb-testing?
> > > > > 
> > > > > I confirmed that this series can be rebased on top of v5.15-rc2
> > > > > without conflicts.
> > > > 
> > > > I'm quite interested to know what the next action items are, too. This
> > > > is one of the very few patches we have for trogdor (excluding MIPI
> > > > camera, which is a long story) that we're carrying downstream, so I'm
> > > > keenly interested in making sure it's unblocked (if, indeed, it's
> > > > blocked on anything).
> > > > 
> > > > If folks feel that this needs more review eyes before landing again
> > > > then I'll try to find some time in the next week or two. If it's just
> > > > waiting for the merge window to open/close so it can have maximal bake
> > > > time, that's cool too. Please yell if there's something that I can do
> > > > to help, though! :-)
> > > 
> > > I would love more review-eyes on this please.
> > > 
> > 
> > Hi,
> > 
> > I noticed this series some time ago, and wanted to take a closer look.
> > 
> > The same issue this series address is seen on stm32 board for instance.
> > (arch/arm/boot/dts/stm32mp15xx-dkx.dtsi). On board HUB (not described in
> > the DT) is supplied by an always-on regulator.
> > So it could could be interesting/useful to address the same case ,
> > on stm32 boards, where USB2 (ehci-platform driver) is used currently.
> > 
> > I noticed a few things, especially on the dt-bindings. I've some
> > questions here.
> > 
> > In this series, RTS5411 is used. The dt-bindings documents it as a child
> > node of the USB controller. E.g.
> > 
> > &usb {
> > 	usb_hub_2_0: hub@1 {
> > 		...
> > 	};
> > 
> > 	usb_hub_3_0: hub@2 {
> > 	};
> > }
> > 
> > I had a quick look at RTS5411 datasheet. It looks like there's an i2c
> > interface too.
> > - I guess the I2C interface isn't used in your case ?
> >    (I haven't checked what it could be used for...)
> > 
> > In the stm32 boards (stm32mp15xx-dkx), there's an usb2514b chip
> > - that also could be wired on I2C interface (0R mount option)
> > - unused on stm32 boards by default
> > 
> > usb2514b chip already has a dt-bindings (with compatible), and a driver:
> > - drivers/usb/misc/usb251xb.c
> > - Documentation/devicetree/bindings/usb/usb251xb.txt
> > 
> > It is defined more as an i2c chip, so I'd expect it as an i2c child,
> > e.g. like:
> > 
> > &i2c {
> > 	usb2514b@2c {
> > 		compatible = "microchip,usb2514b";
> > 		...
> > 	};
> > };
> > 
> > 
> > This way, I don't see how it could be used together with onboard_usb_hub
> > driver ? (But I may have missed it)
> > Is it possible to use a phandle, instead of a child node ?
> > 
> > However, in the stm32mp15xx-dkx case, i2c interface isn't wired/used by
> > default. So obviously the i2c driver isn't used. In this case, could the
> > "microchip,usb2514b" be listed in onboard_usb_hub driver ?
> > (wouldn't it be redundant ?)
> > 
> > In this case it would be a child node of the usb DT node... Maybe that's
> > more a question for Rob: would it be "legal" regarding existing
> > dt-bindings ?
> 
> We wanted to upstream driver for microchip usb5744 and based on this thread
> with Rob
> 
> https://lore.kernel.org/all/CAL_JsqJZBbu+UXqUNdZwg-uv0PAsNg55026PTwhKr5wQtxCjVQ@mail.gmail.com/
> 
> the recommendation was to use i2c-bus link. And in our usb5744 case where
> usb hub has only one i2c address we just hardcoded it in the driver. I
> should be pushing this driver to xilinx soc tree soon if you want to take a
> look.

Interesting, with the 'i2c-bus' link it might be feasible to support the
i2c functionality in the onboard_usb_hub driver if desired. Not sure how
things would look when the hub can have different i2c addresses. Also in
case of powering down the hub during system suspend any configuration
through i2c would have to be done again on resume.
