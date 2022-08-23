Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25D0159D75D
	for <lists+linux-omap@lfdr.de>; Tue, 23 Aug 2022 11:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348587AbiHWJRN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Aug 2022 05:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349805AbiHWJQR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Aug 2022 05:16:17 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B92D876A8
        for <linux-omap@vger.kernel.org>; Tue, 23 Aug 2022 01:32:32 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id a4so16101056wrq.1
        for <linux-omap@vger.kernel.org>; Tue, 23 Aug 2022 01:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=CiFtspK/ExyXSouUsQEPofgiClgNIuBW6QTuv7vJaOo=;
        b=pz76wtSNohD1LY+dFWn9+lk+j2q22sZBCJgOHDS65ljA/vRa9H+1bnuTxk8po7aPZh
         GJraTLzU52OjRi1PNrlRFc+pEiy1g+73FY7xovAjBUlEyEbU0USKAlKWXJ5Leoh+TNv9
         FFfmim9Sn7ij8goTP2BOENP7Yqmz1Ge31sB8ZrHVoc9qgAoCIx5nRL6k5ykuVMq6q84u
         HTMV/wFLnNUnrJTdZDmg9GkS2BfC65sWTaK0c2mc8jqS42LePMXIUVOus3FP17H3b+Qw
         03feD//YQD5sUu5N/Yj1BfojQlwkJndFBl4bJkcXOLW+p2MLPgqkVGvJyVl3g7vdM1yl
         EdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=CiFtspK/ExyXSouUsQEPofgiClgNIuBW6QTuv7vJaOo=;
        b=09bOjgZGkdDWvLKIffQDkjBDQifoYPxmMtQ6UNP8k+FrkZOT1+nRz8Ht9M2LlrT7NJ
         GJn05xos9V5d9mcrOPw6FSCso6QXxL7hrVqsmp+ArL+jhoWzB5siUF2LgI/IssWdMk8e
         8hDmE/gEhKaKXmEGEBTNAxy+aMwZ7cbhgLd8aeIqgBws6YsTIDe+8KXfLnrp9pBjQnrZ
         WCTVWve8jhs7nBvxhzoYgbOlNkdJr+gCw7erQC0bnTszziuqiwC3LVIaW6KttnzlMW63
         tNSb6eT0LzioP7memWSSXv+crJJSOy0SwtZScafgrc+LVKku7hzi3McEP+WgLCOhU3y4
         x5tg==
X-Gm-Message-State: ACgBeo1INn2L4hfUUJDKWTd+K0fArWed6uC6iBK3hVrqeV6dezCq5ZD1
        k4JDhRh41ZY2quY6hx0kNVFY9QU8ciPwwQ==
X-Google-Smtp-Source: AA6agR5tzFyao8BsOvkxJURLv/cSrhE+Ad4C+bqFWrEOcJ55Wf+iz8+4fnL/ZaeDpvz9gB+TnWeFMA==
X-Received: by 2002:adf:dc90:0:b0:225:3a6a:18ca with SMTP id r16-20020adfdc90000000b002253a6a18camr9922828wrj.415.1661243548898;
        Tue, 23 Aug 2022 01:32:28 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id e20-20020a5d5954000000b0021e42e7c7dbsm13724776wri.83.2022.08.23.01.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 01:32:28 -0700 (PDT)
Message-ID: <2404bcc0-d01c-1ff1-6ea1-bfdef38cb64e@smile.fr>
Date:   Tue, 23 Aug 2022 10:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ARM: dts: Use clock-output-names for dra7
Content-Language: fr
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        U-Boot Mailing List <u-boot@lists.denx.de>
Cc:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>, s-anna@ti.com
References: <20220204080842.40673-1-tony@atomide.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220204080842.40673-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

Le 04/02/2022 à 09:08, Tony Lindgren a écrit :
> With the TI clocks supporting the use of clock-output-names devicetree
> property, we no longer need to use non-standard node names for clocks.
> 
> Depends-on: 31aa7056bbec ("ARM: dts: Don't use legacy clock defines for dra7 clkctrl")
> Depends-on: 9206a3af4fc0 ("clk: ti: Move dra7 clock devices out of the legacy section")
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Tero Kristo <kristo@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

With this patch applied, u-boot triggers a new warning while applying clock fixup:

ft_fixup_clocks failed for DSP voltage domain: <valid offset/length>

Indeed, such fixup seems still using legacy clock names:

const char *dra7_opp_dsp_clk_names[OPP_DSP_CLK_NUM] = {
	"dpll_dsp_ck",
	"dpll_dsp_m2_ck",
	"dpll_dsp_m3x2_ck",
};

const char *dra7_opp_iva_clk_names[OPP_IVA_CLK_NUM] = {
	"dpll_iva_ck",
	"dpll_iva_m2_ck",
};

const char *dra7_opp_gpu_clk_names[OPP_GPU_CLK_NUM] = {
	"dpll_gpu_ck",
	"dpll_gpu_m2_ck",
};

See:
https://source.denx.de/u-boot/u-boot/-/blob/v2022.10-rc3/arch/arm/mach-omap2/omap5/fdt.c#L209


Before:
dpll_dsp_ck@234 {
        #clock-cells = <0x00>;
        compatible = "ti,omap4-dpll-clock";
        clocks = <0x16 0x24>;
        reg = <0x234 0x238 0x240 0x23c>;
        assigned-clocks = <0x25>;
        assigned-clock-rates = <0x23c34600>;
        phandle = <0x25>;
};

After:
clock@234 {
        #clock-cells = <0x00>;
        compatible = "ti,omap4-dpll-clock";
        clock-output-names = "dpll_dsp_ck";
        clocks = <0x16 0x24>;
        reg = <0x234 0x238 0x240 0x23c>;
        assigned-clocks = <0x25>;
        assigned-clock-rates = <0x23c34600>;
        phandle = <0x25>;
};

Is there any pending patch for uboot ?

Best regards,
Romain


