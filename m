Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455921C3E15
	for <lists+linux-omap@lfdr.de>; Mon,  4 May 2020 17:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729565AbgEDPGx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 4 May 2020 11:06:53 -0400
Received: from muru.com ([72.249.23.125]:52752 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729562AbgEDPGx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 4 May 2020 11:06:53 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6A9F78030;
        Mon,  4 May 2020 15:07:41 +0000 (UTC)
Date:   Mon, 4 May 2020 08:06:49 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: OMAP36 AES and SHA addresses and hwmods
Message-ID: <20200504150649.GI37466@atomide.com>
References: <CAHCN7xKe6DbNtjWzvXWFO4KMkvmmyaDDFnDWuMOKXi7B5CwJvA@mail.gmail.com>
 <7b4ffe96-7d97-81c1-629f-af56018b84ae@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b4ffe96-7d97-81c1-629f-af56018b84ae@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [200504 06:29]:
> On 03/05/2020 18:48, Adam Ford wrote:
> > According to the dm3730 reference manual, there are supposed to be two
> > AES and SHA engines, but the addresses of their IP doesn't appear in
> > the reference manual.
> > 
> > The AM35xx has references to two memory locations for each:
> > 
> >     AES1 shows it's at 0x480A 6000
> >     AES2 shows is 0x480C 5000 (matches omap3630 entry)
> > 
> >     SHA1MD5 2 shows it's at 480c 3000 (matches omap3630 entry)
> >     SHA2MD5 shows it's at 0x480A 4000
> > 
> > Is it reasonable to think the other IP block addresses for the
> > am3630/dm3730 would match the am35xx?
> > 
> > Currently in the OMAP3630, there are hwmods setup for AES and SHA
> > engines, but the rng uses the newer approach with ti,sysc and
> > sysc-omap2.
> > 
> > I tried to just copy the existing blocks to the other addresses, but I
> > got some errors. I assume it's due to hwmods.  It seems like we should
> > be able to convert the hwmods out, and add the additional addresses
> > for the omap36, but before I go too far, I want to know if it'll even
> > be possible.
> 
> All omap3 family should share identical address space for these IPs.

For configuring the accelerators, the dts entries needed should be
very similar to the other SoCs. AFAIK, there are no "ti,sysc-omap4"
compatible devices for omap3 though, and they should be configured
as "ti,sysc-omap2". I could be wrong though, but this can be seen
from the module revision register.

For omap3, you need to specify both "fck" and "ick" for the ti-sysc
config. Not sure what's up with the multiple addresses or instance,
it's best to check what works.

Regards,

Tony
