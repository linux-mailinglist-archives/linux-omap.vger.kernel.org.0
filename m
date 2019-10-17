Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 754F4DAB95
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2019 13:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389985AbfJQL46 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Oct 2019 07:56:58 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37531 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393017AbfJQL46 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Oct 2019 07:56:58 -0400
Received: by mail-wm1-f65.google.com with SMTP id f22so2243002wmc.2
        for <linux-omap@vger.kernel.org>; Thu, 17 Oct 2019 04:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ad2K2FPi+JWuo3JXCsLcy34BkSbdWI0M9B4hyz9w4vE=;
        b=WqZfGPPaJEcdytnRIGiSnnoQaMQdBjJpkA7lC7DN2j7ND/RFca4YDnRXQskoNkFPJY
         6mLTX+0MM78oopNK1NNf20d7+QCsnsz7BngzyEKHUdQB8i1WyTsIHNbxmYhyx+KW/D1O
         GYXQgFZ6AQcHvmByQ4I8amZ3DQ6NawgPm+cdURj/0WTzBT6bEAcFE9YsNCEw0YXvIKBP
         XVZa6FxUNgFjBO1y2xvDw4JMTexv68sRcPBF536bR1ti4kUiWPz2a8Hid1uw7d0PqZx0
         jzBNg8OgcAdO4ZlqgofWGqqXM7JlGeyMBfCb0RX558ornF6Itc/XOGdSO1ZYF7ghYmSw
         eNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ad2K2FPi+JWuo3JXCsLcy34BkSbdWI0M9B4hyz9w4vE=;
        b=Yk+v2PsYUZjkqwlPzqVWfCFY4nHZHpFl2HTDDsr7LptAsO3ZZkTP/dhC5Bpp+i98RY
         X6Br22wcPIgNqiZyVdZoG1YmW/GN33dC/G6p0pCk3KnOdZmM1SojsrFUORoLRznzbvhm
         lidsHfeXWA6IlTrG4iBAO+J8zRor3w7bog+KROA2DnaALgAAeCkCT/8Cqt3R31gSO017
         J2gmqcsHt+NP14BbpwjSrJh+V8fUQ4Zh5B6SanmBYDXOTS5obvVVxATJgpOr2pR7tb2j
         /aMuD6KcEJXjP9g0lRyH6kb60z/AAJ6PhLq7LazBDtp5gVG4jlq9+u8R5yAlsOc8OzvG
         3Bzw==
X-Gm-Message-State: APjAAAVe/0fxkq3sgzd6g9izNjnuDvpQp7GzQn0j3vQ731yL7QiRFRhC
        hMSJcBIr/014omFPqyMnzYshvsTBrGLYRM/2p95p2G+NCVUQEg==
X-Google-Smtp-Source: APXvYqzhAlGmCSUlwFryRLXTx0C+zte/Y2A0F+Mz11sVr45rm22eVwEZblHOV8UZJdpfJw9n9lZow/sUgkI2FpLX5xg=
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr2424328wmj.119.1571313412739;
 Thu, 17 Oct 2019 04:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191014121910.7264-1-ard.biesheuvel@linaro.org>
 <20191014121910.7264-6-ard.biesheuvel@linaro.org> <20191015172843.GB5610@atomide.com>
 <10a69466-7677-ff66-e5e4-9e563c1e457e@ti.com> <CAKv+Gu9QQkL7pHjczs6T+iHExpzSmKsP1jS48o464a8rTA9REA@mail.gmail.com>
 <76dae1ba-eb1d-896b-08d5-81b198ff2100@ti.com>
