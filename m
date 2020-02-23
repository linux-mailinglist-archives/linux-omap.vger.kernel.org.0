Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6511699E8
	for <lists+linux-omap@lfdr.de>; Sun, 23 Feb 2020 21:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbgBWUXO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 23 Feb 2020 15:23:14 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34851 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727149AbgBWUXN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 23 Feb 2020 15:23:13 -0500
Received: by mail-wr1-f65.google.com with SMTP id w12so7974419wrt.2
        for <linux-omap@vger.kernel.org>; Sun, 23 Feb 2020 12:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WofHtOBEwg5RRwOmOmC0T+5slXnmFdDtINSsQoPTxEQ=;
        b=tvp3bzOBDD1a0rT/H5FPrvTS67GL8HxhcVCiDXboMOo0IL3CvqHjft+vfj1E6w0OtZ
         o+Aa+qBBcuQgkTUaTlYtNSUbYxecdav0vtavkbRLOVlPc7JSYFIT/DUxyIoQkGAc4Roz
         23P0U8T/9dDy3c4ICsHxcnR5LlK7oHGrjzBK2CyKDnSubM33ipYDK6uIau6LvmdeQRVg
         vjV6AFpiRvD43Xcsr1TSwiB5qlHRpv4ADg+7JCGURg83OWAlObkVGR2L7RFMittgw1E0
         ddz2CMrHDrIztr7dkxnzLobuCfp/iGQsoqE8QHeY/4H44P984PgzkFb7gFbIBNzYg+LE
         BJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WofHtOBEwg5RRwOmOmC0T+5slXnmFdDtINSsQoPTxEQ=;
        b=ay/kLXX0QhbB2y20P/7DISQ6mYsWgjViEXFbI3XTt1TebyVKdcfwfo1dkWnqmCtR/e
         VvDwV0KKbVXfPkoizEOb3d9JJ71CAHrYuCms/MOc+GYoAm/0WWWzQFdkioFw7aL4tUQP
         HKepFGJugqOIFt8g5iI45wBnJOHxWLz+gsYVIww5WYnpn4SF8C9LH6DmiSwNnvOsLArr
         hOHrOC3ab2fc8VV2krhXvRNF6vJPsrXHlVVHQwbG28Kr4ZxcT3Jl8+4h7/2WxJw9p2QF
         z+YI3Bddy0JO0NBQmiQ1X6flP9VTIBp1e+pfshNWDFVfU8xB7WItBtMd36642agjIZBb
         nMpg==
X-Gm-Message-State: APjAAAX7Iq9N23pz2BWT9EmrECdo6O4/UHSZEAdlx154e+y0uyxFiXk+
        XGRRwKnrEoxoHvMSbxwWW5UqEA==
X-Google-Smtp-Source: APXvYqy/nGfq15ltsFwGAj27YM5HjyJ6Dk9ko42U66ibw34/ft2BRh0sfe8nxBNyV6Sm+74wWCegNQ==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr61052137wro.310.1582489391606;
        Sun, 23 Feb 2020 12:23:11 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id n8sm14284572wrx.42.2020.02.23.12.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 12:23:10 -0800 (PST)
Date:   Sun, 23 Feb 2020 21:23:08 +0100
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     Tero Kristo <t-kristo@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, dmitry.kasatkin@nokia.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [CRASH] crypto: omap: kernel panic when modprobing tcrypt
Message-ID: <20200223202308.GA28683@Red>
References: <20200123085312.GA24255@Red>
 <f8bdce6e-9dff-6dbf-e084-c5508b5493e5@ti.com>
 <20200220195221.GA17341@Red>
 <CAKv+Gu-8pGa7QODPKQv_BAqWiq14X=YN4+43Mw6SX2pDK2fLrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu-8pGa7QODPKQv_BAqWiq14X=YN4+43Mw6SX2pDK2fLrg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Feb 20, 2020 at 10:13:06PM +0100, Ard Biesheuvel wrote:
