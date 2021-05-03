Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D47E5371521
	for <lists+linux-omap@lfdr.de>; Mon,  3 May 2021 14:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233541AbhECMSz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 May 2021 08:18:55 -0400
Received: from muru.com ([72.249.23.125]:51150 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229594AbhECMSy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 3 May 2021 08:18:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 302F8809F;
        Mon,  3 May 2021 12:18:02 +0000 (UTC)
Date:   Mon, 3 May 2021 15:17:57 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv2] drm/omap: Fix issue with clocks left on after resume
Message-ID: <YI/p9Trr5tphov6q@atomide.com>
References: <20210428092500.23521-1-tony@atomide.com>
 <YIlsy4mOkLcbMKwr@pendragon.ideasonboard.com>
 <YIo6CzsU4JRvAdpb@atomide.com>
 <79bea9b8-b2d2-11ec-87a3-34626347e122@ideasonboard.com>
 <YI/UXqQbvdtC2HqI@atomide.com>
 <YI/bdLkwtUNFKHyW@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YI/bdLkwtUNFKHyW@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [210503 11:16]:
> ..the use of pm_runtime_put_sync() like you suggested. I did a quick
> test with the minimal change below and that works :) Seems like that's
> probably the best minimal fix for the -rc cycle.

Sorry I was mistaken, the patch below won't help for the omapdrm
PM runtime state on suspend.

I had patch "bus: ti-sysc: Fix am335x resume hang for usb otg module"
applied, and that changes ti-sysc to get rid of the PM runtime calls
during system suspend. The side effect is ti-sysc now ignores the module
PM runtime state on suspend. This is pretty much what _od_suspend_noirq()
was also doing.

I think we still fix the dispc related issue too, otherwise the parent
child_count will just keep increasing on each suspend. I check that
again though.

Regards,


Tony


> 8< ----------------
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -664,7 +664,7 @@ void dispc_runtime_put(struct dispc_device *dispc)
>  
>  	DSSDBG("dispc_runtime_put\n");
>  
> -	r = pm_runtime_put_sync(&dispc->pdev->dev);
> +	r = pm_runtime_put(&dispc->pdev->dev);
>  	WARN_ON(r < 0 && r != -ENOSYS);
>  }
>  
