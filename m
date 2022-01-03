Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8504833B7
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jan 2022 15:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbiACOoz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Jan 2022 09:44:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233534AbiACOo3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Jan 2022 09:44:29 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF3FC061761;
        Mon,  3 Jan 2022 06:44:28 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id f5so136744458edq.6;
        Mon, 03 Jan 2022 06:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5ItWiZtPUdeCFM1o9nLXW3m2zZX0wCmHSKw6BubrB34=;
        b=C4/2X0S5El7uxJV+QYzVXP+D/ZesS4KPllQHc/6JwhqeIeuWzpkg6itUguIZWCmN6N
         RbeBfNnhTGdl9yH92n6hjyrWge52orVNjB+i/fo6U4w7381YWk/ffWV3dU5fI3wcK/DD
         KvmvdOmICYF+IgyRKE238uCigSytIaIvZ2QFty0PYqbyhuIvqug4DSS2+rPUA7pdRMmg
         uWJtEXWqXNq827jPCEgnCzQBgSLdf8k8T3k4ga3Yp7Xu7iDu3dzmEflgM3UjPMZaFDNE
         sau+thXJ4x4B2v4nSiehcZKkBQBkiHGnux/Jff8Q7dN3S+xUtXNK3Qw9Zb8bNhU6xcAl
         akSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5ItWiZtPUdeCFM1o9nLXW3m2zZX0wCmHSKw6BubrB34=;
        b=QZd2aoRZI8l8M2ZTKFj8TNTvrjXr51dqFl7aIpULPWc5YI912xD0/gG3a9c9Ne2w/y
         NitC02yGZaD0yDJpJoBjnGD8DeR6CGhd4pCU3fD7uFjKJkkIyjDx9ulQwCL+RE0J1IJO
         LnU3q5k6bSl9qmVSTVwbaiFYcmFjrVpbYBNjTZmLAOhsk6JSzgL95PssPEtdt1z66a+A
         AgguqfjpvUVjAwkfJOp+U27BtIF/T0LD+JUaSLE8evc3IfJu76Va+z6bXoa/fc5umoOy
         4oflMiBZwLS4Lw9Z6fiCh/iSTx22Nl+mEGsXv+++wvyfjvkHULf6EdQZvtNsovgzlEnF
         xRRw==
X-Gm-Message-State: AOAM531F/1VLO/3vIfi1cfXhGaoK2k7aUHVMLwMT+FCEpdUwzmJNPclY
        ALrExrArGH57yKsMI8QpR+0=
X-Google-Smtp-Source: ABdhPJzeRvhtdGUt0nbCWx1FTsxtnXAmcbzLpRJrOZ6HIz/gqi0kdbyKV3yZ2Lq5FG06r19qwjE20w==
X-Received: by 2002:a17:907:62a2:: with SMTP id nd34mr35124830ejc.114.1641221067515;
        Mon, 03 Jan 2022 06:44:27 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id w11sm13470956edv.65.2022.01.03.06.44.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jan 2022 06:44:26 -0800 (PST)
Subject: Re: Nokia N900 not hitting OFF mode since 5.9 is caused by proactive
 memory compaction
To:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        phone-devel@vger.kernel.org, maemo-leste@lists.dyne.org,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Dev Null <devnull@uvos.xyz>,
        Andreas Kemnade <andreas@kemnade.info>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Nitin Gupta <nigupta@nvidia.com>
References: <99e25c92-3d2d-0964-0068-651bf44cbf8a@wizzup.org>
 <YbL/teuB7qtGhtfL@atomide.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <a6682d1c-acab-72d3-bbe6-62e6d40a4832@gmail.com>
Date:   Mon, 3 Jan 2022 16:44:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <YbL/teuB7qtGhtfL@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 10.12.21 г. 9:20 ч., Tony Lindgren wrote:
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

This doesn't seem to affect Nokia N900 only, waking-up twice a second 
will have negative effect on power usage of every device this runs on. 
Could we have some discussion on how to avoid that?

Regards,
Ivo

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
