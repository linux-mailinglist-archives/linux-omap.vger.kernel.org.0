Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD1111D40E
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 18:33:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730176AbfLLRdS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 12:33:18 -0500
Received: from muru.com ([72.249.23.125]:46536 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730023AbfLLRdR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 12 Dec 2019 12:33:17 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7FB7C80C0;
        Thu, 12 Dec 2019 17:33:56 +0000 (UTC)
Date:   Thu, 12 Dec 2019 09:33:14 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Jyri Sarha <jsarha@ti.com>
Cc:     dri-devel@lists.freedesktop.org, bcousson@baylibre.com,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com,
        peter.ujfalusi@ti.com, bparrot@ti.com
Subject: Re: [PATCH v2] ARM: dts: am335x-evm: Use drm simple-panel instead of
 tilcdc-panel
Message-ID: <20191212173314.GC35479@atomide.com>
References: <20191203091119.3352-1-jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203091119.3352-1-jsarha@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Jyri Sarha <jsarha@ti.com> [191203 01:12]:
> Move to use the new drm panel support in tilcdc together with added
> "tfc,s9700rtwv43tr-01b"-panel support in drm panel-simple.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> "tfc,s9700rtwv43tr-01b" in panel-simple has been in for some time now
> so it is about time to get this in too.

Thanks applying into omap-for-v5.6/dt.

Tony
