Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4205CCBFCB
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 17:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390053AbfJDPya (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 11:54:30 -0400
Received: from muru.com ([72.249.23.125]:35364 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390011AbfJDPya (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Oct 2019 11:54:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3F26980BF;
        Fri,  4 Oct 2019 15:55:02 +0000 (UTC)
Date:   Fri, 4 Oct 2019 08:54:26 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] ARM: omap2plus_defconfig: Fix selected panels after
 generic panel changes
Message-ID: <20191004155426.GM5610@atomide.com>
References: <20191003165539.50318-1-tony@atomide.com>
 <03ca02c1-2816-17cd-03fd-5b72e5d0ec96@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03ca02c1-2816-17cd-03fd-5b72e5d0ec96@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [191004 08:42]:
> On 03/10/2019 19:55, Tony Lindgren wrote:
> > The old omapdrm panels got removed for v5.4 in favor of generic panels,
> > and the Kconfig options changed. Let's update omap2plus_defconfig
> > accordingly so the same panels are still enabled.
> > 
> > Cc: Jyri Sarha <jsarha@ti.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >   arch/arm/configs/omap2plus_defconfig | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> > --- a/arch/arm/configs/omap2plus_defconfig
> > +++ b/arch/arm/configs/omap2plus_defconfig
> > @@ -356,14 +356,14 @@ CONFIG_DRM_OMAP_CONNECTOR_HDMI=m
> >   CONFIG_DRM_OMAP_CONNECTOR_ANALOG_TV=m
> >   CONFIG_DRM_OMAP_PANEL_DPI=m
> >   CONFIG_DRM_OMAP_PANEL_DSI_CM=m
> > -CONFIG_DRM_OMAP_PANEL_SONY_ACX565AKM=m
> > -CONFIG_DRM_OMAP_PANEL_LGPHILIPS_LB035Q02=m
> > -CONFIG_DRM_OMAP_PANEL_SHARP_LS037V7DW01=m
> > -CONFIG_DRM_OMAP_PANEL_TPO_TD028TTEC1=m
> > -CONFIG_DRM_OMAP_PANEL_TPO_TD043MTEA1=m
> > -CONFIG_DRM_OMAP_PANEL_NEC_NL8048HL11=m
> >   CONFIG_DRM_TILCDC=m
> >   CONFIG_DRM_PANEL_SIMPLE=m
> > +CONFIG_DRM_PANEL_LG_LB035Q02=m
> > +CONFIG_DRM_PANEL_NEC_NL8048HL11=m
> > +CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
> > +CONFIG_DRM_PANEL_SONY_ACX565AKM=m
> > +CONFIG_DRM_PANEL_TPO_TD028TTEC1=m
> > +CONFIG_DRM_PANEL_TPO_TD043MTEA1=m
> >   CONFIG_FB=y
> >   CONFIG_FIRMWARE_EDID=y
> >   CONFIG_FB_MODE_HELPERS=y
> 
> Sorry, I didn't remember to update these. Some additions:
> 
> These can be dropped, they no longer exist:
> 
> CONFIG_DRM_OMAP_ENCODER_TFP410=m
> CONFIG_DRM_OMAP_CONNECTOR_DVI=m
> CONFIG_DRM_OMAP_PANEL_DPI=m
> 
> This can be added to get the DVI output working on many of the boards:
> 
> CONFIG_DRM_TI_TFP410=m

We have patches already posted for these by Adam and me so we
should be good to go with just $subject patch missing now.

Regards,

Tony
