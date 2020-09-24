Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1E2276A0C
	for <lists+linux-omap@lfdr.de>; Thu, 24 Sep 2020 09:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgIXHFz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Sep 2020 03:05:55 -0400
Received: from muru.com ([72.249.23.125]:45362 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726902AbgIXHFz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 24 Sep 2020 03:05:55 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id E2A078027;
        Thu, 24 Sep 2020 07:05:56 +0000 (UTC)
Date:   Thu, 24 Sep 2020 10:05:50 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     khilman@kernel.org, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Subject: Re: [PATCH v2] omap3: enable off mode automatically
Message-ID: <20200924070550.GG9471@atomide.com>
References: <20200911161209.25149-1-andreas@kemnade.info>
 <20200924090047.2b61f883@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924090047.2b61f883@aktux>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [200924 07:00]:
> On Fri, 11 Sep 2020 18:12:09 +0200
> Andreas Kemnade <andreas@kemnade.info> wrote:
> 
> > Enabling off mode was only reachable deeply hidden
> > in the debugfs. As powersaving is an important feature,
> > move the option out of its shady place.
> > The debugfs file can still be used to override the default.
> > 
> > Use the presence of a device compatible to ti,twl4030-idle or
> > ti,twl4030-idle-osc-off as an indicator that the board is wired correctly
> > for off mode.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> > An earlier version of this patch was here:
> > https://patchwork.kernel.org/patch/10794121/
> > 
> > A config option was used instead of the suggested devicetree check.
> > 
> > Changes in v2:
> > - fix compile without CONFIG_ARCH_OMAP3
> >   The variable enable_off_mode is now always a real one and not
> >   a preprocessor constant to avoid trouble with unusual configurations.
> > 
> Anything I still missed here? 

No the missing part is just me picking up the remaining patches
for v5.10 that I'll hopefully manage to do today :)

Regards,

Tony
