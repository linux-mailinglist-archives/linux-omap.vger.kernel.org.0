Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E460742E92B
	for <lists+linux-omap@lfdr.de>; Fri, 15 Oct 2021 08:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235523AbhJOGla (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Oct 2021 02:41:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:56990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229716AbhJOGla (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 15 Oct 2021 02:41:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B89B861184;
        Fri, 15 Oct 2021 06:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634279964;
        bh=eHMP1L5p7U9JjkTgxLAgLmWgChOZElqg0ECTI25pFiM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vH5xyVPI7ANQGLw7FNvgZFKqHpopiBvQMnPds7bxMgnbwjA8XxmviHtF/zfnjwhNU
         G+6HLYm08gIDuOVCObdDG0AXRoBnmlvhxa2cYdTI/5DF97VTndUoIbYg+t2Ivojhxv
         cDly48omx4tvWBlX4moZM+FA+Sex7vXvTIsISXTU=
Date:   Fri, 15 Oct 2021 08:39:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
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
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
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
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lionel Debieve <lionel.debieve@st.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Olivier Moysan <olivier.moysan@st.com>,
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
Message-ID: <YWkiGGBKOVokBye9@kroah.com>
References: <20210813195228.2003500-1-mka@chromium.org>
 <YUoRq1RrOIoiBJ5+@google.com>
 <CAD=FV=WrddUhWT0wUVZD0gN_+8Zy1VGY77LYLYBvhaPQQ_SqZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WrddUhWT0wUVZD0gN_+8Zy1VGY77LYLYBvhaPQQ_SqZw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 14, 2021 at 02:38:55PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Sep 21, 2021 at 10:09 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Hi Greg,
> >
> > are there any actions pending or can this land in usb-testing?
> >
> > I confirmed that this series can be rebased on top of v5.15-rc2
> > without conflicts.
> 
> I'm quite interested to know what the next action items are, too. This
> is one of the very few patches we have for trogdor (excluding MIPI
> camera, which is a long story) that we're carrying downstream, so I'm
> keenly interested in making sure it's unblocked (if, indeed, it's
> blocked on anything).
> 
> If folks feel that this needs more review eyes before landing again
> then I'll try to find some time in the next week or two. If it's just
> waiting for the merge window to open/close so it can have maximal bake
> time, that's cool too. Please yell if there's something that I can do
> to help, though! :-)

I would love more review-eyes on this please.

It's in my queue to review, I just need to spend the time on it, sorry
for the delay.

greg k-h
