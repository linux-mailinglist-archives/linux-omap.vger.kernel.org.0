Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8716F89B1
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 08:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfKLH3t (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 02:29:49 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36479 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfKLH3t (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 02:29:49 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iUQcG-0001qJ-9e; Tue, 12 Nov 2019 08:29:32 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iUQcA-0001xe-RB; Tue, 12 Nov 2019 08:29:26 +0100
Date:   Tue, 12 Nov 2019 08:29:26 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-realtek-soc@lists.infradead.org,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        linux-amlogic@lists.infradead.org,
        Lee Jones <lee.jones@linaro.org>, linux-omap@vger.kernel.org,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] base: soc: Export soc_device_to_device() helper
Message-ID: <20191112072926.isjxfa4ci6akhx56@pengutronix.de>
References: <20191103013645.9856-3-afaerber@suse.de>
 <20191111045609.7026-1-afaerber@suse.de>
 <20191111052741.GB3176397@kroah.com>
 <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com>
 <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
 <20191112052347.GA1197504@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191112052347.GA1197504@kroah.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Nov 12, 2019 at 06:23:47AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Nov 11, 2019 at 09:10:41PM +0100, Andreas Färber wrote:
> > Am 11.11.19 um 07:40 schrieb Greg Kroah-Hartman:
> > > On Mon, Nov 11, 2019 at 06:42:05AM +0100, Andreas Färber wrote:
> > >> Hi Greg,
> > >>
> > >> Am 11.11.19 um 06:27 schrieb Greg Kroah-Hartman:
> > >>> On Mon, Nov 11, 2019 at 05:56:09AM +0100, Andreas Färber wrote:
> > >>>> Use of soc_device_to_device() in driver modules causes a build failure.
> > >>>> Given that the helper is nicely documented in include/linux/sys_soc.h,
> > >>>> let's export it as GPL symbol.
> > >>>
> > >>> I thought we were fixing the soc drivers to not need this.  What
> > >>> happened to that effort?  I thought I had patches in my tree (or
> > >>> someone's tree) that did some of this work already, such that this
> > >>> symbol isn't needed anymore.
> > >>
> > >> I do still see this function used in next-20191108 in drivers/soc/.
> > >>
> > >> I'll be happy to adjust my RFC driver if someone points me to how!
> > > 
> > > Look at c31e73121f4c ("base: soc: Handle custom soc information sysfs
> > > entries") for how you can just use the default attributes for the soc to
> > > create the needed sysfs files, instead of having to do it "by hand"
> > > which is racy and incorrect.
> > 
> > Unrelated.
> > 
> > >> Given the current struct layout, a type cast might work (but ugly).
> > >> Or if we stay with my current RFC driver design, we could use the
> > >> platform_device instead of the soc_device (which would clutter the
> > >> screen more than "soc soc0:") or resort to pr_info() w/o device.
> > > 
> > > Ick, no, don't cast blindly.  What do you need the pointer for?  Is this
> > > for in-tree code?
> > 
> > No, an RFC patchset: https://patchwork.kernel.org/cover/11224261/
> > 
> > As I indicated above, I used it for a dev_info(), which I can easily
> > avoid by using pr_info() instead:
> > 
> > diff --git a/drivers/soc/realtek/chip.c b/drivers/soc/realtek/chip.c
> > index e5078c6731fd..f9380e831659 100644
> > --- a/drivers/soc/realtek/chip.c
> > +++ b/drivers/soc/realtek/chip.c
> > @@ -178,8 +178,7 @@ static int rtd_soc_probe(struct platform_device *pdev)
> > 
> >         platform_set_drvdata(pdev, soc_dev);
> > 
> > -       dev_info(soc_device_to_device(soc_dev),
> > -               "%s %s (0x%08x) rev %s (0x%08x) detected\n",
> > +       pr_info("%s %s (0x%08x) rev %s (0x%08x) detected\n",
> >                 soc_dev_attr->family, soc_dev_attr->soc_id, chip_id,
> >                 soc_dev_attr->revision, chip_rev);
> 
> First off, the driver should not be spitting out noise for when all goes
> well like this :)

I didn't follow the discussion closely, but I think I want to object
here a bit. While I agree that each driver emitting some stuff to the
log buffer is hardly helpful, seeing the exact SoC details is indeed
useful at times. With my Debian kernel team member hat on, I'd say
keep this information. This way the SoC details make it into kernel bug
reports without effort on our side.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
