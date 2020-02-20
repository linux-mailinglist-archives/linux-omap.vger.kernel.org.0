Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7776E166790
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 20:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbgBTTw2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 14:52:28 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38557 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728969AbgBTTw1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Feb 2020 14:52:27 -0500
Received: by mail-wr1-f67.google.com with SMTP id e8so6002910wrm.5
        for <linux-omap@vger.kernel.org>; Thu, 20 Feb 2020 11:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U4J+B9AoFtCWOao01WnI0w+VuIomj0Zkw34iYE7h/Uc=;
        b=n/jy/8hjidJgOHwJ61VAXVVQwiy1Znzz74Yd3iFrwjtp93WChpvCtUXN3OKfUuwYPo
         22+Z3qdvyJljow0wjDy0hnHeqtyXaE4Pd5EO+5FLTgnBp6xR/5U9BSNqKyxZzxx7FNtt
         fVjp6TLrfYgqqXbYB7RcsBAuClNSjRdrMpasDR02kiApo6S17NhwGWPjOdeEbmVF4S5n
         JVt+M18PmdMyGlwDycKIjkIaAGy+UX6awe4mhEVITJrC+xqUesqNKSx2UbQHsM4MxPVW
         N34jBuc78agbmSniLDZd8wDwQJ1VNbWsHbHVbTga69ac46Y/QqTwfybwRuXQ9nb9bxXT
         xGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U4J+B9AoFtCWOao01WnI0w+VuIomj0Zkw34iYE7h/Uc=;
        b=a3t025+p0KVRrYVz3CFZXFaDFdhHSt38qsw8id+Xb0GX+rBbttklQZtj4DM9uD9eWo
         +lZ3ipQY0Hsq9UumITf9tYnliX6MjynoiSRdYEVnntrxC0AeRGwPMFMbCMwtAnrs/Fbi
         7CziYqX9G8jY/0bsqwg7TyYfGlQ1KNeJRL1AzgaVgOOUkv3nCf9U6PrzBZH9jWzbF1Tv
         +usWPV0HaKpcHkpOJjJCWqU+jKtry/9O2TVeDyvjac78T1j8ILXiyd1JFjPKe7Ds8zbH
         lMZan0CPmDhDaXSMZW85OI+5BuqCz5dZ6NqJ+LLCIjidTzp96eXaAPZhIv9qRNl3jHDn
         EK5A==
X-Gm-Message-State: APjAAAXSfeMhVmx6za6d4SrmKDcmvEBvuvw2Y4HHXMFx5N7xCHji2f0Q
        JoZ8J6EiQ0VeVeJtg0gG02WIlQ==
X-Google-Smtp-Source: APXvYqzvAGTsWwWNIV1KJB3/zOaeAzePPP56TtgvK+0Ysu6sFQ6CO1Xpe2lbLrIzilTSbCvnBXMoVg==
X-Received: by 2002:a05:6000:1252:: with SMTP id j18mr46628367wrx.103.1582228343954;
        Thu, 20 Feb 2020 11:52:23 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id h18sm784030wrv.78.2020.02.20.11.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 11:52:23 -0800 (PST)
Date:   Thu, 20 Feb 2020 20:52:21 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        dmitry.kasatkin@nokia.com, linux-kernel@vger.kernel.org
Subject: Re: [CRASH] crypto: omap: kernel panic when modprobing tcrypt
Message-ID: <20200220195221.GA17341@Red>
References: <20200123085312.GA24255@Red>
 <f8bdce6e-9dff-6dbf-e084-c5508b5493e5@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8bdce6e-9dff-6dbf-e084-c5508b5493e5@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jan 23, 2020 at 01:59:21PM +0200, Tero Kristo wrote:
