Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E4236E44D
	for <lists+linux-omap@lfdr.de>; Thu, 29 Apr 2021 06:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhD2Eqx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Apr 2021 00:46:53 -0400
Received: from muru.com ([72.249.23.125]:49742 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229792AbhD2Eqx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 29 Apr 2021 00:46:53 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id EEC9B80AA;
        Thu, 29 Apr 2021 04:46:06 +0000 (UTC)
Date:   Thu, 29 Apr 2021 07:46:03 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv2] drm/omap: Fix issue with clocks left on after resume
Message-ID: <YIo6CzsU4JRvAdpb@atomide.com>
References: <20210428092500.23521-1-tony@atomide.com>
 <YIlsy4mOkLcbMKwr@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIlsy4mOkLcbMKwr@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Laurent Pinchart <laurent.pinchart@ideasonboard.com> [210428 14:10]:
> Based on my experience on the camera and display side with devices that
> are made of multiple components, suspend and resume are best handled in
> a controlled way by the top-level driver. Otherwise you end up having
> different components suspending and resuming in random orders, and
> that's a recipe for failure.

Manually suspending and resuming the components should be doable based
on the registered components. However, I'm not sure it buys much in
this case since we do have Linux driver module take care of things for
us for most part :)

The dss hardware is really a private interconnect with a control module,
and a collection of various mostly independent display output device
modules.

We also have the interconnect target module to deal with for each
module, and have the interconnect hierachy mapped in the devicetree.
So we already have Linux driver module take care of the device
hierarchy.

Because the child components are mostly independent, it should not
matter in which order they suspend and resume related to each other.

I think the remaining issue is how dispc should provide services to
the other components.

If dispc needs to be enabled to provide services to the other modules,
maybe there's some better Linux generic framework dispc could implement?
That is other than PM runtime calls for routing the signals to the
output modules? Then PM runtime can be handled private to the dispc
module.

Decoupling the system suspend and resume from PM runtime calls for
all the other dss components should still also be done IMO. But that
can be done as a separate clean-up patches after we have fixed the
$subject issue.

> Can we get the omapdrm suspend/resume to run first/last, and
> stop/restart the whole device from there ?

This is already the case since commit ecfdedd7da5d ("drm/omap: force
runtime PM suspend on system suspend"). We have omap_drv use
SIMPLE_DEV_PM_OPS, and the components use SET_LATE_SYSTEM_SLEEP_PM_OPS.
So omap_drv suspends first and resumes last. The order should not
matter for other components. Well that is as long as we can deal
with dispc providing resources.

I think we really should also change omap_drv use prepare/complete ops,
and have the components use standard SIMPLE_DEV_PM_OPS. That still
won't help with PM runtime related issues for system suspend and
resume though, but leaves out the need for late pm ops.

Regards,

Tony
