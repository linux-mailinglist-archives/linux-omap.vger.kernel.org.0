Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CC22A890C
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 22:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731694AbgKEVcB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 16:32:01 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:35484 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729783AbgKEVcB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 16:32:01 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 184BC2006C;
        Thu,  5 Nov 2020 22:31:59 +0100 (CET)
Date:   Thu, 5 Nov 2020 22:31:57 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Tony Lindgren <tony@atomide.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
Message-ID: <20201105213157.GG216923@ravnborg.org>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105120333.947408-1-tomi.valkeinen@ti.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=OLL_FvSJAAAA:8 a=KN5_TdukHPppwH8LP0YA:9
        a=CjuIK1q_8ugA:10 a=3w7wjZy9XmMA:10 a=0Y2J-7ZVQZYA:10
        a=oIrB72frpwYPwTMnlWqB:22
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tomi

On Thu, Nov 05, 2020 at 02:02:37PM +0200, Tomi Valkeinen wrote:
> Hi,
> 
> This is third version of the series sent by Sebastian in February:
> 
> https://www.spinics.net/lists/linux-omap/msg153465.html
> 
> I took the patches from his git tree, and rebased on 5.10-rc2. There
> were some conflicts and compilation errors, and one bug that made dsi to
> not work (videomode variable was not initialized to 0).

I for one would be more than happy to see these patches go in.
I have looked at them before but was lost in all the conversions.
But the general impression is that the drivers are left in a much better
shape after the patch set. And the individual patches all looks good.

So I am all for getting the patches applied.
Perferably soonish so there is some time to fix any regressions that may
be reported.

	Sam

