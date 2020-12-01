Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286032CA047
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 11:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgLAKsf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 05:48:35 -0500
Received: from muru.com ([72.249.23.125]:49694 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbgLAKsf (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Dec 2020 05:48:35 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 56A5D80A9;
        Tue,  1 Dec 2020 10:48:01 +0000 (UTC)
Date:   Tue, 1 Dec 2020 12:47:50 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Sekhar Nori <nsekhar@ti.com>, hns@goldelico.com
Subject: Re: [PATCH v4 57/80] ARM: dts: omap5: add address-cells & size-cells
 to dsi
Message-ID: <20201201104750.GY26857@atomide.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-58-tomi.valkeinen@ti.com>
 <20201130095358.GI4141@pendragon.ideasonboard.com>
 <90a6fc14-78c5-f2c8-edb7-65fccde5fae8@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90a6fc14-78c5-f2c8-edb7-65fccde5fae8@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [201201 10:39]:
> On 30/11/2020 11:53, Laurent Pinchart wrote:
> > Hi Tomi,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Nov 24, 2020 at 02:45:15PM +0200, Tomi Valkeinen wrote:
> >> Add address-cells & size-cells to DSI nodes so that board files do not
> >> need to define them.
> > 
> > How about adding ports too, while at it ?
> 
> We don't have ports for other encoders either. I'm not sure if adding ports helps or not, but I
> think it makes sense to add them consistently to all encoders on all boards if we want to go that way.
> 
> > It would also be nice to convert the DT bindings to YAML :-)
> 
> I agree, but not as part of this already 81 patch series. =)

Please feel free to merge this via the dss tree:

Acked-by: Tony Lindgren <tony@atomide.com>
