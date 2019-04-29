Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60835DD4B
	for <lists+linux-omap@lfdr.de>; Mon, 29 Apr 2019 09:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfD2H7J (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Apr 2019 03:59:09 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:60272 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727478AbfD2H7J (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Apr 2019 03:59:09 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C72AB25B6F0;
        Mon, 29 Apr 2019 17:59:06 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CA2AB940376; Mon, 29 Apr 2019 09:59:04 +0200 (CEST)
Date:   Mon, 29 Apr 2019 09:59:04 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Olof Johansson <olof@lixom.net>
Cc:     Tony Lindgren <tony@atomide.com>, arm@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [GIT PULL] defconfig refresh for multi_v7_defconfig for v5.1
Message-ID: <20190429075904.a4qhqkhn4argt6b2@verge.net.au>
References: <pull-1555425463-418342@atomide.com>
 <20190429061714.3qcj72efkblqhjw3@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429061714.3qcj72efkblqhjw3@localhost>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Apr 28, 2019 at 11:17:14PM -0700, Olof Johansson wrote:
> On Tue, Apr 16, 2019 at 09:13:37AM -0700, Tony Lindgren wrote:
> > From: "Tony Lindgren" <tony@atomide.com>
> > 
> > The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> > 
> >   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/multi-v7-defconfig-for-v5.2-signed
> > 
> > for you to fetch changes up to 35f8e2e29e74bb7197419d7cd80df5584e2a6311:
> > 
> >   ARM: multi_v7_defconfig: Update for moved options (2019-04-16 07:05:07 -0700)
> > 
> > ----------------------------------------------------------------
> > Update multi_v7_defconfig for dropped and moved options
> > 
> > This series of two patches first updates multi_v7_defconfig for
> > dropped options, and then updates it for moved options. We want to
> > do this on regular basis to make it easier to patch multi_v7_defconfig
> > without introducing errors and merge conflicts. We update the defconfig
> > in two patches to make sure we're not accidentally losing any needed
> > options.
> > 
> > After this, updating multi_v7_defconfig will become trivial, and most
> > likely only a small follow-up patches are needed after the merge window
> > to update it again for moved options.
> 
> Merged, thanks.
> 
> 
> 
> -Olof
> 
