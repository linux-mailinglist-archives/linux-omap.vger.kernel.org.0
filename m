Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF061ED1AE
	for <lists+linux-omap@lfdr.de>; Wed,  3 Jun 2020 16:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgFCOGo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 3 Jun 2020 10:06:44 -0400
Received: from muru.com ([72.249.23.125]:56886 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbgFCOGn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 3 Jun 2020 10:06:43 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B20A1809C;
        Wed,  3 Jun 2020 14:07:32 +0000 (UTC)
Date:   Wed, 3 Jun 2020 07:06:39 -0700
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
Message-ID: <20200603140639.GG37466@atomide.com>
References: <20200531193941.13179-1-tony@atomide.com>
 <20200531193941.13179-2-tony@atomide.com>
 <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16ba1808-5c7f-573d-8dd0-c80cac2f476e@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200603 12:34]:
> Hi Tony,
> 
> On 31/05/2020 22:39, Tony Lindgren wrote:
> > When booting without legacy platform data, we no longer have omap_device
> > calling PM runtime suspend for us on suspend. This causes the driver
> > context not be saved as we have no suspend and resume functions defined.
> > 
> > Let's fix the issue by switching over to use UNIVERSAL_DEV_PM_OPS as it
> > will call the existing PM runtime suspend functions on suspend.
> 
> I don't think we can use UNIVERSAL_DEV_PM_OPS, as we can't disable DSS
> modules in any order, but things have to be shut down in orderly manner.

OK. I presume you talk about the order of dss child devices here.

> omapdrm hasn't relied on omap_device calling runtime suspend for us (I
> didn't know it does that). We have system suspend hooks in omap_drv.c:

We had omap_device sort of brute forcing things to idle on suspend
which only really works for interconnect target modules with one
device in them.

> SIMPLE_DEV_PM_OPS(omapdrm_pm_ops, omap_drm_suspend, omap_drm_resume)
> 
> omap_drm_suspend() is supposed to turn off the displays, which then cause
> dispc_runtime_put (and other runtime_puts) to be called, which result in
> dispc_runtime_suspend (and other runtime PM suspends).

OK thanks for explaining, I missed that part.

> So... For some reason that's no longer happening? I need to try to find a
> board with which suspend/resume works (without DSS)...

Yes it seems something has changed. When diffing the dmesg debug output
on suspend and resume, context save and restore functions are no longer
called as the PM runtime suspend and resume functions are no longer
called on suspend and resume.

I'll drop this patch, and will be applying the rest of the series to
fixes if no objections.

Thanks,

Tony
