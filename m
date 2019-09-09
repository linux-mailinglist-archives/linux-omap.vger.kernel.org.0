Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45B9DADA0F
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 15:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbfIINhX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 09:37:23 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:40991 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfIINhX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 09:37:23 -0400
Received: by mail-io1-f65.google.com with SMTP id r26so28607681ioh.8;
        Mon, 09 Sep 2019 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yh5I34I3F+kfotLecJXxZJWCxaSx2fVhdlna36vlC/Q=;
        b=aMjYbIgkkBOM4kFGelnj0CRr0XsK616LuEIBdWHa9oQUjj0CAGINRicUeroEu9gczK
         S4rD+z3DtU83yn88vV/t8iPfliEYHa29cYU0+0KKObloJYilOTnlM/Sa+sVi1JW4J5pX
         v0E73NBQ8LSkMYfyRJSaimQ8uBE0hNloy9kq/q9JapEbnJa14f/df4kHpswzkb+F0E0A
         mC6ki7e6q674qnVL5OrCPCgG24lGF5mnBpC7x7j92FeFALc37r2hywEdPpj23cySjR2e
         C2QCUC47GcJrWxOMYvoXMUOXRn3zDs4IZsu3nCVxa6vYz3Bh9LoRSH1QKkvS2QfC0Axb
         jiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yh5I34I3F+kfotLecJXxZJWCxaSx2fVhdlna36vlC/Q=;
        b=dZ0ofNr2RoRbCp1QUews2YdPDblFzpjwFcbxD4A3PSx1r6Pb7r+103M2UvwUm6vcQh
         sk3rjBtdZQ1Y2TXaGuFmrPI8UKCvOxpzXALlg23coIlEnkRf7z4PJtufQnFWZW+f5O6M
         n8SBEEJMRct/siXFGGiane4I5Rqeu7rNL4+WeE7tC52n6U7K//7isAZhRUBLj+a2WGzr
         sWj6+MqHDUhjzo9TvW1CVzFJ5nLIRml3ED12dwFlTu+M3m7is6y903VTkrTDu5PZ9R9l
         RWXvwVUjMrq1tejm52GFxhGb/4wIlLafQpNmp1Ny9yg/pC6uZTpDB1Gr7due/zVsIW7a
         y1Jw==
X-Gm-Message-State: APjAAAUsvOec/cqkAlL7vCm3avJGxmSlJiJ1SYzEMWXkp96XKQizmisF
        lIpsMGtR3rzrCLskItkOMFKr7fpSglUNQf+2ieo=
X-Google-Smtp-Source: APXvYqyp7hx2ZCMIfDI5DkTtuxBM/fx0HuShxFbt9jNMkXe/jgYYg8kF8aWEGdXk2I4SrI2LI8SYRU+FTsVSCybZo4Y=
X-Received: by 2002:a6b:8e92:: with SMTP id q140mr4178546iod.205.1568036240538;
 Mon, 09 Sep 2019 06:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190828150037.2640-1-aford173@gmail.com> <20190905230443.GA52127@atomide.com>
 <CAHCN7xL0fbr=Sv+b=0AuGB1PPhAAFdAFLEd_iBM+ZMTkUw5sHQ@mail.gmail.com>
In-Reply-To: <CAHCN7xL0fbr=Sv+b=0AuGB1PPhAAFdAFLEd_iBM+ZMTkUw5sHQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 9 Sep 2019 08:37:09 -0500
Message-ID: <CAHCN7xL-Gfxe0qF5w7BUsHnyhcNNpmCnchdKErnmiqggXfsLWw@mail.gmail.com>
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

On Mon, Sep 9, 2019 at 7:13 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Thu, Sep 5, 2019 at 6:04 PM Tony Lindgren <tony@atomide.com> wrote:
> >
> > Hi,
> >
> > * Adam Ford <aford173@gmail.com> [190828 15:01]:
> > > The datasheet for the AM3517 shows the RNG is connected to L4.
> > > It shows the module address for the RNG is 0x480A0000, and it
> > > matches the omap2.dtsi description.  Since the driver can support
> > > omap2 and omap4, it seems reasonable to assume the omap3 would
> > > use the same core for the RNG.
> > >
> > > This RFC, mimics much of the omap2 hwmods on the OMAP3. It
> > > also adds the necessary clock for driving the RNG.  Unfortunately,
> > > it appears non-functional.  If anyone has any suggestions on how
> > > to finish the hwmod (or port it to the newer l4 device tree
> > > format), feedback is requested.
> >
> > Yup I'll take the bait :) The patch below seems to do the trick
> > for me on dm3730 based on translating your patch to probe with
> > ti-sysc.
> >
> > Not sure about 34xx, it seems we're missing rng_clk? Care
> > to give it a try and attempt simlar patches for 34xx and
> > 3517?
> >
> > At least I'm not needing the "ti,no-reset-on-init" property
> > that your patch has a comment for. Maybe that's needed on
> > some other omap3.
> >
> > Oh and this needs to default to status = "disabled" for
> > HS devices like n900 as it needs to use the omap3-rom-rng.
> >
> > Regards,
> >
> > Tony
> >
> > 8< -----------------------
> > diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
> > --- a/arch/arm/boot/dts/omap36xx.dtsi
> > +++ b/arch/arm/boot/dts/omap36xx.dtsi
> > @@ -140,6 +140,29 @@
> >                         };
> >                 };
> >
> > +               rng_target: target-module@480a0000 {
> > +                       compatible = "ti,sysc-omap2", "ti,sysc";
> > +                       reg = <0x480a003c 0x4>,
> > +                             <0x480a0040 0x4>,
> > +                             <0x480a0044 0x4>;
> > +                       reg-names = "rev", "sysc", "syss";
> > +                       ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
> > +                       ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> > +                                       <SYSC_IDLE_NO>;
> > +                       ti,syss-mask = <1>;
> > +                       clocks = <&rng_ick>;
> > +                       clock-names = "ick";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +                       ranges = <0 0x480a0000 0x2000>;
> > +
> > +                       rng: rng@0 {
> > +                               compatible = "ti,omap2-rng";
> > +                               reg = <0x0 0x2000>;
> > +                               interrupts = <52>;
> > +                       };
> > +               };
> > +

I applied this on 5.3 and it is working.  I assume the same is true in for-next.

Do you want to submit a formal patch?  I  can mark it as 'tested-by'
This really helps speed up the startup sequence on boards with sshd
because it delays for nearly 80 seconds waiting for entropy without
the hwrng.

adam
>
> Tony,
>
> Can you tell me what branch you're using?  I am not seeing the note
> below, so I am not exactly sure what version to base my testing.
>
> ada,
> >                 /*
> >                  * Note that the sysconfig register layout is a subset of the
> >                  * "ti,sysc-omap4" type register with just sidle and midle bits
