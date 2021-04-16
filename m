Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18F7362008
	for <lists+linux-omap@lfdr.de>; Fri, 16 Apr 2021 14:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242826AbhDPMoR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Apr 2021 08:44:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:34054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233916AbhDPMoM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 16 Apr 2021 08:44:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C630761107;
        Fri, 16 Apr 2021 12:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618577027;
        bh=oMN+Rlt12ndCbHJtP/UKi3IFuOfxmSEY0U7Ig87hsUw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=e3kULCrMHEwHUvtymYCy+3Ba9HRgWBsJ5hZwmce+xKW/V9Pv8g/xNk7PF7DJyDql9
         piBgMah+1N5w6vufMdMXc5kbx59VYeF6WOVnS2enLk7Zf905sY92SUMotEyikUv52p
         dhtc826AuWt/zuy+sk4SDRFgAZEXyt7ngu2Zx+qTs5FxjnUX2g/sLrEtw1DJqN6UnI
         Iuf2D2FZWe+0Urf2omIbC5o4yigTYeqEdAfhir+XqtqYZN6xu0IOGbCkrjden+pGid
         YgwoEUuQ4JkiDhPyk7Wx2WCOWMdbfTS2fNrD+Di6a+MEBO4cX/J3namvo2xJRyjapD
         LdbdnEgqpkdPA==
Subject: Re: [PATCH v4 5/5] clk: ti: add am33xx/am43xx spread spectrum clock
 support
To:     Dario Binacchi <dariobin@libero.it>, linux-kernel@vger.kernel.org
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
References: <20210401193741.24639-1-dariobin@libero.it>
 <20210401193741.24639-6-dariobin@libero.it>
From:   Tero Kristo <kristo@kernel.org>
Message-ID: <b88d012a-b74c-6bd6-7465-3391921c9092@kernel.org>
Date:   Fri, 16 Apr 2021 15:43:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210401193741.24639-6-dariobin@libero.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Dario,

Spent some time looking at this, had to read through the TRM chapter of 
it also in quite detailed level to figure out how this is supposed to 
work out.

Other than couple of minor nits below, the code seems ok to me. What is 
the testing that has been done with this?

On 01/04/2021 22:37, Dario Binacchi wrote:
> The patch enables spread spectrum clocking (SSC) for MPU and LCD PLLs.
> As reported by the TI spruh73x/spruhl7x RM, SSC is only supported for
> the DISP/LCD and MPU PLLs on am33xx/am43xx. SSC is not supported for
> DDR, PER, and CORE PLLs.
> 
> Calculating the required values and setting the registers accordingly
> was taken from the set_mpu_spreadspectrum routine contained in the
> arch/arm/mach-omap2/am33xx/clock_am33xx.c file of the u-boot project.
> 
> In locked condition, DPLL output clock = CLKINP *[M/N]. In case of
> SSC enabled, the reference manual explains that there is a restriction
> of range of M values. Since the omap2_dpll_round_rate routine attempts
> to select the minimum possible N, the value of M obtained is not
> guaranteed to be within the range required. With the new "ti,min-div"
> parameter it is possible to increase N and consequently M to satisfy the
> constraint imposed by SSC.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> 
> ---

<snip>

>   	/* REVISIT: Set ramp-up delay? */
> diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
> index c62f6fa6763d..cba093de62d8 100644
> --- a/include/linux/clk/ti.h
> +++ b/include/linux/clk/ti.h
> @@ -63,6 +63,18 @@ struct clk_omap_reg {
>    * @auto_recal_bit: bitshift of the driftguard enable bit in @control_reg
>    * @recal_en_bit: bitshift of the PRM_IRQENABLE_* bit for recalibration IRQs
>    * @recal_st_bit: bitshift of the PRM_IRQSTATUS_* bit for recalibration IRQs
> + * @ssc_deltam_reg: register containing the DPLL SSC frequency spreading
> + * @ssc_modfreq_reg: register containing the DPLL SSC modulation frequency
> + * @ssc_modfreq_mant_mask: mask of the mantissa component in @ssc_modfreq_reg
> + * @ssc_modfreq_exp_mask: mask of the exponent component in @ssc_modfreq_reg
> + * @ssc_enable_mask: mask of the DPLL SSC enable bit in @control_reg
> + * @ssc_ack_mask: mask of the DPLL SSC turned on/off bit in @control_reg
> + * @ssc_downspread_mask: mask of the DPLL SSC low frequency only bit in
> + *                       @control_reg
> + * @ssc_modfreq: the DPLL SSC frequency modulation in kHz
> + * @ssc_deltam: the DPLL SSC frequency spreading in permille (10th of percent)
> + * @ssc_downspread: require the only low frequency spread of the DPLL in SSC
> + *                   mode
>    * @flags: DPLL type/features (see below)
>    *
>    * Possible values for @flags:
> @@ -110,6 +122,18 @@ struct dpll_data {
>   	u8			auto_recal_bit;
>   	u8			recal_en_bit;
>   	u8			recal_st_bit;
> +	struct clk_omap_reg	ssc_deltam_reg;
> +	struct clk_omap_reg	ssc_modfreq_reg;
> +	u32			ssc_deltam_int_mask;
> +	u32			ssc_deltam_frac_mask;
> +	u32			ssc_modfreq_mant_mask;
> +	u32			ssc_modfreq_exp_mask;
> +	u32                     ssc_enable_mask;
> +	u32                     ssc_ack_mask;

ssc_ack_mask is not used for anything in the code.

> +	u32                     ssc_downspread_mask;
> +	u32                     ssc_modfreq;
> +	u32                     ssc_deltam;
> +	u8                      ssc_downspread;

ssc_downspread should be boolean?

>   	u8			flags;
>   };
>   
> 

