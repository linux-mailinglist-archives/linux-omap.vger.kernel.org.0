Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B056177AF6
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 16:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgCCPt6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 10:49:58 -0500
Received: from muru.com ([72.249.23.125]:58594 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727683AbgCCPt6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Mar 2020 10:49:58 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7847080EE;
        Tue,  3 Mar 2020 15:50:41 +0000 (UTC)
Date:   Tue, 3 Mar 2020 07:49:53 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-omap@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] bus: ti-sysc: Implement display subsystem reset quirk
Message-ID: <20200303154953.GT37466@atomide.com>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-4-tony@atomide.com>
 <7d4af3b5-5dd7-76b3-4d3f-4698bfde288c@ti.com>
 <20200303151349.GQ37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303151349.GQ37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [200303 15:14]:
> * Tomi Valkeinen <tomi.valkeinen@ti.com> [200303 06:03]:
> > On 24/02/2020 21:12, Tony Lindgren wrote:
> > > +	if (sysc_soc->soc == SOC_3430) {
> > > +		/* Clear DSS_SDI_CONTROL */
> > > +		sysc_write(ddata, dispc_offset + 0x44, 0);
> > > +
> > > +		/* Clear DSS_PLL_CONTROL */
> > > +		sysc_write(ddata, dispc_offset + 0x48, 0);
> > 
> > These are not dispc registers, but dss registers.
> 
> Ouch. Thanks for catching this, will include in the fix.
> 
> > > +	}
> > > +
> > > +	/* Clear DSS_CONTROL to switch DSS clock sources to PRCM if not */
> > > +	sysc_write(ddata, dispc_offset + 0x40, 0);
> > 
> > Same here.

Below is a fix using dispc offset for dss registers.

Regards,

Tony

8< ----------------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Tue, 3 Mar 2020 07:17:43 -0800
Subject: [PATCH] bus: ti-sysc: Fix wrong offset for display subsystem
 reset quirk

Commit 7324a7a0d5e2 ("bus: ti-sysc: Implement display subsystem reset
quirk") added support for DSS reset, but is using dispc offset also for
DSS also registers as reported by Tomi Valkeinen <tomi.valkeinen@ti.com>.
Also, we're not using dispc_offset for dispc IRQSTATUS register so let's
fix that too.

Fixes: 7324a7a0d5e2 ("bus: ti-sysc: Implement display subsystem reset quirk")
Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1566,7 +1566,7 @@ static void sysc_pre_reset_quirk_dss(struct sysc *ddata)
 		return;
 
 	/* Clear IRQSTATUS */
-	sysc_write(ddata, 0x1000 + 0x18, irq_mask);
+	sysc_write(ddata, dispc_offset + 0x18, irq_mask);
 
 	/* Disable outputs */
 	val = sysc_quirk_dispc(ddata, dispc_offset, true);
@@ -1580,14 +1580,14 @@ static void sysc_pre_reset_quirk_dss(struct sysc *ddata)
 
 	if (sysc_soc->soc == SOC_3430) {
 		/* Clear DSS_SDI_CONTROL */
-		sysc_write(ddata, dispc_offset + 0x44, 0);
+		sysc_write(ddata, 0x44, 0);
 
 		/* Clear DSS_PLL_CONTROL */
-		sysc_write(ddata, dispc_offset + 0x48, 0);
+		sysc_write(ddata, 0x48, 0);
 	}
 
 	/* Clear DSS_CONTROL to switch DSS clock sources to PRCM if not */
-	sysc_write(ddata, dispc_offset + 0x40, 0);
+	sysc_write(ddata, 0x40, 0);
 }
 
 /* 1-wire needs module's internal clocks enabled for reset */
-- 
2.25.1