In-Reply-To: <76dae1ba-eb1d-896b-08d5-81b198ff2100@ti.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Thu, 17 Oct 2019 13:56:41 +0200
Message-ID: <CAKv+Gu-R9mtfY9qVMEcFzzp0Whng2wOTHXuqgBPGT8dBrFd1CA@mail.gmail.com>
Subject: Re: [PATCH 05/25] crypto: omap - switch to skcipher API
To:     Tero Kristo <t-kristo@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@google.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 17 Oct 2019 at 13:25, Tero Kristo <t-kristo@ti.com> wrote:
>
> On 17/10/2019 13:45, Ard Biesheuvel wrote:
> > On Thu, 17 Oct 2019 at 12:25, Tero Kristo <t-kristo@ti.com> wrote:
> >>
> >> On 15/10/2019 20:28, Tony Lindgren wrote:
> >>> * Ard Biesheuvel <ard.biesheuvel@linaro.org> [191014 12:20]:
> >>>> Commit 7a7ffe65c8c5 ("crypto: skcipher - Add top-level skcipher interface")
> >>>> dated 20 august 2015 introduced the new skcipher API which is supposed to
> >>>> replace both blkcipher and ablkcipher. While all consumers of the API have
> >>>> been converted long ago, some producers of the ablkcipher remain, forcing
> >>>> us to keep the ablkcipher support routines alive, along with the matching
> >>>> code to expose [a]blkciphers via the skcipher API.
> >>>>
> >>>> So switch this driver to the skcipher API, allowing us to finally drop the
> >>>> blkcipher code in the near future.
> >>>
> >>> Adding Tero to loop as I think he was the last one to update this code.
> >>
> >> With this patch, I am seeing the SW fallback fail with the following
> >> crash. Any ideas why this happens? This on top of 5.4-rc2, I did not
> >> pick any other crypto patches from the lists, but have couple of local
> >> fixes to get AES working properly with latest changes to testmgr. Am I
> >> missing something?
> >>
> >
> > Thanks Tero.
> >
> > It looks like the fallback ends up invoking __crypto_xor() with a
> > value of NULL for the IV.
> >
> > This should fix the issue, I think.
>
> Thats right, it fixes it. There is another skcipher missing the ivsize
> within omap-aes.c it seems.
>

I take it you are referring to ecb(aes)? That one actually has a
ivsize of 0, so that one is correct.

> Do you want to send a patch out for both or shall I send a patch with
> you as suggested by?
>

I'll fold the cbc fix into my series, thanks.

> I have some 10 omap crypto related patches on their way.
>

Would I be able to test those on a BeagleBone white? In any case,
please cc me so I can have a look as well.

Thanks,
Ard.


