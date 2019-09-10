Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0FDAAEC85
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2019 15:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730590AbfIJN5D (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 09:57:03 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39055 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730520AbfIJN5C (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Sep 2019 09:57:02 -0400
Received: by mail-io1-f66.google.com with SMTP id d25so37699410iob.6;
        Tue, 10 Sep 2019 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WiJfk6BOQ9URkJhc4rYT7Cef+8bJjMR5zQiVGBcXf9o=;
        b=EaQ6O1eeHeZ7e7GTBRsUQWg0bCT0bWiASR2rd8VgF8uIcukRGqCjUT4xqUaQitnglP
         ikKMwnlv+rFHcNqG1QjFNIUF671pqNNZA1cTRemld56Mo9Yb0KgQUaxwKUQmYEjI3xzb
         bgPDPOCmqMm4tNNJARAMqwyX2+LDjYp/eoUgzQxbgyzFjobuIL72VnIStIc5nQQNQnUm
         HBQVADpd4FRbW4B2zS+Po85H1J8NVYdbjCVBf+xbi+43sXVnTKz1vWiFnCCMZVD7T8LM
         OuGERIu/ryG9zjMResmNKiNXB5DtgChrabikLFkbjwMycYzyye9mXOH/IvotpF5X5Iv3
         JlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WiJfk6BOQ9URkJhc4rYT7Cef+8bJjMR5zQiVGBcXf9o=;
        b=qj2vW8KHaFvFy2qR+6PjYGGhQFyEhRJ9I/+fT8ulykiapKQltCllbZMJ6FXBbqpwKa
         XErLIMUwJeiWGUzdXCaKi8b/Qr1gD/C6yx0cJmZwtUsN28cK7A+74/w9CVJTalNCl5yw
         UKi8iSyI9U0ddtf7wm4AzuXSc5DS91j2Yg6xURCdL5d9tmsASSPKfA4OMEb60pV/z3Pn
         But9NLTmuWuWqom7kVVEDgJlkuEg3FiC+ajJtHxl5yF6YAmYNOkACh5OtJwxKb1AvpjH
         SWjYgf6obSx+yJiBXX73bgz9QUibnM0pfEFG90HUcvMLVgtYM1F18T4yYEtimvVakcJg
         2yUg==
X-Gm-Message-State: APjAAAUoYRO08eG7rSXp5ddUEJ6ZMEeq6oy2XbJgOn1O+PHpo/skmvY8
        6zkZU1JMtDHE08YcKkUxTlLzrjskPeIcYvykyMHJ210cWPk=
X-Google-Smtp-Source: APXvYqwpbmj+9gSQ84cmL21PKzfeoORrvoHlfRtvKw1m73P5qmijzXxshrIRVofX574C/KBbdM2WpaAAorFjgcnQKac=
X-Received: by 2002:a05:6638:4b:: with SMTP id a11mr32038325jap.0.1568123821449;
 Tue, 10 Sep 2019 06:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190828150037.2640-1-aford173@gmail.com> <20190905230443.GA52127@atomide.com>
In-Reply-To: <20190905230443.GA52127@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 10 Sep 2019 08:56:49 -0500
Message-ID: <CAHCN7xKxffJUV2V2CCuw0iPqUm4LJT28GMrcF2=8rDJQM2dOOw@mail.gmail.com>
Subject: Re: [RFC] ARM: omap3: Enable HWMODS for HW Random Number Generator
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <adam.ford@logicpd.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Paul Walmsley <paul@pwsan.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Sep 5, 2019 at 6:04 PM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi,
>
> * Adam Ford <aford173@gmail.com> [190828 15:01]:
> > The datasheet for the AM3517 shows the RNG is connected to L4.
> > It shows the module address for the RNG is 0x480A0000, and it
> > matches the omap2.dtsi description.  Since the driver can support
> > omap2 and omap4, it seems reasonable to assume the omap3 would
> > use the same core for the RNG.
> >
> > This RFC, mimics much of the omap2 hwmods on the OMAP3. It
> > also adds the necessary clock for driving the RNG.  Unfortunately,
> > it appears non-functional.  If anyone has any suggestions on how
> > to finish the hwmod (or port it to the newer l4 device tree
> > format), feedback is requested.
>
> Yup I'll take the bait :) The patch below seems to do the trick
> for me on dm3730 based on translating your patch to probe with
> ti-sysc.
>
> Not sure about 34xx, it seems we're missing rng_clk? Care
> to give it a try and attempt simlar patches for 34xx and
> 3517?
>

I took the block you added to omap36xx and copied it to omap34xx.
Since this is present in the omap2.dtsi, I wonder if it could be used
at the omap3.dtsi level instead of am3517, omap34xx and omap36xx.
What is not clear to me is the clocking architecture needed.  The
omap34xx-omap36xx-clocks.dtsi have the  aes1, rng_ick, sha1, and des1
setup which appears to be present in the am3517 based on that
datasheet, but they are all dependent on the security_l4_ick2 which is
not defined for am35.  I wonder if all these could move to omap3 and
its respective clock file.  Duplicating it in 3x locations doesn't
seem to make sense, but I don't have every permutation of omap3 to
know, and those features are not clearly documented.

I have it working on an omap3530:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.3.0-rc8-00009-gaa2f12f5625a-dirty
(aford@aford-OptiPlex-7050) (gcc version 8.3.0 (Buildroot
2019.02.4-00056-gb0868303cf)) #11 SMP Mon Sep 9 13:59:31 CDT 2019
[    0.000000] CPU: ARMv7 Processor [411fc083] revision 3 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT
nonaliasing instruction cache
[    0.000000] OF: fdt: Machine model: LogicPD Zoom OMAP35xx SOM-LV
Development Kit
...snip...

[    0.000000] OMAP3430/3530 ES3.1 (l2cache iva sgx neon isp)

... snip...

[    0.000000] random: get_random_bytes called from
start_kernel+0x2e8/0x514 with crng_init=0
[    2.573120] random: fast init done
[    5.172821] random: udevd: uninitialized urandom read (16 bytes read)
[    5.182922] random: udevd: uninitialized urandom read (16 bytes read)
[    5.190460] random: udevd: uninitialized urandom read (16 bytes read)
[    7.739837] omap_rng 480a0000.rng: Random Number Generator ver. 70
[    7.747283] random: crng init done
[    7.750793] random: 1 urandom warning(s) missed due to ratelimiting

And hexdump  is working on both /dev/hwrng and /dev/random
I have not been able to replicate the issue you mentioned about it
dying after a few reads and/or rmmod-modprobe cycles.


> At least I'm not needing the "ti,no-reset-on-init" property
> that your patch has a comment for. Maybe that's needed on
> some other omap3.

The hwmod I used was a copy-paste from omap2, so it might not be
needed in omap3's at all.

>
> Oh and this needs to default to status = "disabled" for
> HS devices like n900 as it needs to use the omap3-rom-rng.

I don't know enough about the HS version of the OMAP3, but what's the
main difference between omap3-rom-rng and this one?

adam
>
> Regards,
>
> Tony
>
> 8< -----------------------
> diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
> --- a/arch/arm/boot/dts/omap36xx.dtsi
> +++ b/arch/arm/boot/dts/omap36xx.dtsi
> @@ -140,6 +140,29 @@
>                         };
>                 };
>
> +               rng_target: target-module@480a0000 {
> +                       compatible = "ti,sysc-omap2", "ti,sysc";
> +                       reg = <0x480a003c 0x4>,
> +                             <0x480a0040 0x4>,
> +                             <0x480a0044 0x4>;
> +                       reg-names = "rev", "sysc", "syss";
> +                       ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
> +                       ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +                                       <SYSC_IDLE_NO>;
> +                       ti,syss-mask = <1>;
> +                       clocks = <&rng_ick>;
> +                       clock-names = "ick";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0x480a0000 0x2000>;
> +
> +                       rng: rng@0 {
> +                               compatible = "ti,omap2-rng";
> +                               reg = <0x0 0x2000>;
> +                               interrupts = <52>;
> +                       };
> +               };
> +
>                 /*
>                  * Note that the sysconfig register layout is a subset of the
>                  * "ti,sysc-omap4" type register with just sidle and midle bits
