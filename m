Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4252CD4514
	for <lists+linux-omap@lfdr.de>; Fri, 11 Oct 2019 18:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbfJKQKM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Oct 2019 12:10:12 -0400
Received: from muru.com ([72.249.23.125]:37092 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726666AbfJKQKM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Oct 2019 12:10:12 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1EE8D80EA;
        Fri, 11 Oct 2019 16:10:45 +0000 (UTC)
Date:   Fri, 11 Oct 2019 09:10:08 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>, linux-omap@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
Message-ID: <20191011161008.GY5610@atomide.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-8-tomi.valkeinen@ti.com>
 <20191008141335.GB5610@atomide.com>
 <ffb498fb-5041-d3e9-2702-879f3d389adf@ti.com>
 <20191008142153.GD5610@atomide.com>
 <59381248-5ded-7ea9-40a6-cbfb58a3c5b1@ti.com>
 <20191010132407.GS5610@atomide.com>
 <d7cb0f2a-1645-29ff-aaf2-2ec5188dbc24@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7cb0f2a-1645-29ff-aaf2-2ec5188dbc24@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [191011 10:25]:
> On 10/10/2019 16:24, Tony Lindgren wrote:
> 
> > Hmm so what register does this clock actually change?
> > 
> > I'm seeing an increase of few tens of extra mW, which means at
> > least one day of standby time less for me :) It does not happen
> > always, maybe half of the time.
> 
> I have no idea why this would affect power consumption. As far as I can
> understand, the bits written here are a clk divider MCLK. I don't see why
> that would affect.

Yeah you're right, and I just got lucky initially.

I have seen the power consumption stay higher already with
the patch applied. The clocks seem just fine.

> Maybe Jyri or Peter has an idea, I have never looked at the HDMI audio side.

I'll try dumping out the hdmi registers before and after
when I get a chance.

Regards,

Tony
