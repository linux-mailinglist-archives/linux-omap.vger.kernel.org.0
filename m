Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 190781699F4
	for <lists+linux-omap@lfdr.de>; Sun, 23 Feb 2020 21:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgBWUfJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 23 Feb 2020 15:35:09 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33698 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbgBWUfJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 23 Feb 2020 15:35:09 -0500
Received: by mail-wm1-f65.google.com with SMTP id m10so9276427wmc.0
        for <linux-omap@vger.kernel.org>; Sun, 23 Feb 2020 12:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Uq6kfBNCBukDuhfL6sEejpc9F/5XdOjMWrmRS3tq0to=;
        b=L+XD8dwSQKGoGZelaEHPfa1ZI7PbCV1GhqDdwlPh6dtRPZJI6TahVQH6adpvptuHJs
         swV/Gx07HnqH+7O95qlo0JeatvMjK3dxLZeO0QBHRBP8HPxflCUJ9qFabpJ2jVWjHNbw
         trZ/ZOBsV+8rgNb4Z7KsmlmpUkBKAWRiXM2lRC8hRb9no1YYj5ZJOuRqBBY5vo8ndAd8
         SJRSsCa6nmFsTMRvyR2R5+sSWM2AbJfCWWzKj7/znrqTDkXPX+JYOU3T2jwxBoxAc8WY
         esZMo7/OMqDoTfuIo65JpD1k0AEqj/6TNBevrMuCAKWaKii1gfh6IjQu0AVDDyAm7c7a
         V+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Uq6kfBNCBukDuhfL6sEejpc9F/5XdOjMWrmRS3tq0to=;
        b=cmxdcTCyFkquBA/ktGTvSoSBuFi2r4kKMLOuyMcYTH905QC6gpfc12HMkSAv+dYtns
         bznhFKjFlPDXkapS8iwGKdwEAFd5dpnVb0re3mErJw6VycJC+xELr973bD8LLlyCnGqu
         GuIbS/Kh0GWgzkLfwaG0c0mLlxnGSpAmQxIbKgqsJPKN7G/jDX3A6BogqsgvaktHKCYz
         aqZbmkqjk9yUMiIfSQAUM2apWTSEvz9sgdaH9TNzaxShanRTqFbvi/rQJTrJkVZRo5dG
         aIFS4HNGeBVjda9YU0Q88pB8DoH42pMFNVgKEc80bzJP3Aej63OrQop44Ypj5aP1+JlW
         yXJA==
X-Gm-Message-State: APjAAAW7kssfJeYnFSCXa433/Fe0tkPjno4Ee4istI4OYLVA6Xu/4dmF
        EOw3rZuT3QyMthEnop+B8vtk/EQt0g+miGoP6gLjEQ==
X-Google-Smtp-Source: APXvYqyaVu8Mazs4GlXiCJ2u8GjqG9gyae5eKrSOKeBCYwBe/MF78ZNVHcrPWij5ib6ilgRqGaCYa8QflBDI+d0cSvo=
X-Received: by 2002:a1c:bc46:: with SMTP id m67mr17102148wmf.40.1582490105686;
 Sun, 23 Feb 2020 12:35:05 -0800 (PST)
MIME-Version: 1.0
References: <20200123085312.GA24255@Red> <f8bdce6e-9dff-6dbf-e084-c5508b5493e5@ti.com>
 <20200220195221.GA17341@Red> <CAKv+Gu-8pGa7QODPKQv_BAqWiq14X=YN4+43Mw6SX2pDK2fLrg@mail.gmail.com>
 <20200223202308.GA28683@Red>
In-Reply-To: <20200223202308.GA28683@Red>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Sun, 23 Feb 2020 21:34:54 +0100
Message-ID: <CAKv+Gu9LHEe0Z3CT32uigftpQKenxj_nngcKCrU7D3kMGxozzA@mail.gmail.com>
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

