Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEB8CDB21
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 06:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfJGEkt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 00:40:49 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:35690 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726969AbfJGEkt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Oct 2019 00:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=XIkkXOn84faRoqcKhr8x/joSlFB/KtZXrqxZQ1zMgLc=; b=ddc/42LjsSZUwkJQodE8URGFnh
        xtrta8+baKq6fdcZXgVkQLdRu6kh+0R7VuC8KOfskrqQnIJEkNMWcV6MTeBpwEbRrPRXAUoBlgHVm
        K9iIozKZEdbbQ3/2Y33fNI/s6P0rf7yRztaae3dMdyRi9U24/VwxYbFgGV7+ZTwnJ05g=;
Received: from p200300ccff0a88001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0a:8800:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iHKp3-0006vp-II; Mon, 07 Oct 2019 06:40:42 +0200
Date:   Mon, 7 Oct 2019 06:40:35 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        Tony Lindgren <tony@atomide.com>, Jyri Sarha <jsarha@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Letux-kernel] [PATCH] ARM: omap2plus_defconfig: Fix selected
 panels after generic panel changes
Message-ID: <20191007064035.72016c78@aktux>
In-Reply-To: <20191006223958.67725fdf@aktux>
References: <20191003165539.50318-1-tony@atomide.com>
        <03ca02c1-2816-17cd-03fd-5b72e5d0ec96@ti.com>
        <39E48EC6-65FE-419B-BBE8-E72CB44B517D@goldelico.com>
        <20191006145348.GD4740@pendragon.ideasonboard.com>
        <20191006223958.67725fdf@aktux>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -0.6 (/)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 6 Oct 2019 22:39:58 +0200
Andreas Kemnade <andreas@kemnade.info> wrote:

> On Sun, 6 Oct 2019 17:53:48 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> 
> > Hi Nikolaus,
> > 
> > On Sat, Oct 05, 2019 at 12:50:37PM +0200, H. Nikolaus Schaller wrote:  
> > > > Am 04.10.2019 um 10:41 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
> > > > 
> > > > On 03/10/2019 19:55, Tony Lindgren wrote:    
> > > >> The old omapdrm panels got removed for v5.4 in favor of generic panels,
> > > >> and the Kconfig options changed. Let's update omap2plus_defconfig
> > > >> accordingly so the same panels are still enabled.
> > > >> Cc: Jyri Sarha <jsarha@ti.com>
> > > >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > >> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > >> Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > >> ---
> > > >>  arch/arm/configs/omap2plus_defconfig | 12 ++++++------
> > > >>  1 file changed, 6 insertions(+), 6 deletions(-)
> > > >> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> > > >> --- a/arch/arm/configs/omap2plus_defconfig
> > > >> +++ b/arch/arm/configs/omap2plus_defconfig
> > > >> @@ -356,14 +356,14 @@ CONFIG_DRM_OMAP_CONNECTOR_HDMI=m
> > > >>  CONFIG_DRM_OMAP_CONNECTOR_ANALOG_TV=m
> > > >>  CONFIG_DRM_OMAP_PANEL_DPI=m
> > > >>  CONFIG_DRM_OMAP_PANEL_DSI_CM=m
> > > >> -CONFIG_DRM_OMAP_PANEL_SONY_ACX565AKM=m
> > > >> -CONFIG_DRM_OMAP_PANEL_LGPHILIPS_LB035Q02=m
> > > >> -CONFIG_DRM_OMAP_PANEL_SHARP_LS037V7DW01=m
> > > >> -CONFIG_DRM_OMAP_PANEL_TPO_TD028TTEC1=m
> > > >> -CONFIG_DRM_OMAP_PANEL_TPO_TD043MTEA1=m
> > > >> -CONFIG_DRM_OMAP_PANEL_NEC_NL8048HL11=m
> > > >>  CONFIG_DRM_TILCDC=m
> > > >>  CONFIG_DRM_PANEL_SIMPLE=m
> > > >> +CONFIG_DRM_PANEL_LG_LB035Q02=m
> > > >> +CONFIG_DRM_PANEL_NEC_NL8048HL11=m
> > > >> +CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
> > > >> +CONFIG_DRM_PANEL_SONY_ACX565AKM=m
> > > >> +CONFIG_DRM_PANEL_TPO_TD028TTEC1=m
> > > >> +CONFIG_DRM_PANEL_TPO_TD043MTEA1=m
> > > >>  CONFIG_FB=y
> > > >>  CONFIG_FIRMWARE_EDID=y
> > > >>  CONFIG_FB_MODE_HELPERS=y    
> > > > 
> > > > Sorry, I didn't remember to update these. Some additions:
> > > > 
> > > > These can be dropped, they no longer exist:
> > > > 
> > > > CONFIG_DRM_OMAP_ENCODER_TFP410=m
> > > > CONFIG_DRM_OMAP_CONNECTOR_DVI=m
> > > > CONFIG_DRM_OMAP_PANEL_DPI=m    
> > > 
> > > After being hit by the __always_inline issue [1] I am now
> > > back with being able to test v5.4-rc1.
> > > 
> > > Now this patch fixes the build problem, but we still have
> > > one: panel drivers are no longer automatically loaded at
> > > boot. We now need to manually modprobe them.
> > > 
> > > This has been observed with GTA04 (TD028TTEC1) and OpenPandora
> > > (TD043MTEA1). So moving the drivers seems to have changed/broken
> > > something with DT based driver matching.    
> > 
> > That's really weird, the driver name, the SPI device table and the OF
> > device table are the same (except for the "omapdss," prefix that we
> > don't add anymore in omapdss-boot-init.c). Would you be able to
> > investigate what broke ?
> >   
> in earlier times:
> 
> root@gta04:/sys/bus/spi/devices/spi4.0# cat modalias 
> spi:tpo,td028ttec1
> 
> now in 5.4-rc1:
> root@gta04:/sys/bus/spi/devices/spi4.0# cat modalias 
> spi:td028ttec1
> 
> root@gta04:~# modinfo /lib/modules/5.4.0-rc1-letux+/kernel/drivers/gpu/drm/panel/panel-tpo-td028ttec1.ko 
> filename:       /lib/modules/5.4.0-rc1-letux+/kernel/drivers/gpu/drm/panel/panel-tpo-td028ttec1.ko
> license:        GPL
> description:    Toppoly TD028TTEC1 panel driver
> author:         H. Nikolaus Schaller <hns@goldelico.com>
> srcversion:     6B3E224BCD3D76253CF361C
> alias:          of:N*T*Ctoppoly,td028ttec1C*
> alias:          of:N*T*Ctoppoly,td028ttec1
> alias:          of:N*T*Ctpo,td028ttec1C*
> alias:          of:N*T*Ctpo,td028ttec1
> alias:          spi:toppoly,td028ttec1
> alias:          spi:tpo,td028ttec1
> depends:        drm
> intree:         Y
> name:           panel_tpo_td028ttec1
> vermagic:       5.4.0-rc1-letux+ SMP preempt mod_unload ARMv7 p2v8 
> 
> That alias is not in the list.
> 
some more research:
in former times
of_modalias_node() has stripped the omapdss prefix, result: modalias=spi:tpo,td028ttec1
now it strips the tpo prefix because there is no omapdss prefix anymore.

Regards,
Andreas
