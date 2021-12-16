Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF474775A3
	for <lists+linux-omap@lfdr.de>; Thu, 16 Dec 2021 16:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232629AbhLPPSa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Dec 2021 10:18:30 -0500
Received: from mail.wizzup.org ([95.217.97.174]:44604 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232605AbhLPPS3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Dec 2021 10:18:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=sSN3Qw9S9tP2uVhh9XtTeixv9Oq//tqeMXSC7rMT70U=; b=hLNQ3aIgyq8gV38VrOgceHySnM
        S3X5twc71SZxdLAcSqaAv5uOIEqTj8zugHIREGS4rjSeqqHJfZFPceUbffFt/6/vdtZP/J7doXzn4
        OnUQsQQk/EDXztLT/WZun8rPMCp2NdEW1/8PCbkseb5xiQDkHH9y7xV6E/uEMSpMvrVlZL54YEZnD
        0RLGRuXgEU4ZS+LZnGg0Xru1tDJbUmXBhXCKL0QRI1UsuVUn6HvsmocbXJJPtQ58GNBejua0KAb14
        56o78fCGcQoED8oTUnrVcNhbdQanQhruL7sZhdtPF00ONeDCPWAEyGnpLytCm/KJopfR3tOfIPwxN
        T8RreM5A==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mxsWK-0004WS-Qk; Thu, 16 Dec 2021 15:18:12 +0000
To:     Tony Lindgren <tony@atomide.com>, Nitin Gupta <nigupta@nvidia.com>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Dev Null <devnull@uvos.xyz>,
        Andreas Kemnade <andreas@kemnade.info>,
        "H. Nikolaus Schaller" <hns@goldelico.com>, linux-mm@kvack.org
References: <99e25c92-3d2d-0964-0068-651bf44cbf8a@wizzup.org>
 <YbL/teuB7qtGhtfL@atomide.com>
From:   Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: Nokia N900 not hitting OFF mode since 5.9 is caused by proactive
 memory compaction
Message-ID: <6f1d0a78-13a9-4909-2b9e-326a4dfeedc0@wizzup.org>
Date:   Thu, 16 Dec 2021 16:23:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YbL/teuB7qtGhtfL@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nitin, linux-mm list,

Any ideas or comments on the problem I encountered and on the question
from Tony below? Is it possible to have CONFIG_COMPACTION not wake up
systems unnecessarily, or should it perhaps be disabled for systems
where power consumption is an issue?

Thanks,
Regards,
Merlijn

PS: I already earlier noted in this thread that setting "sysctl -w
vm.compaction_proactiveness=0" does not solve the problem, as the system
stills is kept awake by CONFIG_COMPACTION.

On 10/12/2021 08:20, Tony Lindgren wrote:
> Hi,
> 
> * Merlijn Wajer <merlijn@wizzup.org> [211210 00:34]:
>> Hi,
>>
>> I've spent the day bisecting what exact commit prevented the Nokia N900
>> from entering the OFF sleep state (between v5.8 and v5.9), and it this
>> commit:
>>
>>> # first bad commit: [facdaa917c4d5a376d09d25865f5a863f906234a] mm: proactive compaction
>>
>> The git tree prior to that commit can idle at about ~27mW in OFF mode,
>> and it will often remain in that mode for prolonged amounts of time
>> (easily 30 seconds, depending on running userspace). Which the above
>> commit applied, the Nokia N900 almost never hits OFF mode any more. This
>> would suggest at least to disable CONFIG_COMPACTION, perhaps in
>> omap2plus_defconfig? I suspect this might cause idle problems beyond the
>> Nokia N900, too.
> 
> Nice find, adding Nitin to Cc as well. Nitin, can we somehow avoid the
> timers for CONFIG_COMPACTION on an idle system to prevent waking up the
> system unnecessarily?
> 
> Not sure if sysctl -w vm.compaction_proactiveness=0 is enough to disable
> compaction for idle, maybe also the HPAGE_FRAG_CHECK_INTERVAL_MSEC = 500
> at ms also causes extra wake-ups?
> 
> Regards,
> 
> Tony
> 
>> Maybe nothing needs to be done here other than disable the config option
>> -- but I wanted to share this in case others are trying to figure out
>> what happened to their battery life. :-)
>>
>> There seem be more power regressions since then (at least on 5.15 there
>> is more blocking proper idle), so I'll try to find those as well, but if
>> this commit is reverted (or CONFIG_COMPACTION=n is in .config - probably
>> easier) on top of v5.9 the system seems to idle fine.
>>
>>> # grep ^core_pwrdm /sys/kernel/debug/pm_debug/count | cut -d',' -f2,
>>> OFF:16,RET:2
>>
>> Hope this helps someone...
>>
>> Regards,
>> Merlijn
>>
>> PS: v5.10 seems to use another 19mW if panel_sony_acx565akm is loaded
>> even when display is not active (maybe it doesn't suspend or something?
>> - could be fixed later, just noticed it for v5.10). I load it initially
>> to idle the display, but until I rmmod the modules, the module uses
>> quite a bit more power. This problem is not present in v5.9, so that is
>> another thing to chase down I guess... And then v5.15 uses another 12mW
>> more, for not yet uncovered reasons)

