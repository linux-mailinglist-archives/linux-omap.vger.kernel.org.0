Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89EB836C475
	for <lists+linux-omap@lfdr.de>; Tue, 27 Apr 2021 12:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235547AbhD0Kzb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Apr 2021 06:55:31 -0400
Received: from muru.com ([72.249.23.125]:49128 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230341AbhD0Kza (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Apr 2021 06:55:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CDC0180EB;
        Tue, 27 Apr 2021 10:54:47 +0000 (UTC)
Date:   Tue, 27 Apr 2021 13:54:44 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] drm/omap: Fix issue with clocks left on after resume
Message-ID: <YIftdKeNHFzOw+aU@atomide.com>
References: <20210426141241.51985-1-tony@atomide.com>
 <0963c9fa-1b45-b742-ed9b-5c48d3a97987@ideasonboard.com>
 <YIfjlVaiGa2sz8qW@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIfjlVaiGa2sz8qW@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [210427 10:12]:
> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210427 08:47]:
> > If I understand right, this is only an issue when the dss was not enabled
> > before the system suspend? And as the dispc is not enabled at suspend,
> > pm_runtime_force_suspend and pm_runtime_force_resume don't really do
> > anything. At resume, the DRM resume functionality causes omapdrm to call
> > pm_runtime_get and put, and this somehow causes the dss to stay enabled.
> 
> We do have dss enabled at system suspend from omap_atomic_comit_tail()
> until pm_runtime_force_suspend(). Then we have pm_runtime_force_resume()
> enable it.

Sorry I already forgot that pm_runtime_force_resume() is not enabling
it because pm_runtime_need_not_resume().. It's the omapdrm calling
pm_runtime_get() that enables the hardware on resume.

> Then on resume PM runtime prevents disable of the hardware on resume path
> until after device_complete(). Until then we have rpm_suspend() return
> -EBUSY, and so the parent child_count is not going to get decreased.
> Something would have to handle the -EBUSY error here it seems.

Regards,

Tony
