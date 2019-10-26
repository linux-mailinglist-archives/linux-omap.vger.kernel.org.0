Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E83E5DDD
	for <lists+linux-omap@lfdr.de>; Sat, 26 Oct 2019 17:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfJZPG3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 26 Oct 2019 11:06:29 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32993 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbfJZPG3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 26 Oct 2019 11:06:29 -0400
Received: by mail-wr1-f65.google.com with SMTP id s1so5480041wro.0
        for <linux-omap@vger.kernel.org>; Sat, 26 Oct 2019 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QLAGBMMJrZggygVygRsryefuvxd8XaBmeOF2j1/ecNE=;
        b=rVmRABxhe02YgSdyMdnuJuo7BC1VPq00UtE12fKace9MDodEtRUmLGayaFndOTO/Xc
         LxQVjfNk1DO8VugPd8m2OvFXlRs7rdts936KkHd4Zy7EX7qPmd66ifrqRZQ7gIG5PyR+
         kEY/RCCfuvyboqO51pyaBgbBJE90y2auSV+EMoNq8cKeZOApIl/DZwFrqikw0d8oQ+r5
         m6QLFsiQYH/8TAwTprrT8+JYzG992Uw3N47xL+IEV4PH0Eexe464o36bxn1yJzo1Cqz6
         La5BmtFmD//TuanHacSeWuFfcShr4bPsIzDf3A08t+Me4ZG84OJZkDR0aMuKTbBSeTxe
         OcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QLAGBMMJrZggygVygRsryefuvxd8XaBmeOF2j1/ecNE=;
        b=nCbxzkgoo4Y2KNvP2HUUKQIUmk3+hLQClZCy0zWNRRqi0tA7AnhwFRUkthIweMDqII
         bliESeO3Kx23ISkbzl/UG6YsQ5RbIC5HQ24sit6V7OYxPduot07BgrJQsMUsU+ZxjIdB
         vBDDp914m4itMq9UF7z/ITgffnS/jNWHBP3Vqu8HrO1PNUEIVjqkuayeKf9vHeihOPUv
         /J/ZDodI3ABABJKkeAC9pkCmWj3p21hS3cSs3u21OWF5p0pDCug7qL5jPz5vpiNuJDLC
         pexd4BBcN7HvnTgj1AZYlwIkushZfcHw8rkCFwdF1vSQr58Vdvn96muxwhy+4qI2XBcC
         Ysrg==
X-Gm-Message-State: APjAAAWsW+fn6dN6KuhA8PgW0YkaA52SVN2Mg9ECuSN/plqqRqv0lRg5
        QK0rw9SpkW1c8IhOSaGFq/L7zY1lV88+87lzftm1JQ==
X-Google-Smtp-Source: APXvYqxqv6iTS3d9ZL9lpYTs9m1CK0s8bMw9rNdx+7ex9vS7Pv7YSdyRAY1LkY2mf8u+utyAedZXk1aVjBATxptM6xM=
X-Received: by 2002:adf:fd88:: with SMTP id d8mr1736438wrr.200.1572102386529;
 Sat, 26 Oct 2019 08:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191017122549.4634-1-t-kristo@ti.com> <CAKv+Gu_HNOTSvWRTzLMeECaM8qCi5w806ht_e68e5vgcU9aQvQ@mail.gmail.com>
 <8f97d690-a88a-55cb-eb67-206e01873d94@ti.com> <bf22f7dd-5446-d736-611b-6465df45b74d@ti.com>
 <CAKv+Gu_ABcosRm30nrtCY429Xki8_b9GAzQ=hQ=Kiuo2o6Y2ng@mail.gmail.com> <359434e9-3289-2982-edc1-b93e76c28700@ti.com>
In-Reply-To: <359434e9-3289-2982-edc1-b93e76c28700@ti.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Sat, 26 Oct 2019 17:06:25 +0200
Message-ID: <CAKv+Gu_TgqGzhzhojgBzuJ5r9pRusW3yC+Opqpr5ehdUaXX=UQ@mail.gmail.com>
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

