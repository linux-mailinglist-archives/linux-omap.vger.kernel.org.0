Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A59F16699D
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 22:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbgBTVNW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 16:13:22 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35099 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729064AbgBTVNV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Feb 2020 16:13:21 -0500
Received: by mail-wm1-f65.google.com with SMTP id b17so84221wmb.0
        for <linux-omap@vger.kernel.org>; Thu, 20 Feb 2020 13:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rW5t0PJc3Jr/8TnUKVhYNJ/sFLfIcthwxD1CFSxUYJk=;
        b=x/FOfayUnF/BRMjAioiFNqHeV0zfqdUHqQl8iVfRkmfljeRLLEO2K6AR/+ZU0WooEK
         cs4LCRRrCIcpXNuNxO+wWGIhk3KldWgzX4cfsgyfMPQerGfnQWOmttpMYSCJLYn8Wnml
         Yg37DI+oeXXD1O7i9EXd5p6j8aBCzr38LnaJp5B0XGmilQ+AsFldvo+nTzGd6LvfOQD3
         /sWSfRLy80BbZJas/ZUSx8ncS/gl53OAhk7iXiDVGSM+BBQwfSCoDSqE4X9BKdObSO+s
         TfX7lOXXEaxbV8wloNDmbvv/n2yFKAV/fAyBuqv/OCehl7uojWY4cJlBaH+jzmlJiH3K
         J3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rW5t0PJc3Jr/8TnUKVhYNJ/sFLfIcthwxD1CFSxUYJk=;
        b=Wxz8MQ7kpcS6umgcokCBH90ZSqzxCI8Lup+EX9x4W0OFfvGaQZT2COMTNoB3pLxrPR
         /D/TiuOhQqWbQbJMU3keoJdi656Sf7slM/aoLruKIF+/P1OiadKLz4NibE/HOXEXLDyj
         bI63RlKaZtTeBdYViWv4YSC1nxlZn6F5egRucNTQ+N938tRHG+bEqcGVNhygP74zq9Y0
         On64l2mJwae3hwSpyPAj0nugNDkgdzfb3+cPEq8OVMqmY4nIVRJWIUDlksMSGEIJ02mz
         rA7CmIkVgg2YGzAdUZ2aI6b0sH7X9Nrk1weU3HhxxqN3Gi10+SlMpTc57nyBGNQ7XZBz
         RO2Q==
X-Gm-Message-State: APjAAAWTyDGeLZbhv7nSCSRv3MFbXrTC0kZ39O6LWARdnjNg8kdw7SOq
        3yOrS7QUruHZkz5PMegFp4VA3yUQRx8kKs7jFVhWLA==
X-Google-Smtp-Source: APXvYqxCxB4EGH5QGqKKIn14UfWNUkpQYMgngxNj262blMWEIsHj7qRe7X11aPJimXqjUwh/+HlKsQzr/uzE22C+EZ8=
X-Received: by 2002:a05:600c:248:: with SMTP id 8mr6329781wmj.1.1582233198199;
 Thu, 20 Feb 2020 13:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20200123085312.GA24255@Red> <f8bdce6e-9dff-6dbf-e084-c5508b5493e5@ti.com>
 <20200220195221.GA17341@Red>
In-Reply-To: <20200220195221.GA17341@Red>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Thu, 20 Feb 2020 22:13:06 +0100
Message-ID: <CAKv+Gu-8pGa7QODPKQv_BAqWiq14X=YN4+43Mw6SX2pDK2fLrg@mail.gmail.com>
Subject: Re: [CRASH] crypto: omap: kernel panic when modprobing tcrypt
To:     LABBE Corentin <clabbe@baylibre.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, dmitry.kasatkin@nokia.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 20 Feb 2020 at 20:52, LABBE Corentin <clabbe@baylibre.com> wrote:
>
> On Thu, Jan 23, 2020 at 01:59:21PM +0200, Tero Kristo wrote:
> > Hi,
> >
> > Linux-next has huge pile of fixes in place for omap-crypto, so I would
> > not recommend testing any older kernels. You are saying -next crashes i=
n
> > similar manner though? TI internal kernel has couple of additional fixe=
s
> > against 5.4 stable, but can't see why those would help on this. If you
> > have spare time, you could try it out though [1].
> >
> > Today's next doesn't compile for me at all for some reason (some toolin=
g
> > failure) so can't really test it myself right now.
> >
> > -Tero
> >
> > [1]
> > https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=3Dti-lin=
ux-5.4.y
> >
>
> I have tested this branch and loading tcrypt lead to a kernel panic