> ---
>  arch/arm/boot/dts/dra7xx-clocks.dtsi | 693 ++++++++++++++++++---------
>  1 file changed, 462 insertions(+), 231 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7xx-clocks.dtsi b/arch/arm/boot/dts/dra7xx-clocks.dtsi
> --- a/arch/arm/boot/dts/dra7xx-clocks.dtsi
> +++ b/arch/arm/boot/dts/dra7xx-clocks.dtsi
> @@ -5,210 +5,244 @@
>   * Copyright (C) 2013 Texas Instruments, Inc.
>   */
>  &cm_core_aon_clocks {
> -	atl_clkin0_ck: atl_clkin0_ck {
> +	atl_clkin0_ck: clock-atl-clkin0 {
>  		#clock-cells = <0>;
>  		compatible = "ti,dra7-atl-clock";
> +		clock-output-names = "atl_clkin0_ck";
>  		clocks = <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 26>;
>  	};
>  
> -	atl_clkin1_ck: atl_clkin1_ck {
> +	atl_clkin1_ck: clock-atl-clkin1 {
>  		#clock-cells = <0>;
>  		compatible = "ti,dra7-atl-clock";
> +		clock-output-names = "atl_clkin1_ck";
>  		clocks = <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 26>;
>  	};
>  
> -	atl_clkin2_ck: atl_clkin2_ck {
> +	atl_clkin2_ck: clock-atl-clkin2 {
>  		#clock-cells = <0>;
>  		compatible = "ti,dra7-atl-clock";
> +		clock-output-names = "atl_clkin2_ck";
>  		clocks = <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 26>;
>  	};
>  
> -	atl_clkin3_ck: atl_clkin3_ck {
> +	atl_clkin3_ck: clock-atl-clkin3 {
>  		#clock-cells = <0>;
>  		compatible = "ti,dra7-atl-clock";
> +		clock-output-names = "atl_clkin3_ck";
>  		clocks = <&atl_clkctrl DRA7_ATL_ATL_CLKCTRL 26>;
>  	};
>  
> -	hdmi_clkin_ck: hdmi_clkin_ck {
> +	hdmi_clkin_ck: clock-hdmi-clkin {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "hdmi_clkin_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	mlb_clkin_ck: mlb_clkin_ck {
> +	mlb_clkin_ck: clock-mlb-clkin {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "mlb_clkin_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	mlbp_clkin_ck: mlbp_clkin_ck {
> +	mlbp_clkin_ck: clock-mlbp-clkin {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "mlbp_clkin_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	pciesref_acs_clk_ck: pciesref_acs_clk_ck {
> +	pciesref_acs_clk_ck: clock-pciesref-acs {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "pciesref_acs_clk_ck";
>  		clock-frequency = <100000000>;
>  	};
>  
> -	ref_clkin0_ck: ref_clkin0_ck {
> +	ref_clkin0_ck: clock-ref-clkin0 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "ref_clkin0_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	ref_clkin1_ck: ref_clkin1_ck {
> +	ref_clkin1_ck: clock-ref-clkin1 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "ref_clkin1_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	ref_clkin2_ck: ref_clkin2_ck {
> +	ref_clkin2_ck: clock-ref-clkin2 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "ref_clkin2_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	ref_clkin3_ck: ref_clkin3_ck {
> +	ref_clkin3_ck: clock-ref-clkin3 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "ref_clkin3_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	rmii_clk_ck: rmii_clk_ck {
> +	rmii_clk_ck: clock-rmii {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "rmii_clk_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	sdvenc_clkin_ck: sdvenc_clkin_ck {
> +	sdvenc_clkin_ck: clock-sdvenc-clkin {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "sdvenc_clkin_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	secure_32k_clk_src_ck: secure_32k_clk_src_ck {
> +	secure_32k_clk_src_ck: clock-secure-32k-clk-src {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "secure_32k_clk_src_ck";
>  		clock-frequency = <32768>;
>  	};
>  
> -	sys_clk32_crystal_ck: sys_clk32_crystal_ck {
> +	sys_clk32_crystal_ck: clock-sys-clk32-crystal {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "sys_clk32_crystal_ck";
>  		clock-frequency = <32768>;
>  	};
>  
> -	sys_clk32_pseudo_ck: sys_clk32_pseudo_ck {
> +	sys_clk32_pseudo_ck: clock-sys-clk32-pseudo {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "sys_clk32_pseudo_ck";
>  		clocks = <&sys_clkin1>;
>  		clock-mult = <1>;
>  		clock-div = <610>;
>  	};
>  
> -	virt_12000000_ck: virt_12000000_ck {
> +	virt_12000000_ck: clock-virt-12000000 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "virt_12000000_ck";
>  		clock-frequency = <12000000>;
>  	};
>  
> -	virt_13000000_ck: virt_13000000_ck {
> +	virt_13000000_ck: clock-virt-13000000 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "virt_13000000_ck";
>  		clock-frequency = <13000000>;
>  	};
>  
> -	virt_16800000_ck: virt_16800000_ck {
> +	virt_16800000_ck: clock-virt-16800000 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "virt_16800000_ck";
>  		clock-frequency = <16800000>;
>  	};
>  
> -	virt_19200000_ck: virt_19200000_ck {
> +	virt_19200000_ck: clock-virt-19200000 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "virt_19200000_ck";
>  		clock-frequency = <19200000>;
>  	};
>  
> -	virt_20000000_ck: virt_20000000_ck {
> +	virt_20000000_ck: clock-virt-20000000 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "virt_20000000_ck";
>  		clock-frequency = <20000000>;
>  	};
>  
> -	virt_26000000_ck: virt_26000000_ck {
> +	virt_26000000_ck: clock-virt-26000000 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "virt_26000000_ck";
>  		clock-frequency = <26000000>;
>  	};
>  
> -	virt_27000000_ck: virt_27000000_ck {
> +	virt_27000000_ck: clock-virt-27000000 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "virt_27000000_ck";
>  		clock-frequency = <27000000>;
>  	};
>  
> -	virt_38400000_ck: virt_38400000_ck {
> +	virt_38400000_ck: clock-virt-38400000 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "virt_38400000_ck";
>  		clock-frequency = <38400000>;
>  	};
>  
> -	sys_clkin2: sys_clkin2 {
> +	sys_clkin2: clock-sys-clkin2 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "sys_clkin2";
>  		clock-frequency = <22579200>;
>  	};
>  
> -	usb_otg_clkin_ck: usb_otg_clkin_ck {
> +	usb_otg_clkin_ck: clock-usb-otg-clkin {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "usb_otg_clkin_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	video1_clkin_ck: video1_clkin_ck {
> +	video1_clkin_ck: clock-video1-clkin {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "video1_clkin_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	video1_m2_clkin_ck: video1_m2_clkin_ck {
> +	video1_m2_clkin_ck: clock-video1-m2-clkin {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "video1_m2_clkin_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	video2_clkin_ck: video2_clkin_ck {
> +	video2_clkin_ck: clock-video2-clkin {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "video2_clkin_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	video2_m2_clkin_ck: video2_m2_clkin_ck {
> +	video2_m2_clkin_ck: clock-video2-m2-clkin {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "video2_m2_clkin_ck";
>  		clock-frequency = <0>;
>  	};
>  
> -	dpll_abe_ck: dpll_abe_ck@1e0 {
> +	dpll_abe_ck: clock@1e0 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-m4xen-clock";
> +		clock-output-names = "dpll_abe_ck";
>  		clocks = <&abe_dpll_clk_mux>, <&abe_dpll_bypass_clk_mux>;
>  		reg = <0x01e0>, <0x01e4>, <0x01ec>, <0x01e8>;
>  	};
>  
> -	dpll_abe_x2_ck: dpll_abe_x2_ck {
> +	dpll_abe_x2_ck: clock-dpll-abe-x2 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-x2-clock";
> +		clock-output-names = "dpll_abe_x2_ck";
>  		clocks = <&dpll_abe_ck>;
>  	};
>  
> -	dpll_abe_m2x2_ck: dpll_abe_m2x2_ck@1f0 {
> +	dpll_abe_m2x2_ck: clock-dpll-abe-m2x2-8@1f0 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_abe_m2x2_ck";
>  		clocks = <&dpll_abe_x2_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -217,18 +251,20 @@ dpll_abe_m2x2_ck: dpll_abe_m2x2_ck@1f0 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	abe_clk: abe_clk@108 {
> +	abe_clk: clock-abe@108 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "abe_clk";
>  		clocks = <&dpll_abe_m2x2_ck>;
>  		ti,max-div = <4>;
>  		reg = <0x0108>;
>  		ti,index-power-of-two;
>  	};
>  
> -	dpll_abe_m2_ck: dpll_abe_m2_ck@1f0 {
> +	dpll_abe_m2_ck: clock-dpll-abe-m2-8@1f0 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_abe_m2_ck";
>  		clocks = <&dpll_abe_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -237,9 +273,10 @@ dpll_abe_m2_ck: dpll_abe_m2_ck@1f0 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_abe_m3x2_ck: dpll_abe_m3x2_ck@1f4 {
> +	dpll_abe_m3x2_ck: clock-dpll-abe-m3x2-8@1f4 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_abe_m3x2_ck";
>  		clocks = <&dpll_abe_x2_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -248,30 +285,34 @@ dpll_abe_m3x2_ck: dpll_abe_m3x2_ck@1f4 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_core_byp_mux: dpll_core_byp_mux@12c {
> +	dpll_core_byp_mux: clock-dpll-core-byp-mux-23@12c {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "dpll_core_byp_mux";
>  		clocks = <&sys_clkin1>, <&dpll_abe_m3x2_ck>;
>  		ti,bit-shift = <23>;
>  		reg = <0x012c>;
>  	};
>  
> -	dpll_core_ck: dpll_core_ck@120 {
> +	dpll_core_ck: clock@120 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-core-clock";
> +		clock-output-names = "dpll_core_ck";
>  		clocks = <&sys_clkin1>, <&dpll_core_byp_mux>;
>  		reg = <0x0120>, <0x0124>, <0x012c>, <0x0128>;
>  	};
>  
> -	dpll_core_x2_ck: dpll_core_x2_ck {
> +	dpll_core_x2_ck: clock-dpll-core-x2 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-x2-clock";
> +		clock-output-names = "dpll_core_x2_ck";
>  		clocks = <&dpll_core_ck>;
>  	};
>  
> -	dpll_core_h12x2_ck: dpll_core_h12x2_ck@13c {
> +	dpll_core_h12x2_ck: clock-dpll-core-h12x2-8@13c {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_core_h12x2_ck";
>  		clocks = <&dpll_core_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -280,24 +321,27 @@ dpll_core_h12x2_ck: dpll_core_h12x2_ck@13c {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	mpu_dpll_hs_clk_div: mpu_dpll_hs_clk_div {
> +	mpu_dpll_hs_clk_div: clock-mpu-dpll-hs-clk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "mpu_dpll_hs_clk_div";
>  		clocks = <&dpll_core_h12x2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	dpll_mpu_ck: dpll_mpu_ck@160 {
> +	dpll_mpu_ck: clock@160 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap5-mpu-dpll-clock";
> +		clock-output-names = "dpll_mpu_ck";
>  		clocks = <&sys_clkin1>, <&mpu_dpll_hs_clk_div>;
>  		reg = <0x0160>, <0x0164>, <0x016c>, <0x0168>;
>  	};
>  
> -	dpll_mpu_m2_ck: dpll_mpu_m2_ck@170 {
> +	dpll_mpu_m2_ck: clock-dpll-mpu-m2-8@170 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_mpu_m2_ck";
>  		clocks = <&dpll_mpu_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -306,42 +350,47 @@ dpll_mpu_m2_ck: dpll_mpu_m2_ck@170 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	mpu_dclk_div: mpu_dclk_div {
> +	mpu_dclk_div: clock-mpu-dclk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "mpu_dclk_div";
>  		clocks = <&dpll_mpu_m2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	dsp_dpll_hs_clk_div: dsp_dpll_hs_clk_div {
> +	dsp_dpll_hs_clk_div: clock-dsp-dpll-hs-clk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "dsp_dpll_hs_clk_div";
>  		clocks = <&dpll_core_h12x2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	dpll_dsp_byp_mux: dpll_dsp_byp_mux@240 {
> +	dpll_dsp_byp_mux: clock-dpll-dsp-byp-mux-23@240 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "dpll_dsp_byp_mux";
>  		clocks = <&sys_clkin1>, <&dsp_dpll_hs_clk_div>;
>  		ti,bit-shift = <23>;
>  		reg = <0x0240>;
>  	};
>  
> -	dpll_dsp_ck: dpll_dsp_ck@234 {
> +	dpll_dsp_ck: clock@234 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-clock";
> +		clock-output-names = "dpll_dsp_ck";
>  		clocks = <&sys_clkin1>, <&dpll_dsp_byp_mux>;
>  		reg = <0x0234>, <0x0238>, <0x0240>, <0x023c>;
>  		assigned-clocks = <&dpll_dsp_ck>;
>  		assigned-clock-rates = <600000000>;
>  	};
>  
> -	dpll_dsp_m2_ck: dpll_dsp_m2_ck@244 {
> +	dpll_dsp_m2_ck: clock-dpll-dsp-m2-8@244 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_dsp_m2_ck";
>  		clocks = <&dpll_dsp_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -352,34 +401,38 @@ dpll_dsp_m2_ck: dpll_dsp_m2_ck@244 {
>  		assigned-clock-rates = <600000000>;
>  	};
>  
> -	iva_dpll_hs_clk_div: iva_dpll_hs_clk_div {
> +	iva_dpll_hs_clk_div: clock-iva-dpll-hs-clk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "iva_dpll_hs_clk_div";
>  		clocks = <&dpll_core_h12x2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	dpll_iva_byp_mux: dpll_iva_byp_mux@1ac {
> +	dpll_iva_byp_mux: clock-dpll-iva-byp-mux-23@1ac {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "dpll_iva_byp_mux";
>  		clocks = <&sys_clkin1>, <&iva_dpll_hs_clk_div>;
>  		ti,bit-shift = <23>;
>  		reg = <0x01ac>;
>  	};
>  
> -	dpll_iva_ck: dpll_iva_ck@1a0 {
> +	dpll_iva_ck: clock@1a0 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-clock";
> +		clock-output-names = "dpll_iva_ck";
>  		clocks = <&sys_clkin1>, <&dpll_iva_byp_mux>;
>  		reg = <0x01a0>, <0x01a4>, <0x01ac>, <0x01a8>;
>  		assigned-clocks = <&dpll_iva_ck>;
>  		assigned-clock-rates = <1165000000>;
>  	};
>  
> -	dpll_iva_m2_ck: dpll_iva_m2_ck@1b0 {
> +	dpll_iva_m2_ck: clock-dpll-iva-m2-8@1b0 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_iva_m2_ck";
>  		clocks = <&dpll_iva_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -390,34 +443,38 @@ dpll_iva_m2_ck: dpll_iva_m2_ck@1b0 {
>  		assigned-clock-rates = <388333334>;
>  	};
>  
> -	iva_dclk: iva_dclk {
> +	iva_dclk: clock-iva-dclk {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "iva_dclk";
>  		clocks = <&dpll_iva_m2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	dpll_gpu_byp_mux: dpll_gpu_byp_mux@2e4 {
> +	dpll_gpu_byp_mux: clock-dpll-gpu-byp-mux-23@2e4 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "dpll_gpu_byp_mux";
>  		clocks = <&sys_clkin1>, <&dpll_abe_m3x2_ck>;
>  		ti,bit-shift = <23>;
>  		reg = <0x02e4>;
>  	};
>  
> -	dpll_gpu_ck: dpll_gpu_ck@2d8 {
> +	dpll_gpu_ck: clock@2d8 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-clock";
> +		clock-output-names = "dpll_gpu_ck";
>  		clocks = <&sys_clkin1>, <&dpll_gpu_byp_mux>;
>  		reg = <0x02d8>, <0x02dc>, <0x02e4>, <0x02e0>;
>  		assigned-clocks = <&dpll_gpu_ck>;
>  		assigned-clock-rates = <1277000000>;
>  	};
>  
> -	dpll_gpu_m2_ck: dpll_gpu_m2_ck@2e8 {
> +	dpll_gpu_m2_ck: clock-dpll-gpu-m2-8@2e8 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_gpu_m2_ck";
>  		clocks = <&dpll_gpu_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -428,9 +485,10 @@ dpll_gpu_m2_ck: dpll_gpu_m2_ck@2e8 {
>  		assigned-clock-rates = <425666667>;
>  	};
>  
> -	dpll_core_m2_ck: dpll_core_m2_ck@130 {
> +	dpll_core_m2_ck: clock-dpll-core-m2-8@130 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_core_m2_ck";
>  		clocks = <&dpll_core_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -439,32 +497,36 @@ dpll_core_m2_ck: dpll_core_m2_ck@130 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	core_dpll_out_dclk_div: core_dpll_out_dclk_div {
> +	core_dpll_out_dclk_div: clock-core-dpll-out-dclk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "core_dpll_out_dclk_div";
>  		clocks = <&dpll_core_m2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	dpll_ddr_byp_mux: dpll_ddr_byp_mux@21c {
> +	dpll_ddr_byp_mux: clock-dpll-ddr-byp-mux-23@21c {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "dpll_ddr_byp_mux";
>  		clocks = <&sys_clkin1>, <&dpll_abe_m3x2_ck>;
>  		ti,bit-shift = <23>;
>  		reg = <0x021c>;
>  	};
>  
> -	dpll_ddr_ck: dpll_ddr_ck@210 {
> +	dpll_ddr_ck: clock@210 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-clock";
> +		clock-output-names = "dpll_ddr_ck";
>  		clocks = <&sys_clkin1>, <&dpll_ddr_byp_mux>;
>  		reg = <0x0210>, <0x0214>, <0x021c>, <0x0218>;
>  	};
>  
> -	dpll_ddr_m2_ck: dpll_ddr_m2_ck@220 {
> +	dpll_ddr_m2_ck: clock-dpll-ddr-m2-8@220 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_ddr_m2_ck";
>  		clocks = <&dpll_ddr_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -473,24 +535,27 @@ dpll_ddr_m2_ck: dpll_ddr_m2_ck@220 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_gmac_byp_mux: dpll_gmac_byp_mux@2b4 {
> +	dpll_gmac_byp_mux: clock-dpll-gmac-byp-mux-23@2b4 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "dpll_gmac_byp_mux";
>  		clocks = <&sys_clkin1>, <&dpll_abe_m3x2_ck>;
>  		ti,bit-shift = <23>;
>  		reg = <0x02b4>;
>  	};
>  
> -	dpll_gmac_ck: dpll_gmac_ck@2a8 {
> +	dpll_gmac_ck: clock@2a8 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-clock";
> +		clock-output-names = "dpll_gmac_ck";
>  		clocks = <&sys_clkin1>, <&dpll_gmac_byp_mux>;
>  		reg = <0x02a8>, <0x02ac>, <0x02b4>, <0x02b0>;
>  	};
>  
> -	dpll_gmac_m2_ck: dpll_gmac_m2_ck@2b8 {
> +	dpll_gmac_m2_ck: clock-dpll-gmac-m2-8@2b8 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_gmac_m2_ck";
>  		clocks = <&dpll_gmac_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -499,72 +564,81 @@ dpll_gmac_m2_ck: dpll_gmac_m2_ck@2b8 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	video2_dclk_div: video2_dclk_div {
> +	video2_dclk_div: clock-video2-dclk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "video2_dclk_div";
>  		clocks = <&video2_m2_clkin_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	video1_dclk_div: video1_dclk_div {
> +	video1_dclk_div: clock-video1-dclk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "video1_dclk_div";
>  		clocks = <&video1_m2_clkin_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	hdmi_dclk_div: hdmi_dclk_div {
> +	hdmi_dclk_div: clock-hdmi-dclk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "hdmi_dclk_div";
>  		clocks = <&hdmi_clkin_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	per_dpll_hs_clk_div: per_dpll_hs_clk_div {
> +	per_dpll_hs_clk_div: clock-per-dpll-hs-clk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "per_dpll_hs_clk_div";
>  		clocks = <&dpll_abe_m3x2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <2>;
>  	};
>  
> -	usb_dpll_hs_clk_div: usb_dpll_hs_clk_div {
> +	usb_dpll_hs_clk_div: clock-usb-dpll-hs-clk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "usb_dpll_hs_clk_div";
>  		clocks = <&dpll_abe_m3x2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <3>;
>  	};
>  
> -	eve_dpll_hs_clk_div: eve_dpll_hs_clk_div {
> +	eve_dpll_hs_clk_div: clock-eve-dpll-hs-clk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "eve_dpll_hs_clk_div";
>  		clocks = <&dpll_core_h12x2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	dpll_eve_byp_mux: dpll_eve_byp_mux@290 {
> +	dpll_eve_byp_mux: clock-dpll-eve-byp-mux-23@290 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "dpll_eve_byp_mux";
>  		clocks = <&sys_clkin1>, <&eve_dpll_hs_clk_div>;
>  		ti,bit-shift = <23>;
>  		reg = <0x0290>;
>  	};
>  
> -	dpll_eve_ck: dpll_eve_ck@284 {
> +	dpll_eve_ck: clock@284 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-clock";
> +		clock-output-names = "dpll_eve_ck";
>  		clocks = <&sys_clkin1>, <&dpll_eve_byp_mux>;
>  		reg = <0x0284>, <0x0288>, <0x0290>, <0x028c>;
>  	};
>  
> -	dpll_eve_m2_ck: dpll_eve_m2_ck@294 {
> +	dpll_eve_m2_ck: clock-dpll-eve-m2-8@294 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_eve_m2_ck";
>  		clocks = <&dpll_eve_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -573,17 +647,19 @@ dpll_eve_m2_ck: dpll_eve_m2_ck@294 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	eve_dclk_div: eve_dclk_div {
> +	eve_dclk_div: clock-eve-dclk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "eve_dclk_div";
>  		clocks = <&dpll_eve_m2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	dpll_core_h13x2_ck: dpll_core_h13x2_ck@140 {
> +	dpll_core_h13x2_ck: clock-dpll-core-h13x2-8@140 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_core_h13x2_ck";
>  		clocks = <&dpll_core_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -592,9 +668,10 @@ dpll_core_h13x2_ck: dpll_core_h13x2_ck@140 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_core_h14x2_ck: dpll_core_h14x2_ck@144 {
> +	dpll_core_h14x2_ck: clock-dpll-core-h14x2-8@144 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_core_h14x2_ck";
>  		clocks = <&dpll_core_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -603,9 +680,10 @@ dpll_core_h14x2_ck: dpll_core_h14x2_ck@144 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_core_h22x2_ck: dpll_core_h22x2_ck@154 {
> +	dpll_core_h22x2_ck: clock-dpll-core-h22x2-8@154 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_core_h22x2_ck";
>  		clocks = <&dpll_core_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -614,9 +692,10 @@ dpll_core_h22x2_ck: dpll_core_h22x2_ck@154 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_core_h23x2_ck: dpll_core_h23x2_ck@158 {
> +	dpll_core_h23x2_ck: clock-dpll-core-h23x2-8@158 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_core_h23x2_ck";
>  		clocks = <&dpll_core_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -625,9 +704,10 @@ dpll_core_h23x2_ck: dpll_core_h23x2_ck@158 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_core_h24x2_ck: dpll_core_h24x2_ck@15c {
> +	dpll_core_h24x2_ck: clock-dpll-core-h24x2-8@15c {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_core_h24x2_ck";
>  		clocks = <&dpll_core_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -636,15 +716,17 @@ dpll_core_h24x2_ck: dpll_core_h24x2_ck@15c {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_ddr_x2_ck: dpll_ddr_x2_ck {
> +	dpll_ddr_x2_ck: clock-dpll-ddr-x2 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-x2-clock";
> +		clock-output-names = "dpll_ddr_x2_ck";
>  		clocks = <&dpll_ddr_ck>;
>  	};
>  
> -	dpll_ddr_h11x2_ck: dpll_ddr_h11x2_ck@228 {
> +	dpll_ddr_h11x2_ck: clock-dpll-ddr-h11x2-8@228 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_ddr_h11x2_ck";
>  		clocks = <&dpll_ddr_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -653,15 +735,17 @@ dpll_ddr_h11x2_ck: dpll_ddr_h11x2_ck@228 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_dsp_x2_ck: dpll_dsp_x2_ck {
> +	dpll_dsp_x2_ck: clock-dpll-dsp-x2 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-x2-clock";
> +		clock-output-names = "dpll_dsp_x2_ck";
>  		clocks = <&dpll_dsp_ck>;
>  	};
>  
> -	dpll_dsp_m3x2_ck: dpll_dsp_m3x2_ck@248 {
> +	dpll_dsp_m3x2_ck: clock-dpll-dsp-m3x2-8@248 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_dsp_m3x2_ck";
>  		clocks = <&dpll_dsp_x2_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -672,15 +756,17 @@ dpll_dsp_m3x2_ck: dpll_dsp_m3x2_ck@248 {
>  		assigned-clock-rates = <400000000>;
>  	};
>  
> -	dpll_gmac_x2_ck: dpll_gmac_x2_ck {
> +	dpll_gmac_x2_ck: clock-dpll-gmac-x2 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-x2-clock";
> +		clock-output-names = "dpll_gmac_x2_ck";
>  		clocks = <&dpll_gmac_ck>;
>  	};
>  
> -	dpll_gmac_h11x2_ck: dpll_gmac_h11x2_ck@2c0 {
> +	dpll_gmac_h11x2_ck: clock-dpll-gmac-h11x2-8@2c0 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_gmac_h11x2_ck";
>  		clocks = <&dpll_gmac_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -689,9 +775,10 @@ dpll_gmac_h11x2_ck: dpll_gmac_h11x2_ck@2c0 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_gmac_h12x2_ck: dpll_gmac_h12x2_ck@2c4 {
> +	dpll_gmac_h12x2_ck: clock-dpll-gmac-h12x2-8@2c4 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_gmac_h12x2_ck";
>  		clocks = <&dpll_gmac_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -700,9 +787,10 @@ dpll_gmac_h12x2_ck: dpll_gmac_h12x2_ck@2c4 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_gmac_h13x2_ck: dpll_gmac_h13x2_ck@2c8 {
> +	dpll_gmac_h13x2_ck: clock-dpll-gmac-h13x2-8@2c8 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_gmac_h13x2_ck";
>  		clocks = <&dpll_gmac_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -711,9 +799,10 @@ dpll_gmac_h13x2_ck: dpll_gmac_h13x2_ck@2c8 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_gmac_m3x2_ck: dpll_gmac_m3x2_ck@2bc {
> +	dpll_gmac_m3x2_ck: clock-dpll-gmac-m3x2-8@2bc {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_gmac_m3x2_ck";
>  		clocks = <&dpll_gmac_x2_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -722,33 +811,37 @@ dpll_gmac_m3x2_ck: dpll_gmac_m3x2_ck@2bc {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	gmii_m_clk_div: gmii_m_clk_div {
> +	gmii_m_clk_div: clock-gmii-m-clk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "gmii_m_clk_div";
>  		clocks = <&dpll_gmac_h11x2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <2>;
>  	};
>  
> -	hdmi_clk2_div: hdmi_clk2_div {
> +	hdmi_clk2_div: clock-hdmi-clk2-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "hdmi_clk2_div";
>  		clocks = <&hdmi_clkin_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	hdmi_div_clk: hdmi_div_clk {
> +	hdmi_div_clk: clock-hdmi-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "hdmi_div_clk";
>  		clocks = <&hdmi_clkin_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	l3_iclk_div: l3_iclk_div@100 {
> +	l3_iclk_div: clock-l3-iclk-div-4@100 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "l3_iclk_div";
>  		ti,max-div = <2>;
>  		ti,bit-shift = <4>;
>  		reg = <0x0100>;
> @@ -756,374 +849,420 @@ l3_iclk_div: l3_iclk_div@100 {
>  		ti,index-power-of-two;
>  	};
>  
> -	l4_root_clk_div: l4_root_clk_div {
> +	l4_root_clk_div: clock-l4-root-clk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "l4_root_clk_div";
>  		clocks = <&l3_iclk_div>;
>  		clock-mult = <1>;
>  		clock-div = <2>;
>  	};
>  
> -	video1_clk2_div: video1_clk2_div {
> +	video1_clk2_div: clock-video1-clk2-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "video1_clk2_div";
>  		clocks = <&video1_clkin_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	video1_div_clk: video1_div_clk {
> +	video1_div_clk: clock-video1-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "video1_div_clk";
>  		clocks = <&video1_clkin_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	video2_clk2_div: video2_clk2_div {
> +	video2_clk2_div: clock-video2-clk2-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "video2_clk2_div";
>  		clocks = <&video2_clkin_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	video2_div_clk: video2_div_clk {
> +	video2_div_clk: clock-video2-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "video2_div_clk";
>  		clocks = <&video2_clkin_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	dummy_ck: dummy_ck {
> +	dummy_ck: clock-dummy {
>  		#clock-cells = <0>;
>  		compatible = "fixed-clock";
> +		clock-output-names = "dummy_ck";
>  		clock-frequency = <0>;
>  	};
>  };
>  &prm_clocks {
> -	sys_clkin1: sys_clkin1@110 {
> +	sys_clkin1: clock-sys-clkin1@110 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "sys_clkin1";
>  		clocks = <&virt_12000000_ck>, <&virt_20000000_ck>, <&virt_16800000_ck>, <&virt_19200000_ck>, <&virt_26000000_ck>, <&virt_27000000_ck>, <&virt_38400000_ck>;
>  		reg = <0x0110>;
>  		ti,index-starts-at-one;
>  	};
>  
> -	abe_dpll_sys_clk_mux: abe_dpll_sys_clk_mux@118 {
> +	abe_dpll_sys_clk_mux: clock-abe-dpll-sys-clk-mux@118 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "abe_dpll_sys_clk_mux";
>  		clocks = <&sys_clkin1>, <&sys_clkin2>;
>  		reg = <0x0118>;
>  	};
>  
> -	abe_dpll_bypass_clk_mux: abe_dpll_bypass_clk_mux@114 {
> +	abe_dpll_bypass_clk_mux: clock-abe-dpll-bypass-clk-mux@114 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "abe_dpll_bypass_clk_mux";
>  		clocks = <&abe_dpll_sys_clk_mux>, <&sys_32k_ck>;
>  		reg = <0x0114>;
>  	};
>  
> -	abe_dpll_clk_mux: abe_dpll_clk_mux@10c {
> +	abe_dpll_clk_mux: clock-abe-dpll-clk-mux@10c {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "abe_dpll_clk_mux";
>  		clocks = <&abe_dpll_sys_clk_mux>, <&sys_32k_ck>;
>  		reg = <0x010c>;
>  	};
>  
> -	abe_24m_fclk: abe_24m_fclk@11c {
> +	abe_24m_fclk: clock-abe-24m@11c {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "abe_24m_fclk";
>  		clocks = <&dpll_abe_m2x2_ck>;
>  		reg = <0x011c>;
>  		ti,dividers = <8>, <16>;
>  	};
>  
> -	aess_fclk: aess_fclk@178 {
> +	aess_fclk: clock-aess@178 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "aess_fclk";
>  		clocks = <&abe_clk>;
>  		reg = <0x0178>;
>  		ti,max-div = <2>;
>  	};
>  
> -	abe_giclk_div: abe_giclk_div@174 {
> +	abe_giclk_div: clock-abe-giclk-div@174 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "abe_giclk_div";
>  		clocks = <&aess_fclk>;
>  		reg = <0x0174>;
>  		ti,max-div = <2>;
>  	};
>  
> -	abe_lp_clk_div: abe_lp_clk_div@1d8 {
> +	abe_lp_clk_div: clock-abe-lp-clk-div@1d8 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "abe_lp_clk_div";
>  		clocks = <&dpll_abe_m2x2_ck>;
>  		reg = <0x01d8>;
>  		ti,dividers = <16>, <32>;
>  	};
>  
> -	abe_sys_clk_div: abe_sys_clk_div@120 {
> +	abe_sys_clk_div: clock-abe-sys-clk-div@120 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "abe_sys_clk_div";
>  		clocks = <&sys_clkin1>;
>  		reg = <0x0120>;
>  		ti,max-div = <2>;
>  	};
>  
> -	adc_gfclk_mux: adc_gfclk_mux@1dc {
> +	adc_gfclk_mux: clock-adc-gfclk-mux@1dc {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "adc_gfclk_mux";
>  		clocks = <&sys_clkin1>, <&sys_clkin2>, <&sys_32k_ck>;
>  		reg = <0x01dc>;
>  	};
>  
> -	sys_clk1_dclk_div: sys_clk1_dclk_div@1c8 {
> +	sys_clk1_dclk_div: clock-sys-clk1-dclk-div@1c8 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "sys_clk1_dclk_div";
>  		clocks = <&sys_clkin1>;
>  		ti,max-div = <64>;
>  		reg = <0x01c8>;
>  		ti,index-power-of-two;
>  	};
>  
> -	sys_clk2_dclk_div: sys_clk2_dclk_div@1cc {
> +	sys_clk2_dclk_div: clock-sys-clk2-dclk-div@1cc {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "sys_clk2_dclk_div";
>  		clocks = <&sys_clkin2>;
>  		ti,max-div = <64>;
>  		reg = <0x01cc>;
>  		ti,index-power-of-two;
>  	};
>  
> -	per_abe_x1_dclk_div: per_abe_x1_dclk_div@1bc {
> +	per_abe_x1_dclk_div: clock-per-abe-x1-dclk-div@1bc {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "per_abe_x1_dclk_div";
>  		clocks = <&dpll_abe_m2_ck>;
>  		ti,max-div = <64>;
>  		reg = <0x01bc>;
>  		ti,index-power-of-two;
>  	};
>  
> -	dsp_gclk_div: dsp_gclk_div@18c {
> +	dsp_gclk_div: clock-dsp-gclk-div@18c {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dsp_gclk_div";
>  		clocks = <&dpll_dsp_m2_ck>;
>  		ti,max-div = <64>;
>  		reg = <0x018c>;
>  		ti,index-power-of-two;
>  	};
>  
> -	gpu_dclk: gpu_dclk@1a0 {
> +	gpu_dclk: clock-gpu-dclk@1a0 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "gpu_dclk";
>  		clocks = <&dpll_gpu_m2_ck>;
>  		ti,max-div = <64>;
>  		reg = <0x01a0>;
>  		ti,index-power-of-two;
>  	};
>  
> -	emif_phy_dclk_div: emif_phy_dclk_div@190 {
> +	emif_phy_dclk_div: clock-emif-phy-dclk-div@190 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "emif_phy_dclk_div";
>  		clocks = <&dpll_ddr_m2_ck>;
>  		ti,max-div = <64>;
>  		reg = <0x0190>;
>  		ti,index-power-of-two;
>  	};
>  
> -	gmac_250m_dclk_div: gmac_250m_dclk_div@19c {
> +	gmac_250m_dclk_div: clock-gmac-250m-dclk-div@19c {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "gmac_250m_dclk_div";
>  		clocks = <&dpll_gmac_m2_ck>;
>  		ti,max-div = <64>;
>  		reg = <0x019c>;
>  		ti,index-power-of-two;
>  	};
>  
> -	gmac_main_clk: gmac_main_clk {
> +	gmac_main_clk: clock-gmac-main {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "gmac_main_clk";
>  		clocks = <&gmac_250m_dclk_div>;
>  		clock-mult = <1>;
>  		clock-div = <2>;
>  	};
>  
> -	l3init_480m_dclk_div: l3init_480m_dclk_div@1ac {
> +	l3init_480m_dclk_div: clock-l3init-480m-dclk-div@1ac {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "l3init_480m_dclk_div";
>  		clocks = <&dpll_usb_m2_ck>;
>  		ti,max-div = <64>;
>  		reg = <0x01ac>;
>  		ti,index-power-of-two;
>  	};
>  
> -	usb_otg_dclk_div: usb_otg_dclk_div@184 {
> +	usb_otg_dclk_div: clock-usb-otg-dclk-div@184 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "usb_otg_dclk_div";
>  		clocks = <&usb_otg_clkin_ck>;
>  		ti,max-div = <64>;
>  		reg = <0x0184>;
>  		ti,index-power-of-two;
>  	};
>  
> -	sata_dclk_div: sata_dclk_div@1c0 {
> +	sata_dclk_div: clock-sata-dclk-div@1c0 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "sata_dclk_div";
>  		clocks = <&sys_clkin1>;
>  		ti,max-div = <64>;
>  		reg = <0x01c0>;
>  		ti,index-power-of-two;
>  	};
>  
> -	pcie2_dclk_div: pcie2_dclk_div@1b8 {
> +	pcie2_dclk_div: clock-pcie2-dclk-div@1b8 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "pcie2_dclk_div";
>  		clocks = <&dpll_pcie_ref_m2_ck>;
>  		ti,max-div = <64>;
>  		reg = <0x01b8>;
>  		ti,index-power-of-two;
>  	};
>  
> -	pcie_dclk_div: pcie_dclk_div@1b4 {
> +	pcie_dclk_div: clock-pcie-dclk-div@1b4 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "pcie_dclk_div";
>  		clocks = <&apll_pcie_m2_ck>;
>  		ti,max-div = <64>;
>  		reg = <0x01b4>;
>  		ti,index-power-of-two;
>  	};
>  
> -	emu_dclk_div: emu_dclk_div@194 {
> +	emu_dclk_div: clock-emu-dclk-div@194 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "emu_dclk_div";
>  		clocks = <&sys_clkin1>;
>  		ti,max-div = <64>;
>  		reg = <0x0194>;
>  		ti,index-power-of-two;
>  	};
>  
> -	secure_32k_dclk_div: secure_32k_dclk_div@1c4 {
> +	secure_32k_dclk_div: clock-secure-32k-dclk-div@1c4 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "secure_32k_dclk_div";
>  		clocks = <&secure_32k_clk_src_ck>;
>  		ti,max-div = <64>;
>  		reg = <0x01c4>;
>  		ti,index-power-of-two;
>  	};
>  
> -	clkoutmux0_clk_mux: clkoutmux0_clk_mux@158 {
> +	clkoutmux0_clk_mux: clock-clkoutmux0-clk-mux@158 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "clkoutmux0_clk_mux";
>  		clocks = <&sys_clk1_dclk_div>, <&sys_clk2_dclk_div>, <&per_abe_x1_dclk_div>, <&mpu_dclk_div>, <&dsp_gclk_div>, <&iva_dclk>, <&gpu_dclk>, <&core_dpll_out_dclk_div>, <&emif_phy_dclk_div>, <&gmac_250m_dclk_div>, <&video2_dclk_div>, <&video1_dclk_div>, <&hdmi_dclk_div>, <&func_96m_aon_dclk_div>, <&l3init_480m_dclk_div>, <&usb_otg_dclk_div>, <&sata_dclk_div>, <&pcie2_dclk_div>, <&pcie_dclk_div>, <&emu_dclk_div>, <&secure_32k_dclk_div>, <&eve_dclk_div>;
>  		reg = <0x0158>;
>  	};
>  
> -	clkoutmux1_clk_mux: clkoutmux1_clk_mux@15c {
> +	clkoutmux1_clk_mux: clock-clkoutmux1-clk-mux@15c {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "clkoutmux1_clk_mux";
>  		clocks = <&sys_clk1_dclk_div>, <&sys_clk2_dclk_div>, <&per_abe_x1_dclk_div>, <&mpu_dclk_div>, <&dsp_gclk_div>, <&iva_dclk>, <&gpu_dclk>, <&core_dpll_out_dclk_div>, <&emif_phy_dclk_div>, <&gmac_250m_dclk_div>, <&video2_dclk_div>, <&video1_dclk_div>, <&hdmi_dclk_div>, <&func_96m_aon_dclk_div>, <&l3init_480m_dclk_div>, <&usb_otg_dclk_div>, <&sata_dclk_div>, <&pcie2_dclk_div>, <&pcie_dclk_div>, <&emu_dclk_div>, <&secure_32k_dclk_div>, <&eve_dclk_div>;
>  		reg = <0x015c>;
>  	};
>  
> -	clkoutmux2_clk_mux: clkoutmux2_clk_mux@160 {
> +	clkoutmux2_clk_mux: clock-clkoutmux2-clk-mux@160 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "clkoutmux2_clk_mux";
>  		clocks = <&sys_clk1_dclk_div>, <&sys_clk2_dclk_div>, <&per_abe_x1_dclk_div>, <&mpu_dclk_div>, <&dsp_gclk_div>, <&iva_dclk>, <&gpu_dclk>, <&core_dpll_out_dclk_div>, <&emif_phy_dclk_div>, <&gmac_250m_dclk_div>, <&video2_dclk_div>, <&video1_dclk_div>, <&hdmi_dclk_div>, <&func_96m_aon_dclk_div>, <&l3init_480m_dclk_div>, <&usb_otg_dclk_div>, <&sata_dclk_div>, <&pcie2_dclk_div>, <&pcie_dclk_div>, <&emu_dclk_div>, <&secure_32k_dclk_div>, <&eve_dclk_div>;
>  		reg = <0x0160>;
>  	};
>  
> -	custefuse_sys_gfclk_div: custefuse_sys_gfclk_div {
> +	custefuse_sys_gfclk_div: clock-custefuse-sys-gfclk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "custefuse_sys_gfclk_div";
>  		clocks = <&sys_clkin1>;
>  		clock-mult = <1>;
>  		clock-div = <2>;
>  	};
>  
> -	eve_clk: eve_clk@180 {
> +	eve_clk: clock-eve@180 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "eve_clk";
>  		clocks = <&dpll_eve_m2_ck>, <&dpll_dsp_m3x2_ck>;
>  		reg = <0x0180>;
>  	};
>  
> -	hdmi_dpll_clk_mux: hdmi_dpll_clk_mux@164 {
> +	hdmi_dpll_clk_mux: clock-hdmi-dpll-clk-mux@164 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "hdmi_dpll_clk_mux";
>  		clocks = <&sys_clkin1>, <&sys_clkin2>;
>  		reg = <0x0164>;
>  	};
>  
> -	mlb_clk: mlb_clk@134 {
> +	mlb_clk: clock-mlb@134 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "mlb_clk";
>  		clocks = <&mlb_clkin_ck>;
>  		ti,max-div = <64>;
>  		reg = <0x0134>;
>  		ti,index-power-of-two;
>  	};
>  
> -	mlbp_clk: mlbp_clk@130 {
> +	mlbp_clk: clock-mlbp@130 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "mlbp_clk";
>  		clocks = <&mlbp_clkin_ck>;
>  		ti,max-div = <64>;
>  		reg = <0x0130>;
>  		ti,index-power-of-two;
>  	};
>  
> -	per_abe_x1_gfclk2_div: per_abe_x1_gfclk2_div@138 {
> +	per_abe_x1_gfclk2_div: clock-per-abe-x1-gfclk2-div@138 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "per_abe_x1_gfclk2_div";
>  		clocks = <&dpll_abe_m2_ck>;
>  		ti,max-div = <64>;
>  		reg = <0x0138>;
>  		ti,index-power-of-two;
>  	};
>  
> -	timer_sys_clk_div: timer_sys_clk_div@144 {
> +	timer_sys_clk_div: clock-timer-sys-clk-div@144 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "timer_sys_clk_div";
>  		clocks = <&sys_clkin1>;
>  		reg = <0x0144>;
>  		ti,max-div = <2>;
>  	};
>  
> -	video1_dpll_clk_mux: video1_dpll_clk_mux@168 {
> +	video1_dpll_clk_mux: clock-video1-dpll-clk-mux@168 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "video1_dpll_clk_mux";
>  		clocks = <&sys_clkin1>, <&sys_clkin2>;
>  		reg = <0x0168>;
>  	};
>  
> -	video2_dpll_clk_mux: video2_dpll_clk_mux@16c {
> +	video2_dpll_clk_mux: clock-video2-dpll-clk-mux@16c {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "video2_dpll_clk_mux";
>  		clocks = <&sys_clkin1>, <&sys_clkin2>;
>  		reg = <0x016c>;
>  	};
>  
> -	wkupaon_iclk_mux: wkupaon_iclk_mux@108 {
> +	wkupaon_iclk_mux: clock-wkupaon-iclk-mux@108 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "wkupaon_iclk_mux";
>  		clocks = <&sys_clkin1>, <&abe_lp_clk_div>;
>  		reg = <0x0108>;
>  	};
>  };
>  
>  &cm_core_clocks {
> -	dpll_pcie_ref_ck: dpll_pcie_ref_ck@200 {
> +	dpll_pcie_ref_ck: clock@200 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-clock";
> +		clock-output-names = "dpll_pcie_ref_ck";
>  		clocks = <&sys_clkin1>, <&sys_clkin1>;
>  		reg = <0x0200>, <0x0204>, <0x020c>, <0x0208>;
>  	};
>  
> -	dpll_pcie_ref_m2ldo_ck: dpll_pcie_ref_m2ldo_ck@210 {
> +	dpll_pcie_ref_m2ldo_ck: clock-dpll-pcie-ref-m2ldo-8@210 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_pcie_ref_m2ldo_ck";
>  		clocks = <&dpll_pcie_ref_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -1132,23 +1271,26 @@ dpll_pcie_ref_m2ldo_ck: dpll_pcie_ref_m2ldo_ck@210 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	apll_pcie_in_clk_mux: apll_pcie_in_clk_mux@4ae06118 {
> +	apll_pcie_in_clk_mux: clock-apll-pcie-in-clk-mux-7@4ae06118 {
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "apll_pcie_in_clk_mux";
>  		clocks = <&dpll_pcie_ref_m2ldo_ck>, <&pciesref_acs_clk_ck>;
>  		#clock-cells = <0>;
>  		reg = <0x021c 0x4>;
>  		ti,bit-shift = <7>;
>  	};
>  
> -	apll_pcie_ck: apll_pcie_ck@21c {
> +	apll_pcie_ck: clock@21c {
>  		#clock-cells = <0>;
>  		compatible = "ti,dra7-apll-clock";
> +		clock-output-names = "apll_pcie_ck";
>  		clocks = <&apll_pcie_in_clk_mux>, <&dpll_pcie_ref_ck>;
>  		reg = <0x021c>, <0x0220>;
>  	};
>  
> -	optfclk_pciephy_div: optfclk_pciephy_div@4a00821c {
> +	optfclk_pciephy_div: clock-optfclk-pciephy-div-8@4a00821c {
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "optfclk_pciephy_div";
>  		clocks = <&apll_pcie_ck>;
>  		#clock-cells = <0>;
>  		reg = <0x021c>;
> @@ -1157,48 +1299,54 @@ optfclk_pciephy_div: optfclk_pciephy_div@4a00821c {
>  		ti,max-div = <2>;
>  	};
>  
> -	apll_pcie_clkvcoldo: apll_pcie_clkvcoldo {
> +	apll_pcie_clkvcoldo: clock-apll-pcie-clkvcoldo {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "apll_pcie_clkvcoldo";
>  		clocks = <&apll_pcie_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	apll_pcie_clkvcoldo_div: apll_pcie_clkvcoldo_div {
> +	apll_pcie_clkvcoldo_div: clock-apll-pcie-clkvcoldo-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "apll_pcie_clkvcoldo_div";
>  		clocks = <&apll_pcie_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	apll_pcie_m2_ck: apll_pcie_m2_ck {
> +	apll_pcie_m2_ck: clock-apll-pcie-m2 {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "apll_pcie_m2_ck";
>  		clocks = <&apll_pcie_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	dpll_per_byp_mux: dpll_per_byp_mux@14c {
> +	dpll_per_byp_mux: clock-dpll-per-byp-mux-23@14c {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "dpll_per_byp_mux";
>  		clocks = <&sys_clkin1>, <&per_dpll_hs_clk_div>;
>  		ti,bit-shift = <23>;
>  		reg = <0x014c>;
>  	};
>  
> -	dpll_per_ck: dpll_per_ck@140 {
> +	dpll_per_ck: clock@140 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-clock";
> +		clock-output-names = "dpll_per_ck";
>  		clocks = <&sys_clkin1>, <&dpll_per_byp_mux>;
>  		reg = <0x0140>, <0x0144>, <0x014c>, <0x0148>;
>  	};
>  
> -	dpll_per_m2_ck: dpll_per_m2_ck@150 {
> +	dpll_per_m2_ck: clock-dpll-per-m2-8@150 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_per_m2_ck";
>  		clocks = <&dpll_per_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -1207,32 +1355,36 @@ dpll_per_m2_ck: dpll_per_m2_ck@150 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	func_96m_aon_dclk_div: func_96m_aon_dclk_div {
> +	func_96m_aon_dclk_div: clock-func-96m-aon-dclk-div {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "func_96m_aon_dclk_div";
>  		clocks = <&dpll_per_m2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	dpll_usb_byp_mux: dpll_usb_byp_mux@18c {
> +	dpll_usb_byp_mux: clock-dpll-usb-byp-mux-23@18c {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "dpll_usb_byp_mux";
>  		clocks = <&sys_clkin1>, <&usb_dpll_hs_clk_div>;
>  		ti,bit-shift = <23>;
>  		reg = <0x018c>;
>  	};
>  
> -	dpll_usb_ck: dpll_usb_ck@180 {
> +	dpll_usb_ck: clock@180 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-j-type-clock";
> +		clock-output-names = "dpll_usb_ck";
>  		clocks = <&sys_clkin1>, <&dpll_usb_byp_mux>;
>  		reg = <0x0180>, <0x0184>, <0x018c>, <0x0188>;
>  	};
>  
> -	dpll_usb_m2_ck: dpll_usb_m2_ck@190 {
> +	dpll_usb_m2_ck: clock-dpll-usb-m2-8@190 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_usb_m2_ck";
>  		clocks = <&dpll_usb_ck>;
>  		ti,max-div = <127>;
>  		ti,autoidle-shift = <8>;
> @@ -1241,9 +1393,10 @@ dpll_usb_m2_ck: dpll_usb_m2_ck@190 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_pcie_ref_m2_ck: dpll_pcie_ref_m2_ck@210 {
> +	dpll_pcie_ref_m2_ck: clock-dpll-pcie-ref-m2-8@210 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_pcie_ref_m2_ck";
>  		clocks = <&dpll_pcie_ref_ck>;
>  		ti,max-div = <127>;
>  		ti,autoidle-shift = <8>;
> @@ -1252,15 +1405,17 @@ dpll_pcie_ref_m2_ck: dpll_pcie_ref_m2_ck@210 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_per_x2_ck: dpll_per_x2_ck {
> +	dpll_per_x2_ck: clock-dpll-per-x2 {
>  		#clock-cells = <0>;
>  		compatible = "ti,omap4-dpll-x2-clock";
> +		clock-output-names = "dpll_per_x2_ck";
>  		clocks = <&dpll_per_ck>;
>  	};
>  
> -	dpll_per_h11x2_ck: dpll_per_h11x2_ck@158 {
> +	dpll_per_h11x2_ck: clock-dpll-per-h11x2-8@158 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_per_h11x2_ck";
>  		clocks = <&dpll_per_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -1269,9 +1424,10 @@ dpll_per_h11x2_ck: dpll_per_h11x2_ck@158 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_per_h12x2_ck: dpll_per_h12x2_ck@15c {
> +	dpll_per_h12x2_ck: clock-dpll-per-h12x2-8@15c {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_per_h12x2_ck";
>  		clocks = <&dpll_per_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -1280,9 +1436,10 @@ dpll_per_h12x2_ck: dpll_per_h12x2_ck@15c {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_per_h13x2_ck: dpll_per_h13x2_ck@160 {
> +	dpll_per_h13x2_ck: clock-dpll-per-h13x2-8@160 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_per_h13x2_ck";
>  		clocks = <&dpll_per_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -1291,9 +1448,10 @@ dpll_per_h13x2_ck: dpll_per_h13x2_ck@160 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_per_h14x2_ck: dpll_per_h14x2_ck@164 {
> +	dpll_per_h14x2_ck: clock-dpll-per-h14x2-8@164 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_per_h14x2_ck";
>  		clocks = <&dpll_per_x2_ck>;
>  		ti,max-div = <63>;
>  		ti,autoidle-shift = <8>;
> @@ -1302,9 +1460,10 @@ dpll_per_h14x2_ck: dpll_per_h14x2_ck@164 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_per_m2x2_ck: dpll_per_m2x2_ck@150 {
> +	dpll_per_m2x2_ck: clock-dpll-per-m2x2-8@150 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "dpll_per_m2x2_ck";
>  		clocks = <&dpll_per_x2_ck>;
>  		ti,max-div = <31>;
>  		ti,autoidle-shift = <8>;
> @@ -1313,105 +1472,118 @@ dpll_per_m2x2_ck: dpll_per_m2x2_ck@150 {
>  		ti,invert-autoidle-bit;
>  	};
>  
> -	dpll_usb_clkdcoldo: dpll_usb_clkdcoldo {
> +	dpll_usb_clkdcoldo: clock-dpll-usb-clkdcoldo {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "dpll_usb_clkdcoldo";
>  		clocks = <&dpll_usb_ck>;
>  		clock-mult = <1>;
>  		clock-div = <1>;
>  	};
>  
> -	func_128m_clk: func_128m_clk {
> +	func_128m_clk: clock-func-128m {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "func_128m_clk";
>  		clocks = <&dpll_per_h11x2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <2>;
>  	};
>  
> -	func_12m_fclk: func_12m_fclk {
> +	func_12m_fclk: clock-func-12m-fclk {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "func_12m_fclk";
>  		clocks = <&dpll_per_m2x2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <16>;
>  	};
>  
> -	func_24m_clk: func_24m_clk {
> +	func_24m_clk: clock-func-24m {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "func_24m_clk";
>  		clocks = <&dpll_per_m2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <4>;
>  	};
>  
> -	func_48m_fclk: func_48m_fclk {
> +	func_48m_fclk: clock-func-48m-fclk {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "func_48m_fclk";
>  		clocks = <&dpll_per_m2x2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <4>;
>  	};
>  
> -	func_96m_fclk: func_96m_fclk {
> +	func_96m_fclk: clock-func-96m-fclk {
>  		#clock-cells = <0>;
>  		compatible = "fixed-factor-clock";
> +		clock-output-names = "func_96m_fclk";
>  		clocks = <&dpll_per_m2x2_ck>;
>  		clock-mult = <1>;
>  		clock-div = <2>;
>  	};
>  
> -	l3init_60m_fclk: l3init_60m_fclk@104 {
> +	l3init_60m_fclk: clock-l3init-60m@104 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "l3init_60m_fclk";
>  		clocks = <&dpll_usb_m2_ck>;
>  		reg = <0x0104>;
>  		ti,dividers = <1>, <8>;
>  	};
>  
> -	clkout2_clk: clkout2_clk@6b0 {
> +	clkout2_clk: clock-clkout2-8@6b0 {
>  		#clock-cells = <0>;
>  		compatible = "ti,gate-clock";
> +		clock-output-names = "clkout2_clk";
>  		clocks = <&clkoutmux2_clk_mux>;
>  		ti,bit-shift = <8>;
>  		reg = <0x06b0>;
>  	};
>  
> -	l3init_960m_gfclk: l3init_960m_gfclk@6c0 {
> +	l3init_960m_gfclk: clock-l3init-960m-gfclk-8@6c0 {
>  		#clock-cells = <0>;
>  		compatible = "ti,gate-clock";
> +		clock-output-names = "l3init_960m_gfclk";
>  		clocks = <&dpll_usb_clkdcoldo>;
>  		ti,bit-shift = <8>;
>  		reg = <0x06c0>;
>  	};
>  
> -	usb_phy1_always_on_clk32k: usb_phy1_always_on_clk32k@640 {
> +	usb_phy1_always_on_clk32k: clock-usb-phy1-always-on-clk32k-8@640 {
>  		#clock-cells = <0>;
>  		compatible = "ti,gate-clock";
> +		clock-output-names = "usb_phy1_always_on_clk32k";
>  		clocks = <&sys_32k_ck>;
>  		ti,bit-shift = <8>;
>  		reg = <0x0640>;
>  	};
>  
> -	usb_phy2_always_on_clk32k: usb_phy2_always_on_clk32k@688 {
> +	usb_phy2_always_on_clk32k: clock-usb-phy2-always-on-clk32k-8@688 {
>  		#clock-cells = <0>;
>  		compatible = "ti,gate-clock";
> +		clock-output-names = "usb_phy2_always_on_clk32k";
>  		clocks = <&sys_32k_ck>;
>  		ti,bit-shift = <8>;
>  		reg = <0x0688>;
>  	};
>  
> -	usb_phy3_always_on_clk32k: usb_phy3_always_on_clk32k@698 {
> +	usb_phy3_always_on_clk32k: clock-usb-phy3-always-on-clk32k-8@698 {
>  		#clock-cells = <0>;
>  		compatible = "ti,gate-clock";
> +		clock-output-names = "usb_phy3_always_on_clk32k";
>  		clocks = <&sys_32k_ck>;
>  		ti,bit-shift = <8>;
>  		reg = <0x0698>;
>  	};
>  
> -	gpu_core_gclk_mux: gpu_core_gclk_mux@1220 {
> +	gpu_core_gclk_mux: clock-gpu-core-gclk-mux-24@1220 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "gpu_core_gclk_mux";
>  		clocks = <&dpll_core_h14x2_ck>, <&dpll_per_h14x2_ck>, <&dpll_gpu_m2_ck>;
>  		ti,bit-shift = <24>;
>  		reg = <0x1220>;
> @@ -1419,9 +1591,10 @@ gpu_core_gclk_mux: gpu_core_gclk_mux@1220 {
>  		assigned-clock-parents = <&dpll_gpu_m2_ck>;
>  	};
>  
> -	gpu_hyd_gclk_mux: gpu_hyd_gclk_mux@1220 {
> +	gpu_hyd_gclk_mux: clock-gpu-hyd-gclk-mux-26@1220 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "gpu_hyd_gclk_mux";
>  		clocks = <&dpll_core_h14x2_ck>, <&dpll_per_h14x2_ck>, <&dpll_gpu_m2_ck>;
>  		ti,bit-shift = <26>;
>  		reg = <0x1220>;
> @@ -1429,34 +1602,38 @@ gpu_hyd_gclk_mux: gpu_hyd_gclk_mux@1220 {
>  		assigned-clock-parents = <&dpll_gpu_m2_ck>;
>  	};
>  
> -	l3instr_ts_gclk_div: l3instr_ts_gclk_div@e50 {
> +	l3instr_ts_gclk_div: clock-l3instr-ts-gclk-div-24@e50 {
>  		#clock-cells = <0>;
>  		compatible = "ti,divider-clock";
> +		clock-output-names = "l3instr_ts_gclk_div";
>  		clocks = <&wkupaon_iclk_mux>;
>  		ti,bit-shift = <24>;
>  		reg = <0x0e50>;
>  		ti,dividers = <8>, <16>, <32>;
>  	};
>  
> -	vip1_gclk_mux: vip1_gclk_mux@1020 {
> +	vip1_gclk_mux: clock-vip1-gclk-mux-24@1020 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "vip1_gclk_mux";
>  		clocks = <&l3_iclk_div>, <&dpll_core_h23x2_ck>;
>  		ti,bit-shift = <24>;
>  		reg = <0x1020>;
>  	};
>  
> -	vip2_gclk_mux: vip2_gclk_mux@1028 {
> +	vip2_gclk_mux: clock-vip2-gclk-mux-24@1028 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "vip2_gclk_mux";
>  		clocks = <&l3_iclk_div>, <&dpll_core_h23x2_ck>;
>  		ti,bit-shift = <24>;
>  		reg = <0x1028>;
>  	};
>  
> -	vip3_gclk_mux: vip3_gclk_mux@1030 {
> +	vip3_gclk_mux: clock-vip3-gclk-mux-24@1030 {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "vip3_gclk_mux";
>  		clocks = <&l3_iclk_div>, <&dpll_core_h23x2_ck>;
>  		ti,bit-shift = <24>;
>  		reg = <0x1030>;
> @@ -1464,48 +1641,54 @@ vip3_gclk_mux: vip3_gclk_mux@1030 {
>  };
>  
>  &cm_core_clockdomains {
> -	coreaon_clkdm: coreaon_clkdm {
> +	coreaon_clkdm: clock-coreaon-clkdm {
>  		compatible = "ti,clockdomain";
> +		clock-output-names = "coreaon_clkdm";
>  		clocks = <&dpll_usb_ck>;
>  	};
>  };
>  
>  &scm_conf_clocks {
> -	dss_deshdcp_clk: dss_deshdcp_clk@558 {
> +	dss_deshdcp_clk: clock-dss-deshdcp-0@558 {
>  		#clock-cells = <0>;
>  		compatible = "ti,gate-clock";
> +		clock-output-names = "dss_deshdcp_clk";
>  		clocks = <&l3_iclk_div>;
>  		ti,bit-shift = <0>;
>  		reg = <0x558>;
>  	};
>  
> -       ehrpwm0_tbclk: ehrpwm0_tbclk@558 {
> +       ehrpwm0_tbclk: clock-ehrpwm0-tbclk-20@558 {
>  		#clock-cells = <0>;
>  		compatible = "ti,gate-clock";
> +		clock-output-names = "ehrpwm0_tbclk";
>  		clocks = <&l4_root_clk_div>;
>  		ti,bit-shift = <20>;
>  		reg = <0x0558>;
>  	};
>  
> -	ehrpwm1_tbclk: ehrpwm1_tbclk@558 {
> +	ehrpwm1_tbclk: clock-ehrpwm1-tbclk-21@558 {
>  		#clock-cells = <0>;
>  		compatible = "ti,gate-clock";
> +		clock-output-names = "ehrpwm1_tbclk";
>  		clocks = <&l4_root_clk_div>;
>  		ti,bit-shift = <21>;
>  		reg = <0x0558>;
>  	};
>  
> -	ehrpwm2_tbclk: ehrpwm2_tbclk@558 {
> +	ehrpwm2_tbclk: clock-ehrpwm2-tbclk-22@558 {
>  		#clock-cells = <0>;
>  		compatible = "ti,gate-clock";
> +		clock-output-names = "ehrpwm2_tbclk";
>  		clocks = <&l4_root_clk_div>;
>  		ti,bit-shift = <22>;
>  		reg = <0x0558>;
>  	};
>  
> -	sys_32k_ck: sys_32k_ck {
> +	sys_32k_ck: clock-sys-32k {
>  		#clock-cells = <0>;
>  		compatible = "ti,mux-clock";
> +		clock-output-names = "sys_32k_ck";
>  		clocks = <&sys_clk32_crystal_ck>, <&sys_clk32_pseudo_ck>, <&sys_clk32_pseudo_ck>, <&sys_clk32_pseudo_ck>;
>  		ti,bit-shift = <8>;
>  		reg = <0x6c4>;
> @@ -1513,97 +1696,110 @@ sys_32k_ck: sys_32k_ck {
>  };
>  
>  &cm_core_aon {
> -	mpu_cm: mpu-cm@300 {
> +	mpu_cm: clock@300 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "mpu_cm";
>  		reg = <0x300 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x300 0x100>;
>  
> -		mpu_clkctrl: mpu-clkctrl@20 {
> +		mpu_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "mpu_clkctrl";
>  			reg = <0x20 0x4>;
>  			#clock-cells = <2>;
>  		};
>  
>  	};
>  
> -	dsp1_cm: dsp1-cm@400 {
> +	dsp1_cm: clock@400 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "dsp1_cm";
>  		reg = <0x400 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x400 0x100>;
>  
> -		dsp1_clkctrl: dsp1-clkctrl@20 {
> +		dsp1_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "dsp1_clkctrl";
>  			reg = <0x20 0x4>;
>  			#clock-cells = <2>;
>  		};
>  
>  	};
>  
> -	ipu_cm: ipu-cm@500 {
> +	ipu_cm: clock@500 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "ipu_cm";
>  		reg = <0x500 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x500 0x100>;
>  
> -		ipu1_clkctrl: ipu1-clkctrl@20 {
> +		ipu1_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "ipu1_clkctrl";
>  			reg = <0x20 0x4>;
>  			#clock-cells = <2>;
>  			assigned-clocks = <&ipu1_clkctrl DRA7_IPU1_MMU_IPU1_CLKCTRL 24>;
>  			assigned-clock-parents = <&dpll_core_h22x2_ck>;
>  		};
>  
> -		ipu_clkctrl: ipu-clkctrl@50 {
> +		ipu_clkctrl: clock@50 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "ipu_clkctrl";
>  			reg = <0x50 0x34>;
>  			#clock-cells = <2>;
>  		};
>  
>  	};
>  
> -	dsp2_cm: dsp2-cm@600 {
> +	dsp2_cm: clock@600 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "dsp2_cm";
>  		reg = <0x600 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x600 0x100>;
>  
> -		dsp2_clkctrl: dsp2-clkctrl@20 {
> +		dsp2_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "dsp2_clkctrl";
>  			reg = <0x20 0x4>;
>  			#clock-cells = <2>;
>  		};
>  
>  	};
>  
> -	rtc_cm: rtc-cm@700 {
> +	rtc_cm: clock@700 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "rtc_cm";
>  		reg = <0x700 0x60>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x700 0x60>;
>  
> -		rtc_clkctrl: rtc-clkctrl@20 {
> +		rtc_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "rtc_clkctrl";
>  			reg = <0x20 0x28>;
>  			#clock-cells = <2>;
>  		};
>  	};
>  
> -	vpe_cm: vpe-cm@760 {
> +	vpe_cm: clock@760 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "vpe_cm";
>  		reg = <0x760 0xc>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x760 0xc>;
>  
> -		vpe_clkctrl: vpe-clkctrl@0 {
> +		vpe_clkctrl: clock@0 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "vpe_clkctrl";
>  			reg = <0x0 0xc>;
>  			#clock-cells = <2>;
>  		};
> @@ -1612,212 +1808,242 @@ vpe_clkctrl: vpe-clkctrl@0 {
>  };
>  
>  &cm_core {
> -	coreaon_cm: coreaon-cm@600 {
> +	coreaon_cm: clock@600 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "coreaon_cm";
>  		reg = <0x600 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x600 0x100>;
>  
> -		coreaon_clkctrl: coreaon-clkctrl@20 {
> +		coreaon_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "coreaon_clkctrl";
>  			reg = <0x20 0x1c>;
>  			#clock-cells = <2>;
>  		};
>  	};
>  
> -	l3main1_cm: l3main1-cm@700 {
> +	l3main1_cm: clock@700 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "l3main1_cm";
>  		reg = <0x700 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x700 0x100>;
>  
> -		l3main1_clkctrl: l3main1-clkctrl@20 {
> +		l3main1_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "l3main1_clkctrl";
>  			reg = <0x20 0x74>;
>  			#clock-cells = <2>;
>  		};
>  
>  	};
>  
> -	ipu2_cm: ipu2-cm@900 {
> +	ipu2_cm: clock@900 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "ipu2_cm";
>  		reg = <0x900 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x900 0x100>;
>  
> -		ipu2_clkctrl: ipu2-clkctrl@20 {
> +		ipu2_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "ipu2_clkctrl";
>  			reg = <0x20 0x4>;
>  			#clock-cells = <2>;
>  		};
>  
>  	};
>  
> -	dma_cm: dma-cm@a00 {
> +	dma_cm: clock@a00 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "dma_cm";
>  		reg = <0xa00 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0xa00 0x100>;
>  
> -		dma_clkctrl: dma-clkctrl@20 {
> +		dma_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "dma_clkctrl";
>  			reg = <0x20 0x4>;
>  			#clock-cells = <2>;
>  		};
>  	};
>  
> -	emif_cm: emif-cm@b00 {
> +	emif_cm: clock@b00 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "emif_cm";
>  		reg = <0xb00 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0xb00 0x100>;
>  
> -		emif_clkctrl: emif-clkctrl@20 {
> +		emif_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "emif_clkctrl";
>  			reg = <0x20 0x4>;
>  			#clock-cells = <2>;
>  		};
>  	};
>  
> -	atl_cm: atl-cm@c00 {
> +	atl_cm: clock@c00 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "atl_cm";
>  		reg = <0xc00 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0xc00 0x100>;
>  
> -		atl_clkctrl: atl-clkctrl@0 {
> +		atl_clkctrl: clock@0 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "atl_clkctrl";
>  			reg = <0x0 0x4>;
>  			#clock-cells = <2>;
>  		};
>  	};
>  
> -	l4cfg_cm: l4cfg-cm@d00 {
> +	l4cfg_cm: clock@d00 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "l4cfg_cm";
>  		reg = <0xd00 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0xd00 0x100>;
>  
> -		l4cfg_clkctrl: l4cfg-clkctrl@20 {
> +		l4cfg_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "l4cfg_clkctrl";
>  			reg = <0x20 0x84>;
>  			#clock-cells = <2>;
>  		};
>  	};
>  
> -	l3instr_cm: l3instr-cm@e00 {
> +	l3instr_cm: clock@e00 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "l3instr_cm";
>  		reg = <0xe00 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0xe00 0x100>;
>  
> -		l3instr_clkctrl: l3instr-clkctrl@20 {
> +		l3instr_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "l3instr_clkctrl";
>  			reg = <0x20 0xc>;
>  			#clock-cells = <2>;
>  		};
>  	};
>  
> -	iva_cm: iva-cm@f00 {
> +	iva_cm: clock@f00 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "iva_cm";
>  		reg = <0xf00 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0xf00 0x100>;
>  
> -		iva_clkctrl: iva-clkctrl@20 {
> +		iva_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "iva_clkctrl";
>  			reg = <0x20 0xc>;
>  			#clock-cells = <2>;
>  		};
>  	};
>  
> -	cam_cm: cam-cm@1000 {
> +	cam_cm: clock@1000 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "cam_cm";
>  		reg = <0x1000 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x1000 0x100>;
>  
> -		cam_clkctrl: cam-clkctrl@20 {
> +		cam_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "cam_clkctrl";
>  			reg = <0x20 0x2c>;
>  			#clock-cells = <2>;
>  		};
>  	};
>  
> -	dss_cm: dss-cm@1100 {
> +	dss_cm: clock@1100 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "dss_cm";
>  		reg = <0x1100 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x1100 0x100>;
>  
> -		dss_clkctrl: dss-clkctrl@20 {
> +		dss_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "dss_clkctrl";
>  			reg = <0x20 0x14>;
>  			#clock-cells = <2>;
>  		};
>  	};
>  
> -	gpu_cm: gpu-cm@1200 {
> +	gpu_cm: clock@1200 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "gpu_cm";
>  		reg = <0x1200 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x1200 0x100>;
>  
> -		gpu_clkctrl: gpu-clkctrl@20 {
> +		gpu_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "gpu_clkctrl";
>  			reg = <0x20 0x4>;
>  			#clock-cells = <2>;
>  		};
>  	};
>  
> -	l3init_cm: l3init-cm@1300 {
> +	l3init_cm: clock@1300 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "l3init_cm";
>  		reg = <0x1300 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x1300 0x100>;
>  
> -		l3init_clkctrl: l3init-clkctrl@20 {
> +		l3init_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "l3init_clkctrl";
>  			reg = <0x20 0x6c>, <0xe0 0x14>;
>  			#clock-cells = <2>;
>  		};
>  
> -		pcie_clkctrl: pcie-clkctrl@b0 {
> +		pcie_clkctrl: clock@b0 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "pcie_clkctrl";
>  			reg = <0xb0 0xc>;
>  			#clock-cells = <2>;
>  		};
>  
> -		gmac_clkctrl: gmac-clkctrl@d0 {
> +		gmac_clkctrl: clock@d0 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "gmac_clkctrl";
>  			reg = <0xd0 0x4>;
>  			#clock-cells = <2>;
>  		};
>  
>  	};
>  
> -	l4per_cm: l4per-cm@1700 {
> +	l4per_cm: clock@1700 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "l4per_cm";
>  		reg = <0x1700 0x300>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x1700 0x300>;
>  
> -		l4per_clkctrl: l4per-clkctrl@28 {
> +		l4per_clkctrl: clock@28 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "l4per_clkctrl";
>  			reg = <0x28 0x64>, <0xa0 0x24>, <0xf0 0x3c>, <0x140 0x1c>, <0x170 0x4>;
>  			#clock-cells = <2>;
>  
> @@ -1825,20 +2051,23 @@ l4per_clkctrl: l4per-clkctrl@28 {
>  			assigned-clock-parents = <&abe_24m_fclk>;
>  		};
>  
> -		l4sec_clkctrl: l4sec-clkctrl@1a0 {
> +		l4sec_clkctrl: clock@1a0 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "l4sec_clkctrl";
>  			reg = <0x1a0 0x2c>;
>  			#clock-cells = <2>;
>  		};
>  
> -		l4per2_clkctrl: l4per2-clkctrl@c {
> +		l4per2_clkctrl: clock@c {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "l4per2_clkctrl";
>  			reg = <0xc 0x4>, <0x18 0xc>, <0x90 0xc>, <0xc4 0x4>, <0x138 0x4>, <0x160 0xc>, <0x178 0x24>, <0x1d0 0x3c>;
>  			#clock-cells = <2>;
>  		};
>  
> -		l4per3_clkctrl: l4per3-clkctrl@14 {
> +		l4per3_clkctrl: clock@14 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "l4per3_clkctrl";
>  			reg = <0x14 0x4>, <0xc8 0x14>, <0x130 0x4>;
>  			#clock-cells = <2>;
>  		};
> @@ -1847,15 +2076,17 @@ l4per3_clkctrl: l4per3-clkctrl@14 {
>  };
>  
>  &prm {
> -	wkupaon_cm: wkupaon-cm@1800 {
> +	wkupaon_cm: clock@1800 {
>  		compatible = "ti,omap4-cm";
> +		clock-output-names = "wkupaon_cm";
>  		reg = <0x1800 0x100>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		ranges = <0 0x1800 0x100>;
>  
> -		wkupaon_clkctrl: wkupaon-clkctrl@20 {
> +		wkupaon_clkctrl: clock@20 {
>  			compatible = "ti,clkctrl";
> +			clock-output-names = "wkupaon_clkctrl";
>  			reg = <0x20 0x6c>;
>  			#clock-cells = <2>;
>  		};