> >
> > diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
> > index 329fddbe8a39..a1fc03ed01f3 100644
> > --- a/drivers/crypto/omap-aes.c
> > +++ b/drivers/crypto/omap-aes.c
> > @@ -715,6 +715,7 @@ static struct skcipher_alg algs_ecb_cbc[] = {
> >
> >          .min_keysize            = AES_MIN_KEY_SIZE,
> >          .max_keysize            = AES_MAX_KEY_SIZE,
> > +       .ivsize                 = AES_BLOCK_SIZE,
> >          .setkey                 = omap_aes_setkey,
> >          .encrypt                = omap_aes_cbc_encrypt,
> >          .decrypt                = omap_aes_cbc_decrypt,
> >
> >
> > Thanks,
> > Ard.
> >
> >> -Tero
> >>
> >>
> >> [   11.458071] 8<--- cut here ---
> >>
> >> [   11.461205] Unable to handle kernel NULL pointer dereference at
> >> virtual addre
> >> ss 00000000
> >>
> >> [   11.469352] pgd = e8df20f8
> >>
> >> [   11.472083] [00000000] *pgd=00000000
> >>
> >> [   11.475691] Internal error: Oops: 5 [#1] SMP ARM
> >>
> >> [   11.480325] Modules linked in: syscopyarea cfbimgblt sysfillrect
> >> sysimgblt fb
> >> _sys_fops cfbcopyarea sha512_arm(+) dwc3 ecb udc_core usb_common evdev
> >> aes_arm a
> >> es_generic snd_soc_simple_card snd_soc_simple_card_utils
> >> encoder_tpd12s015 leds_
> >> gpio led_class aes_arm_bs gpio_fan crypto_simd omapdss connector_hdmi
> >> omapdss_ba
> >> se cpufreq_dt cryptd drm omap_wdt watchdog drm_panel_orientation_quirks
> >> cec omap
> >> _aes_driver(+) omap_sham(+) phy_omap_usb2 dwc3_omap omap_mailbox
> >> rtc_omap blueto
> >> oth ecdh_generic ecc libaes snd_soc_davinci_mcasp snd_soc_ti_edma
> >> snd_soc_ti_sdm
> >> a bq27xxx_battery_hdq bq27xxx_battery snd_soc_tlv320aic3x extcon_palmas
> >> rtc_palm
> >> as palmas_pwrbutton snd_soc_core snd_pcm_dmaengine omap_rng snd_pcm
> >> rng_core snd
> >> _timer omap_hdq snd at24 soundcore tmp102 wire cn rtc_ds1307 hwmon
> >> omap_des cryp
> >> to_engine omap_crypto autofs4
> >>
> >> [   11.552884] CPU: 0 PID: 979 Comm: cryptomgr_test Not tainted
> >> 5.4.0-rc2-00014-
> >> g6f57ec1e433d-dirty #334
> >>
> >> [   11.562138] Hardware name: Generic DRA74X (Flattened Device Tree)
> >>
> >> [   11.568259] PC is at __crypto_xor+0x20/0xa0
> >> [   11.572454] LR is at 0x10
> >>
> >> [   11.575080] pc : [<c0494a10>]    lr : [<00000010>]    psr: 20010113
> >>
> >> [   11.581369] sp : eb5f9a3c  ip : 676e6953  fp : eb5f9cec
> >>
> >> [   11.586611] r10: c0e05148  r9 : eb4a4e80  r8 : 00000010
> >>
> >> [   11.591853] r7 : 00000003  r6 : eb2e6000  r5 : fffffffc  r4 :
> >> eb2e6000
> >> [   11.598403] r3 : 00000010  r2 : 00000000  r1 : eb2e6000  r0 :
> >> eb2e6000
> >> [   11.604955] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
> >> Segment none
> >> [   11.612115] Control: 10c5387d  Table: abd0806a  DAC: 00000051
> >>
> >> [   11.617883] Process cryptomgr_test (pid: 979, stack limit =
> >> 0x99cee04c)
> >> [   11.624521] Stack: (0xeb5f9a3c to 0xeb5fa000)
> >>
> >> [   11.628891] 9a20:
> >>
> >>       00000010
> >>
> >> [   11.637101] 9a40: eb2e6000 eb2e6000 00000003 c04a45f8 edc12858
> >> eb2e6000 edc12
> >> 858 eb2e6000
> >>
> >> [   11.645310] 9a60: eb057020 00000000 00000010 eb057020 00000000
> >> 00000010 00000
> >> 000 00000000
> >>
> >> [   11.653519] 9a80: 00000000 00000000 00000000 00000000 00000010
> >> 00000000 00000
> >> 010 00000010
> >>
> >> [   11.661729] 9aa0: 00000000 09865966 eb5f9b00 eb22c400 c0e05148
> >> 00000003 00000
> >> 400 00000000
> >>
> >> [   11.669938] 9ac0: 00000400 bf18c4c0 00000000 00000000 00000000
> >> 00000000 00000
> >> 0b3 00000000
> >>
> >> [   11.678147] 9ae0: 00000000 00000001 00000001 00000001 00000000
> >> 00000000 00000
> >> 000 09865966
> >> [   11.686356] 9b00: 00000010 00000000 eb057020 eb057020 eb379800
> >> eb379940 00000
> >> 000 00000000
> >>
> >> [   11.694566] 9b20: eb4a4e80 00000400 0000084c 00000000 00000002
> >> 00000001 00000
> >> 000 00000001
> >>
> >> [   11.702774] 9b40: 00000000 c016e38c 00000129 00000000 00000000
> >> 00000001 00000
> >> 001 00000001
> >>
> >> [   11.710983] 9b60: eb379940 a8a2cc6a 00000002 09865966 c0a04b3c
> >> efd86300 eb245
> >> 7c0 efd862c0
> >>
> >> [   11.719193] 9b80: eb245900 a8d4a57d 00000002 00000000 eb5f9cf4
> >> c016ef74 00000
> >> 000 efd86300
> >>
> >> [   11.727402] 9ba0: 00000000 00000001 00000000 00000001 00000000
> >> c016e38c eb379
> >> 80c 09865966
> >>
> >> [   11.735611] 9bc0: efd86300 efd86300 eb21f240 efd862c0 eb21f380
> >> 00000000 eb5f9
> >> d20 eb2e6010
> >>
> >> [   11.743819] 9be0: c0e05148 eb2e6000 00000010 c04dfdd4 00000000
> >> 00000001 c08fb
> >> 4b8 00000000
> >>
> >> [   11.752028] 9c00: 00000020 00000020 eb2e6000 eb057000 c0e05148
> >> eb0570c0 00000
> >> 001 c049e5f8
> >>
> >> [   11.760237] 9c20: eb057000 00000000 00000000 00000010 00000000
> >> c0a2eca8 00000
> >> 010 efd862c0
> >>
> >> [   11.768446] 9c40: 2eff5000 eb21f1c0 eb245740 c0e0554c eb5f9c94
> >> ebe5c040 efd86
> >> 2c0 ebe5c000
> >>
> >> [   11.776656] 9c60: eb4a4e40 ebf65c80 c0a30694 00000000 00000000
> >> 09865966 c0a2e
> >> c9c 00000010
> >> [   11.784865] 9c80: c0a2ec9c eb057000 c0e05148 c0a2eca8 00000000
> >> 00000010 eb5f9
> >> cac c049e6fc
> >>
> >> [   11.793073] 9ca0: eb5f9cac 00000000 00000000 00000009 00000000
> >> 00000000 eb5f9
> >> d28 00000000
> >>
> >> [   11.801282] 9cc0: bf18f880 09865966 00000000 09865966 eb22c400
> >> eb057000 eb22c
> >> 400 c0a498f8
> >>
> >> [   11.809492] 9ce0: 00000000 eb5f9d28 c0a2ec9c c049f850 00000010
> >> eb5f9d20 00000
> >> 001 7fffffff
> >>
> >> [   11.817702] 9d00: 00000001 00000000 eb07e200 eb5f9e64 c0b7dc78
> >> eb20ccc0 00000
> >> 000 00000000
> >>
> >> [   11.825910] 9d20: c0b80cf4 00000010 00000000 00000000 eb5f9d30
> >> eb5f9d30 00000
> >> 000 00000001
> >>
> >> [   11.834119] 9d40: c0e05148 09865966 eb49e004 00000000 00000001
> >> 00000001 00000
> >> cc0 eb057168
> >>
> >> [   11.842328] 9d60: eb20cd00 eb07e280 00000001 c02963a4 00000000
> >> 0000000a 00000
> >> 000 00000000
> >>
> >> [   11.850536] 9d80: ffffffff 00000000 00000000 ffffffff 00000000
> >> eb1f2800 00000
> >> dc0 00000c30
> >>
> >> [   11.858746] 9da0: c0e763bc edc172e0 c0a2d3dc c015d2a4 00000cc0
> >> 09865966 ec800
> >> 180 eb5f9e64
> >>
> >> [   11.866954] 9dc0: c0b685b2 eb5f9e44 ffffffff c0b685b2 00000002
> >> eb5f9df4 c0aab
> >> 698 c08f6464
> >>
> >> [   11.875163] 9de0: ffffff0f ffff0a00 14a0619b eb5f9e64 bf18f8a8
> >> ffffff0f ffff0
> >> a00 09865966
> >> [   11.883373] 9e00: c0eac400 c0e05148 c0a498f8 eb07e200 eb07e200
> >> 00000001 eb22c
> >> 400 09865966
> >>
> >> [   11.891582] 9e20: c0a2d74c c0a2ec9c c0a498f8 c0a2f620 eb07e200
> >> 00000001 eb22c
> >> 400 eb057000
> >>
> >> [   11.899790] 9e40: c0a2d74c c049fef0 c0a2ec9c eb22c400 eb057000
> >> eb057180 00000
> >> 000 00000000
> >>
> >> [   11.907998] 9e60: eb057168 eb200030 eb07e280 c049d63c eb057000
> >> 09865966 eb07e
> >> 200 eb20ccc0
> >>
> >> [   11.916208] 9e80: eb22c400 eb07e200 eb057000 c0a2d74c eb20cd00
> >> eb07e280 c0a2d
> >> 3dc c04a1eb8
> >>
> >> [   11.924418] 9ea0: eb057000 00000000 c04a1e38 0000001b 00001185
> >> ffffffff c0e05
> >> 148 eb07e200
> >>
> >> [   11.932626] 9ec0: eb07e280 c049dff0 ecb29100 00000400 efd862c0
> >> ecb29080 c0e09
> >> ebc ffffffff
> >>
> >> [   11.940835] 9ee0: c08fb4b8 00000102 eb0c6018 efd862c0 ecb29080
> >> eb245740 ebca5
> >> 000 00000001
> >>
> >> [   11.949043] 9f00: 00000002 eb0c7b64 eb5f9f6c c08fb4b8 00000000
> >> eb0c7b60 00000
> >> 001 eb0c7b6c
> >>
> >> [   11.957251] 9f20: 00000000 2eff5000 c0a04adc c08fba14 eb245b90
> >> efd862c0 00000
> >> 000 00000000
> >> [   11.965460] 9f40: 00000000 09865966 eb0c7b64 eb245740 eb5f8000
> >> 09865966 ffffe
> >> 000 eb07e200
> >>
> >> [   11.973668] 9f60: 00000000 eb3f8b80 eb5f8000 eb07e200 c049d144
> >> eb0c7b64 eb22e
> >> 29c c049d184
> >>
> >> [   11.981877] 9f80: eb22e280 c015c708 00000001 eb3f8b80 c015c5fc
> >> 00000000 00000
> >> 000 00000000
> >>
> >> [   11.990086] 9fa0: 00000000 00000000 00000000 c01010e8 00000000
> >> 00000000 00000
> >> 000 00000000
> >>
> >> [   11.998294] 9fc0: 00000000 00000000 00000000 00000000 00000000
> >> 00000000 00000
> >> 000 00000000
> >>
> >> [   12.006502] 9fe0: 00000000 00000000 00000000 00000000 00000013
> >> 00000000 00000
> >> 000 00000000
> >>
> >> [   12.014721] [<c0494a10>] (__crypto_xor) from [<c04a45f8>]
> >> (crypto_cbc_encrypt
> >> +0xf4/0x13c)
> >>
> >> [   12.022945] [<c04a45f8>] (crypto_cbc_encrypt) from [<bf18c4c0>]
> >> (omap_aes_cry
> >> pt+0xc8/0x114 [omap_aes_driver])
> >>
> >> [   12.032924] [<bf18c4c0>] (omap_aes_crypt [omap_aes_driver]) from
> >> [<c049f850>]
> >>    (test_skcipher_vec_cfg+0x1c8/0x7e4)
> >>
> >> [   12.043228] [<c049f850>] (test_skcipher_vec_cfg) from [<c049fef0>]
> >> (test_skci
> >> pher+0x84/0xf0)
> >> [   12.051701] [<c049fef0>] (test_skcipher) from [<c04a1eb8>]
> >> (alg_test_skcipher
> >> +0x80/0x140)
> >>
> >> [   12.059912] [<c04a1eb8>] (alg_test_skcipher) from [<c049dff0>]
> >> (alg_test.part
> >> .8+0x8c/0x3a0)
> >>
> >> [   12.068297] [<c049dff0>] (alg_test.part.8) from [<c049d184>]
> >> (cryptomgr_test+
> >> 0x40/0x48)
> >>
> >> [   12.076336] [<c049d184>] (cryptomgr_test) from [<c015c708>]
> >> (kthread+0x10c/0x
> >> 148)
> >>
> >> [   12.083853] [<c015c708>] (kthread) from [<c01010e8>]
> >> (ret_from_fork+0x14/0x2c
> >> )
> >>
> >> [   12.091100] Exception stack(0xeb5f9fb0 to 0xeb5f9ff8)
> >>
> >> [   12.096169] 9fa0:                                     00000000
> >> 00000000 00000
> >> 000 00000000
> >>
> >> [   12.104378] 9fc0: 00000000 00000000 00000000 00000000 00000000
> >> 00000000 00000
> >> 000 00000000
> >>
> >> [   12.112593] 9fe0: 00000000 00000000 00000000 00000000 00000013
> >> 00000000
> >> [   12.119240] Code: e2425004 e1a0e003 e1a04000 e5b6c004 (e5b57004)
> >>
> >> [   12.125437] ---[ end trace 9b4a71e796035151 ]---
> >> --
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
