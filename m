Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C566D3A13DE
	for <lists+linux-omap@lfdr.de>; Wed,  9 Jun 2021 14:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234193AbhFIMOU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Jun 2021 08:14:20 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:44668 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbhFIMOT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Jun 2021 08:14:19 -0400
Received: by mail-pf1-f169.google.com with SMTP id u18so18219314pfk.11
        for <linux-omap@vger.kernel.org>; Wed, 09 Jun 2021 05:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=6in0KS8562i1+20F6xukGSLvzhhZA9APUC3Q3j15qNk=;
        b=n7VphOlq0BPXmmvZJcDgro1p7Dy99uOAyAcmMZuvfLLKs2vyh7E1pELvCirXR0VDmf
         liXSYxRAQ/FK3qbJUP6QSjL2hKwjD5eLTGQ4JSHfBj6J54K6YmPmmrJoNNI7EgvSeYWj
         rg+BbDARhqrKx5Go3qyD+GNMNXVChdSn5dPQujwwSxTCa95etvxYeXGf6Y5gCF7B5URw
         VtZ/SGWLSmHO2HhuYvq+VZ4F4pmPU2Nb8N1tT/VnLGn0Gahi9lhWt3GJIyahoTbEjm1j
         iRxWBbOclvvAE0dXqsTJfFQ4Wu4GT22O0FU44vEcL57fl8LLP5l9swNpc/nqgAtRnbWI
         bdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=6in0KS8562i1+20F6xukGSLvzhhZA9APUC3Q3j15qNk=;
        b=JuRcBd80Yr7eQUhcWDdMzC+h/HsgEzGc82KGN6w/JErUr9KQD76ZIoF7U4rNOqWVXG
         c47k7gBI3kXvGI0k9uDy3gIsPShYJ5RfwiLndExc0p0S7wZV4BmEYqLfBiBh4mUz8Gja
         k4d6EyECVRrC+h/c217/qad66GCgG/9ac2gYAReCIcYeEZIbf0V8ZZiR8ZUn1JULuZWg
         RUKVSIHrV/P8nVIc/g4BoV+MLNsxpJ5wWrCa7eBn8FEGse/3plO6u/CmNGnMMhyzJMZb
         hKrnMK4BkOv2A2rSYMm9FPsSHUwFR5KK/aM3LEozqz3uRJQBImiuSmNvNQ2lW3GzAeYh
         S86g==
X-Gm-Message-State: AOAM530OJZAQVJIvNBoMDwAkhoR2raq//up2JQ8Kb8SsmoBzhIy/E6la
        9wZABbY63Tt7klMI3QoIbZY=
X-Google-Smtp-Source: ABdhPJxq3cX1gx1pFBzaOFTjSrZA8cgt9+s7guBONm0OlsTZ2QQ88grYHEt/JpI8GbBw5TzQ2uD/YQ==
X-Received: by 2002:a05:6a00:23cf:b029:2d5:302e:dc77 with SMTP id g15-20020a056a0023cfb02902d5302edc77mr4956356pfc.63.1623240684395;
        Wed, 09 Jun 2021 05:11:24 -0700 (PDT)
Received: from ?IPv6:2600:8800:6880:151:e96c:b08f:f60:8e7d? ([2600:8800:6880:151:e96c:b08f:f60:8e7d])
        by smtp.gmail.com with ESMTPSA id t12sm13957506pfc.133.2021.06.09.05.11.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jun 2021 05:11:23 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [EXTERNAL] OMAP2430 kernel hangs on ioremap of IVA2.1 addresses
From:   David Russell <david.russell73@gmail.com>
In-Reply-To: <YMBdt8dDdvySofuC@atomide.com>
Date:   Wed, 9 Jun 2021 05:11:22 -0700
Cc:     "Woodruff, Richard" <r-woodruff2@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7307CCC8-4052-45DF-B733-8752E2A8447E@gmail.com>
References: <E26ACA77-0F54-41BC-BA45-29B641A6BEA9@gmail.com>
 <cb562f9f798d4431a09f19e8efd24727@ti.com> <YMBdt8dDdvySofuC@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Good morning (where I am anyway),

