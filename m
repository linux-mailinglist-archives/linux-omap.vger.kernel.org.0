Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F01470E73
	for <lists+linux-omap@lfdr.de>; Sat, 11 Dec 2021 00:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238080AbhLJXS2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Dec 2021 18:18:28 -0500
Received: from mail.wizzup.org ([95.217.97.174]:43558 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237592AbhLJXS2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Dec 2021 18:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID
        :Subject:Cc:From:To:Sender:Reply-To:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=9a8Evp+auWINtiJU8RxzQhSWdRLOWN6ErSZxks5P+U4=; b=mliSSWPol8tB1LtCB/OCZvauNc
        YWFRgoZf2SCkXifbmUWTVlmI1FJbBWN3bC/x9A28pN40WZO9lzPb1tenid/Ab8cpsR2egDBSxtePL
        yPc4l/ReqNLZ3153XgyGSZxY4mQVppeJUbbKsaXCeu0c6i4W+auS2qm0+0rU6W6dHknW1qjSOh+08
        s7MN2S0PX/myzEvICBWiWRkxqS5Chx1CJHxnKuyx39oUfh5A6BtrnkEb4xClUb+PtffUaBuaalu6G
        I18rfKhQ1nW73fjXhtaIdbThKd0upkMNuvCPOWk+K0eX0VP0UP5rF0h9uECfAtckk9YBk2ftIORzv
        C/PAS7bg==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mvp65-0000pY-Cw; Fri, 10 Dec 2021 23:14:37 +0000
To:     linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Adam Ford <aford173@gmail.com>
From:   Merlijn Wajer <merlijn@wizzup.org>
Cc:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dev Null <devnull@uvos.xyz>,
        Andreas Kemnade <andreas@kemnade.info>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Nokia N900 OFF mode regression between v5.10 and v5.11
Message-ID: <43cac03a-53c2-83dd-e1b0-4d25920d9095@wizzup.org>
Date:   Sat, 11 Dec 2021 00:20:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony, Adam,

I noticed that after I fixed the OFF mode regression between v5.9 and
v5.10 that there are another one between v5.10 and v5.11. Fortunately,
much like the other change it can be worked around with a config change,
and in fact it looks like the commit identified by git bisect is indeed
just a commit to change omap2plus_defconfig.

a82820fcd079e38309403f595f005a8cc318a13c ("ARM: omap2plus_defconfig:
Enable OMAP3_THERMAL") prevents the N900 from entering OFF mode pretty
much all the time (I've seen scenarios with OFF:2,RET:500), but with the
config change reverted, stuff like this is more common: OFF:13,RET:2

We will probably to keep the thermal features enabled, but maybe we can
figure out why it causes the SoC to not enter sleep modes?

The good news is that this seems to be one of the last regressions with
regards to OFF mode (there might be smaller ones that cause slightly
more wakeups, but those will be harder to find). With this
(CONFIG_OMAP3_THERMAL) config option disabled as well; as fixes from my
other recent emails I can get my 5.15 branch to enter OFF mode again:

> # uname -a
> Linux (none) 5.15.2-00597-g68be8fac7cbd #48 SMP PREEMPT Sat Dec 11 00:14:05 CET 2021 armv7l GNU/Linux
> # grep ^core_pwrdm /sys/kernel/debug/pm_debug/count | cut -d',' -f2,
> OFF:13,RET:10

Regards,
Merlijn
