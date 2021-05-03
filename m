Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC363713BF
	for <lists+linux-omap@lfdr.de>; Mon,  3 May 2021 12:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233424AbhECKqr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 May 2021 06:46:47 -0400
Received: from muru.com ([72.249.23.125]:51104 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230246AbhECKqq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 3 May 2021 06:46:46 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9AC2C809F;
        Mon,  3 May 2021 10:45:54 +0000 (UTC)
Date:   Mon, 3 May 2021 13:45:50 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv2] drm/omap: Fix issue with clocks left on after resume
Message-ID: <YI/UXqQbvdtC2HqI@atomide.com>
References: <20210428092500.23521-1-tony@atomide.com>
 <YIlsy4mOkLcbMKwr@pendragon.ideasonboard.com>
 <YIo6CzsU4JRvAdpb@atomide.com>
 <79bea9b8-b2d2-11ec-87a3-34626347e122@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79bea9b8-b2d2-11ec-87a3-34626347e122@ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210503 08:04]:
> On 29/04/2021 07:46, Tony Lindgren wrote:
> > I think the remaining issue is how dispc should provide services to
> > the other components.
> > 
> > If dispc needs to be enabled to provide services to the other modules,
> > maybe there's some better Linux generic framework dispc could implement?
> > That is other than PM runtime calls for routing the signals to the
> > output modules? Then PM runtime can be handled private to the dispc
> > module.
> 
> What would be the difference? The dispc service would just call runtime get
> and put, like it does now, wouldn't it?

I was thinking that we could have dispc always enabled when services from
dispc have been requested. I'm not sure if we need to toggle dispc state,
having it set to SYSC_IDLE_SMART mode might be enough. And I think the
clocks are already on for dispc from the top level dss module if any of
the dss components are active. I could be wrong though as I don't know
enough about the dss hardware :)

> > Decoupling the system suspend and resume from PM runtime calls for
> > all the other dss components should still also be done IMO. But that
> > can be done as a separate clean-up patches after we have fixed the
> > $subject issue.
> 
> I don't think I still really understand why all this is needed. I mean,
> obviously things don't work correctly at the moment, so maybe this patch can
> be applied to fix the system suspend. But it just feels like a big hack (the
> current pm_runtime_force_suspend/resume work-around feels like a big hack
> too).

Well omapdrm is not handling the -EBUSY error during system resume.

> Why doesn't the suspend just work? Afaics, the runtime PM code in omapdrm is
> fine: the dependencies work nicely, things get runtime suspended and resumes
> correctly. And at system suspend, omapdrm will disable the whole display
> pipeline (including bridges, panels) in a controlled manner, which results
> in the appropriate runtime PM calls. I think this should just work. But it
> doesn't, because... runtime PM and system suspend don't quite work well
> together? Or something.

Right, PM runtime and system suspend should not be mixed together.

> So is it something that omapdrm is doing in a wrong way, or is the PM
> framework just messed up, and other drivers need to dance around the
> problems too?

I think we have omapdrm close to doing the right things. But trying to
use PM runtime for system suspend is like using a Rube Goldberg machine
to turn off the lights at night when you want to sleep :p

> > I think we really should also change omap_drv use prepare/complete ops,
> > and have the components use standard SIMPLE_DEV_PM_OPS. That still
> > won't help with PM runtime related issues for system suspend and
> > resume though, but leaves out the need for late pm ops.
> 
> Why do we need to do the above? What would omapdrm do in prepare & complete?
> Why would we use SIMPLE_DEV_PM_OPS for the dss subcomponents?

That would leave out the need to use late_pm_ops at all for the driver,
we should suspend a bit earlier, and resume a bit later.

> Slightly off topic, but I just noticed that we're using runtime_put_sync for
> some reason. Found 0eaf9f52e94f756147dbfe1faf1f77a02378dbf9. I've been
> fighting with system suspend for a long time =).
> 
> I wonder if using non-sync version would remove the EBUSY problem...

Worth trying, but it will only help if the -EBUSY error from
pm_runtime_put() is handled somewhere for a retry..

Regards,

Tony
