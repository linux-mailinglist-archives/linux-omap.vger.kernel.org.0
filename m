Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72F8AE0E1A
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 00:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731951AbfJVWT1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 18:19:27 -0400
Received: from muru.com ([72.249.23.125]:39180 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730331AbfJVWT0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 18:19:26 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 88D5080FA;
        Tue, 22 Oct 2019 22:19:57 +0000 (UTC)
Date:   Tue, 22 Oct 2019 15:19:19 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] configs: ARM: omap2plus: Enable OMAP3_THERMAL
Message-ID: <20191022221919.GF5610@atomide.com>
References: <20191007220540.30690-1-aford173@gmail.com>
 <20191022162223.GU5610@atomide.com>
 <CAHCN7xLy975mxX+cm56PMx-TKODEZjYPfMHb=byspKxYXXq7OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLy975mxX+cm56PMx-TKODEZjYPfMHb=byspKxYXXq7OA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191022 19:01]:
> On Tue, Oct 22, 2019 at 11:22 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > Hi,
> >
> > * Adam Ford <aford173@gmail.com> [191007 15:06]:
> > > The some in the OMAP3 family have a bandgap thermal sensor, but
> > > omap2plus has it disabled.
> > >
> > > This patch enables the OMAP3_THERMAL by default like the rest of
> > > the OMAP family.
> >
> > Looks like this breaks off mode during idle for omap3, and that's
> > probably why it never got enabled. The difference in power
> > consumption during idle is about 7mW vs 32mW for the SoC as
> > measured from torpedo shunt for main_battery_som.
> >
> > I think the right fix might be simply to add handling for
> > CPU_CLUSTER_PM_ENTER to the related thermal driver to disable
> > it during idle like we have for gpio-omap.c for example.
> 
> I am not sure I know where to start on fixing that issue.  Would you
> entertain enabling the driver if we set the device tree to 'disabled'
> by default?  This way if people want to to use it, it can be enabled
> on a per-device option.  Once the power stuff gets resolved, we might
> be able to enable it by default.  For people who are planning on using
> the DM3730 @ 1GHz in high temp environments, I am not sure they'll
> care about low power.

They should both work fine together though. They are not mutually
exclusive features.

> I'll try to look into it when I have time, but I was hoping a
> compromise might be a reasonable work-around.

It should be hopefully a trivial fix.. I have not looked at the
driver code though.

Regards,

Tony
