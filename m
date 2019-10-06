Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0916CD257
	for <lists+linux-omap@lfdr.de>; Sun,  6 Oct 2019 16:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfJFOx7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 6 Oct 2019 10:53:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47394 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfJFOx7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 6 Oct 2019 10:53:59 -0400
Received: from pendragon.ideasonboard.com (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E517DD;
        Sun,  6 Oct 2019 16:53:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570373636;
        bh=QDEA/8/x+1vTbsqf8DyjUh6f+BfP1E7QR04AKqspjjc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HZTmMLta2NyaurObBzy9hmysL2BaGuBN8DapUYbSEdZA8RRd7t3WhX/ivMtzWNRKs
         v+c38ZqqQwh7zfhsvqx+Lj1wY5aAzUWh/HAFjquKyg4y7T2XTDf7r/tMoLOkNHJ+VW
         cRQ46tPkZDH6CqKBPrrVWUXBNV6y1igkUnm+yGpU=
Date:   Sun, 6 Oct 2019 17:53:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Jyri Sarha <jsarha@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [PATCH] ARM: omap2plus_defconfig: Fix selected panels after
 generic panel changes
Message-ID: <20191006145348.GD4740@pendragon.ideasonboard.com>
References: <20191003165539.50318-1-tony@atomide.com>
 <03ca02c1-2816-17cd-03fd-5b72e5d0ec96@ti.com>
 <39E48EC6-65FE-419B-BBE8-E72CB44B517D@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <39E48EC6-65FE-419B-BBE8-E72CB44B517D@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus,

On Sat, Oct 05, 2019 at 12:50:37PM +0200, H. Nikolaus Schaller wrote:
> > Am 04.10.2019 um 10:41 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
> > 
> > On 03/10/2019 19:55, Tony Lindgren wrote:
> >> The old omapdrm panels got removed for v5.4 in favor of generic panels,
> >> and the Kconfig options changed. Let's update omap2plus_defconfig
> >> accordingly so the same panels are still enabled.
> >> Cc: Jyri Sarha <jsarha@ti.com>
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> >> Signed-off-by: Tony Lindgren <tony@atomide.com>
> >> ---
> >>  arch/arm/configs/omap2plus_defconfig | 12 ++++++------
> >>  1 file changed, 6 insertions(+), 6 deletions(-)
> >> diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> >> --- a/arch/arm/configs/omap2plus_defconfig
> >> +++ b/arch/arm/configs/omap2plus_defconfig
> >> @@ -356,14 +356,14 @@ CONFIG_DRM_OMAP_CONNECTOR_HDMI=m
> >>  CONFIG_DRM_OMAP_CONNECTOR_ANALOG_TV=m
> >>  CONFIG_DRM_OMAP_PANEL_DPI=m
> >>  CONFIG_DRM_OMAP_PANEL_DSI_CM=m
> >> -CONFIG_DRM_OMAP_PANEL_SONY_ACX565AKM=m
> >> -CONFIG_DRM_OMAP_PANEL_LGPHILIPS_LB035Q02=m
> >> -CONFIG_DRM_OMAP_PANEL_SHARP_LS037V7DW01=m
> >> -CONFIG_DRM_OMAP_PANEL_TPO_TD028TTEC1=m
> >> -CONFIG_DRM_OMAP_PANEL_TPO_TD043MTEA1=m
> >> -CONFIG_DRM_OMAP_PANEL_NEC_NL8048HL11=m
> >>  CONFIG_DRM_TILCDC=m
> >>  CONFIG_DRM_PANEL_SIMPLE=m
> >> +CONFIG_DRM_PANEL_LG_LB035Q02=m
> >> +CONFIG_DRM_PANEL_NEC_NL8048HL11=m
> >> +CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
> >> +CONFIG_DRM_PANEL_SONY_ACX565AKM=m
> >> +CONFIG_DRM_PANEL_TPO_TD028TTEC1=m
> >> +CONFIG_DRM_PANEL_TPO_TD043MTEA1=m
> >>  CONFIG_FB=y
> >>  CONFIG_FIRMWARE_EDID=y
> >>  CONFIG_FB_MODE_HELPERS=y
> > 
> > Sorry, I didn't remember to update these. Some additions:
> > 
> > These can be dropped, they no longer exist:
> > 
> > CONFIG_DRM_OMAP_ENCODER_TFP410=m
> > CONFIG_DRM_OMAP_CONNECTOR_DVI=m
> > CONFIG_DRM_OMAP_PANEL_DPI=m
> 
> After being hit by the __always_inline issue [1] I am now
> back with being able to test v5.4-rc1.
> 
> Now this patch fixes the build problem, but we still have
> one: panel drivers are no longer automatically loaded at
> boot. We now need to manually modprobe them.
> 
> This has been observed with GTA04 (TD028TTEC1) and OpenPandora
> (TD043MTEA1). So moving the drivers seems to have changed/broken
> something with DT based driver matching.

That's really weird, the driver name, the SPI device table and the OF
device table are the same (except for the "omapdss," prefix that we
don't add anymore in omapdss-boot-init.c). Would you be able to
investigate what broke ?

> [1]: https://lkml.org/lkml/2019/10/2/201

-- 
Regards,

Laurent Pinchart
