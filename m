Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 424CB311BF3
	for <lists+linux-omap@lfdr.de>; Sat,  6 Feb 2021 08:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbhBFHYI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 6 Feb 2021 02:24:08 -0500
Received: from muru.com ([72.249.23.125]:57962 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229745AbhBFHYH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 6 Feb 2021 02:24:07 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 23EE180AA;
        Sat,  6 Feb 2021 07:23:39 +0000 (UTC)
Date:   Sat, 6 Feb 2021 09:23:23 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     "Ivan J." <parazyd@dyne.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] ARM: omap2plus_defconfig: Update for dropped options.
Message-ID: <YB5D6zYcU6GES7WY@atomide.com>
References: <20210203113426.18964-1-parazyd@dyne.org>
 <20210203113426.18964-2-parazyd@dyne.org>
 <YBuankYwwMsG4MN9@atomide.com>
 <4b32f566-92ad-3c49-0453-b44df23f1384@ti.com>
 <20210205131736.3jivrc5lln4t2onr@fq>
 <YB1Ib41trny2JFDv@atomide.com>
 <8ab86ccf-7568-c173-75f6-0d572fd43fec@ti.com>
 <YB1aS4Tn76hKM5NC@atomide.com>
 <8daa6fce-bfad-ea28-e8dd-f3083bf43b01@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8daa6fce-bfad-ea28-e8dd-f3083bf43b01@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210205 15:04]:
> On 05/02/2021 16:46, Tony Lindgren wrote:
> > That will potentially break things too as the configs now expect
> > it to be selected :) Looks like that got changed with commit
> > f0791b92d2b6 ("net: ks8851: Select PHYLIB and MICREL_PHY in
> > Kconfig").
> 
> Yah. It's really has to be "depends on".

Yeah that's almost always better than select for sure.

> > So why can't we do similar patches to select MICREL_PHY for
> > the other non-ks8851 configurations in drivers/net/ethernet
> > Kconfig files as needed?
> 
> because there is no dependency between Ethernet controller (CPSW) and
> Ethernet PHY - any MII capable PHY can be used with CPSW.

OK thanks for the info.

Regards,

Tony
