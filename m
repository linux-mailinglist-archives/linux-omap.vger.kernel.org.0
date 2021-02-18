Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F83431E639
	for <lists+linux-omap@lfdr.de>; Thu, 18 Feb 2021 07:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhBRGPP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Feb 2021 01:15:15 -0500
Received: from muru.com ([72.249.23.125]:34900 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231596AbhBRF6H (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 18 Feb 2021 00:58:07 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F2BC88061;
        Thu, 18 Feb 2021 05:57:37 +0000 (UTC)
Date:   Thu, 18 Feb 2021 07:57:09 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, hns@goldelico.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v4 24/80] drm/omap: dsi: move TE GPIO handling into core
Message-ID: <YC4Bte47SFKVgrqX@atomide.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-25-tomi.valkeinen@ti.com>
 <YCF7ARchcMKvWa4s@atomide.com>
 <5b469566-c926-7e1f-8872-84774b96f389@ideasonboard.com>
 <YCVq8JnuMLQq6FEc@atomide.com>
 <4432cf2c-fe15-dab0-3034-789f6d711396@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4432cf2c-fe15-dab0-3034-789f6d711396@ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210217 07:42]:
> On 11/02/2021 19:35, Tony Lindgren wrote:
> > * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210211 07:35]:
> >> On 08/02/2021 19:55, Tony Lindgren wrote:
> >>> Hi,
> >>>
> >>> * Tomi Valkeinen <tomi.valkeinen@ti.com> [201124 12:47]:
> >>>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> >>>>
> >>>> In preparation for removing custom DSS calls from the DSI
> >>>> panel driver, this moves support for external tearing event
> >>>> GPIOs into the DSI host driver. This way tearing events are
> >>>> always handled in the core resulting in simplification of
> >>>> the panel drivers.
> >>>>
> >>>> The TE GPIO acquisition follows works in the same way as the
> >>>> exynos DSI implementation.
> >>>
> >>> Looks like this patch causes the following warnings:
> >>>
> >>> DSI: omapdss DSI error: Failed to receive BTA
> >>> DSI: omapdss DSI error: bta sync failed
> >>> DSI: omapdss DSI error: vc(0) busy when trying to config for VP
> >>> DSI: omapdss DSI error: Failed to receive BTA
> >>> DSI: omapdss DSI error: bta sync failed
> >>> DSI: omapdss DSI error: vc(0) busy when trying to config for VP
> >>> DSI: omapdss DSI error: Failed to receive BTA
> >>> DSI: omapdss DSI error: bta sync failed
> >>> DSI: omapdss DSI error: vc(0) busy when trying to config for VP
> >>> ...
> >>>
> >>> Any ideas? The display works for me despite the constant
> >>> warnings.
> >>
> >> Which board is that? Do the errors start right from the boot, or only
> >> after running something in userspace?
> > 
> > This is with droid4, that's about the only device I use with a display
> > on regular basis. I'm pretty sure some earlier version of Sebastian's
> > patches worked fine.
> 
> OMAP4 SDP doesn't produce these errors and the HW looks rather
> identical. Although I noticed something odd there, running kmstest
> --flip on the first display works fine, but running on the second
> display gets a bit erratic fps. Which is a bit odd as everything should
> be identical.

Oh cool that you have those running again/still :) In this case there
is no te-gpios if that might make a difference.

> So these errors start from the boot? Or only when running something
> specific?

They start from the boot when modules are loaded.

> Is there a bootloader that initializes the display?

Yes it boots with kexec.

Regards,

Tony
