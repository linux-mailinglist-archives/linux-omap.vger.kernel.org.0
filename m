Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E6F46FB38
	for <lists+linux-omap@lfdr.de>; Fri, 10 Dec 2021 08:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237418AbhLJHX6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Dec 2021 02:23:58 -0500
Received: from muru.com ([72.249.23.125]:36770 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237181AbhLJHX6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Dec 2021 02:23:58 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 73CCE806C;
        Fri, 10 Dec 2021 07:21:04 +0000 (UTC)
Date:   Fri, 10 Dec 2021 09:20:21 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Dev Null <devnull@uvos.xyz>,
        Andreas Kemnade <andreas@kemnade.info>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Nitin Gupta <nigupta@nvidia.com>
Subject: Re: Nokia N900 not hitting OFF mode since 5.9 is caused by proactive
 memory compaction
Message-ID: <YbL/teuB7qtGhtfL@atomide.com>
References: <99e25c92-3d2d-0964-0068-651bf44cbf8a@wizzup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99e25c92-3d2d-0964-0068-651bf44cbf8a@wizzup.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Merlijn Wajer <merlijn@wizzup.org> [211210 00:34]:
> Hi,
> 
> I've spent the day bisecting what exact commit prevented the Nokia N900
> from entering the OFF sleep state (between v5.8 and v5.9), and it this
> commit:
> 
> > # first bad commit: [facdaa917c4d5a376d09d25865f5a863f906234a] mm: proactive compaction
> 
> The git tree prior to that commit can idle at about ~27mW in OFF mode,
> and it will often remain in that mode for prolonged amounts of time
> (easily 30 seconds, depending on running userspace). Which the above
> commit applied, the Nokia N900 almost never hits OFF mode any more. This
> would suggest at least to disable CONFIG_COMPACTION, perhaps in
> omap2plus_defconfig? I suspect this might cause idle problems beyond the
> Nokia N900, too.

Nice find, adding Nitin to Cc as well. Nitin, can we somehow avoid the
timers for CONFIG_COMPACTION on an idle system to prevent waking up the
system unnecessarily?

Not sure if sysctl -w vm.compaction_proactiveness=0 is enough to disable
compaction for idle, maybe also the HPAGE_FRAG_CHECK_INTERVAL_MSEC = 500
at ms also causes extra wake-ups?

Regards,

Tony

> Maybe nothing needs to be done here other than disable the config option
> -- but I wanted to share this in case others are trying to figure out
> what happened to their battery life. :-)
> 
> There seem be more power regressions since then (at least on 5.15 there
> is more blocking proper idle), so I'll try to find those as well, but if
> this commit is reverted (or CONFIG_COMPACTION=n is in .config - probably
> easier) on top of v5.9 the system seems to idle fine.
> 
> > # grep ^core_pwrdm /sys/kernel/debug/pm_debug/count | cut -d',' -f2,
> > OFF:16,RET:2
> 
> Hope this helps someone...
> 
> Regards,
> Merlijn
> 
> PS: v5.10 seems to use another 19mW if panel_sony_acx565akm is loaded
> even when display is not active (maybe it doesn't suspend or something?
> - could be fixed later, just noticed it for v5.10). I load it initially
> to idle the display, but until I rmmod the modules, the module uses
> quite a bit more power. This problem is not present in v5.9, so that is
> another thing to chase down I guess... And then v5.15 uses another 12mW
> more, for not yet uncovered reasons)
