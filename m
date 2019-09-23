Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3ED2BBAB3
	for <lists+linux-omap@lfdr.de>; Mon, 23 Sep 2019 19:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440152AbfIWRrN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 23 Sep 2019 13:47:13 -0400
Received: from muru.com ([72.249.23.125]:34280 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389763AbfIWRrN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 23 Sep 2019 13:47:13 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8F9E4809F;
        Mon, 23 Sep 2019 17:47:44 +0000 (UTC)
Date:   Mon, 23 Sep 2019 10:47:09 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     santosh.shilimkar@oracle.com
Cc:     Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        ssantosh@kernel.org, p.zabel@pengutronix.de, robh+dt@kernel.org,
        s-anna@ti.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCHv5 00/10] soc: ti: add OMAP PRM driver (for reset)
Message-ID: <20190923174709.GY5610@atomide.com>
References: <20190912113916.20093-1-t-kristo@ti.com>
 <20190920142849.GS5610@atomide.com>
 <13a77bd8-72bd-6a44-9141-d5492be82d82@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13a77bd8-72bd-6a44-9141-d5492be82d82@oracle.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* santosh.shilimkar@oracle.com <santosh.shilimkar@oracle.com> [190920 19:20]:
> On 9/20/19 7:28 AM, Tony Lindgren wrote:
> > * Tero Kristo <t-kristo@ti.com> [190912 04:39]:
> > > Hi,
> > > 
> > > V5 of the series, re-sent the whole series as one patch was dropped.
> > > Changes compared to v3/v4:
> > > 
> > > - removed dependency towards clock driver (patch #5 was completely
> > >    dropped compared to v3/v4)
> > > - dropped clocks property from dt binding
> > > - re-added the pdata patch which was accidentally dropped out (it has
> > >    dependency towards this series.)
> > > 
> > > The new implementation (without clock driver dependency) relies on the
> > > bus driver to sequence events properly, otherwise some timeouts will
> > > occur either at clock driver or reset driver end.
> > 
> > With the two updated patches seems like we're done with this
> > series?
> > 
> > If so, I suggest either Santosh or me sets up an immutable
> > branch against v5.3 or v5.4-rc1 that we all can merge in.
> > I will need it for the related dts changes at least.
> > 
> I will pick this up Tony and apply it once v5.4-rc1 is out.

OK thanks.

Tony
