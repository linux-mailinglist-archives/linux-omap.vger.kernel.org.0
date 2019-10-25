Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 767BDE4A20
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2019 13:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730058AbfJYLkf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Oct 2019 07:40:35 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53544 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727283AbfJYLkf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 25 Oct 2019 07:40:35 -0400
Received: by mail-wm1-f66.google.com with SMTP id n7so1769222wmc.3
        for <linux-omap@vger.kernel.org>; Fri, 25 Oct 2019 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q056A8pfFrgw7OFexFhREoLczRiOMLWphJ+A1TYCo0Y=;
        b=eQh7F6s0YD2t8q960oiIdypEYAhttldDW1NGg7A7L6bvz3hTApDBUoW/vuAwnrMYtf
         jFSwWvqvdbjTgGIYW55qgVM06VGABNQOuH8YJtYbd9liM0a0irGTsIOp9bHouYST5kbW
         PoK468+CHAKl0yThhaPPy5oX/HN9Lj6f/G9xk5pTbY+rdaZ7ZiBAa8EysitU3zLT2WEN
         N5T10mmJo+syakmOAVd4o29+5SIAVLkA1PMVPFvoDhosw4/fp9aoE09my5b8IrGZHcOQ
         ZxqLjVmGTbegQ5I/B2/g8R2M1e1X+vYhhMov8cMCD7sfSWht9zt6Gqd6rFk/Ir5asw4I
         mV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q056A8pfFrgw7OFexFhREoLczRiOMLWphJ+A1TYCo0Y=;
        b=FMSomha6/dpAx691pDoDwbjS32F9LXEG1qP70oiprM1J/Mm07prqAKmZyETCDQtWzN
         eGuvNL1HyfEkTGlF+ewB1PKhYDQwMkjv3kz3XXvyg3NF8mzeeKe8w8RBEWd5X23bMfSq
         YSN9jWIiyhl6BetQjm/7JLJTD2U4IUHfboi9NrJNyAvMsPzxbzVwOwGBDh+EJELO2BeU
         syzjzc8odjcrc0XqxIA/aMwrNpXXzFZahFju1JwHexXCoFn64XYJaygmOlOcQr8Xlqzl
         YQ/o6QuWOriyZcF245Bd/DqyffI6TvELQ6bOU1V8C3/NScm52AZ02VF3LDxYpyFZI8Zc
         Y7fQ==
X-Gm-Message-State: APjAAAWLenV3/YLq+UV/gN/rdMLcn35+CpN1WKNYGSwYfnNIrm9Fs4ij
        Zh/OAuQtHCKWeEMKxTEmqkVPw1LKzaYlEMi8EKjLUQ==
X-Google-Smtp-Source: APXvYqxsB2Dsh8qSvaILwEaKBWrQBWTVHh8FL83Xb6lFTS2VmjfLLNIhQEw99PE9WRRjdCzpSvyYblxYw0PAE7+JAA8=
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr2916121wmj.119.1572003197530;
 Fri, 25 Oct 2019 04:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191017122549.4634-1-t-kristo@ti.com>
In-Reply-To: <20191017122549.4634-1-t-kristo@ti.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Fri, 25 Oct 2019 13:33:14 +0200
Message-ID: <CAKv+Gu_HNOTSvWRTzLMeECaM8qCi5w806ht_e68e5vgcU9aQvQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] crypto: omap fixes towards 5.5
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, linux-omap@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 17 Oct 2019 at 14:26, Tero Kristo <t-kristo@ti.com> wrote:
>
> Hi,
>
> This series fixes a number of bugs with omap crypto implementation.
> These have become evident with the changes to the cryptomanager, where
> it adds some new test cases and modifies some existing, namely the split
> update tests. Also, while fixing the cryptomanager induced bugs, some
> other surfaced with tcrypt/IPSec tests, so fixed them aswell.
>
> Patch #9 is against crypto core modifying the crypto_wait_req
> common API to have a timeout for it also, currently it waits forever
> and it is kind of difficult to see what test fails with crypto manager.
> This is not really needed for anything, but it is kind of nice to have
> (makes debugging easier.)
>
> This series has been tested on top of 5.4-rc2, with following setups,
> on AM57xx-beagle-x15 board:
>
> - crypto manager self tests
> - tcrypt performance test
> - ipsec test with strongswan
>
> This series depends on the skcipher API switch patch from Ard Biesheuvel
> [1].
>

