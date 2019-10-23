Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2888EE2516
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 23:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406297AbfJWVTw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 17:19:52 -0400
Received: from muru.com ([72.249.23.125]:39598 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404502AbfJWVTw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 23 Oct 2019 17:19:52 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8D41080CF;
        Wed, 23 Oct 2019 21:20:26 +0000 (UTC)
Date:   Wed, 23 Oct 2019 14:19:48 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Olof Johansson <olof@lixom.net>
Cc:     soc@kernel.org, arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/2] omap2plus_defconfig changes for v5.5
Message-ID: <20191023211948.GS5610@atomide.com>
References: <pull-1571853258-16998@atomide.com>
 <20191023202247.wb2jzwvek7u5korx@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023202247.wb2jzwvek7u5korx@localhost>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Olof Johansson <olof@lixom.net> [191023 20:28]:
> On Wed, Oct 23, 2019 at 10:54:48AM -0700, Tony Lindgren wrote:
> > From: "Tony Lindgren" <tony@atomide.com>
> > 
> > The following changes since commit 96d49bbfe6c1a6bb43ccd00fb87aca100e32e5e2:
> > 
> >   ARM: omap2plus_defconfig: Fix selected panels after generic panel changes (2019-10-03 09:44:40 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/defconfig-signed
> > 
> > for you to fetch changes up to ec2b31267263cd7d5a7567d315f839796c2a8c87:
> > 
> >   configs: omap2plus: Enable VIDEO_MT9P031 module (2019-10-22 09:11:03 -0700)
> > 
> > ----------------------------------------------------------------
> > Defconfig changes for omap2plus_defconfig for v5.5
> > 
> > A series of changes from Adam Ford to update for removed and moved items,
> > and then enable crypto devices and MT9P031 video as loadable modules.
> > 
> > Looks like I missed unifying the subject line for one commit, but I did
> > not want to mess with the commit after pushing it out.
> > 
> > ----------------------------------------------------------------
> > Adam Ford (4):
> >       ARM: omap2plus_defconfig: Update for removed items
> >       ARM: omap2plus_defconfig: Update for moved item
> >       ARM: omap2plus_defconfig: Enable HW Crypto engine modules
> >       configs: omap2plus: Enable VIDEO_MT9P031 module
> 
> Looks like this branch had a minor conflict with one of your fixes branches.
> Easy to patch up, but feel free to use your fixes as a base for the topics if
> needed.

Oh sorry, I thought I did that. But sounds like I also had
some additional merge resolve in my for-next.

Thanks,

Tony
