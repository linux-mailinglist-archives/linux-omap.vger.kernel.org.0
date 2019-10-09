Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 269A6D179F
	for <lists+linux-omap@lfdr.de>; Wed,  9 Oct 2019 20:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730955AbfJISjP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Oct 2019 14:39:15 -0400
Received: from muru.com ([72.249.23.125]:36316 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730490AbfJISjP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Oct 2019 14:39:15 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7CAEC8140;
        Wed,  9 Oct 2019 18:39:48 +0000 (UTC)
Date:   Wed, 9 Oct 2019 11:39:11 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Cc:     Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        ssantosh@kernel.org, s-anna@ti.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de
Subject: Re: [PATCHv8 0/9] soc: ti: add OMAP PRM driver (for reset)
Message-ID: <20191009183911.GN5610@atomide.com>
References: <20191008125544.20679-1-t-kristo@ti.com>
 <20191008140002.GY5610@atomide.com>
 <5e10f95c-7ec9-d3a7-6862-f6f07a9c1495@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e10f95c-7ec9-d3a7-6862-f6f07a9c1495@oracle.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* santosh.shilimkar@oracle.com <santosh.shilimkar@oracle.com> [191009 09:02]:
> On 10/8/19 7:00 AM, Tony Lindgren wrote:
> > * Tero Kristo <t-kristo@ti.com> [191008 05:56]:
> > > Hi,
> > > 
> > > Hopefully this is the final revision of the series. Just a repost of v7
> > > with the single comment from Philipp fixed, and added reviewed by tags
> > > from him for couple of the patches.
> > 
> > Santosh, when applying these, can you please provide me an immutable
> > branch maybe against v5.4-rc1 that I can use as the base for the related
> > dts changes?
> > 
> > For the whole series where not already done, please feel free to add:
> > 
> > Reviewed-by: Tony Lindgren <tony@atomide.com>
> > 
> Pushed a branch out with series and your reviewed-by tag. I have tagged
> it yet in case Peter's soc patches get ready.
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git
> for_5.5/driver-soc

Great, thanks!

Tony
