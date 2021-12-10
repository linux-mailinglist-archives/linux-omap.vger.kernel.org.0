Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9CD346F81F
	for <lists+linux-omap@lfdr.de>; Fri, 10 Dec 2021 01:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234921AbhLJAhY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Dec 2021 19:37:24 -0500
Received: from mail.wizzup.org ([95.217.97.174]:43404 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230109AbhLJAhY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 9 Dec 2021 19:37:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID
        :Subject:From:Cc:To:Sender:Reply-To:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ikI9llI2WD4Q1bc3yU8It+TtoHavj8pcle8JQapY4Ww=; b=hNOOih0GTqFjI/v5sq2Fpjmh/+
        7YklcVuhmOldHOkSw896E+YNrzRhV7t07zRZ0oOlss9nVaB5HLia5paIkqBFK7AhihdKDrJjfgaDO
        txFGHjLo5JZN8Q/L27OY3XwPpJuCho1aZU2F3PIH6GmxWTx5ay/TCDkBcvHp3NS+WgZ3OJ2L9DJV2
        HGFCiHPIy4oowMMvuH4UGnxs/Mu9gqrS6kqbJSar7G7x0AtOwRVvzg4aYzQz75J113shyKvRZDS08
        LYViMkUCJ5hcJQEgbnkI/t4D6FN8VE9C5b3FH7aIhpeYIFWG4HhE8LIjnw7HgHfBYgz+yAqstYNAc
        GOZHoCyQ==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mvTqr-0000Dl-QG; Fri, 10 Dec 2021 00:33:29 +0000
To:     linux-omap <linux-omap@vger.kernel.org>,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org,
        Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Dev Null <devnull@uvos.xyz>,
        Andreas Kemnade <andreas@kemnade.info>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
From:   Merlijn Wajer <merlijn@wizzup.org>
Subject: Nokia N900 not hitting OFF mode since 5.9 is caused by proactive
 memory compaction
Message-ID: <99e25c92-3d2d-0964-0068-651bf44cbf8a@wizzup.org>
Date:   Fri, 10 Dec 2021 01:39:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

I've spent the day bisecting what exact commit prevented the Nokia N900
from entering the OFF sleep state (between v5.8 and v5.9), and it this
commit:

> # first bad commit: [facdaa917c4d5a376d09d25865f5a863f906234a] mm: proactive compaction

The git tree prior to that commit can idle at about ~27mW in OFF mode,
and it will often remain in that mode for prolonged amounts of time
(easily 30 seconds, depending on running userspace). Which the above
commit applied, the Nokia N900 almost never hits OFF mode any more. This
would suggest at least to disable CONFIG_COMPACTION, perhaps in
omap2plus_defconfig? I suspect this might cause idle problems beyond the
Nokia N900, too.

Maybe nothing needs to be done here other than disable the config option
-- but I wanted to share this in case others are trying to figure out
what happened to their battery life. :-)

There seem be more power regressions since then (at least on 5.15 there
is more blocking proper idle), so I'll try to find those as well, but if
this commit is reverted (or CONFIG_COMPACTION=n is in .config - probably
easier) on top of v5.9 the system seems to idle fine.

> # grep ^core_pwrdm /sys/kernel/debug/pm_debug/count | cut -d',' -f2,
> OFF:16,RET:2

Hope this helps someone...

Regards,
Merlijn

PS: v5.10 seems to use another 19mW if panel_sony_acx565akm is loaded
even when display is not active (maybe it doesn't suspend or something?
- could be fixed later, just noticed it for v5.10). I load it initially
to idle the display, but until I rmmod the modules, the module uses
quite a bit more power. This problem is not present in v5.9, so that is
another thing to chase down I guess... And then v5.15 uses another 12mW
more, for not yet uncovered reasons)
