Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C05A3D2CA1
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 16:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbfJJOfZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 10:35:25 -0400
Received: from muru.com ([72.249.23.125]:36948 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726034AbfJJOfZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Oct 2019 10:35:25 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8AE6880BB;
        Thu, 10 Oct 2019 14:35:58 +0000 (UTC)
Date:   Thu, 10 Oct 2019 07:35:21 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, s-anna@ti.com
Subject: Re: [PATCHv3 00/10] clk: ti: remoteproc / iommu support patches
Message-ID: <20191010143521.GX5610@atomide.com>
References: <20190912132613.28093-1-t-kristo@ti.com>
 <ef764d1c-8ebc-4b64-4543-7b296327e197@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef764d1c-8ebc-4b64-4543-7b296327e197@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191010 08:34]:
> On 12/09/2019 16:26, Tero Kristo wrote:
> > Hi,
> > 
> > V3 of this series sort of reverted back to pretty much V1 which expects
> > strict sequencing of events from the bus driver. This one doesn't have
> > any dependency towards the reset driver either, and the controversial
> > reset handling APIs have been removed.
> > 
> > -Tero
> 
> Stephen, any comments on this one or shall I just craft a pull-request for
> this and rest of the TI clock driver changes towards 5.5? There seems to be
> a pile of them coming this time over...

Sounds like we need an immutable branch for the clkctrl related
changes against v5.4-rc1 that I can also merge into omap-for-v5.5/prm
branch in addition to the immutable prm reset driver branch.

Otherwise I can't apply any of the consumer device related dts
changes into that branch AFAIK.

Regards,

Tony
