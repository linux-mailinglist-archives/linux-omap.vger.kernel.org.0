Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94CC5402921
	for <lists+linux-omap@lfdr.de>; Tue,  7 Sep 2021 14:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbhIGMpx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Sep 2021 08:45:53 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:34690
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344258AbhIGMpx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Sep 2021 08:45:53 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 38D994077E
        for <linux-omap@vger.kernel.org>; Tue,  7 Sep 2021 12:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631018686;
        bh=lSByXk3vZ2uUwX6aw8cCNLfpPVphgUncd0Iy1wU4m98=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=NUXVVFZLqN06ORECmcq+PM3c02HmSfXZHcHFzBXtfmOqRSQY6iWRV+/SPYyimJ0wW
         ZLv0rtlW+1fRoN4ZaJMGYPDSRfFdgqdOnI+WWJ9/1EPBXjHSiO8dO4CWTVxWTEf9FX
         +Lvao6OSz38hsKDQZUrPJV7WN6+DM6Rmrpm1fnqbt3msMSAc0hUSJj6Xnfb1Aio5Ax
         SxKFceAsIcFKRo2WD7nRVyPwPd/Fk9LyE0vqaBGX80r4ddUjeaJupwXHURolGJyg7H
         b4qrlAEyzrZrwRITa7mruRuDkAOaL0Gbt2MjwXAS6SOaCZxyzXke7r+frCRvLQ0B49
         /NHkAIUEndpUA==
Received: by mail-wr1-f72.google.com with SMTP id h15-20020adff18f000000b001574654fbc2so2064479wro.10
        for <linux-omap@vger.kernel.org>; Tue, 07 Sep 2021 05:44:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lSByXk3vZ2uUwX6aw8cCNLfpPVphgUncd0Iy1wU4m98=;
        b=lz91e2VY2rSpMVi6NjvxqsXxrLO+t6Sh3FD87BAWX/hLikjujbym9C8Opjbi+G5kus
         g5c+InVY2rvEYvI1WapcjkO+QQJO4tXVDuMXMJ50kw67HPnAPqnZqAq1Y/jdEFiGV/F8
         GdAHWD59gGA8ly5Z4eh0V7qZ8koqQAU8LpSe39i9r0sV8SQfMNrxVR8uKAclGXaRN48X
         lO0rV2dQOMvWfyRqkujqOztCIbrn/VuFYQ8hOtZIQ1+AIqs5zLVNBK58dKcNlILj8UPE
         LTdwbVo/g43gbvN8BxQGTPtwr6vuXBYy+5hSmNUsNSlYS7RYam94G4PeW8cRL/LroRwx
         5QYw==
X-Gm-Message-State: AOAM5308QoKUOZVgxmTo47JeM32zfXAaaHdIUaTwNUpEPsFBRL379zGd
        GFOeVWg+S8ivxHB7k2OYv08VeLPlPCh7tgOdq+e9QgHa//rWQZpP0oysbCuPkN1nGZpXkb43xmZ
        gPONapcCGRUZunBGvuP2CnNt6ivWf6A38eN1h7lw=
X-Received: by 2002:a05:600c:4293:: with SMTP id v19mr3778456wmc.32.1631018684941;
        Tue, 07 Sep 2021 05:44:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK6fnMG9DMg8Wh9yb3/1zvfnsgWtOWMPQWv5TUQtox0L6VWRDRiglmp218n4VGf1BVNmBBdA==
X-Received: by 2002:a05:600c:4293:: with SMTP id v19mr3778442wmc.32.1631018684754;
        Tue, 07 Sep 2021 05:44:44 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.74])
        by smtp.gmail.com with ESMTPSA id o21sm2704077wms.32.2021.09.07.05.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 05:44:44 -0700 (PDT)
Subject: Re: [PATCH v3 1/8] ARM: dts: omap: Fixup GPMC child nodes
To:     Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210907113226.31876-1-rogerq@kernel.org>
 <20210907113226.31876-2-rogerq@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <8e29cf74-313f-b8c5-7514-60b5e404833d@canonical.com>
