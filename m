Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4E11F4166
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jun 2020 18:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731061AbgFIQwk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Jun 2020 12:52:40 -0400
Received: from muru.com ([72.249.23.125]:57404 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729988AbgFIQwk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 9 Jun 2020 12:52:40 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id DA2BC8088;
        Tue,  9 Jun 2020 16:53:28 +0000 (UTC)
Date:   Tue, 9 Jun 2020 09:52:34 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-omap@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>,
        Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Roger Quadros <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/5] drm/omap: Fix suspend resume regression after
 platform data removal
Message-ID: <20200609165234.GM37466@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
 <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
 <20200603140639.GG37466@atomide.com>
 <47e286dd-f87a-4440-5bde-1f7b53e8b672@ti.com>
 <20200609151943.GL37466@atomide.com>
 <9ed70121-2a53-d2b3-051a-88eb83e6c53f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ed70121-2a53-d2b3-051a-88eb83e6c53f@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200609 15:27]:
> On 09/06/2020 18:19, Tony Lindgren wrote:
> > Currently I'm only able to rmmod -f omapdrm, not sure if these issues might
> > be related.
> 
> Hmm, I always use modules, and can unload omapdrm and drm fine. But there's
> a sequence that must be followed. However, the sequence starts with
> unloading omapdrm... What behavior you see with rmmod?

Hmm maybe it's output specific somehow?

I just tried again with the following with v5.7. I see the omapdrm
usage count issue happen at least on duovero, but don't seem to
currently get /dev/fb0 initialized on x15 with these:

modprobe omapdrm
#modprobe connector_hdmi	# up to v5.6
modprobe display-connector	# starting with v5.7-rc1
modprobe ti-tpd12s015		# beagle-x15
modprobe omapdss

# rmmod omapdrm
rmmod: ERROR: Module omapdrm is in use

# lsmod | grep omapdrm
omapdrm                65536  1
omapdss_base           16384  2 omapdrm,omapdss
drm_kms_helper        155648  3 omapdss_base,omapdrm,omapdss
drm                   372736  7 ti_tpd12s015,omapdss_base,display_connector,omapdrm,omapdss,drm_kms_helper

On beagle-x15 I see these errors after modprobe:

DSS: OMAP DSS rev 6.1
omapdss_dss 58000000.dss: bound 58001000.dispc (ops dispc_component_ops [omapdss])
omapdss_dss 58000000.dss: bound 58040000.encoder (ops hdmi5_component_ops [omapdss])
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
omapdrm omapdrm.0: [drm] Cannot find any crtc or sizes
[drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0 on minor 0
omapdrm omapdrm.0: [drm] Cannot find any crtc or sizes
aic_dvdd_fixed: disabling
ldousb: disabling

Maybe I'm missing some related module on x15?

Regards,

Tony
