Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9011363629
	for <lists+linux-omap@lfdr.de>; Sun, 18 Apr 2021 16:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhDROue (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 18 Apr 2021 10:50:34 -0400
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:35205 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229986AbhDROud (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 18 Apr 2021 10:50:33 -0400
Received: from oxapps-37-174.iol.local ([10.101.8.220])
        by smtp-32.iol.local with ESMTPA
        id Y8kNlST74Bc6YY8kNlhE8V; Sun, 18 Apr 2021 16:50:04 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1618757404; bh=Z+gqUTa/4gMQqPDDlTPJPLQ3NTLR8D+V8mUSlwYrWVk=;
        h=From;
        b=TuUA58nLdKA6aeYyxRYJF11P1yqmwNKyB7l58BePnanSjKgVdg1UTnCQ9wBjzbtD+
         +9bsNHy4CZiI2jrLOAHjaEcChsOQrgp9yhGauu7NFd30SmcU0tCR/+iPuQYFmNEFgR
         M/Vdq2cX77HkwjqGYLoX96YOPXnz2tk1nMBZ06ndybnZCbKZz5X/qnnK200Ttzd99D
         mHMx/z0/d5DXizd9/TLfPAfErMUsNRfr7NgCh+e5KFV4N1NWxjbjQlYD5pQVc8bOYx
         l0b3Y1X1d8iSpLmytO9pK2eqlkWhvYxSaO+/f5AbZEuB5LV06rYigxoUIUiIxeTjD4
         xyARp7CalOKig==
X-CNFS-Analysis: v=2.4 cv=B6l8bMhM c=1 sm=1 tr=0 ts=607c471c cx=a_exe
 a=C8U9wQxWOnS4tgU1BwpF/g==:117 a=VYA5D5F8Gk0A:10 a=IkcTkHD0fZMA:10
 a=4ehuGOvBq5EA:10 a=VwQbUJbxAAAA:8 a=GAHydID9G1J-QwgOjSYA:9 a=QEXdDO2ut3YA:10
 a=5yUOnwQy5QICz8m5uxDm:22 a=AjGcO6oz07-iQ99wixmX:22
Date:   Sun, 18 Apr 2021 16:50:03 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Message-ID: <2042188966.804761.1618757403843@mail1.libero.it>
In-Reply-To: <b88d012a-b74c-6bd6-7465-3391921c9092@kernel.org>
References: <20210401193741.24639-1-dariobin@libero.it>
 <20210401193741.24639-6-dariobin@libero.it>
 <b88d012a-b74c-6bd6-7465-3391921c9092@kernel.org>
Subject: Re: [PATCH v4 5/5] clk: ti: add am33xx/am43xx spread spectrum clock
 support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 95.244.94.151
X-Originating-Client: open-xchange-appsuite
x-libjamsun: nKteNHKRVC0JswLz36FlhNqfco92qKV/
x-libjamv: oBRXhknxPSs=
X-CMAE-Envelope: MS4xfFdXTR9TX9SiBogFiIYPJz86nwESpkvlJtlOCFuX94yAjXSHV4ixugTVuxLMTsc1tFJksLu/QbUxmyfYMUawK2nFVe0FvAn0crfgtUHny6ElAdhmlhNg
 iR0KGr5ot/8efd5KQPcUGo0k28rbTfQitrdx6KdeV0s7xVXPkwgfUJP32VW4TBu0Lp9cMYRo3B8sjjsn77zmjH57mPmtQz3Yb3q50Xf8RqPx/FplxqOXpOEE
 KDoaVjxWzRxG8vqskjEt9sUYAldUZ7VssVJRJjQvOm4lRevapvrh01ewro3VbSMHT7t18OI/DgF1YsDsXrLElhBOCwdR0Oi2NB+GQE6xcs6CbKeDFGVqmRIn
 AoAdYM2N9x1u2TR9OXKJjanidu+rVwOOgNddQppmdAFWeHLKpcEUB9qGOzDbDBSws4S1fTVPblGUDps80SgwzvbLX8QFoA==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tero,

> Il 16/04/2021 14:43 Tero Kristo <kristo@kernel.org> ha scritto:
> 
>  
> Hi Dario,
> 
> Spent some time looking at this, had to read through the TRM chapter of 
> it also in quite detailed level to figure out how this is supposed to 
> work out.
> 
> Other than couple of minor nits below, the code seems ok to me. What is 
> the testing that has been done with this?

The patch has been tested with laboratory instrumentation and is currently 
used on a custom board based on a AM335x SOC with a TI 4.1.6 kernel. It was born 
from the need to reduce the electromagnetic emissions of the display to pass the
EMI certifications. The current patch is a port of that to the mainline kernel. 
The corrections to be made were minimal and not significant. I'm testing it on a 
beaglebone black board, verifying with devmem that the DPLL registers are correctly 
set.

> 
> On 01/04/2021 22:37, Dario Binacchi wrote:
> > The patch enables spread spectrum clocking (SSC) for MPU and LCD PLLs.
> > As reported by the TI spruh73x/spruhl7x RM, SSC is only supported for
> > the DISP/LCD and MPU PLLs on am33xx/am43xx. SSC is not supported for
> > DDR, PER, and CORE PLLs.
> > 
> > Calculating the required values and setting the registers accordingly
> > was taken from the set_mpu_spreadspectrum routine contained in the
> > arch/arm/mach-omap2/am33xx/clock_am33xx.c file of the u-boot project.
> > 
> > In locked condition, DPLL output clock = CLKINP *[M/N]. In case of
> > SSC enabled, the reference manual explains that there is a restriction
> > of range of M values. Since the omap2_dpll_round_rate routine attempts
> > to select the minimum possible N, the value of M obtained is not
> > guaranteed to be within the range required. With the new "ti,min-div"
> > parameter it is possible to increase N and consequently M to satisfy the
> > constraint imposed by SSC.
> > 
> > Signed-off-by: Dario Binacchi <dariobin@libero.it>
> > 
> > ---
> 
> <snip>
> 
> >   	/* REVISIT: Set ramp-up delay? */
> > diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
> > index c62f6fa6763d..cba093de62d8 100644
> > --- a/include/linux/clk/ti.h
> > +++ b/include/linux/clk/ti.h
> > @@ -63,6 +63,18 @@ struct clk_omap_reg {
> >    * @auto_recal_bit: bitshift of the driftguard enable bit in @control_reg
> >    * @recal_en_bit: bitshift of the PRM_IRQENABLE_* bit for recalibration IRQs
> >    * @recal_st_bit: bitshift of the PRM_IRQSTATUS_* bit for recalibration IRQs
> > + * @ssc_deltam_reg: register containing the DPLL SSC frequency spreading
> > + * @ssc_modfreq_reg: register containing the DPLL SSC modulation frequency
> > + * @ssc_modfreq_mant_mask: mask of the mantissa component in @ssc_modfreq_reg
> > + * @ssc_modfreq_exp_mask: mask of the exponent component in @ssc_modfreq_reg
> > + * @ssc_enable_mask: mask of the DPLL SSC enable bit in @control_reg
> > + * @ssc_ack_mask: mask of the DPLL SSC turned on/off bit in @control_reg
> > + * @ssc_downspread_mask: mask of the DPLL SSC low frequency only bit in
> > + *                       @control_reg
> > + * @ssc_modfreq: the DPLL SSC frequency modulation in kHz
> > + * @ssc_deltam: the DPLL SSC frequency spreading in permille (10th of percent)
> > + * @ssc_downspread: require the only low frequency spread of the DPLL in SSC
> > + *                   mode
> >    * @flags: DPLL type/features (see below)
> >    *
> >    * Possible values for @flags:
> > @@ -110,6 +122,18 @@ struct dpll_data {
> >   	u8			auto_recal_bit;
> >   	u8			recal_en_bit;
> >   	u8			recal_st_bit;
> > +	struct clk_omap_reg	ssc_deltam_reg;
> > +	struct clk_omap_reg	ssc_modfreq_reg;
> > +	u32			ssc_deltam_int_mask;
> > +	u32			ssc_deltam_frac_mask;
> > +	u32			ssc_modfreq_mant_mask;
> > +	u32			ssc_modfreq_exp_mask;
> > +	u32                     ssc_enable_mask;
> > +	u32                     ssc_ack_mask;
> 
> ssc_ack_mask is not used for anything in the code.

Ok, I will remove it.

> 
> > +	u32                     ssc_downspread_mask;
> > +	u32                     ssc_modfreq;
> > +	u32                     ssc_deltam;
> > +	u8                      ssc_downspread;
> 
> ssc_downspread should be boolean?

Yes.

Thanks and regards,
Dario

> 
> >   	u8			flags;
> >   };
> >   
> >