> On Thu, 20 Feb 2020 at 20:52, LABBE Corentin <clabbe@baylibre.com> wrote:
> >
> > On Thu, Jan 23, 2020 at 01:59:21PM +0200, Tero Kristo wrote:
> > > Hi,
> > >
> > > Linux-next has huge pile of fixes in place for omap-crypto, so I would
> > > not recommend testing any older kernels. You are saying -next crashes in
> > > similar manner though? TI internal kernel has couple of additional fixes
> > > against 5.4 stable, but can't see why those would help on this. If you
> > > have spare time, you could try it out though [1].
> > >
> > > Today's next doesn't compile for me at all for some reason (some tooling
> > > failure) so can't really test it myself right now.
> > >
> > > -Tero
> > >
> > > [1]
> > > https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=ti-linux-5.4.y
> > >
> >
> > I have tested this branch and loading tcrypt lead to a kernel panic
> 
> Hi Corentin,
> 
> It would be helpful if you could paste the entire error message.
> 

Hello

I dont understand, the following trace is the entire error message I get on the console.

> 
> > [  105.664062] Internal error: Oops: 17 [#1] SMP ARM
> > [  105.668792] Modules linked in: vmac xcbc streebog_generic sm3_generic sha3_generic crct10dif_generic crct10dif_common seed rmd320 rmd256 rmd160 rmd128 cts ccm salsa20_generic camellia_generic fcrypt pcbc tgr192 anubis wp512 khazad tea michael_mic arc4 libarc4 cast6_generic cast5_generic cast_common sha512_arm sha512_generic cfb ofb ux500_cryp aes_arm serpent_generic lrw twofish_generic twofish_common blowfish_generic blowfish_common md4 tcrypt(+) ghash_generic gf128mul gcm sha256_generic libsha256 hmac md5 des_generic ctr sha1_arm_neon sha1_arm phy_generic aes_arm_bs crypto_simd cryptd sha1_generic omap_aes_driver omap_sham omap2430 ehci_omap omap_des omap_crypto libdes phy_twl6030_usb musb_hdrc
> > [  105.730743] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.4.20-00513-gd274af0de6bd #2
> > [  105.730743] Hardware name: Generic OMAP4 (Flattened Device Tree)
> > [  105.745849] PC is at omap_sham_finish_req+0x10/0x190 [omap_sham]
> > [  105.745880] LR is at omap_sham_done_task+0x58/0x118 [omap_sham]
> > [  105.757843] pc : [<bf04d054>]    lr : [<bf04d63c>]    psr: 20000113
> > [  105.764129] sp : c1701da8  ip : 00000000  fp : ffffe000
> > [  105.769378] r10: c557b268  r9 : 00000040  r8 : c167d100
> > [  105.774627] r7 : c1894b44  r6 : 00000000  r5 : c5622200  r4 : 00000000
> > [  105.781188] r3 : 00000008  r2 : 000002b3  r1 : 00000000  r0 : c5622200
> > [  105.781188] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> > [  105.787750] Control: 10c5387d  Table: 854d004a  DAC: 00000051
> > [  105.787750] Process swapper/0 (pid: 0, stack limit = 0xd5fffd75)
> > [  105.806701] Stack: (0xc1701da8 to 0xc1702000)
> > [  105.806701] 1da0:                   c557b240 00000000 ef55b318 c1894b44 c167d100 bf04d63c
> > [  105.819305] 1dc0: 00000000 c528bab8 c557b264 00000000 ef55b318 c034d8c8 c5544040 00000006
> > [  105.827514] 1de0: c1701efc c1703098 00000007 00000040 00000006 ffffe000 c1894b44 00000100
> > [  105.827514] 1e00: c1703080 c0302298 c1704e48 00000001 c1672388 c167d100 c1704e6c 0000000a
> > [  105.827514] 1e20: c1672314 ffffb416 c1703d00 c0f07470 00200002 eea7a668 00000000 ffffe000
> > [  105.852142] 1e40: 00000000 00000000 00000001 ee824000 fa241100 c18ec14c 00000000 c034e018
> > [  105.860351] 1e60: c167d098 c039be58 c1705528 c1774e04 fa24010c fa240100 c1701ea0 c06e816c
> > [  105.860351] 1e80: c0c98518 60000113 ffffffff c1701ed4 ef5655b0 c1700000 c18ec14c c0301a8c
> > [  105.876800] 1ea0: 00000000 c170e1e8 2dee9000 00000050 c170e1e8 00000000 00000000 c1895418
> > [  105.885009] 1ec0: ef5655b0 00000000 c18ec14c 00000000 ee6b2800 c1701ef0 c0c984f0 c0c98518
> > [  105.885009] 1ee0: 60000113 ffffffff 00000051 00000000 9a103e82 00000018 9a0fc74d 00000018
> > [  105.901428] 1f00: 00000018 c167c5a8 ef569b40 c529a5c4 ef5655b0 c170e1e8 ffffffff ffff0000
> > [  105.909637] 1f20: ffffe000 c18ec14c c529a580 c0c9ae0c 00000002 c1704e6c fe687d92 ef5655b0
> > [  105.909637] 1f40: c170e1e8 00000002 00000001 ef5655b0 c1704e48 c167c5a8 c170e1e8 c0c989b4
> > [  105.926086] 1f60: ffffe000 c1704e6c c1704eb0 c03770ec c18944b2 00000002 01000000 f99d40c3
> > [  105.934295] 1f80: c15dea3c 000000cd c18a0594 00000001 c18a0540 00000000 00000001 c15dea3c
> > [  105.934295] 1fa0: ef585280 c037741c c1704e48 c1500ea8 ffffffff ffffffff 00000000 c1500664
> > [  105.934295] 1fc0: 00000000 c15dea3c f99844d7 00000000 00000000 c1500330 00000051 10c0387d
> > [  105.958923] 1fe0: 00000ae7 83f00000 411fc092 10c5387d 00000000 00000000 00000000 00000000
> > [  105.967163] [<bf04d054>] (omap_sham_finish_req [omap_sham]) from [<bf04d63c>] (omap_sham_done_task+0x58/0x118 [omap_sham])
> > [  105.978271] [<bf04d63c>] (omap_sham_done_task [omap_sham]) from [<c034d8c8>] (tasklet_action_common.constprop.5+0x70/0x174)
> > [  105.978271] [<c034d8c8>] (tasklet_action_common.constprop.5) from [<c0302298>] (__do_softirq+0x130/0x3b4)
> > [  105.999053] [<c0302298>] (__do_softirq) from [<c034e018>] (irq_exit+0xcc/0xd8)
> > [  106.006317] [<c034e018>] (irq_exit) from [<c039be58>] (__handle_domain_irq+0x60/0xb4)
> > [  106.014190] [<c039be58>] (__handle_domain_irq) from [<c06e816c>] (gic_handle_irq+0x58/0x9c)
> > [  106.022613] [<c06e816c>] (gic_handle_irq) from [<c0301a8c>] (__irq_svc+0x6c/0x90)
> > [  106.022613] Exception stack(0xc1701ea0 to 0xc1701ee8)
> > [  106.022613] 1ea0: 00000000 c170e1e8 2dee9000 00000050 c170e1e8 00000000 00000000 c1895418
> > [  106.043395] 1ec0: ef5655b0 00000000 c18ec14c 00000000 ee6b2800 c1701ef0 c0c984f0 c0c98518
> > [  106.043395] 1ee0: 60000113 ffffffff
> > [  106.055114] [<c0301a8c>] (__irq_svc) from [<c0c98518>] (cpuidle_enter_state+0x180/0x5b8)
> > [  106.063262] [<c0c98518>] (cpuidle_enter_state) from [<c0c9ae0c>] (cpuidle_enter_state_coupled+0x144/0x3c8)
> > [  106.072967] [<c0c9ae0c>] (cpuidle_enter_state_coupled) from [<c0c989b4>] (cpuidle_enter+0x50/0x54)
> > [  106.081970] [<c0c989b4>] (cpuidle_enter) from [<c03770ec>] (do_idle+0x218/0x294)
> > [  106.081970] [<c03770ec>] (do_idle) from [<c037741c>] (cpu_startup_entry+0x18/0x1c)
> > [  106.097015] [<c037741c>] (cpu_startup_entry) from [<c1500ea8>] (start_kernel+0x480/0x4b0)
> > [  106.097015] Code: e92d41f0 e1a05000 e5904040 e1a06001 (e59430bc)
> > [  106.111358] ---[ end trace 53e3b1ecd80eac62 ]---
> > [  106.115997] Kernel panic - not syncing: Fatal exception in interrupt
> > [  106.115997] SMP: failed to stop secondary CPUs
> > [  106.115997] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
