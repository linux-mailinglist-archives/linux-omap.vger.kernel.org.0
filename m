Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83747ADA23
	for <lists+linux-omap@lfdr.de>; Mon,  9 Sep 2019 15:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730558AbfIINkk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Sep 2019 09:40:40 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36612 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbfIINkj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Sep 2019 09:40:39 -0400
Received: by mail-wm1-f68.google.com with SMTP id p13so14774165wmh.1;
        Mon, 09 Sep 2019 06:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=uU5JBRHXIvx/8FJrzT3Q8CzzXnkxCEsE/V9AOb2mS4I=;
        b=GJ+dgc+rY09904fO5gRxx6o63f0twPMfDJSQdqowLkOjfgAXLFQCemSI2tCdamoI0F
         PK/16ehPFz8eZ1J+/to26wtJpYeny8zIx3HweIIfUZDuzVkQcEiUEmQrnxzoy8QvnKUj
         ogiVG2aAYw23JVQDI4CXFpfkoYvN06e3FEonUTDVBPbJLpJH5B9h2DsBpEY049QpMrIA
         zdrhsg4SsRkqUhioUfsP+4UVph7LI0kKasz0lE3f7JPKuLNkGw54V/6KwOO87hOnICZj
         GVaLCF8Vot3aD0lBr2IHng4BNbweksp6XRbO05QV/tMj6PG/IpFu0eMm8MorVzjObnxq
         J8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=uU5JBRHXIvx/8FJrzT3Q8CzzXnkxCEsE/V9AOb2mS4I=;
        b=OVdCkTikOtD3xfrK51rcgGPkEm2ac527O/GlYZc2utv5fOXGBW1yDC0zPjvU0CqVWI
         00M7l8N/53zPvVU1P7jnAsmkAJFzgWqKxOAOKPdcx2Q8Ne7UOVkBR0LXJuAspDhjgwfj
         F7ieHqSZpQ4lgNftVMgk3e4ghnJ+UD4nVMLDbOwxQvrB/LlOgyH7C1r129GMN/5y5uRf
         Tq+ACko0ZieZCKq5Ikn5s+V/WIFWqHB0Anb34fbqmxurYo6RIzas2CGftPE1ildwX99X
         YxaKEtTQTr3QHZ2Ne/xvGIIv0G+u549EY63I9q4MYr8i5OyBkjPC18up/4CWtujc1NhH
         ZjXw==
X-Gm-Message-State: APjAAAUn8qp+54MF5wkXmfDJMPY4D1ukfdOUWr2TLEJQUVibe8sxgAtD
        T8yJFhYz3hzgir+B3nOcYCM=
X-Google-Smtp-Source: APXvYqxHaF/yMZggxxln8G4flQD0InZGwOQ1ivuk3uCKtnT1meqyiO91xNlY2j5uvD1R7UsJvqTdjg==
X-Received: by 2002:a1c:a404:: with SMTP id n4mr18354841wme.137.1568036436379;
        Mon, 09 Sep 2019 06:40:36 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id g201sm20586327wmg.34.2019.09.09.06.40.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2019 06:40:35 -0700 (PDT)
Date:   Mon, 9 Sep 2019 15:40:33 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <adam.ford@logicpd.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Paul Walmsley <paul@pwsan.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC] ARM: omap3: Enable HWMODS for HW Random Number Generator
Message-ID: <20190909134033.s26eiurpat3iekse@pali>
References: <20190828150037.2640-1-aford173@gmail.com>
 <20190905230443.GA52127@atomide.com>
 <CAHCN7xL0fbr=Sv+b=0AuGB1PPhAAFdAFLEd_iBM+ZMTkUw5sHQ@mail.gmail.com>
 <CAHCN7xL-Gfxe0qF5w7BUsHnyhcNNpmCnchdKErnmiqggXfsLWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xL-Gfxe0qF5w7BUsHnyhcNNpmCnchdKErnmiqggXfsLWw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Monday 09 September 2019 08:37:09 Adam Ford wrote:
