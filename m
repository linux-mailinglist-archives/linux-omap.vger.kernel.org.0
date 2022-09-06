Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71A0D5AE168
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 09:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239016AbiIFHlh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 03:41:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238970AbiIFHlM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 03:41:12 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 452AD75399
        for <linux-omap@vger.kernel.org>; Tue,  6 Sep 2022 00:40:34 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 00AC680E1;
        Tue,  6 Sep 2022 07:32:57 +0000 (UTC)
Date:   Tue, 6 Sep 2022 10:40:32 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Unable to boot 6.0-rc3 on dra76
Message-ID: <Yxb5cD7kas+Hi695@atomide.com>
References: <abf4d275-b732-b1d5-35f0-40d78ef09962@ideasonboard.com>
 <Yw9MAKJyZlonv9b3@atomide.com>
 <7a0d68b0-0458-9c12-0e8a-cb0ed402700a@ideasonboard.com>
 <Yxbd3xbv2elWZ6/I@atomide.com>
 <79d045ca-38ac-7ad2-3944-e980f0cff0ed@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79d045ca-38ac-7ad2-3944-e980f0cff0ed@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Romain Naour <romain.naour@smile.fr> [220906 07:17]:
> Hello,
> 
> Le 06/09/2022 à 07:42, Tony Lindgren a écrit :
> > * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [220831 12:22]:
> >> On 31/08/2022 14:54, Tony Lindgren wrote:
> >>> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [220831 11:35]:
> >>>> Hi,
> >>>>
> >>>> I've been unable to boot 6.0-rc3 on dra76 evm with omap2plus_defconfig. I get no output from the kernel.
> >>>> Enabling earlyprintk gives me the following. Any ideas?
> >>>
> >>> This series of fixes for deferred probe in Linux next should help:
> >>>
> >>> https://lore.kernel.org/linux-kernel/20220819221616.2107893-1-saravanak@google.com/
> >>>
> >>> Hopefully it will get merged to the mainline kernel soonish.
> >>
> >> Thanks Tony! This solves the issue.
> > 
> > Looks like the deferred probe fixes are now merged in v6.0-rc4 FYI.
> 
> Just to let you know, I had the same boot issue with the kernel v6.0-rc2 and I
> reverted locally the series removing the driver_deferred_probe_check_state().
> 
> I'm using an AM5749 cpu on a custom board.
> 
> I'm glad to see the problem fixed for v6.0-rc4.

Yup, few more pending fixes that I'm aware of:

Tomi is suggesting reverting commit 09077bc31165 ("drm/bridge_connector:
enable HPD by default if supported") to fix the hdmi hpd related warning.
More info at [0] below.

To fix the wlcore mac80211 warning, pick Linux next commit 4a86c5462616
("wifi: mac80211: fix link warning in RX agg timer expiry"). More info at
[1] below.

Regards,

Tony


[0] https://lore.kernel.org/dri-devel/a28a4858-c66a-6737-a9fc-502f591ba2d5@ideasonboard.com/
[1] https://www.spinics.net/lists/linux-wireless/msg227085.html
