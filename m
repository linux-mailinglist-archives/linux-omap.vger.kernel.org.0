Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09D75A6981
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 15:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbfICNQg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 09:16:36 -0400
Received: from muru.com ([72.249.23.125]:59552 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729090AbfICNQg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Sep 2019 09:16:36 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AA52280CF;
        Tue,  3 Sep 2019 13:17:05 +0000 (UTC)
Date:   Tue, 3 Sep 2019 06:16:32 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCHv3 01/10] dt-bindings: omap: add new binding for PRM
 instances
Message-ID: <20190903131632.GL52127@atomide.com>
References: <20190830121816.30034-1-t-kristo@ti.com>
 <20190830121816.30034-2-t-kristo@ti.com>
 <20190902042631.GA22055@bogus>
 <e8d700cd-8f3c-5cea-a022-b20a595fc1e1@ti.com>
 <CAL_Jsq+AJj1bgOQYG=c86A5HC_g2UZph387oVEKZyP4M18kURw@mail.gmail.com>
 <7c2c8a4d-d24e-ceec-afc1-04cdc4d5d952@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c2c8a4d-d24e-ceec-afc1-04cdc4d5d952@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [190903 08:15]:
> On 03/09/2019 11:10, Rob Herring wrote:
> > I prefer that bindings be complete as possible even if driver support
> > is not there yet. Adding power domain support may only mean adding
> > '#power-domain-cells'.
> > 
> > The location is fine then.
> 
> Yeah, I assume just adding power-domain-cells should be enough. I am not too
> sure before I start trying this out though so did not want to add it yet.

Should we call the device tree node name power-controller instead of
reset controller though? Most of the PRM instances do not have a
separate rstctrl reset control functionality.

Anybody got better any better naming in mind?

Regards,

Tony


