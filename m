Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3AD146767
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2020 12:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgAWL7f (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jan 2020 06:59:35 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:55120 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgAWL7f (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jan 2020 06:59:35 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00NBxPhV026763;
        Thu, 23 Jan 2020 05:59:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579780765;
        bh=JvTgiwmqo1fCMmZ25vGssC5KEnqon7pVtAK/OSvVc6Y=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=BibAoK7l+xR1qQ5DY4QSom2SZgeFsnMG5XdX5Zd3vxtbK1boo4vMCi19q9HUlQ0U1
         F/x8LhhWZ9krZwkD8j53T8wyZwr7584opbHqNMFWA4px0J4HThxXYM2ZLcqsT2Eg8D
         rJ/B2igtVg5A2+7hUDjkfJP/Vo3ntrvESZ/BbInE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00NBxPw7070973
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 Jan 2020 05:59:25 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 23
 Jan 2020 05:59:25 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 23 Jan 2020 05:59:25 -0600
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00NBxMpV006188;
        Thu, 23 Jan 2020 05:59:23 -0600
Subject: Re: [CRASH] crypto: omap: kernel panic when modprobing tcrypt
To:     LABBE Corentin <clabbe@baylibre.com>, <linux-omap@vger.kernel.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>, <dmitry.kasatkin@nokia.com>
CC:     <linux-kernel@vger.kernel.org>
References: <20200123085312.GA24255@Red>
From:   Tero Kristo <t-kristo@ti.com>
Message-ID: <f8bdce6e-9dff-6dbf-e084-c5508b5493e5@ti.com>
Date:   Thu, 23 Jan 2020 13:59:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200123085312.GA24255@Red>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Linux-next has huge pile of fixes in place for omap-crypto, so I would 
not recommend testing any older kernels. You are saying -next crashes in 
similar manner though? TI internal kernel has couple of additional fixes 
against 5.4 stable, but can't see why those would help on this. If you 
have spare time, you could try it out though [1].

Today's next doesn't compile for me at all for some reason (some tooling 
failure) so can't really test it myself right now.

-Tero

[1] 
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=ti-linux-5.4.y

On 23/01/2020 10:53, LABBE Corentin wrote:
> Hello
> 
> When testing omap crypto driver I hit freeze/crash when modprobing tcrypt.
> The result is random (crash vs freeze) but this never succeed.
> 
> I test the driver on a omap4-panda
> 
> I tested next-20200122, 5.2.21, 5.0.21 and 5.5-rc7.
> 
> On 5.0.21:
> [   62.644042] Internal error: Oops: 5 [#1] SMP ARM
> [   62.644042] Modules linked in: authenc cmac gcm vmac xcbc streebog_generic sm3_generic sha3_generic crct10dif_generic crct10dif_common ghash_arm_ce ghash_generic seed rmd320 rmd256 rmd160 rmd128 cts ccm salsa20_generic camellia_generic fcrypt pcbc tgr192 anubis wp512 khazad tea michael_mic arc4 cast6_generic cast5_generic cast_common sha512_arm sha512_generic cfb ofb ux500_cryp aes_arm serpent_generic lrw gf128mul twofish_generic twofish_common blowfish_generic blowfish_common md4 tcrypt(+) ctr sha256_generic hmac md5 sha1_arm_neon sha1_arm sha1_generic aes_arm_bs crypto_simd cryptd phy_generic omap_des omap_sham omap_aes_driver omap_crypto omap2430 ehci_omap des_generic phy_twl6030_usb musb_hdrc
> [   62.710723] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.0.21 #2
> [   62.714050] Hardware name: Generic OMAP4 (Flattened Device Tree)
> [   62.724090] PC is at memcpy+0x48/0x330
> [   62.727874] LR is at scatterwalk_copychunks+0x8c/0x184
> [   62.733032] pc : [<c0e59308>]    lr : [<c062619c>]    psr: 60000113
> [   62.736846] sp : c1701d4c  ip : 00000000  fp : c568a000
> [   62.736846] r10: 00000080  r9 : 00000080  r8 : 00000001
> [   62.749816] r7 : 00000001  r6 : 94478000  r5 : c1701d94  r4 : 00000098
> [   62.754547] r3 : 00080000  r2 : 00000000  r1 : 94478000  r0 : c568a000
> [   62.756378] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [   62.770080] Control: 10c5387d  Table: 857c804a  DAC: 00000051
> [   62.772399] Process swapper/0 (pid: 0, stack limit = 0x(ptrval))
> [   62.781890] Stack: (0xc1701d4c to 0xc1702000)
> [   62.786254] 1d40:                            c1701d94 94478000 00000001 00000001 c568a000
> [   62.794464] 1d60: 00000098 c062619c 00000001 c1708c48 94478000 00000080 c5536154 00000000
> [   62.802368] 1d80: 94478000 00000080 c1703080 c06263cc c170cd04 c5536154 00000000 00000002
> [   62.810913] 1da0: 00000000 c031728c 8010000d 00000001 eee96900 db55db46 c1708c48 c5281e8c
> [   62.819122] 1dc0: 00000002 db55db46 00000002 c5281ea0 00000000 bf04c080 00000001 c0478228
> [   62.827056] 1de0: c5281e40 c0317c2c 00000000 ef7a0354 00000000 00000006 00000100 bf076398
> [   62.835540] 1e00: 0000000a 00000a13 00000000 c5281e60 c5281e64 c034c3bc c1703098 00000007
> [   62.842376] 1e20: 00000040 00000006 ffffe000 c188a5e4 00000100 c0302218 c1708c48 00000001
> [   62.851959] 1e40: c16603c0 c1668e80 c1708c78 00000009 c1660350 ffffa34a c1703d00 c0f07070
> [   62.854400] 1e60: 00200102 eee79e68 00000000 c1668e34 00000000 00000000 00000001 ee824000
> [   62.862365] 1e80: fa241100 95df4e6d 0000000e c034c00c c1668e34 c0399414 c170935c c1776744
> [   62.876617] 1ea0: fa24010c fa240100 c1701ed0 c0692878 c0c60e10 60000113 ffffffff c1701f04
> [   62.884826] 1ec0: ef7a8570 c1700000 95df4e6d c0301a0c 00000000 c1711ee4 2e140000 00000050
> [   62.893035] 1ee0: c1711ee4 00000000 00000000 00000000 ef7a8570 c188ae40 95df4e6d 0000000e
> [   62.899963] 1f00: ee6b2800 c1701f20 c0c60cac c0c60e10 60000113 ffffffff 00000051 00000000
> [   62.909454] 1f20: 95df4e6d 0000000e c1701f73 00000000 007fbd7f 00000000 ef7a8870 db55db46
> [   62.912414] 1f40: 00000002 ffffe000 c1708c78 c1708cbc 00000001 ef7a8570 c1708c48 c1668568
> [   62.922393] 1f60: c1711ee4 c0374394 c188a087 00000000 00896580 db55db46 c15d9a3c 000000c8
> [   62.934112] 1f80: 00000001 ffffffff c1708c40 c1896580 00000001 c15d9a3c c1708c48 c03746a8
> [   62.942321] 1fa0: c18965d8 c1500e14 ffffffff ffffffff 00000000 c1500710 00000000 ef7c4600
> [   62.950531] 1fc0: 00000000 c15d9a3c db50db53 00000000 00000000 c1500330 00000051 10c0387d
> [   62.957916] 1fe0: 00000ae7 83f00000 411fc092 10c5387d 00000000 00000000 00000000 00000000
> [   62.966949] [<c0e59308>] (memcpy) from [<c062619c>] (scatterwalk_copychunks+0x8c/0x184)
> [   62.975006] [<c062619c>] (scatterwalk_copychunks) from [<c06263cc>] (scatterwalk_map_and_copy+0x64/0xb0)
> [   62.984527] [<c06263cc>] (scatterwalk_map_and_copy) from [<bf04c080>] (omap_crypto_cleanup+0x80/0xb4 [omap_crypto])
> [   62.995025] [<bf04c080>] (omap_crypto_cleanup [omap_crypto]) from [<bf076398>] (omap_des_done_task+0x168/0x268 [omap_des])
> [   63.006164] [<bf076398>] (omap_des_done_task [omap_des]) from [<c034c3bc>] (tasklet_action_common.constprop.5+0x4c/0xcc)
> [   63.017089] [<c034c3bc>] (tasklet_action_common.constprop.5) from [<c0302218>] (__do_softirq+0x130/0x3c8)
> [   63.026702] [<c0302218>] (__do_softirq) from [<c034c00c>] (irq_exit+0xcc/0x10c)
> [   63.034057] [<c034c00c>] (irq_exit) from [<c0399414>] (__handle_domain_irq+0x60/0xb4)
> [   63.041931] [<c0399414>] (__handle_domain_irq) from [<c0692878>] (gic_handle_irq+0x58/0x9c)
> [   63.050323] [<c0692878>] (gic_handle_irq) from [<c0301a0c>] (__irq_svc+0x6c/0x90)
> [   63.052398] Exception stack(0xc1701ed0 to 0xc1701f18)
> [   63.062896] 1ec0:                                     00000000 c1711ee4 2e140000 00000050
> [   63.062896] 1ee0: c1711ee4 00000000 00000000 00000000 ef7a8570 c188ae40 95df4e6d 0000000e
> [   63.072387] 1f00: ee6b2800 c1701f20 c0c60cac c0c60e10 60000113 ffffffff
> [   63.085388] [<c0301a0c>] (__irq_svc) from [<c0c60e10>] (cpuidle_enter_state+0x2d0/0x5dc)
> [   63.088409] [<c0c60e10>] (cpuidle_enter_state) from [<c0374394>] (do_idle+0x220/0x298)
> [   63.102111] [<c0374394>] (do_idle) from [<c03746a8>] (cpu_startup_entry+0x18/0x1c)
> [   63.103302] [<c03746a8>] (cpu_startup_entry) from [<c1500e14>] (start_kernel+0x43c/0x46c)
> [   63.117950] Code: ba000002 f5d1f03c f5d1f05c f5d1f07c (e8b151f8)
> [   63.124114] ---[ end trace 5d689d873b1dfe82 ]---
> [   63.128753] Kernel panic - not syncing: Fatal exception in interrupt
> [   63.135131] CPU1: stopping
> [   63.137847] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D W         5.0.21 #2
> [   63.145202] Hardware name: Generic OMAP4 (Flattened Device Tree)
> [   63.145202] [<c0312250>] (unwind_backtrace) from [<c030ccd0>] (show_stack+0x10/0x14)
> [   63.159027] [<c030ccd0>] (show_stack) from [<c0e5afa8>] (dump_stack+0xb4/0xc8)
> [   63.166290] [<c0e5afa8>] (dump_stack) from [<c0310720>] (handle_IPI+0x3bc/0x3dc)
> [   63.173736] [<c0310720>] (handle_IPI) from [<c06928b8>] (gic_handle_irq+0x98/0x9c)
> [   63.181335] [<c06928b8>] (gic_handle_irq) from [<c0301a0c>] (__irq_svc+0x6c/0x90)
> [   63.181335] Exception stack(0xee8f7ef0 to 0xee8f7f38)
> [   63.181335] 7ee0:                                     00000000 c1711ee4 2e151000 00000050
> [   63.202117] 7f00: c1711ee4 00000000 00000000 00000000 ef7b9570 c188ae40 b2c455fd 0000000e
> [   63.202117] 7f20: ee6b2800 ee8f7f40 c0c60cac c0c60e10 60000013 ffffffff
> [   63.210357] [<c0301a0c>] (__irq_svc) from [<c0c60e10>] (cpuidle_enter_state+0x2d0/0x5dc)
> [   63.225128] [<c0c60e10>] (cpuidle_enter_state) from [<c0c633cc>] (cpuidle_enter_state_coupled+0x144/0x3c8)
> [   63.234832] [<c0c633cc>] (cpuidle_enter_state_coupled) from [<c0374394>] (do_idle+0x220/0x298)
> [   63.234832] [<c0374394>] (do_idle) from [<c03746a8>] (cpu_startup_entry+0x18/0x1c)
> [   63.234832] [<c03746a8>] (cpu_startup_entry) from [<8030254c>] (0x8030254c)
> [   63.258087] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
> 
> I have also hit on 5.5-rc7
> [   25.662384] ------------[ cut here ]------------
> [   25.667053] WARNING: CPU: 0 PID: 125 at /linux/mm/page_alloc.c:4713 __alloc_pages_nodemask+0x658/0x10c8
> [   25.677947] Modules linked in: ctr sha1_arm_neon(+) des_generic sha1_arm aes_arm_bs(+) crypto_simd cryptd sha1_generic phy_generic omap_sham(+) omap_aes_driver(+) omap2430 ehci_omap omap_des(+) omap_crypto libdes phy_twl6030_usb musb_hdrc
> [   25.699249] CPU: 0 PID: 125 Comm: 480a5000.des-en Not tainted 5.5.0-rc7-00004-gdbab40bdb42c-dirty #2
> [   25.708374] Hardware name: Generic OMAP4 (Flattened Device Tree)
> [   25.714447] [<c03128f8>] (unwind_backtrace) from [<c030cc9c>] (show_stack+0x10/0x14)
> [   25.722259] [<c030cc9c>] (show_stack) from [<c0eeccfc>] (dump_stack+0xc0/0xd4)
> [   25.728271] [<c0eeccfc>] (dump_stack) from [<c0347b68>] (__warn+0xe0/0xf8)
> [   25.728271] [<c0347b68>] (__warn) from [<c0347c30>] (warn_slowpath_fmt+0xb0/0xb8)
> [   25.738281] [<c0347c30>] (warn_slowpath_fmt) from [<c047c054>] (__alloc_pages_nodemask+0x658/0x10c8)
> [   25.753143] [<c047c054>] (__alloc_pages_nodemask) from [<c047cad8>] (__get_free_pages+0x14/0x24)
> [   25.761993] [<c047cad8>] (__get_free_pages) from [<bf0301b4>] (omap_crypto_align_sg+0x1b4/0x42c [omap_crypto])
> [   25.772033] [<bf0301b4>] (omap_crypto_align_sg [omap_crypto]) from [<bf037724>] (omap_des_prepare_req+0x84/0x244 [omap_des])
> [   25.780670] [<bf037724>] (omap_des_prepare_req [omap_des]) from [<c06582d8>] (crypto_pump_work+0xec/0x240)
> [   25.793029] [<c06582d8>] (crypto_pump_work) from [<c036901c>] (kthread_worker_fn+0x10c/0x1f4)
> [   25.801605] [<c036901c>] (kthread_worker_fn) from [<c0369dbc>] (kthread+0x150/0x154)
> [   25.809387] [<c0369dbc>] (kthread) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
> [   25.816650] Exception stack(0xc5507fb0 to 0xc5507ff8)
> [   25.821716] 7fa0:                                     00000000 00000000 00000000 00000000
> [   25.829925] 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [   25.838134] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [   25.844848] ---[ end trace 163fce45307eae52 ]---
> 
> On 5.0.21 I hit
> [   60.062530] Internal error: Oops: 17 [#1] SMP ARM
> [   60.066619] Modules linked in: authenc cmac gcm vmac xcbc streebog_generic sm3_generic sha3_generic crct10dif_generic crct10dif_common ghash_arm_ce ghash_generic seed rmd320 rmd256 rmd160 rmd128 cts ccm salsa20_generic camellia_generic fcrypt pcbc tgr192 anubis wp512 khazad tea michael_mic arc4 cast6_generic cast5_generic cast_common sha512_arm sha512_generic cfb ofb ux500_cryp aes_arm serpent_generic lrw gf128mul twofish_generic twofish_common blowfish_generic blowfish_common md4 tcrypt(+) ctr sha256_generic hmac md5 sha1_arm_neon sha1_arm phy_generic aes_arm_bs crypto_simd cryptd sha1_generic omap_aes_driver omap_sham omap2430 ehci_omap omap_des omap_crypto des_generic phy_twl6030_usb musb_hdrc
> [   60.119415] CPU: 0 PID: 116 Comm: 480a5000.des-en Tainted: G        W         5.0.21 #3
> [   60.137359] Hardware name: Generic OMAP4 (Flattened Device Tree)
> [   60.143402] PC is at omap_des_prepare_req+0x168/0x274 [omap_des]
> [   60.143493] LR is at 0x6
> [   60.149444] pc : [<bf041768>]    lr : [<00000006>]    psr: 00000113
> [   60.155303] sp : c53a9f18  ip : fa0a5000  fp : c53ec5dc
> [   60.159423] r10: c1708c48  r9 : c54a250c  r8 : 000c3d00
> [   60.167480] r7 : 00000000  r6 : 00000008  r5 : 00000913  r4 : c52d7140
> [   60.167480] r3 : 00000290  r2 : db55db46  r1 : c54eef40  r0 : 00000001
> [   60.181884] Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [   60.183258] Control: 10c5387d  Table: 8534004a  DAC: 00000051
> [   60.189422] Process 480a5000.des-en (pid: 116, stack limit = 0x(ptrval))
> [   60.199401] Stack: (0xc53a9f18 to 0xc53aa000)
> [   60.199401] 9f00:                                                       00000000 0000000a
> [   60.214141] 9f20: c52d7158 db55db46 c53958d8 c53958ac c54eef00 c5395880 c53958b0 c0623fc4
> [   60.222351] 9f40: c53958d8 c53ec540 ffffe000 c18bb964 c53ec544 00000001 c1708c48 c0365ef0
> [   60.229400] 9f60: ffffe000 db55db46 c53ec5c0 c53ec580 00000000 c53a8000 c53ec540 c0365dec
> [   60.234130] 9f80: c5377c04 c0365db8 00000001 c53ec580 c0365c6c 00000000 00000000 00000000
> [   60.247009] 9fa0: 00000000 00000000 00000000 c03010e8 00000000 00000000 00000000 00000000
> [   60.249420] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [   60.249420] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> [   60.271697] [<bf041768>] (omap_des_prepare_req [omap_des]) from [<c0623fc4>] (crypto_pump_work+0xec/0x240)
> [   60.281402] [<c0623fc4>] (crypto_pump_work) from [<c0365ef0>] (kthread_worker_fn+0x104/0x1ec)
> [   60.289978] [<c0365ef0>] (kthread_worker_fn) from [<c0365db8>] (kthread+0x14c/0x154)
> [   60.297760] [<c0365db8>] (kthread) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
> [   60.304595] Exception stack(0xc53a9fb0 to 0xc53a9ff8)
> [   60.310089] 9fa0:                                     00000000 00000000 00000000 00000000
> [   60.318298] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [   60.326507] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [   60.333160] Code: e594809c e594c00c e1b0e12e 0a00000a (e598600c)
> [   60.339447] ---[ end trace 1c4ef7665b4e53a4 ]---
> 
> Regards
> 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
