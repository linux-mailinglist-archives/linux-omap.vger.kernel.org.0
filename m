Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0008416B275
	for <lists+linux-omap@lfdr.de>; Mon, 24 Feb 2020 22:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgBXVaY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 16:30:24 -0500
Received: from muru.com ([72.249.23.125]:57350 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728167AbgBXVaT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 16:30:19 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 507D18030;
        Mon, 24 Feb 2020 21:31:04 +0000 (UTC)
Date:   Mon, 24 Feb 2020 13:30:16 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Keerthy <j-keerthy@ti.com>, Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 00/23] Drop platform data for omap DSS
Message-ID: <20200224213016.GC37466@atomide.com>
References: <20200224210959.56146-1-tony@atomide.com>
 <20200224212135.GB16163@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224212135.GB16163@pendragon.ideasonboard.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Laurent Pinchart <laurent.pinchart@ideasonboard.com> [200224 21:22]:
> Nice work !

Thanks :) Yeah it was a bit of a pain to do..

> Just for my information, do you plan to do something similar for OMAP3 ?

Yes. I think we should completely remove legacy platform data for
DSS like we did for SDMA. Maintaining multiple probe paths is going
to be just too much of a pain in the long run.

I'm estimating/hoping that updating omap2 and 3 DSS to probe
without platform data will be just as easy as doing dts changes.
So reasonably minimal effort, especially if this series works
for the other SoCs like it should.

Regards,

Tony


