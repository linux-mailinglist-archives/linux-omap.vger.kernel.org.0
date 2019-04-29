Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61811DE33
	for <lists+linux-omap@lfdr.de>; Mon, 29 Apr 2019 10:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbfD2Io3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Apr 2019 04:44:29 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34596 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbfD2Io3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Apr 2019 04:44:29 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 50EED25B775;
        Mon, 29 Apr 2019 18:44:27 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 46033940376; Mon, 29 Apr 2019 10:44:25 +0200 (CEST)
Date:   Mon, 29 Apr 2019 10:44:25 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Olof Johansson <olof@lixom.net>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>, arm@kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] defconfig refresh for multi_v7_defconfig for v5.1
Message-ID: <20190429084424.jadc7oa23qcrj4nx@verge.net.au>
References: <pull-1555425463-418342@atomide.com>
 <20190429061714.3qcj72efkblqhjw3@localhost>
 <20190429075904.a4qhqkhn4argt6b2@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429075904.a4qhqkhn4argt6b2@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Sorry, I accidently sent an empty response.
I have no idea how that happened, please ignore.

On Mon, Apr 29, 2019 at 09:59:04AM +0200, Simon Horman wrote:
> On Sun, Apr 28, 2019 at 11:17:14PM -0700, Olof Johansson wrote:
> > On Tue, Apr 16, 2019 at 09:13:37AM -0700, Tony Lindgren wrote:
> > > From: "Tony Lindgren" <tony@atomide.com>
> > > 
> > > The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> > > 
> > >   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/multi-v7-defconfig-for-v5.2-signed
> > > 
> > > for you to fetch changes up to 35f8e2e29e74bb7197419d7cd80df5584e2a6311:
> > > 
> > >   ARM: multi_v7_defconfig: Update for moved options (2019-04-16 07:05:07 -0700)
> > > 
> > > ----------------------------------------------------------------
> > > Update multi_v7_defconfig for dropped and moved options
> > > 
> > > This series of two patches first updates multi_v7_defconfig for
> > > dropped options, and then updates it for moved options. We want to
> > > do this on regular basis to make it easier to patch multi_v7_defconfig
> > > without introducing errors and merge conflicts. We update the defconfig
> > > in two patches to make sure we're not accidentally losing any needed
> > > options.
> > > 
> > > After this, updating multi_v7_defconfig will become trivial, and most
> > > likely only a small follow-up patches are needed after the merge window
> > > to update it again for moved options.
> > 
> > Merged, thanks.
> > 
> > 
> > 
> > -Olof
> > 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