On Fri, 25 Oct 2019 at 14:18, Tero Kristo <t-kristo@ti.com> wrote:
>
> On 25/10/2019 15:05, Ard Biesheuvel wrote:
> > On Fri, 25 Oct 2019 at 13:56, Tero Kristo <t-kristo@ti.com> wrote:
> >>
> >> On 25/10/2019 14:55, Tero Kristo wrote:
> >>> On 25/10/2019 14:33, Ard Biesheuvel wrote:
> >>>> On Thu, 17 Oct 2019 at 14:26, Tero Kristo <t-kristo@ti.com> wrote:
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> This series fixes a number of bugs with omap crypto implementation.
> >>>>> These have become evident with the changes to the cryptomanager, where
> >>>>> it adds some new test cases and modifies some existing, namely the split
> >>>>> update tests. Also, while fixing the cryptomanager induced bugs, some
> >>>>> other surfaced with tcrypt/IPSec tests, so fixed them aswell.
> >>>>>
> >>>>> Patch #9 is against crypto core modifying the crypto_wait_req
> >>>>> common API to have a timeout for it also, currently it waits forever
> >>>>> and it is kind of difficult to see what test fails with crypto manager.
> >>>>> This is not really needed for anything, but it is kind of nice to have
> >>>>> (makes debugging easier.)
> >>>>>
> >>>>> This series has been tested on top of 5.4-rc2, with following setups,
> >>>>> on AM57xx-beagle-x15 board:
> >>>>>
> >>>>> - crypto manager self tests
> >>>>> - tcrypt performance test
> >>>>> - ipsec test with strongswan
> >>>>>
> >>>>> This series depends on the skcipher API switch patch from Ard Biesheuvel
> >>>>> [1].
> >>>>>
> >>>>
> >>>> Hi Tero,
> >>>>
> >>>> On my BeagleBone White, I am hitting the following issues after
> >>>> applying these patches:
> >>>>
> >>>> [    7.493903] alg: skcipher: ecb-aes-omap encryption unexpectedly
> >>>> succeeded on test vector "random: len=531 klen=32";
> >>>> expected_error=-22, cfg="random: inplace may_sleep use_finup
> >>>> src_divs=[44.72%@+4028, <flush>14.70%@alignmask+3, 19.45%@+4070,
> >>>> 21.13%@+2728]"
> >>>> [    7.651103] alg: skcipher: cbc-aes-omap encryption unexpectedly
> >>>> succeeded on test vector "random: len=1118 klen=32";
> >>>> expected_error=-22, cfg="random: may_sleep use_final
> >>>> src_divs=[<reimport>41.87%@+31, <flush>58.13%@+2510]"
> >>>>
> >>>> These are simply a result of the ECB and CBC implementations not
> >>>> returning -EINVAL when the input is not a multiple of the block size.
> >>>>
> >>>> [    7.845527] alg: skcipher: blocksize for ctr-aes-omap (16) doesn't
> >>>> match generic impl (1)
> >>>>
> >>>> This means cra_blocksize is not set to 1 as it should. If your driver
> >>>> uses the skcipher walk API, it should set the walksize to
> >>>> AES_BLOCK_SIZE to ensure that the input is handled correctly. If you
> >>>> don't, then you can disregard that part.
> >>>>
> >>>> [    8.306491] alg: aead: gcm-aes-omap setauthsize unexpectedly
> >>>> succeeded on test vector "random: alen=3 plen=31 authsize=6 klen=9";
> >>>> expected_error=-22
> >>>>
> >>>> Another missing sanity check. GCM only permits certain authsizes.
> >>>>
> >>>> [    9.074703] omap_crypto_copy_sgs: Couldn't allocate pages for
> >>>> unaligned cases.
> >>>>
> >>>> This is not a bug, but I'm not sure if the below is related or not.
> >>>>
> >>>> I'll preserve the binaries, in case you need me to objdump anything.
> >>>
> >>> What are these tests you are executing? For me, the testmgr self test
> >>> suite is passing just fine. Any extra tests you have enabled somehow?
> >>>
> >
> > I enabled CONFIG_CRYPTO_MANAGER_EXTRA_TESTS, which enables a bunch of
> > fuzz tests of the offloaded algorithms against the generic
> > implementations.
>
> Ahha I see, let me give that a shot locally. I have so far only been
> testing with the standard suite.
>
> >
> >>> I am also running full test on different board though (am57xx), I
> >>> haven't been explicitly running anything on am335x.
> >>
> >> Oh, and btw, did you try without my series? I think the selftests are
> >> failing rather miserably without them...
> >>
> >
> > No, I just tried a branch with mine and your patches applied.
>
> Could you give it a shot without the CRYPTO_MANAGER_EXTRA_TESTS, that
> should pass with my series, and fail without?
>

The missing output IVs are fixed by this series, but it seems we need
some more work to get all the wrinkles ironed out. I sent some patches
on top that address a couple of them, but we still need a proper fix
for the situation where only assocdata is presented, and cryptlen == 0

Feel free to merge my patches into your series, or take bits and
pieces into your own patches where needed.
