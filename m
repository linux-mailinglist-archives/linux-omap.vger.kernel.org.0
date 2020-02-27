Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26050172570
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 18:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730369AbgB0Ro3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Feb 2020 12:44:29 -0500
Received: from muru.com ([72.249.23.125]:58102 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730541AbgB0Ro3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 27 Feb 2020 12:44:29 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3677B80C0;
        Thu, 27 Feb 2020 17:45:12 +0000 (UTC)
Date:   Thu, 27 Feb 2020 09:44:24 -0800
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
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 1/3] drm/omap: Prepare DSS for probing without legacy
 platform data
Message-ID: <20200227174424.GI37466@atomide.com>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-2-tony@atomide.com>
 <20200224233111.gkctx27usfxj2wgz@earth.universe>
 <20200224234333.GD37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224234333.GD37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tomi,

* Tony Lindgren <tony@atomide.com> [200224 23:44]:
> * Sebastian Reichel <sre@kernel.org> [200224 23:32]:
> > Hi,
> > 
> > On Mon, Feb 24, 2020 at 11:12:28AM -0800, Tony Lindgren wrote:
> > > In order to probe display subsystem (DSS) components with ti-sysc
> > > interconnect target module without legacy platform data and using
> > > devicetree, we need to update dss probing a bit.
> > > 
> > > In the device tree, we will be defining the data also for the interconnect
> > > target modules as DSS really is a private interconnect. There is some
> > > information about that in 4460 TRM in "Figure 10-3. DSS Integration" for
> > > example where it mentions "32-bit interconnect (SLX)".
> > > 
> > > The changes we need to make are:
> > > 
> > > 1. Parse also device tree subnodes for the compatible property fixup
> > > 
> > > 2. Update the component code to consider device tree subnodes
> > > 
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: Jyri Sarha <jsarha@ti.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > ---
> > > 
> > > This is needed for dropping DSS platform data that I'll be posting
> > > seprately. If this looks OK, can you guys please test and ack?
> > > 
> > > ---
> > 
> > Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > 
> > FWIW, I dropped omapdss-boot-init.c in my patch series updating DSI
> > code to use common panel infrastructure, so this will conflict.
> 
> Hey that's great :) Sounds like we can set up an immutable branch
> for just this $subject patch against v5.6-rc1 to resolve the
> conflict. I can set it up for Tomi or Tomi can set it up for me,
> whichever Tomi prefers.

Do you want me to send you a pull request for just this one patch
against v5.6-rc1?

Regards,

Tony