Yeah it is definitely a dated part; it turns out the actual part is an =
OMAP2530, but it is effectively the same as the 2430 (not sure what the =
difference is but from a Linux perspective the 2430 works).  As I =
mentioned, the product has been around for a while (i.e., mid-2009) with =
a mature application (both ARM and DSP) that runs on Linux =
(2.6.28-omap1).  The company is moving forward with a new iteration of =
hardware that is still based on the 2530 (not sure why honestly) and =
they have requirements of BT and Wifi among other things.  Instead of =
trying to back port that functionality I thought it would be better to =
upgrade the kernel to mainline LTS.  In so doing I *have* noticed that =
the OMAP2xxx has some holes in the mainline, and I just figured that not =
many people use this part any more so regression testing of drivers has =
not been great.  I have been able to get past everything else (e.g., =
RFBI missing from mainline DISPC, USB DMA not working, device-tree =
mistakes on USB, etc.).

I am extremely grateful for this mailing list and people willing to =
respond to my question; thank you!  It turns out this particular problem =
was a bone-headed mistake on my part when porting the old DSP driver; =
previously there were calls to omap_readl() and omap_writel() to =
generically read or write some peripheral registers =E2=80=94 these no =
longer exist in the mainline so I had to ioremap the base of SYSC and =
PRCM.  I then created #define=E2=80=99s for some registers.  The =
original driver referenced the initialization from a GEL file =
(code-composer studio) similar to what Richard had suggested.  It turns =
out my #defines were off so the calls to reset the DSP were incorrect.

In the event anyone is interested, the sequence that works is:

        /* Configure boot mode 0 and boot address at the beginning of =
SDRAM */
        write_sysc_reg(e, SYSC_OCP1_IVA2_BOOTADDR, DSP_VADDR_START);
        write_sysc_reg(e, SYSC_OCP1_IVA2_BOOTMOD, 0x0);

        /* Release L3S reset and perhaps power-on reset (clear bit 1) at =
the same time */
        write_prcm_reg(e, PRCM_RM_RSTCTRL_DSP, 0x1);

This allowed me to initialize the DSP MMU, then download the DSP binary =
via request firmware, followed by:

        /* Release DSP from reset */
        write_prcm_reg(e, PRCM_RM_RSTCTRL_DSP, 0x0);

        val =3D read_prcm_reg(e, PRCM_CM_IDLEST_DSP);

        if (val & 1) {
                dev_info(dev, "DSP is active\n");
        } else {
                dev_info(dev, "DSP is NOT active\n");
        }

Again, thank you for your quick responses; very appreciated.  I intend =
on submitting some patches in the near future to address some of the =
previously mentioned 2430-holes, especially affecting the USB.

Regards,

Dave

> On Jun 8, 2021, at 11:20 PM, Tony Lindgren <tony@atomide.com> wrote:
>=20
> Hi,
>=20
> * Woodruff, Richard <r-woodruff2@ti.com> [210607 15:40]:
>> Guess: this bit in JTAG script used for IVA tests probably is missing =
and needs to be worked in.  The generic linux-omap clock code probably =
handles the IVA clock but maybe not the resets.
>>=20
>>   /*  Enable IVA-ss functional clock (set bit 0) */
>>   (*(int*)0x49006800) |=3D 0x1;
>>=20
>>   /* Release l3s_idle_req  */
>>   (*(int*)0x49006810) |=3D (1 << 1);
>>=20
>>   /* Release L3S reset and power-on reset (clear bit 1) at the same =
time */
>>   (*(int*)0x49006850) &=3D ~(( 1 << 1));
>=20
> Heh and I thought nobody is using 2430 any longer :)
>=20
> FYI, the current mainline kernel actually can deal with all that using
> reset driver and genpd, see for example commits:
>=20
> ae57d1558908 ("ARM: dts: Configure interconnect target module for dra7 =
iva")
> effe89e40037 ("soc: ti: omap-prm: Fix occasional abort on reset =
deassert for dra7 iva")
>=20
> Similar setup should also work for 2430 but needs the power domains
> configured for drivers/soc/ti/omap_prm.c at least for iva.
>=20
> David, I think what you're seeing is iva getting released from reset =
with
> an unconfigured MMU, and then the system will hang.
>=20
> Regards,
>=20
> Tony