> On Mon, Sep 9, 2019 at 7:13 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Thu, Sep 5, 2019 at 6:04 PM Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > Hi,
> > >
> > > * Adam Ford <aford173@gmail.com> [190828 15:01]:
> > > > The datasheet for the AM3517 shows the RNG is connected to L4.
> > > > It shows the module address for the RNG is 0x480A0000, and it
> > > > matches the omap2.dtsi description.  Since the driver can support
> > > > omap2 and omap4, it seems reasonable to assume the omap3 would
> > > > use the same core for the RNG.
> > > >
> > > > This RFC, mimics much of the omap2 hwmods on the OMAP3. It
> > > > also adds the necessary clock for driving the RNG.  Unfortunately,
> > > > it appears non-functional.  If anyone has any suggestions on how
> > > > to finish the hwmod (or port it to the newer l4 device tree
> > > > format), feedback is requested.
> > >
> > > Yup I'll take the bait :) The patch below seems to do the trick
> > > for me on dm3730 based on translating your patch to probe with
> > > ti-sysc.
> > >
> > > Not sure about 34xx, it seems we're missing rng_clk? Care
> > > to give it a try and attempt simlar patches for 34xx and
> > > 3517?
> > >
> > > At least I'm not needing the "ti,no-reset-on-init" property
> > > that your patch has a comment for. Maybe that's needed on
> > > some other omap3.
> > >
> > > Oh and this needs to default to status = "disabled" for
> > > HS devices like n900 as it needs to use the omap3-rom-rng.
> > >
> > > Regards,
> > >
> > > Tony
> > >
> > > 8< -----------------------
> > > diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
> > > --- a/arch/arm/boot/dts/omap36xx.dtsi
> > > +++ b/arch/arm/boot/dts/omap36xx.dtsi
> > > @@ -140,6 +140,29 @@
> > >                         };
> > >                 };
> > >
> > > +               rng_target: target-module@480a0000 {
> > > +                       compatible = "ti,sysc-omap2", "ti,sysc";
> > > +                       reg = <0x480a003c 0x4>,
> > > +                             <0x480a0040 0x4>,
> > > +                             <0x480a0044 0x4>;
> > > +                       reg-names = "rev", "sysc", "syss";
> > > +                       ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
> > > +                       ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> > > +                                       <SYSC_IDLE_NO>;
> > > +                       ti,syss-mask = <1>;
> > > +                       clocks = <&rng_ick>;
> > > +                       clock-names = "ick";
> > > +                       #address-cells = <1>;
> > > +                       #size-cells = <1>;
> > > +                       ranges = <0 0x480a0000 0x2000>;
> > > +
> > > +                       rng: rng@0 {
> > > +                               compatible = "ti,omap2-rng";
> > > +                               reg = <0x0 0x2000>;
> > > +                               interrupts = <52>;
> > > +                       };
> > > +               };
> > > +
> 
> I applied this on 5.3 and it is working.  I assume the same is true in for-next.
> 
> Do you want to submit a formal patch?  I  can mark it as 'tested-by'
> This really helps speed up the startup sequence on boards with sshd
> because it delays for nearly 80 seconds waiting for entropy without
> the hwrng.

Hi! When applying a patch, could you please disable this rng for n900?

In omap3-n900.dts for rng should be status = "disabled" (as Tony already
wrote), similarly like for aes.

Thanks!

> adam
> >
> > Tony,
> >
> > Can you tell me what branch you're using?  I am not seeing the note
> > below, so I am not exactly sure what version to base my testing.
> >
> > ada,
> > >                 /*
> > >                  * Note that the sysconfig register layout is a subset of the
> > >                  * "ti,sysc-omap4" type register with just sidle and midle bits

-- 
Pali Rohár
pali.rohar@gmail.com
