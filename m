Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0841100F3D
	for <lists+linux-omap@lfdr.de>; Tue, 19 Nov 2019 00:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfKRXFj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 18:05:39 -0500
Received: from muru.com ([72.249.23.125]:42828 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726795AbfKRXFj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Nov 2019 18:05:39 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5F45580BF;
        Mon, 18 Nov 2019 23:06:15 +0000 (UTC)
Date:   Mon, 18 Nov 2019 15:05:35 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com
Subject: Re: [RFCv1 33/42] drm/omap: dsi: use atomic helper for dirtyfb
Message-ID: <20191118230535.GG35479@atomide.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-34-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191117024028.2233-34-sebastian.reichel@collabora.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Reichel <sebastian.reichel@collabora.com> [191117 07:11]:
> We can simply use the atomic helper for
> handling the dirtyfb callback.
...
> --- a/drivers/gpu/drm/omapdrm/omap_crtc.c
> +++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
> -void omap_crtc_flush(struct drm_crtc *crtc)
> +static void omap_crtc_flush(struct drm_crtc *crtc)
>  {
>  	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
> -	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
> -
> -	if (!omap_state->manually_updated)
> -		return;
>  
>  	if (!delayed_work_pending(&omap_crtc->update_work))
>  		schedule_delayed_work(&omap_crtc->update_work, 0);

It would be nice if omap_crtc_flush() would become just some generic
void function with no need to pass it a crtc. I guess for that it
should know what panels are in manual command mode to refresh them.

The reason I'm bringing this up is because it looks like we need
to also flush DSI command mode panels from omap_gem_op_finish()
for gles and the gem code probably should not need to know anything
about crtc, right?

Or maybe there is some better place to call it?

Regards,

Tony