Hi Corentin,

It would be helpful if you could paste the entire error message.


> [  105.664062] Internal error: Oops: 17 [#1] SMP ARM
> [  105.668792] Modules linked in: vmac xcbc streebog_generic sm3_generic =
sha3_generic crct10dif_generic crct10dif_common seed rmd320 rmd256 rmd160 r=
md128 cts ccm salsa20_generic camellia_generic fcrypt pcbc tgr192 anubis wp=
512 khazad tea michael_mic arc4 libarc4 cast6_generic cast5_generic cast_co=
mmon sha512_arm sha512_generic cfb ofb ux500_cryp aes_arm serpent_generic l=
rw twofish_generic twofish_common blowfish_generic blowfish_common md4 tcry=
pt(+) ghash_generic gf128mul gcm sha256_generic libsha256 hmac md5 des_gene=
ric ctr sha1_arm_neon sha1_arm phy_generic aes_arm_bs crypto_simd cryptd sh=
a1_generic omap_aes_driver omap_sham omap2430 ehci_omap omap_des omap_crypt=
o libdes phy_twl6030_usb musb_hdrc
> [  105.730743] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         =
5.4.20-00513-gd274af0de6bd #2
> [  105.730743] Hardware name: Generic OMAP4 (Flattened Device Tree)
> [  105.745849] PC is at omap_sham_finish_req+0x10/0x190 [omap_sham]
> [  105.745880] LR is at omap_sham_done_task+0x58/0x118 [omap_sham]
> [  105.757843] pc : [<bf04d054>]    lr : [<bf04d63c>]    psr: 20000113
> [  105.764129] sp : c1701da8  ip : 00000000  fp : ffffe000
> [  105.769378] r10: c557b268  r9 : 00000040  r8 : c167d100
> [  105.774627] r7 : c1894b44  r6 : 00000000  r5 : c5622200  r4 : 00000000
> [  105.781188] r3 : 00000008  r2 : 000002b3  r1 : 00000000  r0 : c5622200
> [  105.781188] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segme=
nt none
> [  105.787750] Control: 10c5387d  Table: 854d004a  DAC: 00000051
> [  105.787750] Process swapper/0 (pid: 0, stack limit =3D 0xd5fffd75)
> [  105.806701] Stack: (0xc1701da8 to 0xc1702000)
> [  105.806701] 1da0:                   c557b240 00000000 ef55b318 c1894b4=
4 c167d100 bf04d63c
> [  105.819305] 1dc0: 00000000 c528bab8 c557b264 00000000 ef55b318 c034d8c=
8 c5544040 00000006
> [  105.827514] 1de0: c1701efc c1703098 00000007 00000040 00000006 ffffe00=
0 c1894b44 00000100
> [  105.827514] 1e00: c1703080 c0302298 c1704e48 00000001 c1672388 c167d10=
0 c1704e6c 0000000a
> [  105.827514] 1e20: c1672314 ffffb416 c1703d00 c0f07470 00200002 eea7a66=
8 00000000 ffffe000
> [  105.852142] 1e40: 00000000 00000000 00000001 ee824000 fa241100 c18ec14=
c 00000000 c034e018
> [  105.860351] 1e60: c167d098 c039be58 c1705528 c1774e04 fa24010c fa24010=
0 c1701ea0 c06e816c
> [  105.860351] 1e80: c0c98518 60000113 ffffffff c1701ed4 ef5655b0 c170000=
0 c18ec14c c0301a8c
> [  105.876800] 1ea0: 00000000 c170e1e8 2dee9000 00000050 c170e1e8 0000000=
0 00000000 c1895418
> [  105.885009] 1ec0: ef5655b0 00000000 c18ec14c 00000000 ee6b2800 c1701ef=
0 c0c984f0 c0c98518
> [  105.885009] 1ee0: 60000113 ffffffff 00000051 00000000 9a103e82 0000001=
8 9a0fc74d 00000018
> [  105.901428] 1f00: 00000018 c167c5a8 ef569b40 c529a5c4 ef5655b0 c170e1e=
8 ffffffff ffff0000
> [  105.909637] 1f20: ffffe000 c18ec14c c529a580 c0c9ae0c 00000002 c1704e6=
c fe687d92 ef5655b0
> [  105.909637] 1f40: c170e1e8 00000002 00000001 ef5655b0 c1704e48 c167c5a=
8 c170e1e8 c0c989b4
> [  105.926086] 1f60: ffffe000 c1704e6c c1704eb0 c03770ec c18944b2 0000000=
2 01000000 f99d40c3
> [  105.934295] 1f80: c15dea3c 000000cd c18a0594 00000001 c18a0540 0000000=
0 00000001 c15dea3c
> [  105.934295] 1fa0: ef585280 c037741c c1704e48 c1500ea8 ffffffff fffffff=
f 00000000 c1500664
> [  105.934295] 1fc0: 00000000 c15dea3c f99844d7 00000000 00000000 c150033=
0 00000051 10c0387d
> [  105.958923] 1fe0: 00000ae7 83f00000 411fc092 10c5387d 00000000 0000000=
0 00000000 00000000
> [  105.967163] [<bf04d054>] (omap_sham_finish_req [omap_sham]) from [<bf0=
4d63c>] (omap_sham_done_task+0x58/0x118 [omap_sham])
> [  105.978271] [<bf04d63c>] (omap_sham_done_task [omap_sham]) from [<c034=
d8c8>] (tasklet_action_common.constprop.5+0x70/0x174)
> [  105.978271] [<c034d8c8>] (tasklet_action_common.constprop.5) from [<c0=
302298>] (__do_softirq+0x130/0x3b4)
> [  105.999053] [<c0302298>] (__do_softirq) from [<c034e018>] (irq_exit+0x=
cc/0xd8)
> [  106.006317] [<c034e018>] (irq_exit) from [<c039be58>] (__handle_domain=
_irq+0x60/0xb4)
> [  106.014190] [<c039be58>] (__handle_domain_irq) from [<c06e816c>] (gic_=
handle_irq+0x58/0x9c)
> [  106.022613] [<c06e816c>] (gic_handle_irq) from [<c0301a8c>] (__irq_svc=
+0x6c/0x90)
> [  106.022613] Exception stack(0xc1701ea0 to 0xc1701ee8)
> [  106.022613] 1ea0: 00000000 c170e1e8 2dee9000 00000050 c170e1e8 0000000=
0 00000000 c1895418
> [  106.043395] 1ec0: ef5655b0 00000000 c18ec14c 00000000 ee6b2800 c1701ef=
0 c0c984f0 c0c98518
> [  106.043395] 1ee0: 60000113 ffffffff
> [  106.055114] [<c0301a8c>] (__irq_svc) from [<c0c98518>] (cpuidle_enter_=
state+0x180/0x5b8)
> [  106.063262] [<c0c98518>] (cpuidle_enter_state) from [<c0c9ae0c>] (cpui=
dle_enter_state_coupled+0x144/0x3c8)
> [  106.072967] [<c0c9ae0c>] (cpuidle_enter_state_coupled) from [<c0c989b4=
>] (cpuidle_enter+0x50/0x54)
> [  106.081970] [<c0c989b4>] (cpuidle_enter) from [<c03770ec>] (do_idle+0x=
218/0x294)
> [  106.081970] [<c03770ec>] (do_idle) from [<c037741c>] (cpu_startup_entr=
y+0x18/0x1c)
> [  106.097015] [<c037741c>] (cpu_startup_entry) from [<c1500ea8>] (start_=
kernel+0x480/0x4b0)
> [  106.097015] Code: e92d41f0 e1a05000 e5904040 e1a06001 (e59430bc)
> [  106.111358] ---[ end trace 53e3b1ecd80eac62 ]---
> [  106.115997] Kernel panic - not syncing: Fatal exception in interrupt
> [  106.115997] SMP: failed to stop secondary CPUs
> [  106.115997] ---[ end Kernel panic - not syncing: Fatal exception in in=
terrupt ]---
