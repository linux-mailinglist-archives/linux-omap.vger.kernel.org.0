Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40C214FDD63
	for <lists+linux-omap@lfdr.de>; Tue, 12 Apr 2022 13:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237802AbiDLLJV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Apr 2022 07:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242390AbiDLLCM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Apr 2022 07:02:12 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E112B32D;
        Tue, 12 Apr 2022 02:53:47 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D85868061;
        Tue, 12 Apr 2022 09:51:13 +0000 (UTC)
Date:   Tue, 12 Apr 2022 12:53:45 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc:     Merlijn Wajer <merlijn@wizzup.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Dev Null <devnull@uvos.xyz>,
        Andreas Kemnade <andreas@kemnade.info>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Nitin Gupta <nigupta@nvidia.com>,
        Charan Teja Reddy <charante@codeaurora.org>
Subject: Re: Nokia N900 not hitting OFF mode since 5.9 is caused by proactive
 memory compaction
Message-ID: <YlVMKb04CWSvgZ/1@atomide.com>
References: <99e25c92-3d2d-0964-0068-651bf44cbf8a@wizzup.org>
 <YbL/teuB7qtGhtfL@atomide.com>
 <a6682d1c-acab-72d3-bbe6-62e6d40a4832@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6682d1c-acab-72d3-bbe6-62e6d40a4832@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com> [220103 14:45]:
> Hi,
> 
> On 10.12.21 г. 9:20 ч., Tony Lindgren wrote:
> > Hi,
> > 
> > * Merlijn Wajer <merlijn@wizzup.org> [211210 00:34]:
> > > Hi,
> > > 
> > > I've spent the day bisecting what exact commit prevented the Nokia N900
> > > from entering the OFF sleep state (between v5.8 and v5.9), and it this
> > > commit:
> > > 
> > > > # first bad commit: [facdaa917c4d5a376d09d25865f5a863f906234a] mm: proactive compaction
> > > 
> > > The git tree prior to that commit can idle at about ~27mW in OFF mode,
> > > and it will often remain in that mode for prolonged amounts of time
> > > (easily 30 seconds, depending on running userspace). Which the above
> > > commit applied, the Nokia N900 almost never hits OFF mode any more. This
> > > would suggest at least to disable CONFIG_COMPACTION, perhaps in
> > > omap2plus_defconfig? I suspect this might cause idle problems beyond the
> > > Nokia N900, too.
> > 
> > Nice find, adding Nitin to Cc as well. Nitin, can we somehow avoid the
> > timers for CONFIG_COMPACTION on an idle system to prevent waking up the
> > system unnecessarily?
> > 
> > Not sure if sysctl -w vm.compaction_proactiveness=0 is enough to disable
> > compaction for idle, maybe also the HPAGE_FRAG_CHECK_INTERVAL_MSEC = 500
> > at ms also causes extra wake-ups?
> > 
> 
> This doesn't seem to affect Nokia N900 only, waking-up twice a second will
> have negative effect on power usage of every device this runs on. Could we
> have some discussion on how to avoid that?

Just following up on this as I had it tagged in my inbox.

There's kernel commit 65d759c8f9f5 ("mm: compaction: support triggering of
proactive compaction by user") that should fix this issue.

It seems to require the the following to disable compaction:

# echo 0 > /proc/sys/vm/compaction_proactiveness

Merlijn, care to check if this fixes the issue you're seeing? Or are threre
possibly other bugs too preventing n900 from properly idling?

Regards,

Tony