On Sun, 23 Feb 2020 at 21:23, LABBE Corentin <clabbe@baylibre.com> wrote:
>
> On Thu, Feb 20, 2020 at 10:13:06PM +0100, Ard Biesheuvel wrote:
> > On Thu, 20 Feb 2020 at 20:52, LABBE Corentin <clabbe@baylibre.com> wrot=
e:
> > >
> > > On Thu, Jan 23, 2020 at 01:59:21PM +0200, Tero Kristo wrote:
> > > > Hi,
> > > >
> > > > Linux-next has huge pile of fixes in place for omap-crypto, so I wo=
uld
> > > > not recommend testing any older kernels. You are saying -next crash=
es in
> > > > similar manner though? TI internal kernel has couple of additional =
fixes
> > > > against 5.4 stable, but can't see why those would help on this. If =
you
> > > > have spare time, you could try it out though [1].
> > > >
> > > > Today's next doesn't compile for me at all for some reason (some to=
oling
> > > > failure) so can't really test it myself right now.
> > > >
> > > > -Tero
> > > >
> > > > [1]
> > > > https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=3Dti=
-linux-5.4.y
> > > >
> > >
> > > I have tested this branch and loading tcrypt lead to a kernel panic
> >
> > Hi Corentin,
> >
> > It would be helpful if you could paste the entire error message.
> >
>
> Hello
>
> I dont understand, the following trace is the entire error message I get =
on the console.
>

There should be a line before this that gives the kind of error and
the faulting address


