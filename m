Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4DBCF8D36
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 11:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfKLKtI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 05:49:08 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40458 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbfKLKtI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Nov 2019 05:49:08 -0500
Received: by mail-wm1-f68.google.com with SMTP id f3so2405856wmc.5
        for <linux-omap@vger.kernel.org>; Tue, 12 Nov 2019 02:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cGBOxzPSbBShIku6cnlQrmVn7eBeOMTad4fgKmfaiFg=;
        b=Euto9/lQ4Xwt8ZRKGQSpeBv2obGwPp0u/+pHm60h9VTX/05YlZOdCRCI1JzXVpLwm5
         l3g5u9AFmtrm3QcRsRuxM1XCIckSOBQlVGjQfackXRDKAGPfxGCGPr2ts4qmE3SI7Lfa
         qyt0jnRdqJhvES9HKhPlZxKoPX4Q0FbVDo2FOC4Yzl+Bl6Xf3IPU/0ngPAt6xaCWtibg
         UTc8mO7c9XiPGZ0CWumWdpueA3Ij/0fnZhjAvhY3vrWGa4BjuE60H6SiPQn9SD+rn953
         yVVMks7re251j1u6UBWrXfef46kcrzBmy8gCmxIv2xCOGSjIP9dlaZzQrTTtl7GEk6u6
         0lDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cGBOxzPSbBShIku6cnlQrmVn7eBeOMTad4fgKmfaiFg=;
        b=XaxTH3OYi3aUkcjsH69KzHlFnqsUaPX/9gIfRBQ8ejUsccgEh7SGNELTi4IBQmNjr8
         ue5MLvAM/fDT9mdYN6PtbSplqiGe7NSqGqb/CHwi+jqIAQ3yEGhkBqJvKbN40CfbZdSe
         VO7e9rftMkxXK30EwvVQf1fGSUnE0Czp/266FeRLVBoEp6ebGFaRah3VoZpePUf2LYYb
         0BpIXol8eA//813PwyvP8+55yrsrA9vul00ZCONCcOcMaptHZHxAzVTBzdRHG+vYrQWU
         ASwToJZL7hnvP6UcWderURjigynQ/6RwA8mokPfGjLvg4jDGlNYxK/oU0ACl+WAKl3eO
         tV0A==
X-Gm-Message-State: APjAAAW0fwNW31ck3W5PEPxhUN8SgB9OaNQGzbuZHI/iUDtJZpAPtgtj
        qzz2XD0c3vWM8JM5mWVhwbdsxQ==
X-Google-Smtp-Source: APXvYqzZj+j6WLZsmzeULWLgYPCNF9UMEvYlEH8Wd9m5JB3mfTBRFsR7TnMXmSIlEe9absXUaF8dMQ==
X-Received: by 2002:a05:600c:2202:: with SMTP id z2mr3210310wml.162.1573555745515;
        Tue, 12 Nov 2019 02:49:05 -0800 (PST)
Received: from dell ([2.27.35.135])
        by smtp.gmail.com with ESMTPSA id n65sm4341325wmf.28.2019.11.12.02.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 02:49:05 -0800 (PST)
Date:   Tue, 12 Nov 2019 10:48:56 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
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
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] base: soc: Export soc_device_to_device() helper
Message-ID: <20191112104856.GQ3218@dell>
References: <20191103013645.9856-3-afaerber@suse.de>
 <20191111045609.7026-1-afaerber@suse.de>
 <20191111052741.GB3176397@kroah.com>
 <586fa37c-6292-aca4-fa7c-73064858afaf@suse.de>
 <20191111064040.GA3502217@kroah.com>
 <a88442df-dc6b-07e5-8dee-9e308bdda450@suse.de>
 <20191112052347.GA1197504@kroah.com>
 <20191112072926.isjxfa4ci6akhx56@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191112072926.isjxfa4ci6akhx56@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 12 Nov 2019, Uwe Kleine-König wrote:

> On Tue, Nov 12, 2019 at 06:23:47AM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Nov 11, 2019 at 09:10:41PM +0100, Andreas Färber wrote:
> > > Am 11.11.19 um 07:40 schrieb Greg Kroah-Hartman:
> > > > On Mon, Nov 11, 2019 at 06:42:05AM +0100, Andreas Färber wrote:
> > > >> Hi Greg,
> > > >>
> > > >> Am 11.11.19 um 06:27 schrieb Greg Kroah-Hartman:
> > > >>> On Mon, Nov 11, 2019 at 05:56:09AM +0100, Andreas Färber wrote:
> > > >>>> Use of soc_device_to_device() in driver modules causes a build failure.
> > > >>>> Given that the helper is nicely documented in include/linux/sys_soc.h,
> > > >>>> let's export it as GPL symbol.
> > > >>>
> > > >>> I thought we were fixing the soc drivers to not need this.  What
> > > >>> happened to that effort?  I thought I had patches in my tree (or
> > > >>> someone's tree) that did some of this work already, such that this
> > > >>> symbol isn't needed anymore.
> > > >>
> > > >> I do still see this function used in next-20191108 in drivers/soc/.
> > > >>
> > > >> I'll be happy to adjust my RFC driver if someone points me to how!
> > > > 
> > > > Look at c31e73121f4c ("base: soc: Handle custom soc information sysfs
> > > > entries") for how you can just use the default attributes for the soc to
> > > > create the needed sysfs files, instead of having to do it "by hand"
> > > > which is racy and incorrect.
> > > 
> > > Unrelated.
> > > 
> > > >> Given the current struct layout, a type cast might work (but ugly).
> > > >> Or if we stay with my current RFC driver design, we could use the
> > > >> platform_device instead of the soc_device (which would clutter the
> > > >> screen more than "soc soc0:") or resort to pr_info() w/o device.
> > > > 
> > > > Ick, no, don't cast blindly.  What do you need the pointer for?  Is this
> > > > for in-tree code?
> > > 
> > > No, an RFC patchset: https://patchwork.kernel.org/cover/11224261/
> > > 
> > > As I indicated above, I used it for a dev_info(), which I can easily
> > > avoid by using pr_info() instead:
> > > 
> > > diff --git a/drivers/soc/realtek/chip.c b/drivers/soc/realtek/chip.c
> > > index e5078c6731fd..f9380e831659 100644
> > > --- a/drivers/soc/realtek/chip.c
> > > +++ b/drivers/soc/realtek/chip.c
> > > @@ -178,8 +178,7 @@ static int rtd_soc_probe(struct platform_device *pdev)
> > > 
> > >         platform_set_drvdata(pdev, soc_dev);
> > > 
> > > -       dev_info(soc_device_to_device(soc_dev),
> > > -               "%s %s (0x%08x) rev %s (0x%08x) detected\n",
> > > +       pr_info("%s %s (0x%08x) rev %s (0x%08x) detected\n",
> > >                 soc_dev_attr->family, soc_dev_attr->soc_id, chip_id,
> > >                 soc_dev_attr->revision, chip_rev);
> > 
> > First off, the driver should not be spitting out noise for when all goes
> > well like this :)
> 
> I didn't follow the discussion closely, but I think I want to object
> here a bit. While I agree that each driver emitting some stuff to the
> log buffer is hardly helpful, seeing the exact SoC details is indeed
> useful at times. With my Debian kernel team member hat on, I'd say
> keep this information. This way the SoC details make it into kernel bug
> reports without effort on our side.

Right. From my angle we are starting to be way too aggressive with the
point about not printing information to the kernel log. In only a
small set of cases does this actually cause an issue i.e. with
platforms containing so many devices that printing information from
each of them does significantly increase boot times. In my world of
small electronics I've been greatly hindered by the lack of
information, such that it has cost days of engineering trying to track
down fictitious bugs and the like.

For platforms where printing useful information culminates in negative
effects, perhaps simply lower their log level, rather than suffocate
all platforms.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
