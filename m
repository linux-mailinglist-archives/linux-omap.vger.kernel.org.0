Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E41EDE4AB4
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2019 14:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732044AbfJYMGE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Oct 2019 08:06:04 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55103 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503944AbfJYMGE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 25 Oct 2019 08:06:04 -0400
Received: by mail-wm1-f68.google.com with SMTP id g7so1850731wmk.4
        for <linux-omap@vger.kernel.org>; Fri, 25 Oct 2019 05:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Xr5XWoqAazcnd2ln1wAqKC37APWCgyGrEBPgmaFYI4=;
        b=DpnXK3joK9np7VbiFoZ4rFDfLKtgrjx8MVYPh/yBCHdxNjN4swg7/OFkSuSExo8NjC
         zCsZ578BHbJqPCEq2H/j2WTLGo2iMlJC8iStac+bczGC5NM0wHWgsvqKoNCnDO53u01w
         kIMyLkCwE3um5OtziwI0bFC3HqzM82OmuLLcG/p4XWfqR72CmnZYWt8WzlgIyiV9uCUA
         VFG5FHVcUl2j5CPdlFdQi7iLvRJxRSEn4MffMVtTBfba2NnHNqYg3CF4M78jrUtaEjS4
         34hmaAiIV3wwXqu1rbi7U2jE7VyuVYivuYTFKbBVyYnQXDl4jWpUy9FOP26xla0WMzJ8
         GL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Xr5XWoqAazcnd2ln1wAqKC37APWCgyGrEBPgmaFYI4=;
        b=sA00HFf8aAnoNI3i3OMpb1ORK9EsxuUYX+mDeij1acmWys3wUKilr5gaD1AMR9esb8
         OjYpaolF63VTy2LlMtoeET8qHF0gKuuv0M1wxoPm2M3av4+ZAbek2rCdPtblvHLefUGM
         OWKka1dP8R6f1NBo0K8PZOGgOfwNnWMeaiqn1lejWbfP8Y0Aw7KD88FdHpggAWal3Dyl
         w9YBSYeAkbz8liYlP35c7gUaWajsEXMKtkt12iyzsiyUJzVJ7D8uY2redBS8zVFKdfKe
         oxeoCd4U9Qi69ZOz17T5XzQOAaiDcqZwnfYqhx0dBcvZPc+EeY2PysUuGkZP9uK5vWcV
         Wbdw==
X-Gm-Message-State: APjAAAU94pUGGnAbbkpEa46d8h13uoUjUYJo1vjgKnO8tWALSN1DJUZ3
        xZvCz35+hXJdK/879lr4m12wKtiPbbibfxFHuFHvcg==
X-Google-Smtp-Source: APXvYqwgSRdxXwvAi68XsWwqLPq3FxBaQlD3dejCnHYgHetERZNOKwnPey1fARBBMl6WJEZjTJACYw9YTvvK0PD+yhA=
X-Received: by 2002:a05:600c:2214:: with SMTP id z20mr3326202wml.10.1572005162272;
 Fri, 25 Oct 2019 05:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191017122549.4634-1-t-kristo@ti.com> <CAKv+Gu_HNOTSvWRTzLMeECaM8qCi5w806ht_e68e5vgcU9aQvQ@mail.gmail.com>
 <8f97d690-a88a-55cb-eb67-206e01873d94@ti.com> <bf22f7dd-5446-d736-611b-6465df45b74d@ti.com>
In-Reply-To: <bf22f7dd-5446-d736-611b-6465df45b74d@ti.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Fri, 25 Oct 2019 14:05:50 +0200
Message-ID: <CAKv+Gu_ABcosRm30nrtCY429Xki8_b9GAzQ=hQ=Kiuo2o6Y2ng@mail.gmail.com>
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