> Hi,
> 
> Linux-next has huge pile of fixes in place for omap-crypto, so I would 
> not recommend testing any older kernels. You are saying -next crashes in 
> similar manner though? TI internal kernel has couple of additional fixes 
> against 5.4 stable, but can't see why those would help on this. If you 
> have spare time, you could try it out though [1].
> 
> Today's next doesn't compile for me at all for some reason (some tooling 
> failure) so can't really test it myself right now.
> 
> -Tero
> 
> [1] 
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=ti-linux-5.4.y
> 

I have tested this branch and loading tcrypt lead to a kernel panic
[  105.664062] Internal error: Oops: 17 [#1] SMP ARM
[  105.668792] Modules linked in: vmac xcbc streebog_generic sm3_generic sha3_generic crct10dif_generic crct10dif_common seed rmd320 rmd256 rmd160 rmd128 cts ccm salsa20_generic camellia_generic fcrypt pcbc tgr192 anubis wp512 khazad tea michael_mic arc4 libarc4 cast6_generic cast5_generic cast_common sha512_arm sha512_generic cfb ofb ux500_cryp aes_arm serpent_generic lrw twofish_generic twofish_common blowfish_generic blowfish_common md4 tcrypt(+) ghash_generic gf128mul gcm sha256_generic libsha256 hmac md5 des_generic ctr sha1_arm_neon sha1_arm phy_generic aes_arm_bs crypto_simd cryptd sha1_generic omap_aes_driver omap_sham omap2430 ehci_omap omap_des omap_crypto libdes phy_twl6030_usb musb_hdrc
[  105.730743] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.4.20-00513-gd274af0de6bd #2
[  105.730743] Hardware name: Generic OMAP4 (Flattened Device Tree)
[  105.745849] PC is at omap_sham_finish_req+0x10/0x190 [omap_sham]
[  105.745880] LR is at omap_sham_done_task+0x58/0x118 [omap_sham]
[  105.757843] pc : [<bf04d054>]    lr : [<bf04d63c>]    psr: 20000113
[  105.764129] sp : c1701da8  ip : 00000000  fp : ffffe000
[  105.769378] r10: c557b268  r9 : 00000040  r8 : c167d100
[  105.774627] r7 : c1894b44  r6 : 00000000  r5 : c5622200  r4 : 00000000
[  105.781188] r3 : 00000008  r2 : 000002b3  r1 : 00000000  r0 : c5622200
[  105.781188] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[  105.787750] Control: 10c5387d  Table: 854d004a  DAC: 00000051
[  105.787750] Process swapper/0 (pid: 0, stack limit = 0xd5fffd75)
[  105.806701] Stack: (0xc1701da8 to 0xc1702000)
[  105.806701] 1da0:                   c557b240 00000000 ef55b318 c1894b44 c167d100 bf04d63c
[  105.819305] 1dc0: 00000000 c528bab8 c557b264 00000000 ef55b318 c034d8c8 c5544040 00000006
[  105.827514] 1de0: c1701efc c1703098 00000007 00000040 00000006 ffffe000 c1894b44 00000100
[  105.827514] 1e00: c1703080 c0302298 c1704e48 00000001 c1672388 c167d100 c1704e6c 0000000a
[  105.827514] 1e20: c1672314 ffffb416 c1703d00 c0f07470 00200002 eea7a668 00000000 ffffe000
[  105.852142] 1e40: 00000000 00000000 00000001 ee824000 fa241100 c18ec14c 00000000 c034e018
[  105.860351] 1e60: c167d098 c039be58 c1705528 c1774e04 fa24010c fa240100 c1701ea0 c06e816c
[  105.860351] 1e80: c0c98518 60000113 ffffffff c1701ed4 ef5655b0 c1700000 c18ec14c c0301a8c
[  105.876800] 1ea0: 00000000 c170e1e8 2dee9000 00000050 c170e1e8 00000000 00000000 c1895418
[  105.885009] 1ec0: ef5655b0 00000000 c18ec14c 00000000 ee6b2800 c1701ef0 c0c984f0 c0c98518
[  105.885009] 1ee0: 60000113 ffffffff 00000051 00000000 9a103e82 00000018 9a0fc74d 00000018
[  105.901428] 1f00: 00000018 c167c5a8 ef569b40 c529a5c4 ef5655b0 c170e1e8 ffffffff ffff0000
[  105.909637] 1f20: ffffe000 c18ec14c c529a580 c0c9ae0c 00000002 c1704e6c fe687d92 ef5655b0
[  105.909637] 1f40: c170e1e8 00000002 00000001 ef5655b0 c1704e48 c167c5a8 c170e1e8 c0c989b4
[  105.926086] 1f60: ffffe000 c1704e6c c1704eb0 c03770ec c18944b2 00000002 01000000 f99d40c3
[  105.934295] 1f80: c15dea3c 000000cd c18a0594 00000001 c18a0540 00000000 00000001 c15dea3c
[  105.934295] 1fa0: ef585280 c037741c c1704e48 c1500ea8 ffffffff ffffffff 00000000 c1500664
[  105.934295] 1fc0: 00000000 c15dea3c f99844d7 00000000 00000000 c1500330 00000051 10c0387d
[  105.958923] 1fe0: 00000ae7 83f00000 411fc092 10c5387d 00000000 00000000 00000000 00000000
[  105.967163] [<bf04d054>] (omap_sham_finish_req [omap_sham]) from [<bf04d63c>] (omap_sham_done_task+0x58/0x118 [omap_sham])
[  105.978271] [<bf04d63c>] (omap_sham_done_task [omap_sham]) from [<c034d8c8>] (tasklet_action_common.constprop.5+0x70/0x174)
[  105.978271] [<c034d8c8>] (tasklet_action_common.constprop.5) from [<c0302298>] (__do_softirq+0x130/0x3b4)
[  105.999053] [<c0302298>] (__do_softirq) from [<c034e018>] (irq_exit+0xcc/0xd8)
[  106.006317] [<c034e018>] (irq_exit) from [<c039be58>] (__handle_domain_irq+0x60/0xb4)
[  106.014190] [<c039be58>] (__handle_domain_irq) from [<c06e816c>] (gic_handle_irq+0x58/0x9c)
[  106.022613] [<c06e816c>] (gic_handle_irq) from [<c0301a8c>] (__irq_svc+0x6c/0x90)
[  106.022613] Exception stack(0xc1701ea0 to 0xc1701ee8)
[  106.022613] 1ea0: 00000000 c170e1e8 2dee9000 00000050 c170e1e8 00000000 00000000 c1895418
[  106.043395] 1ec0: ef5655b0 00000000 c18ec14c 00000000 ee6b2800 c1701ef0 c0c984f0 c0c98518
[  106.043395] 1ee0: 60000113 ffffffff
[  106.055114] [<c0301a8c>] (__irq_svc) from [<c0c98518>] (cpuidle_enter_state+0x180/0x5b8)
[  106.063262] [<c0c98518>] (cpuidle_enter_state) from [<c0c9ae0c>] (cpuidle_enter_state_coupled+0x144/0x3c8)
[  106.072967] [<c0c9ae0c>] (cpuidle_enter_state_coupled) from [<c0c989b4>] (cpuidle_enter+0x50/0x54)
[  106.081970] [<c0c989b4>] (cpuidle_enter) from [<c03770ec>] (do_idle+0x218/0x294)
[  106.081970] [<c03770ec>] (do_idle) from [<c037741c>] (cpu_startup_entry+0x18/0x1c)
[  106.097015] [<c037741c>] (cpu_startup_entry) from [<c1500ea8>] (start_kernel+0x480/0x4b0)
[  106.097015] Code: e92d41f0 e1a05000 e5904040 e1a06001 (e59430bc) 
[  106.111358] ---[ end trace 53e3b1ecd80eac62 ]---
[  106.115997] Kernel panic - not syncing: Fatal exception in interrupt
[  106.115997] SMP: failed to stop secondary CPUs
[  106.115997] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
