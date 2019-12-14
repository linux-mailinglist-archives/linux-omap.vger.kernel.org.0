Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8E8111F1E1
	for <lists+linux-omap@lfdr.de>; Sat, 14 Dec 2019 14:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbfLNNAB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Dec 2019 08:00:01 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:34498 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfLNNAA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 14 Dec 2019 08:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=cVfsByPBGAH0nlXQRgx8tkvnwPRM93zqT8emFAC0MMo=; b=NYBnGKnByJHlzENS5UPOeXPvF
        lDm53oKLDryplzcg2wtiqsmjk3vVDVik46mpm2X542ZB8jgKcPYXLegNwiMKoe4d/3zB/HFIpweM3
        W9zQNX2o0ic0jH6Xf1nD2ANFnYiJlYjPoErAzdJGnDjLlJNXwP6FaMq4iNpGOlslXBp3lY4Q1YfNZ
        w7c61lybarYqsCdd00nAaqbA6LMJjEqcOt3OUo2xgdSp0A6sZSEZU0regJQgOud95o2biPA9vHEu9
        6z87usN65hGtdKwyFimNG1lclpP+feXTewWQLO1uyc6CFoN3NYiXmGfYCsCkUKChTdYYOtCTKUm45
        Rj/NHc5jw==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:41234)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ig71T-0002v6-Ew; Sat, 14 Dec 2019 12:59:51 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ig71P-0000SH-FH; Sat, 14 Dec 2019 12:59:47 +0000
Date:   Sat, 14 Dec 2019 12:59:47 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Stefan Wahren <wahrenst@gmx.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Subject: Re: BUG - was: [GIT PULL 2/3] bcm2835-soc-next-2019-10-15
Message-ID: <20191214125947.GD1337@shell.armlinux.org.uk>
References: <1571159725-5090-1-git-send-email-wahrenst@gmx.net>
 <1571159725-5090-2-git-send-email-wahrenst@gmx.net>
 <12244E4E-A1A0-4EE9-ACD3-EA165D9A2C79@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12244E4E-A1A0-4EE9-ACD3-EA165D9A2C79@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Dec 14, 2019 at 11:54:19AM +0100, H. Nikolaus Schaller wrote:
> Hi Stefan,
> 
> > Am 15.10.2019 um 19:15 schrieb Stefan Wahren <wahrenst@gmx.net>:
> > 
> > Hi Florian,
> > 
> > The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
> > 
> >  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> > 
> > are available in the git repository at:
> > 
> >  git://github.com/anholt/linux tags/bcm2835-soc-next-2019-10-15
> > 
> > for you to fetch changes up to 781fa0a954240c8487683ddf837fb2c4ede8e7ca:
> > 
> >  ARM: bcm: Add support for BCM2711 SoC (2019-10-10 19:21:03 +0200)
> 
> this patch has finally arrived in v5.5-rc1 but it seems to break
> multiplatform build.
> 
> We run a distribution kernel that supports OMAP3/4/5, i.MX6 and RasPi 3B+
> but since rebasing to v5.5-rc1 the kernel hangs after "Starting Kernel ...".
> On all ARM devices (incl. RasPi 3B+).
> 
> Playing with our defconfig did show that deconfiguring CONFIG_ARCH_BCM2835
> makes the kernel work again.
> 
> After further analysis it turns out that reverting this patch also
> makes the boards work again.
> 
> I am not exactly sure what the reason is, but it may have something to
> do with the new auto-selection of CONFIG_ZONE_DMA which is not automatically
> selected by OMAP and i.MX6.
> 
> To reproduce on some OMAP device (i.MX6 should be similar)
> 
> 1st test:
> 
> git checkout v5.5-rc1
> make omap2plus_defconfig
> 
> => boots OMAP device
> 
> 2nd test:
> 
> ( echo CONFIG_ARCH_BCM2835=y; echo CONFIG_ARCH_BCM=y ) >>arch/arm/configs/omap2plus_defconfig
> make omap2plus_defconfig
> 
> => fails to boot OMAP device
> 
> 3rd test:
> 
> git revert 781fa0a954240c8487683ddf837fb2c4ede8e7ca
> make omap2plus_defconfig
> 
> => boots OMAP device
> 
> BTW: the RasPi 3B+ runs equally well without this patch. So what is it
> good for?
> 
> So please check and fix this patch.

Enabling ZONE_DMA shouldn't cause this problem - but as it does, please
enable memblock debugging and early console, and please send any boot
messages you can get from the system when it fails to boot.  Also
having a successful boot log may be useful.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