On Fri, 25 Oct 2019 at 13:56, Tero Kristo <t-kristo@ti.com> wrote:
>
> On 25/10/2019 14:55, Tero Kristo wrote:
> > On 25/10/2019 14:33, Ard Biesheuvel wrote:
> >> On Thu, 17 Oct 2019 at 14:26, Tero Kristo <t-kristo@ti.com> wrote:
> >>>
> >>> Hi,
> >>>
> >>> This series fixes a number of bugs with omap crypto implementation.
> >>> These have become evident with the changes to the cryptomanager, where
> >>> it adds some new test cases and modifies some existing, namely the split
> >>> update tests. Also, while fixing the cryptomanager induced bugs, some
> >>> other surfaced with tcrypt/IPSec tests, so fixed them aswell.
> >>>
> >>> Patch #9 is against crypto core modifying the crypto_wait_req
> >>> common API to have a timeout for it also, currently it waits forever
> >>> and it is kind of difficult to see what test fails with crypto manager.
> >>> This is not really needed for anything, but it is kind of nice to have
> >>> (makes debugging easier.)
> >>>
> >>> This series has been tested on top of 5.4-rc2, with following setups,
> >>> on AM57xx-beagle-x15 board:
> >>>
> >>> - crypto manager self tests
> >>> - tcrypt performance test
> >>> - ipsec test with strongswan
> >>>
> >>> This series depends on the skcipher API switch patch from Ard Biesheuvel
> >>> [1].
> >>>
> >>
> >> Hi Tero,
> >>
> >> On my BeagleBone White, I am hitting the following issues after
> >> applying these patches:
> >>
> >> [    7.493903] alg: skcipher: ecb-aes-omap encryption unexpectedly
> >> succeeded on test vector "random: len=531 klen=32";
> >> expected_error=-22, cfg="random: inplace may_sleep use_finup
> >> src_divs=[44.72%@+4028, <flush>14.70%@alignmask+3, 19.45%@+4070,
> >> 21.13%@+2728]"
> >> [    7.651103] alg: skcipher: cbc-aes-omap encryption unexpectedly
> >> succeeded on test vector "random: len=1118 klen=32";
> >> expected_error=-22, cfg="random: may_sleep use_final
> >> src_divs=[<reimport>41.87%@+31, <flush>58.13%@+2510]"
> >>
> >> These are simply a result of the ECB and CBC implementations not
> >> returning -EINVAL when the input is not a multiple of the block size.
> >>
> >> [    7.845527] alg: skcipher: blocksize for ctr-aes-omap (16) doesn't
> >> match generic impl (1)
> >>
> >> This means cra_blocksize is not set to 1 as it should. If your driver
> >> uses the skcipher walk API, it should set the walksize to
> >> AES_BLOCK_SIZE to ensure that the input is handled correctly. If you
> >> don't, then you can disregard that part.
> >>
> >> [    8.306491] alg: aead: gcm-aes-omap setauthsize unexpectedly
> >> succeeded on test vector "random: alen=3 plen=31 authsize=6 klen=9";
> >> expected_error=-22
> >>
> >> Another missing sanity check. GCM only permits certain authsizes.
> >>
> >> [    9.074703] omap_crypto_copy_sgs: Couldn't allocate pages for
> >> unaligned cases.
> >>
> >> This is not a bug, but I'm not sure if the below is related or not.
> >>
> >> I'll preserve the binaries, in case you need me to objdump anything.
> >
> > What are these tests you are executing? For me, the testmgr self test
> > suite is passing just fine. Any extra tests you have enabled somehow?
> >

I enabled CONFIG_CRYPTO_MANAGER_EXTRA_TESTS, which enables a bunch of
fuzz tests of the offloaded algorithms against the generic
implementations.

> > I am also running full test on different board though (am57xx), I
> > haven't been explicitly running anything on am335x.
>
> Oh, and btw, did you try without my series? I think the selftests are
> failing rather miserably without them...
>

No, I just tried a branch with mine and your patches applied.
