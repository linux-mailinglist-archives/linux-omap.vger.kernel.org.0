Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF2D7CFC45
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 16:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbfJHOV4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 10:21:56 -0400
Received: from muru.com ([72.249.23.125]:35970 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbfJHOV4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Oct 2019 10:21:56 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 915D88081;
        Tue,  8 Oct 2019 14:22:29 +0000 (UTC)
Date:   Tue, 8 Oct 2019 07:21:53 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>, linux-omap@vger.kernel.org
Subject: Re: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
Message-ID: <20191008142153.GD5610@atomide.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-8-tomi.valkeinen@ti.com>
 <20191008141335.GB5610@atomide.com>
 <ffb498fb-5041-d3e9-2702-879f3d389adf@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffb498fb-5041-d3e9-2702-879f3d389adf@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [191008 14:17]:
> On 08/10/2019 17:13, Tony Lindgren wrote:
> > * Tomi Valkeinen <tomi.valkeinen@ti.com> [190930 10:38]:
> > > If use_mclk is false, mclk_mode is written to a register without
> > > initialization. This doesn't cause any ill effects as the written value
> > > is not used when use_mclk is false.
> > > 
> > > To fix this, write use_mclk only when use_mclk is true.
> > 
> > Hey nice catch. Based on a quick test looks like this fixes an
> > issue where power consumption stays higher after using HDMI.
> > 
> > Would be nice to have merged in the v5.4-rc series:
> > 
> > Tested-by: Tony Lindgren <tony@atomide.com>
> 
> Really? Ok, well, then it was a good random find =).

Yeah so it seems :) Earlier I thought there's still some
clkctrl setting wrong after using HDMI, but did not see
anything diffing the clkctrl registers before and after
and gave up.

> I did already push this to drm-misc-next, as I thought it does not have any
> real effect. I'll check if it's ok to push to drm-misc-fixes too, with Cc
> stable.

OK great thanks.

Tony
