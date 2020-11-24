Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2832C2D17
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 17:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390077AbgKXQiw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 11:38:52 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:39688 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390518AbgKXQiw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 11:38:52 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id B3D0020020;
        Tue, 24 Nov 2020 17:38:49 +0100 (CET)
Date:   Tue, 24 Nov 2020 17:38:48 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
        Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v4 55/80] drm/panel: panel-dsi-cm: use
 MIPI_DCS_GET_ERROR_COUNT_ON_DSI
Message-ID: <20201124163848.GA51881@ravnborg.org>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-56-tomi.valkeinen@ti.com>
 <20201124161836.GA50534@ravnborg.org>
 <d8453eda-6d8b-23be-103e-6f4f07e1346e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8453eda-6d8b-23be-103e-6f4f07e1346e@ti.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=sozttTNsAAAA:8 a=7gkXJVJtAAAA:8
        a=YxeggU3nrjKIOG3EjS0A:9 a=CjuIK1q_8ugA:10 a=aeg5Gbbo78KNqacMgKqU:22
        a=E9Po1WZjFZOl8hwRPBS3:22
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi

On Tue, Nov 24, 2020 at 06:26:47PM +0200, Tomi Valkeinen wrote:
> Hi Sam,
> 
> On 24/11/2020 18:18, Sam Ravnborg wrote:
> > Hi Tomi,
> > 
> > On Tue, Nov 24, 2020 at 02:45:13PM +0200, Tomi Valkeinen wrote:
> >> Use the common MIPI_DCS_GET_ERROR_COUNT_ON_DSI define instead of
> >> driver's own.
> >>
> > They are both 5 - OK
> > 
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > IMO you should get all the patches at least up including this patch applied.
> > They are all reviewed/acked. And then you have a much smaller stack of
> > patches to spam us with.
> 
> Yes, I think that makes sense. I did not want to merge them earlier, as with the v3, I could not get
> videomode panels work at all (while cmd mode panels did work). So I was not sure if something is
> totally silly and broken in the series.
> 
> Now that I can get video mode panels work with some hacks on top, I'm fine with merging these.
> 
> But it's too late for 5.11, as we need testing and work on the video mode panels. So targeting 5.12.
Obviously your call, but I see no reason to wait for working videomode
panles if what you have now do not introduce any (known) regressions.

ofc I assume videomode panels is something new and not something that worked
before.

	Sam