Hi Tero,

On my BeagleBone White, I am hitting the following issues after
applying these patches:

[    7.493903] alg: skcipher: ecb-aes-omap encryption unexpectedly
succeeded on test vector "random: len=531 klen=32";
expected_error=-22, cfg="random: inplace may_sleep use_finup
src_divs=[44.72%@+4028, <flush>14.70%@alignmask+3, 19.45%@+4070,
21.13%@+2728]"
[    7.651103] alg: skcipher: cbc-aes-omap encryption unexpectedly
succeeded on test vector "random: len=1118 klen=32";
expected_error=-22, cfg="random: may_sleep use_final
src_divs=[<reimport>41.87%@+31, <flush>58.13%@+2510]"

These are simply a result of the ECB and CBC implementations not
returning -EINVAL when the input is not a multiple of the block size.

[    7.845527] alg: skcipher: blocksize for ctr-aes-omap (16) doesn't
match generic impl (1)

This means cra_blocksize is not set to 1 as it should. If your driver
uses the skcipher walk API, it should set the walksize to
AES_BLOCK_SIZE to ensure that the input is handled correctly. If you
don't, then you can disregard that part.

[    8.306491] alg: aead: gcm-aes-omap setauthsize unexpectedly
succeeded on test vector "random: alen=3 plen=31 authsize=6 klen=9";
expected_error=-22

Another missing sanity check. GCM only permits certain authsizes.

[    9.074703] omap_crypto_copy_sgs: Couldn't allocate pages for
unaligned cases.

This is not a bug, but I'm not sure if the below is related or not.

I'll preserve the binaries, in case you need me to objdump anything.

-- 
Ard.



