Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0425371417
	for <lists+linux-omap@lfdr.de>; Mon,  3 May 2021 13:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbhECLRB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 May 2021 07:17:01 -0400
Received: from muru.com ([72.249.23.125]:51126 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229811AbhECLRA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 3 May 2021 07:17:00 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C4DC2809F;
        Mon,  3 May 2021 11:16:08 +0000 (UTC)
Date:   Mon, 3 May 2021 14:16:04 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv2] drm/omap: Fix issue with clocks left on after resume
Message-ID: <YI/bdLkwtUNFKHyW@atomide.com>
References: <20210428092500.23521-1-tony@atomide.com>
 <YIlsy4mOkLcbMKwr@pendragon.ideasonboard.com>
 <YIo6CzsU4JRvAdpb@atomide.com>
 <79bea9b8-b2d2-11ec-87a3-34626347e122@ideasonboard.com>
 <YI/UXqQbvdtC2HqI@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YI/UXqQbvdtC2HqI@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Tony Lindgren <tony@atomide.com> [210503 10:45]:
> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210503 08:04]:
> > On 29/04/2021 07:46, Tony Lindgren wrote:
> > > Decoupling the system suspend and resume from PM runtime calls for
> > > all the other dss components should still also be done IMO. But that
> > > can be done as a separate clean-up patches after we have fixed the
> > > $subject issue.
> > 
> > I don't think I still really understand why all this is needed. I mean,
> > obviously things don't work correctly at the moment, so maybe this patch can
> > be applied to fix the system suspend. But it just feels like a big hack (the
> > current pm_runtime_force_suspend/resume work-around feels like a big hack
> > too).
> 
> Well omapdrm is not handling the -EBUSY error during system resume.

Or rather something on the resume path is not handling and cannot handle
-EBUSY. And sounds like the reason is..

> > Slightly off topic, but I just noticed that we're using runtime_put_sync for
> > some reason. Found 0eaf9f52e94f756147dbfe1faf1f77a02378dbf9. I've been
> > fighting with system suspend for a long time =).
> > 
> > I wonder if using non-sync version would remove the EBUSY problem...
> 
> Worth trying, but it will only help if the -EBUSY error from
> pm_runtime_put() is handled somewhere for a retry..

..the use of pm_runtime_put_sync() like you suggested. I did a quick
test with the minimal change below and that works :) Seems like that's
probably the best minimal fix for the -rc cycle.

Regards,

Tony

8< ----------------
diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -664,7 +664,7 @@ void dispc_runtime_put(struct dispc_device *dispc)
 
 	DSSDBG("dispc_runtime_put\n");
 
-	r = pm_runtime_put_sync(&dispc->pdev->dev);
+	r = pm_runtime_put(&dispc->pdev->dev);
 	WARN_ON(r < 0 && r != -ENOSYS);
 }
 
