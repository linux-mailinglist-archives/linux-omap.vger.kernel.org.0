Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB9110B310
	for <lists+linux-omap@lfdr.de>; Wed, 27 Nov 2019 17:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfK0QTM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Nov 2019 11:19:12 -0500
Received: from muru.com ([72.249.23.125]:43734 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbfK0QTM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 27 Nov 2019 11:19:12 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B136F8102;
        Wed, 27 Nov 2019 16:19:50 +0000 (UTC)
Date:   Wed, 27 Nov 2019 08:19:09 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     deffo@gmx.de
Cc:     linux-omap@vger.kernel.org
Subject: Re: twl: not initialized and twl6030_uv_to_vsel problems
Message-ID: <20191127161909.GA35479@atomide.com>
References: <trinity-3f97833c-0914-4f86-8e16-2bfb4ad6dab3-1574862737086@3c-app-gmx-bs22>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-3f97833c-0914-4f86-8e16-2bfb4ad6dab3-1574862737086@3c-app-gmx-bs22>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* deffo@gmx.de <deffo@gmx.de> [191127 13:53]:
> hi there!
> 
> i'm using the TI OMAP4460 (VAR-SOM-OM44) and i get several errors in dmesg on the latest for-next branch:
> 
> root@localhost:~# dmesg -l err
> [    1.146026] twl: not initialized
> [    1.146087] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
> [    1.146087] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
> [    1.146179] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
> [    1.146209] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
> [    1.146270] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
> [    1.146301] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1375000 Vs max 1316660
> [    1.146331] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for 1410000 Vs max 1316660
> [    1.522979] omap_dm_timer_set_source: timer_sys_ck not found

Sounds like something needs fixing for sure. Similar messages seem to
appear for all omap4 with twl PMIC.

> which probably leads to the problem, that the cpu cannot run with more than 920 mhz. is this a known problem?

Yes, see the drivers/cpufreq changes recently done for omap3:

$ git log v5.4..3fbeef397212046cc514fe9fcd07e67e6ca32163 drivers/cpufreq

Similar changes are also needed for omap4 to detect the supported rates.

And then we also need to add a regulator controller driver for cpufreq
to use that manages the voltage controller.

> i need to run the cpus with 1.5 ghz, as it was possible with the v3.4 kernel, how is this possible?

My guess is that v3.4 was missing some critical checks to protect
the SoC :) But please do check, maybe we're missing some code that
was there earlier.

Regards,

Tony