[    9.082178] 8<--- cut here ---
[    9.085258] Unable to handle kernel NULL pointer dereference at
virtual address 00000008
[    9.093442] pgd = (ptrval)
[    9.096165] [00000008] *pgd=00000000
[    9.099773] Internal error: Oops: 5 [#1] SMP ARM
[    9.104415] Modules linked in:
[    9.107494] CPU: 0 PID: 134 Comm: cryptomgr_test Tainted: G
W         5.4.0-rc1-00140-g2e186dcd60ce #17
[    9.117539] Hardware name: Generic AM33XX (Flattened Device Tree)
[    9.123676] PC is at scatterwalk_ffwd+0x24/0xd4
[    9.128232] LR is at scatterwalk_ffwd+0x3c/0xd4
[    9.132785] pc : [<c0494a68>]    lr : [<c0494a80>]    psr: a0070013
[    9.139082] sp : cce839a8  ip : cce79b90  fp : cce75eb0
[    9.144331] r10: cce75e58  r9 : c0d05348  r8 : cce839dc
[    9.149582] r7 : 00000b8b  r6 : cce839dc  r5 : 00000000  r4 : fffff45d
[    9.156142] r3 : cfd820c2  r2 : fffffff8  r1 : cce77420  r0 : 00000000
[    9.162705] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    9.169875] Control: 10c5387d  Table: 8cec0019  DAC: 00000051
[    9.175648] Process cryptomgr_test (pid: 134, stack limit = 0x(ptrval))
[    9.182294] Stack: (0xcce839a8 to 0xcce84000)
[    9.186679] 39a0:                   cce75e40 cce73c80 ffffff8d
c0739198 0000000d 00000008
[    9.194904] 39c0: cce75e58 cce73cd8 00000010 cce839dc 00000000
00000b90 cce75ec4 00000000
[    9.203127] 39e0: cce6c480 00000000 00000000 d72ad1e4 00000000
cce62f80 a0070013 c073948c
[    9.211351] 3a00: ccc2b400 d72ad1e4 cce83a70 cce62f80 cce73c80
00000b83 ccc2b400 cce73cd8
[    9.219575] 3a20: cce83a70 c0d05348 cce83a5c c07394c8 0eec3000
d72ad1e4 00000080 cce73cc8
[    9.227800] 3a40: 00000019 00000010 cfd8182e 00000cc8 00000010
00000000 00000000 cfd8182e
[    9.236023] 3a60: 00000cd8 00000010 00000000 00000000 00000000
00000000 cce83a78 cce83a78
[    9.244247] 3a80: cce77400 d72ad1e4 0000000f cce83c74 cce73c80
cce77400 c0491fd4 cce83ae8
[    9.252470] 3aa0: cce75600 ccc2b3c0 00000000 c04a00ec 00000b9b
cce83afc 00000002 00000010
[    9.260695] 3ac0: 006b875a 00000001 cce83b8d 00000600 cce75a00
cce83cec c0a84898 00000200
[    9.268918] 3ae0: 0000000d 00000000 00000000 00000000 cce83af0
cce83af0 00000000 cce84000
[    9.277142] 3b00: 00000000 cce86000 00000b8b 00000000 cce83dfc
cce83e6c cce83b4c cce83bf8
[    9.285366] 3b20: 0000000d 00000000 c0a84c0f 00000000 00000000
00000000 ffffffff c08ebda8
[    9.293590] 3b40: c0a84c0f ffffff04 ffff0a00 ffff3133 00000092
cce83dda 00000000 ffffff04
[    9.301813] 3b60: ffff0a00 d72ad1e4 00000000 cce83dfc c0a84e35
c0a84e35 cce83bf8 00000002
[    9.310038] 3b80: cce83ba4 cce83e6c c09b03d8 da3b963c 8beab4c9
ffff0a7e 0000007b cce83df1
[    9.318261] 3ba0: 00002710 ffffff0f ffff0a00 d72ad1e4 00000064
c0d05348 0000007b 00002710
[    9.326486] 3bc0: 00000000 a5b2b7e6 01fb625e cce75600 c0d05348
a5b2b7e6 01fb625e c049cfc0
[    9.334709] 3be0: 00000001 d72ad1e4 cce75600 d72ad1e4 cce75600
cce77400 cce7e400 cce83ccc
[    9.342933] 3c00: cce73c80 cce75600 00000000 cce75a00 c0d05348
c04a2804 cce75600 cce73c80
[    9.351157] 3c20: cce77400 cce75a00 00000024 cce75a00 cce77400
ccc2b240 ccc2b280 cce75600
[    9.359381] 3c40: cce73c80 00000024 00000200 cfd7ac52 00000000
00000b9b 00000000 00000000
[    9.367604] 3c60: 00000000 00000000 cce83c68 cce83c68 00000000
cce62fc0 cce62100 cce86000
[    9.375828] 3c80: cce84000 ccb74000 00240000 00000b8b 00000b9b
00000000 00000000 00000000
[    9.384052] 3ca0: ffffffea cfd81ad8 00000000 00000b8b 00000000
00000000 00000002 00000000
[    9.392275] 3cc0: 00000000 00000000 00000000 c9da3b96 7e8beab4
00000000 00000000 00000000
[    9.400499] 3ce0: 00000000 00000000 00000000 6e617222 3a6d6f64
656c6120 20303d6e 6e656c70
[    9.408723] 3d00: 3539323d 75612035 69736874 313d657a 6c6b2036
333d6e65 00002236 00000000
[    9.416946] 3d20: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    9.425169] 3d40: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    9.433392] 3d60: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    9.441615] 3d80: 00000000 00000000 00000000 00000000 00000000
00000002 00000000 c0003232
[    9.449839] 3da0: 00000cc0 c04ee044 00000cc0 646e6172 203a6d6f
6c706e69 20656361 5f79616d
[    9.458063] 3dc0: 65656c73 73752070 69665f65 2070756e 5f637273
73766964 723c5b3d 706d6965
[    9.466287] 3de0: 3e74726f 2e303031 2b402530 39363131 7669205d
66666f5f 3d746573 75003331
[    9.474511] 3e00: 363e6873 2534322e 2c342b40 382e3320 2b402539
205d3232 5f747364 73766964
[    9.482735] 3e20: 30315b3d 25302e30 31332b40 005d3035 34353034
7669205d 66666f5f 3d746573
[    9.490959] 3e40: 3d003631 33003231 36312000 4025342e 005d372b
3034332b 64205d31 645f7473
[    9.499183] 3e60: 3d737669 2e33375b 00253434 d72ad1e4 cce77400
00000017 c092fa2c cce73c80
[    9.507408] 3e80: cce75a00 cce77400 00000000 ccc2b3c0 ccc2b400
c04a2d3c cce73c80 cce77400
[    9.515631] 3ea0: ce2b08c0 c04a2bf8 00001083 c092e66c ffffffff
cce75a00 c0d05348 00000400
[    9.523855] 3ec0: 00000000 c049d0f4 c0c922c0 cce75a80 ce03f7c0
cfb55300 ce03f7c0 cfb55300
[    9.532079] 3ee0: ce03f7c0 ce2b08c0 00000000 ffffffff c08f0e28
ce2b0840 ce08a018 cfb552c0
[    9.540303] 3f00: ce2b0840 ce03f740 00000000 ce03fa50 00000001
cce83f44 cce83f74 c08f0e28
[    9.548527] 3f20: c0167d1c ce08bce4 00000000 00000003 00000000
0eec3000 c08f138c 00000000
[    9.556750] 3f40: 00000000 ce08bce0 00000000 d72ad1e4 ffffe000
d72ad1e4 ffffe000 cce75a00
[    9.564974] 3f60: cce62080 cce62040 cce82000 cce75a00 c049bd44
ce08bcdc cce6205c c049bd84
[    9.573198] 3f80: 00000000 c015c56c 00000029 cce62080 c015c438
00000000 00000000 00000000
[    9.581421] 3fa0: 00000000 00000000 00000000 c01010e8 00000000
00000000 00000000 00000000
[    9.589644] 3fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    9.597866] 3fe0: 00000000 00000000 00000000 00000000 00000013
00000000 00000000 00000000
[    9.606099] [<c0494a68>] (scatterwalk_ffwd) from [<c0739198>]
(omap_aes_gcm_handle_queue+0x180/0x35c)
[    9.615372] [<c0739198>] (omap_aes_gcm_handle_queue) from
[<c07394c8>] (omap_aes_gcm_crypt+0x154/0x210)
[    9.624818] [<c07394c8>] (omap_aes_gcm_crypt) from [<c04a00ec>]
(test_aead_vec_cfg+0x260/0x95c)
[    9.633567] [<c04a00ec>] (test_aead_vec_cfg) from [<c04a2804>]
(test_aead_vs_generic_impl+0x350/0x744)
[    9.642926] [<c04a2804>] (test_aead_vs_generic_impl) from
[<c04a2d3c>] (alg_test_aead+0x144/0x1b8)
[    9.651935] [<c04a2d3c>] (alg_test_aead) from [<c049d0f4>]
(alg_test.part.9+0x9c/0x388)
[    9.659983] [<c049d0f4>] (alg_test.part.9) from [<c049bd84>]
(cryptomgr_test+0x40/0x48)
[    9.668033] [<c049bd84>] (cryptomgr_test) from [<c015c56c>]
(kthread+0x134/0x148)
[    9.675559] [<c015c56c>] (kthread) from [<c01010e8>]
(ret_from_fork+0x14/0x2c)
[    9.682815] Exception stack(0xcce83fb0 to 0xcce83ff8)
[    9.687895] 3fa0:                                     00000000
00000000 00000000 00000000
[    9.696118] 3fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    9.704338] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    9.710994] Code: e1a06000 e1540003 2a000003 ea00000a (e5953008)
[
