Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3177611F29C
	for <lists+linux-omap@lfdr.de>; Sat, 14 Dec 2019 16:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfLNPyt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Dec 2019 10:54:49 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:39178 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbfLNPyt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Dec 2019 10:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RGWmKTY/yyH/XxxUvdn8dLr0Xj3UkAx6dUbBBDhQWg4=; b=NAhC7mF/Yab18ZaE+pUkHVnuQc
        Rgvf7NPxBLw0tPcMFS6J2+w0oSjKt3kbCD48Lrh7o00GEuT5CRpwn07PICo4cINX4MHKu7BlM/Xhy
        38qndSEf6wUIzDc6FsC5/uWaF2b8P6Z3uWsXfLfTXHxsgIlzYi+cGSgXXHnYtsYwLruo=;
Received: from p200300ccff382f001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff38:2f00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1ig9ke-0003oA-QQ; Sat, 14 Dec 2019 16:54:41 +0100
Date:   Sat, 14 Dec 2019 16:54:39 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [Letux-kernel] BUG - was: [GIT PULL 2/3]
 bcm2835-soc-next-2019-10-15
Message-ID: <20191214165439.6873625b@aktux>
In-Reply-To: <20191214125947.GD1337@shell.armlinux.org.uk>
References: <1571159725-5090-1-git-send-email-wahrenst@gmx.net>
        <1571159725-5090-2-git-send-email-wahrenst@gmx.net>
        <12244E4E-A1A0-4EE9-ACD3-EA165D9A2C79@goldelico.com>
        <20191214125947.GD1337@shell.armlinux.org.uk>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 14 Dec 2019 12:59:47 +0000
Russell King - ARM Linux admin <linux@armlinux.org.uk> wrote:

> On Sat, Dec 14, 2019 at 11:54:19AM +0100, H. Nikolaus Schaller wrote:
> > Hi Stefan,
> >   
> > > Am 15.10.2019 um 19:15 schrieb Stefan Wahren <wahrenst@gmx.net>:
> > > 
> > > Hi Florian,
> > > 
> > > The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
> > > 
> > >  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
> > > 
> > > are available in the git repository at:
> > > 
> > >  git://github.com/anholt/linux tags/bcm2835-soc-next-2019-10-15
> > > 
> > > for you to fetch changes up to 781fa0a954240c8487683ddf837fb2c4ede8e7ca:
> > > 
> > >  ARM: bcm: Add support for BCM2711 SoC (2019-10-10 19:21:03 +0200)  
> > 
> > this patch has finally arrived in v5.5-rc1 but it seems to break
> > multiplatform build.
> > 
> > We run a distribution kernel that supports OMAP3/4/5, i.MX6 and RasPi 3B+
> > but since rebasing to v5.5-rc1 the kernel hangs after "Starting Kernel ...".
> > On all ARM devices (incl. RasPi 3B+).
> > 
> > Playing with our defconfig did show that deconfiguring CONFIG_ARCH_BCM2835
> > makes the kernel work again.
> > 
> > After further analysis it turns out that reverting this patch also
> > makes the boards work again.
> > 
> > I am not exactly sure what the reason is, but it may have something to
> > do with the new auto-selection of CONFIG_ZONE_DMA which is not automatically
> > selected by OMAP and i.MX6.
> > 
> > To reproduce on some OMAP device (i.MX6 should be similar)
> > 
> > 1st test:
> > 
> > git checkout v5.5-rc1
> > make omap2plus_defconfig
> >   
> > => boots OMAP device  
> > 
> > 2nd test:
> > 
> > ( echo CONFIG_ARCH_BCM2835=y; echo CONFIG_ARCH_BCM=y ) >>arch/arm/configs/omap2plus_defconfig
> > make omap2plus_defconfig
> >   
> > => fails to boot OMAP device  
> > 
here it does not give any output at all if earlycon is appended to
kernel parameters.

> > 3rd test:
> > 
> > git revert 781fa0a954240c8487683ddf837fb2c4ede8e7ca
> > make omap2plus_defconfig
> >   
> > => boots OMAP device  
> > 
> > BTW: the RasPi 3B+ runs equally well without this patch. So what is it
> > good for?
> > 
> > So please check and fix this patch.  
> 
> Enabling ZONE_DMA shouldn't cause this problem - but as it does, please
> enable memblock debugging and early console, and please send any boot
> messages you can get from the system when it fails to boot.  Also
> having a successful boot log may be useful.
> 
diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index ad08d470a2ca..b46cf3d5e389 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -17,6 +17,7 @@ config ARCH_OMAP3
        select OMAP_INTERCONNECT
        select PM_OPP if PM
        select PM if CPU_IDLE
+       select ZONE_DMA
        select SOC_HAS_OMAP2_SDRC
        select ARM_ERRATA_430973

seems not to cause problems with make omap2plus_defconfig
here.

Regards,
Andreas
