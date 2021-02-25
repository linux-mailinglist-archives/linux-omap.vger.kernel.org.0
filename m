Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66BFD324FE9
	for <lists+linux-omap@lfdr.de>; Thu, 25 Feb 2021 13:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232144AbhBYMiP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Feb 2021 07:38:15 -0500
Received: from muru.com ([72.249.23.125]:37194 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231833AbhBYMiO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Feb 2021 07:38:14 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 37C2E807A;
        Thu, 25 Feb 2021 12:38:05 +0000 (UTC)
Date:   Thu, 25 Feb 2021 14:37:30 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Colin King <colin.king@canonical.com>,
        Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: gpmc: fix out of bounds read and dereference on
 gpmc_cs[]
Message-ID: <YDeaCk5zoAfgEuF6@atomide.com>
References: <20210223193821.17232-1-colin.king@canonical.com>
 <20210224075552.GS2087@kadam>
 <20210224081104.rw6amjl6p5so5cq7@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210224081104.rw6amjl6p5so5cq7@kozik-lap>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Krzysztof Kozlowski <krzk@kernel.org> [210224 08:11]:
> On Wed, Feb 24, 2021 at 10:55:52AM +0300, Dan Carpenter wrote:
> > On Tue, Feb 23, 2021 at 07:38:21PM +0000, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > Currently the array gpmc_cs is indexed by cs before it cs is range checked
> > > and the pointer read from this out-of-index read is dereferenced. Fix this
> > > by performing the range check on cs before the read and the following
> > > pointer dereference.
> > > 
> > > Addresses-Coverity: ("Negative array index read")
> > > Fixes: 186401937927 ("memory: gpmc: Move omap gpmc code to live under drivers")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > ---
> > >  drivers/memory/omap-gpmc.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> > > index cfa730cfd145..f80c2ea39ca4 100644
> > > --- a/drivers/memory/omap-gpmc.c
> > > +++ b/drivers/memory/omap-gpmc.c
> > > @@ -1009,8 +1009,8 @@ EXPORT_SYMBOL(gpmc_cs_request);
> > >  
> > >  void gpmc_cs_free(int cs)
> > >  {
> > > -	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
> > > -	struct resource *res = &gpmc->mem;
> > 
> > There is no actual dereferencing going on here, it just taking the
> > addresses.  But the patch is also harmless and improves readability.
> 
> Hm, in the second line indeed the compiler will just calculate the
> offset of "mem" field against the "gpmc_cs+cs" and return it's probable
> address.
> 
> To me still the code is a little bit non-obvious or obfuscated - first
> you play with the array[index] and then you check the validity of index.

To me it seems the fixes tag is not ideal.. Seems this issue was there
earlier too before moving the code. In any case:

Reviewed-by: Tony Lindgren <tony@atomide.com>
