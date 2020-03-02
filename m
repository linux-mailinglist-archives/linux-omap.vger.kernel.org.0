Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32343175DC5
	for <lists+linux-omap@lfdr.de>; Mon,  2 Mar 2020 16:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgCBPBm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Mar 2020 10:01:42 -0500
Received: from muru.com ([72.249.23.125]:58448 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726997AbgCBPBm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 2 Mar 2020 10:01:42 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 664C6809F;
        Mon,  2 Mar 2020 15:02:25 +0000 (UTC)
Date:   Mon, 2 Mar 2020 07:01:37 -0800
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
Message-ID: <20200302150137.GP37466@atomide.com>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-2-tony@atomide.com>
 <20200224233111.gkctx27usfxj2wgz@earth.universe>
 <20200224234333.GD37466@atomide.com>
 <20200227174424.GI37466@atomide.com>
 <8b27dba3-2e2b-84ce-0927-685f4bfe3ab2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b27dba3-2e2b-84ce-0927-685f4bfe3ab2@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200302 10:29]:
> On 27/02/2020 19:44, Tony Lindgren wrote:
> 
> > > > FWIW, I dropped omapdss-boot-init.c in my patch series updating DSI
> > > > code to use common panel infrastructure, so this will conflict.
> > > 
> > > Hey that's great :) Sounds like we can set up an immutable branch
> > > for just this $subject patch against v5.6-rc1 to resolve the
> > > conflict. I can set it up for Tomi or Tomi can set it up for me,
> > > whichever Tomi prefers.
> > 
> > Do you want me to send you a pull request for just this one patch
> > against v5.6-rc1?
> 
> It's probably easier if Sebastian drops the removal patch, and instead
> creates a patch that removes the panel-dsi-cm from
> omapdss_of_fixups_whitelist. That change should not conflict, and
> effectively makes the omapdss-boot-init.c a no-op.
> 
> We can then remove the file later.

OK for resolving the merge commit that works too.

Tomi, so do you care to ack the $subject patch though so I can set
up an immutable branch for us for the $subject patch?

Or Tomi, do you want to set up an immutable branch for me for the
$subject patch?

Regards,

Tony

