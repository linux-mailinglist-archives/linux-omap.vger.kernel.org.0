Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E825331913E
	for <lists+linux-omap@lfdr.de>; Thu, 11 Feb 2021 18:40:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbhBKRii (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 11 Feb 2021 12:38:38 -0500
Received: from muru.com ([72.249.23.125]:60450 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232400AbhBKRge (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 11 Feb 2021 12:36:34 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 54A06804D;
        Thu, 11 Feb 2021 17:36:06 +0000 (UTC)
Date:   Thu, 11 Feb 2021 19:35:44 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, hns@goldelico.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v4 24/80] drm/omap: dsi: move TE GPIO handling into core
Message-ID: <YCVq8JnuMLQq6FEc@atomide.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-25-tomi.valkeinen@ti.com>
 <YCF7ARchcMKvWa4s@atomide.com>
 <5b469566-c926-7e1f-8872-84774b96f389@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b469566-c926-7e1f-8872-84774b96f389@ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210211 07:35]:
> On 08/02/2021 19:55, Tony Lindgren wrote:
> > Hi,
> > 
> > * Tomi Valkeinen <tomi.valkeinen@ti.com> [201124 12:47]:
> >> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> >>
> >> In preparation for removing custom DSS calls from the DSI
> >> panel driver, this moves support for external tearing event
> >> GPIOs into the DSI host driver. This way tearing events are
> >> always handled in the core resulting in simplification of
> >> the panel drivers.
> >>
> >> The TE GPIO acquisition follows works in the same way as the
> >> exynos DSI implementation.
> > 
> > Looks like this patch causes the following warnings:
> > 
> > DSI: omapdss DSI error: Failed to receive BTA
> > DSI: omapdss DSI error: bta sync failed
> > DSI: omapdss DSI error: vc(0) busy when trying to config for VP
> > DSI: omapdss DSI error: Failed to receive BTA
> > DSI: omapdss DSI error: bta sync failed
> > DSI: omapdss DSI error: vc(0) busy when trying to config for VP
> > DSI: omapdss DSI error: Failed to receive BTA
> > DSI: omapdss DSI error: bta sync failed
> > DSI: omapdss DSI error: vc(0) busy when trying to config for VP
> > ...
> > 
> > Any ideas? The display works for me despite the constant
> > warnings.
> 
> Which board is that? Do the errors start right from the boot, or only
> after running something in userspace?

This is with droid4, that's about the only device I use with a display
on regular basis. I'm pretty sure some earlier version of Sebastian's
patches worked fine.

Regards,

Tony