> >
> > > [  105.664062] Internal error: Oops: 17 [#1] SMP ARM
> > > [  105.668792] Modules linked in: vmac xcbc streebog_generic sm3_gene=
ric sha3_generic crct10dif_generic crct10dif_common seed rmd320 rmd256 rmd1=
60 rmd128 cts ccm salsa20_generic camellia_generic fcrypt pcbc tgr192 anubi=
s wp512 khazad tea michael_mic arc4 libarc4 cast6_generic cast5_generic cas=
t_common sha512_arm sha512_generic cfb ofb ux500_cryp aes_arm serpent_gener=
ic lrw twofish_generic twofish_common blowfish_generic blowfish_common md4 =
tcrypt(+) ghash_generic gf128mul gcm sha256_generic libsha256 hmac md5 des_=
generic ctr sha1_arm_neon sha1_arm phy_generic aes_arm_bs crypto_simd crypt=
d sha1_generic omap_aes_driver omap_sham omap2430 ehci_omap omap_des omap_c=
rypto libdes phy_twl6030_usb musb_hdrc
> > > [  105.730743] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W     =
    5.4.20-00513-gd274af0de6bd #2
> > > [  105.730743] Hardware name: Generic OMAP4 (Flattened Device Tree)
> > > [  105.745849] PC is at omap_sham_finish_req+0x10/0x190 [omap_sham]
> > > [  105.745880] LR is at omap_sham_done_task+0x58/0x118 [omap_sham]
> > > [  105.757843] pc : [<bf04d054>]    lr : [<bf04d63c>]    psr: 2000011=
3
> > > [  105.764129] sp : c1701da8  ip : 00000000  fp : ffffe000
> > > [  105.769378] r10: c557b268  r9 : 00000040  r8 : c167d100
> > > [  105.774627] r7 : c1894b44  r6 : 00000000  r5 : c5622200  r4 : 0000=
0000
> > > [  105.781188] r3 : 00000008  r2 : 000002b3  r1 : 00000000  r0 : c562=
2200
> > > [  105.781188] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  S=
egment none
> > > [  105.787750] Control: 10c5387d  Table: 854d004a  DAC: 00000051
> > > [  105.787750] Process swapper/0 (pid: 0, stack limit =3D 0xd5fffd75)
> > > [  105.806701] Stack: (0xc1701da8 to 0xc1702000)
> > > [  105.806701] 1da0:                   c557b240 00000000 ef55b318 c18=
94b44 c167d100 bf04d63c
> > > [  105.819305] 1dc0: 00000000 c528bab8 c557b264 00000000 ef55b318 c03=
4d8c8 c5544040 00000006
> > > [  105.827514] 1de0: c1701efc c1703098 00000007 00000040 00000006 fff=
fe000 c1894b44 00000100
> > > [  105.827514] 1e00: c1703080 c0302298 c1704e48 00000001 c1672388 c16=
7d100 c1704e6c 0000000a
> > > [  105.827514] 1e20: c1672314 ffffb416 c1703d00 c0f07470 00200002 eea=
7a668 00000000 ffffe000
> > > [  105.852142] 1e40: 00000000 00000000 00000001 ee824000 fa241100 c18=
ec14c 00000000 c034e018
> > > [  105.860351] 1e60: c167d098 c039be58 c1705528 c1774e04 fa24010c fa2=
40100 c1701ea0 c06e816c
> > > [  105.860351] 1e80: c0c98518 60000113 ffffffff c1701ed4 ef5655b0 c17=
00000 c18ec14c c0301a8c
> > > [  105.876800] 1ea0: 00000000 c170e1e8 2dee9000 00000050 c170e1e8 000=
00000 00000000 c1895418
> > > [  105.885009] 1ec0: ef5655b0 00000000 c18ec14c 00000000 ee6b2800 c17=
01ef0 c0c984f0 c0c98518
> > > [  105.885009] 1ee0: 60000113 ffffffff 00000051 00000000 9a103e82 000=
00018 9a0fc74d 00000018
> > > [  105.901428] 1f00: 00000018 c167c5a8 ef569b40 c529a5c4 ef5655b0 c17=
0e1e8 ffffffff ffff0000
> > > [  105.909637] 1f20: ffffe000 c18ec14c c529a580 c0c9ae0c 00000002 c17=
04e6c fe687d92 ef5655b0
> > > [  105.909637] 1f40: c170e1e8 00000002 00000001 ef5655b0 c1704e48 c16=
7c5a8 c170e1e8 c0c989b4
> > > [  105.926086] 1f60: ffffe000 c1704e6c c1704eb0 c03770ec c18944b2 000=
00002 01000000 f99d40c3
> > > [  105.934295] 1f80: c15dea3c 000000cd c18a0594 00000001 c18a0540 000=
00000 00000001 c15dea3c
> > > [  105.934295] 1fa0: ef585280 c037741c c1704e48 c1500ea8 ffffffff fff=
fffff 00000000 c1500664
> > > [  105.934295] 1fc0: 00000000 c15dea3c f99844d7 00000000 00000000 c15=
00330 00000051 10c0387d
> > > [  105.958923] 1fe0: 00000ae7 83f00000 411fc092 10c5387d 00000000 000=
00000 00000000 00000000
> > > [  105.967163] [<bf04d054>] (omap_sham_finish_req [omap_sham]) from [=
<bf04d63c>] (omap_sham_done_task+0x58/0x118 [omap_sham])
> > > [  105.978271] [<bf04d63c>] (omap_sham_done_task [omap_sham]) from [<=
c034d8c8>] (tasklet_action_common.constprop.5+0x70/0x174)
> > > [  105.978271] [<c034d8c8>] (tasklet_action_common.constprop.5) from =
[<c0302298>] (__do_softirq+0x130/0x3b4)
> > > [  105.999053] [<c0302298>] (__do_softirq) from [<c034e018>] (irq_exi=
t+0xcc/0xd8)
> > > [  106.006317] [<c034e018>] (irq_exit) from [<c039be58>] (__handle_do=
main_irq+0x60/0xb4)
> > > [  106.014190] [<c039be58>] (__handle_domain_irq) from [<c06e816c>] (=
gic_handle_irq+0x58/0x9c)
> > > [  106.022613] [<c06e816c>] (gic_handle_irq) from [<c0301a8c>] (__irq=
_svc+0x6c/0x90)
> > > [  106.022613] Exception stack(0xc1701ea0 to 0xc1701ee8)
> > > [  106.022613] 1ea0: 00000000 c170e1e8 2dee9000 00000050 c170e1e8 000=
00000 00000000 c1895418
> > > [  106.043395] 1ec0: ef5655b0 00000000 c18ec14c 00000000 ee6b2800 c17=
01ef0 c0c984f0 c0c98518
> > > [  106.043395] 1ee0: 60000113 ffffffff
> > > [  106.055114] [<c0301a8c>] (__irq_svc) from [<c0c98518>] (cpuidle_en=
ter_state+0x180/0x5b8)
> > > [  106.063262] [<c0c98518>] (cpuidle_enter_state) from [<c0c9ae0c>] (=
cpuidle_enter_state_coupled+0x144/0x3c8)
> > > [  106.072967] [<c0c9ae0c>] (cpuidle_enter_state_coupled) from [<c0c9=
89b4>] (cpuidle_enter+0x50/0x54)
> > > [  106.081970] [<c0c989b4>] (cpuidle_enter) from [<c03770ec>] (do_idl=
e+0x218/0x294)
> > > [  106.081970] [<c03770ec>] (do_idle) from [<c037741c>] (cpu_startup_=
entry+0x18/0x1c)
> > > [  106.097015] [<c037741c>] (cpu_startup_entry) from [<c1500ea8>] (st=
art_kernel+0x480/0x4b0)
> > > [  106.097015] Code: e92d41f0 e1a05000 e5904040 e1a06001 (e59430bc)
> > > [  106.111358] ---[ end trace 53e3b1ecd80eac62 ]---
> > > [  106.115997] Kernel panic - not syncing: Fatal exception in interru=
pt
> > > [  106.115997] SMP: failed to stop secondary CPUs
> > > [  106.115997] ---[ end Kernel panic - not syncing: Fatal exception i=
n interrupt ]---
