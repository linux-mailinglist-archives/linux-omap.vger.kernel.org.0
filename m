Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E441BF87FA
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 06:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfKLFc2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 00:32:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:60190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbfKLFc1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 Nov 2019 00:32:27 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B250821925;
        Tue, 12 Nov 2019 05:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573536745;
        bh=lFiSF9q/Q/xxTvm6x//n2RwUraJ7FAvLWNteiLBYpBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yREQL2uqzE5jVpRoydpr3hHQWGThJUiK0JZ0VB764etqg9/02wKHrPZaJLYX+Pm6p
         AlK+yReNr0+3NWnc7NhV6aD73Jq2EurGGv0EiauCElNiJrq0zpTMJcddNjCDcS3bgJ
         F67bQ43FkabEisW2tm4HeqUGGioJo2M7CuyHC+jo=
Date:   Tue, 12 Nov 2019 06:23:47 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] base: soc: Export soc_device_to_device() helper
Message-ID: <20191112052347.GA1197504@kroah.com>
References: <20191103013645.9856-3-afaerber@suse.de>
 <20191111045609.7026-1-afaerber@suse.de>
 <20191111052741.GB3176397@kroah.com>
 <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com>
 <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Nov 11, 2019 at 09:10:41PM +0100, Andreas Färber wrote:
> Am 11.11.19 um 07:40 schrieb Greg Kroah-Hartman:
> > On Mon, Nov 11, 2019 at 06:42:05AM +0100, Andreas Färber wrote:
> >> Hi Greg,
> >>
> >> Am 11.11.19 um 06:27 schrieb Greg Kroah-Hartman:
> >>> On Mon, Nov 11, 2019 at 05:56:09AM +0100, Andreas Färber wrote:
> >>>> Use of soc_device_to_device() in driver modules causes a build failure.
> >>>> Given that the helper is nicely documented in include/linux/sys_soc.h,
> >>>> let's export it as GPL symbol.
> >>>
> >>> I thought we were fixing the soc drivers to not need this.  What
> >>> happened to that effort?  I thought I had patches in my tree (or
> >>> someone's tree) that did some of this work already, such that this
> >>> symbol isn't needed anymore.
> >>
> >> I do still see this function used in next-20191108 in drivers/soc/.
> >>
> >> I'll be happy to adjust my RFC driver if someone points me to how!
> > 
> > Look at c31e73121f4c ("base: soc: Handle custom soc information sysfs
> > entries") for how you can just use the default attributes for the soc to
> > create the needed sysfs files, instead of having to do it "by hand"
> > which is racy and incorrect.
> 
> Unrelated.
> 
> >> Given the current struct layout, a type cast might work (but ugly).
> >> Or if we stay with my current RFC driver design, we could use the
> >> platform_device instead of the soc_device (which would clutter the
> >> screen more than "soc soc0:") or resort to pr_info() w/o device.
> > 
> > Ick, no, don't cast blindly.  What do you need the pointer for?  Is this
> > for in-tree code?
> 
> No, an RFC patchset: https://patchwork.kernel.org/cover/11224261/
> 
> As I indicated above, I used it for a dev_info(), which I can easily
> avoid by using pr_info() instead:
> 
> diff --git a/drivers/soc/realtek/chip.c b/drivers/soc/realtek/chip.c
> index e5078c6731fd..f9380e831659 100644
> --- a/drivers/soc/realtek/chip.c
> +++ b/drivers/soc/realtek/chip.c
> @@ -178,8 +178,7 @@ static int rtd_soc_probe(struct platform_device *pdev)
> 
>         platform_set_drvdata(pdev, soc_dev);
> 
> -       dev_info(soc_device_to_device(soc_dev),
> -               "%s %s (0x%08x) rev %s (0x%08x) detected\n",
> +       pr_info("%s %s (0x%08x) rev %s (0x%08x) detected\n",
>                 soc_dev_attr->family, soc_dev_attr->soc_id, chip_id,
>                 soc_dev_attr->revision, chip_rev);

First off, the driver should not be spitting out noise for when all goes
well like this :)

Anyway, just use the pdev pointer here, not the soc dev as that is NOT a
pointer you have control over (as is evident by the fact that you need
this call to try to get it.)

I'll look at your other instances later when I've had my coffee...

thanks,

greg k-h