Date:   Tue, 7 Sep 2021 14:44:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907113226.31876-2-rogerq@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 07/09/2021 13:32, Roger Quadros wrote:
> Fixes up the GPMC child nodes to prevent dtbs_check errors
> after device tree binding conversion to yaml.
> 
> - Use reg address as node name
> - gpmc,cycle2cycle-samecsen and gpmc,cycle2cycle-diffcsen are
>   boolean properties.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../boot/dts/logicpd-som-lv-baseboard.dtsi    |  2 +-
>  .../boot/dts/logicpd-torpedo-37xx-devkit.dts  |  2 +-
>  .../boot/dts/logicpd-torpedo-baseboard.dtsi   |  2 +-
>  arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi     | 62 +++++++++----------
>  arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi     | 59 +++++++++---------
>  arch/arm/boot/dts/omap-zoom-common.dtsi       | 16 ++---
>  arch/arm/boot/dts/omap2430-sdp.dts            |  6 +-
>  arch/arm/boot/dts/omap3-cm-t3x30.dtsi         |  6 +-
>  .../arm/boot/dts/omap3-devkit8000-common.dtsi |  4 +-
>  arch/arm/boot/dts/omap3-evm-37xx.dts          |  1 +
>  arch/arm/boot/dts/omap3-evm-common.dtsi       |  9 ---
>  .../boot/dts/omap3-evm-processor-common.dtsi  |  5 +-
>  arch/arm/boot/dts/omap3-evm.dts               |  1 +
>  arch/arm/boot/dts/omap3-igep0020-common.dtsi  |  5 +-
>  arch/arm/boot/dts/omap3-ldp.dts               |  5 +-
>  arch/arm/boot/dts/omap3-n900.dts              |  2 +-
>  .../dts/omap3-overo-chestnut43-common.dtsi    |  6 +-
>  .../arm/boot/dts/omap3-overo-tobi-common.dtsi |  6 +-
>  .../boot/dts/omap3-overo-tobiduo-common.dtsi  |  8 +--
>  arch/arm/boot/dts/omap3-sb-t35.dtsi           |  4 +-
>  arch/arm/boot/dts/omap4-duovero-parlor.dts    |  6 +-
>  21 files changed, 105 insertions(+), 112 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
> index 7d0468a23781..f2364cb114c5 100644
> --- a/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
> +++ b/arch/arm/boot/dts/logicpd-som-lv-baseboard.dtsi
> @@ -65,7 +65,7 @@
>  		  1 0 0x2c000000 0x1000000	/* CS1: 16MB for LAN9221 */
>  		  2 0 0x10000000 0x2000000>;    /* CS2: 32MB for NOR */
>  
> -	ethernet@gpmc {
> +	gpmc_ethernet: ethernet@1,0 {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&lan9221_pins>;
>  		interrupt-parent = <&gpio5>;
> diff --git a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
> index 5532db04046c..6357915d207b 100644
> --- a/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
> +++ b/arch/arm/boot/dts/logicpd-torpedo-37xx-devkit.dts
> @@ -4,8 +4,8 @@
>  
>  #include "omap36xx.dtsi"
>  #include "logicpd-torpedo-som.dtsi"
> -#include "omap-gpmc-smsc9221.dtsi"
>  #include "logicpd-torpedo-baseboard.dtsi"
> +#include "omap-gpmc-smsc9221.dtsi"
>  
>  / {
>  	model = "LogicPD Zoom DM3730 Torpedo + Wireless Development Kit";
> diff --git a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
> index 533a47bc4a53..05049a34b6f1 100644
> --- a/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
> +++ b/arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
> @@ -95,7 +95,7 @@
>  	ranges = <0 0 0x30000000 0x1000000	/* CS0: 16MB for NAND */
>  		  1 0 0x2c000000 0x1000000>;	/* CS1: 16MB for LAN9221 */
>  
> -	ethernet@gpmc {
> +	gpmc_ethernet: ethernet@1,0 {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&lan9221_pins>;
>  		interrupt-parent = <&gpio5>;
> diff --git a/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi b/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
> index ded7e8fec9eb..2a462cb65a7d 100644
> --- a/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
> +++ b/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
> @@ -20,36 +20,34 @@
>  	};
>  };
>  
> -&gpmc {
> -	ethernet@gpmc {
> -		compatible = "smsc,lan9221", "smsc,lan9115";
> -		bank-width = <2>;
> -		gpmc,device-width = <1>;
> -		gpmc,cycle2cycle-samecsen = <1>;
> -		gpmc,cycle2cycle-diffcsen = <1>;
> -		gpmc,cs-on-ns = <5>;
> -		gpmc,cs-rd-off-ns = <150>;
> -		gpmc,cs-wr-off-ns = <150>;
> -		gpmc,adv-on-ns = <0>;
> -		gpmc,adv-rd-off-ns = <15>;
> -		gpmc,adv-wr-off-ns = <40>;
> -		gpmc,oe-on-ns = <45>;
> -		gpmc,oe-off-ns = <140>;
> -		gpmc,we-on-ns = <45>;
> -		gpmc,we-off-ns = <140>;
> -		gpmc,rd-cycle-ns = <155>;
> -		gpmc,wr-cycle-ns = <155>;
> -		gpmc,access-ns = <120>;
> -		gpmc,page-burst-access-ns = <20>;
> -		gpmc,bus-turnaround-ns = <75>;
> -		gpmc,cycle2cycle-delay-ns = <75>;
> -		gpmc,wait-monitoring-ns = <0>;
> -		gpmc,clk-activation-ns = <0>;
> -		gpmc,wr-data-mux-bus-ns = <0>;
> -		gpmc,wr-access-ns = <0>;
> -		vddvario-supply = <&vddvario>;
> -		vdd33a-supply = <&vdd33a>;
> -		reg-io-width = <4>;
> -		smsc,save-mac-address;
> -	};
> +&gpmc_ethernet {
> +	compatible = "smsc,lan9221", "smsc,lan9115";

This looks like regular override-by-label instead of full path.
Unfortunately change of the indentation causes difficulties to find the
real difference - if there is such. Can you split it into separate patch?

The point is that override-by-label should have zero effect on
functionality and produce same dtb. This is easy to compare with
dtx_diff or fdt-decompile but if you mix it with other changes, the
comparison is not straight-forward.

> +	bank-width = <2>;
> +	gpmc,device-width = <1>;
> +	gpmc,cycle2cycle-samecsen;
> +	gpmc,cycle2cycle-diffcsen;
> +	gpmc,cs-on-ns = <5>;
> +	gpmc,cs-rd-off-ns = <150>;
> +	gpmc,cs-wr-off-ns = <150>;
> +	gpmc,adv-on-ns = <0>;
> +	gpmc,adv-rd-off-ns = <15>;
> +	gpmc,adv-wr-off-ns = <40>;
> +	gpmc,oe-on-ns = <45>;
> +	gpmc,oe-off-ns = <140>;
> +	gpmc,we-on-ns = <45>;
> +	gpmc,we-off-ns = <140>;
> +	gpmc,rd-cycle-ns = <155>;
> +	gpmc,wr-cycle-ns = <155>;
> +	gpmc,access-ns = <120>;
> +	gpmc,page-burst-access-ns = <20>;
> +	gpmc,bus-turnaround-ns = <75>;
> +	gpmc,cycle2cycle-delay-ns = <75>;
> +	gpmc,wait-monitoring-ns = <0>;
> +	gpmc,clk-activation-ns = <0>;
> +	gpmc,wr-data-mux-bus-ns = <0>;
> +	gpmc,wr-access-ns = <0>;
> +	vddvario-supply = <&vddvario>;
> +	vdd33a-supply = <&vdd33a>;
> +	reg-io-width = <4>;
> +	smsc,save-mac-address;
>  };
> diff --git a/arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi b/arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi
> index 7f6aefd13451..c1e78f929d2b 100644
> --- a/arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi
> +++ b/arch/arm/boot/dts/omap-gpmc-smsc9221.dtsi
> @@ -24,36 +24,33 @@
>  	};
>  };
>  
> -&gpmc {
> -	ethernet@gpmc {
> -		compatible = "smsc,lan9221","smsc,lan9115";
> -		bank-width = <2>;
> +&gpmc_ethernet {
> +	compatible = "smsc,lan9221","smsc,lan9115";
> +	bank-width = <2>;
> +	gpmc,mux-add-data = <0>;
> +	gpmc,cs-on-ns = <0>;
> +	gpmc,cs-rd-off-ns = <42>;
> +	gpmc,cs-wr-off-ns = <36>;
> +	gpmc,adv-on-ns = <6>;
> +	gpmc,adv-rd-off-ns = <12>;
> +	gpmc,adv-wr-off-ns = <12>;
> +	gpmc,oe-on-ns = <0>;
> +	gpmc,oe-off-ns = <42>;
> +	gpmc,we-on-ns = <0>;
> +	gpmc,we-off-ns = <36>;
> +	gpmc,rd-cycle-ns = <60>;
> +	gpmc,wr-cycle-ns = <54>;
> +	gpmc,access-ns = <36>;
> +	gpmc,page-burst-access-ns = <0>;
> +	gpmc,bus-turnaround-ns = <0>;
> +	gpmc,cycle2cycle-delay-ns = <0>;
> +	gpmc,wr-data-mux-bus-ns = <18>;
> +	gpmc,wr-access-ns = <42>;
> +	gpmc,cycle2cycle-samecsen;
> +	gpmc,cycle2cycle-diffcsen;
>  
> -		gpmc,mux-add-data;

Same here and in other places. Actually here a sneaky change is visible
- different property.

Best regards,
Krzysztof
