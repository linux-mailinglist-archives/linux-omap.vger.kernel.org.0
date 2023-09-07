Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD50B79701C
	for <lists+linux-omap@lfdr.de>; Thu,  7 Sep 2023 07:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbjIGF3r (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Sep 2023 01:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjIGF3q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Sep 2023 01:29:46 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D142C1B2
        for <linux-omap@vger.kernel.org>; Wed,  6 Sep 2023 22:29:42 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A233E8050;
        Thu,  7 Sep 2023 05:29:41 +0000 (UTC)
Date:   Thu, 7 Sep 2023 08:29:40 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Patrik =?utf-8?Q?Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        peter.ujfalusi@gmail.com, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Subject: Re: [RFC 5/6] ARM: DTS: omap4-l4-abe: add an aess (audio DSP of
 OMAP4 and OMAP5) child
Message-ID: <20230907052940.GF11676@atomide.com>
References: <cover.1693918214.git.hns@goldelico.com>
 <535d7f940a97ec12f6551fd2ca8a9343d8ae3674.1693918215.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <535d7f940a97ec12f6551fd2ca8a9343d8ae3674.1693918215.git.hns@goldelico.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* H. Nikolaus Schaller <hns@goldelico.com> [230905 15:58]:
> make the aess module a child of the target-module.

How about something like this for the patch description:

"Move aess specific memory ranges to the aess module and remove the entries
 generated from the hardware ap registers. There is no need to set up
 separate child device nodes for aess as these are all memory ranges used
 only by the aess driver."

And then just combine this patch with the one removing the entries
generated from ap registers.

> diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
> index a8d66240d17d5..7ca7b369b4e59 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
> @@ -41,12 +41,14 @@ segment@0 {					/* 0x40100000 */
>  			 <0x0003d000 0x0003d000 0x001000>,	/* ap 23 */
>  			 <0x0003e000 0x0003e000 0x001000>,	/* ap 24 */
>  			 <0x0003f000 0x0003f000 0x001000>,	/* ap 25 */
> -			 <0x00080000 0x00080000 0x010000>,	/* ap 26 */
> -			 <0x00080000 0x00080000 0x001000>,	/* ap 27 */
> -			 <0x000a0000 0x000a0000 0x010000>,	/* ap 28 */
> -			 <0x000a0000 0x000a0000 0x001000>,	/* ap 29 */
> -			 <0x000c0000 0x000c0000 0x010000>,	/* ap 30 */
> -			 <0x000c0000 0x000c0000 0x001000>,	/* ap 31 */
> +			 <0x00080000 0x00080000 0x010000>,	/* dmem */
> +			 <0x00090000 0x00090000 0x001000>,	/* dmem */
> +			 <0x000a0000 0x000a0000 0x010000>,	/* cmem */
> +			 <0x000b0000 0x000b0000 0x001000>,	/* cmem */
> +			 <0x000c0000 0x000c0000 0x010000>,	/* smem */
> +			 <0x000d0000 0x000d0000 0x001000>,	/* smem */
> +			 <0x000e0000 0x000e0000 0x010000>,	/* pmem */
> +			 <0x000f0000 0x000f0000 0x001000>,	/* pmem */
>  			 <0x000f1000 0x000f1000 0x001000>,	/* ap 32 */
>  			 <0x000f2000 0x000f2000 0x001000>,	/* ap 33 */
>  

So looks like pmem has no ranges defined in the ap registers, just add the
new ranges with comments like "dmem interrconnect" "pmem, not listed in ap".

Right now this change is hard to read as it's not obvious what is changing as
you're adding the new ranges and changing comments for the existing ranges.

Please keep the ap entry reference for the existing ones, not sure we need
comments for the existing ranges. Probably best to add comments in a separate
patch to keep the range changes readable.

> @@ -482,14 +486,47 @@ target-module@f1000 {			/* 0x401f1000, ap 32 20.0 */
>  			clock-names = "fck";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -			ranges = <0x0 0xf1000 0x1000>,
> -				 <0x490f1000 0x490f1000 0x1000>;
>  
> -			/*
> -			 * No child device binding or driver in mainline.
> -			 * See Android tree and related upstreaming efforts
> -			 * for the old driver.
> -			 */
> +			/* CHECKME: OMAP4 and OMAP5 may differ in memory sizes, here we define more than available... */
> +			ranges = <0 0xf1000 0x1000>, /* MPU private access */
> +				 <0x80000 0x80000 0x10000>, /* DMEM 64KiB - MPU */
> +				 <0xa0000 0xa0000 0x10000>, /* CMEM 6KiB - MPU */
> +				 <0xc0000 0xc0000 0x10000>, /* SMEM 64KiB - MPU */
> +				 <0xe0000 0xe0000 0x10000>, /* PMEM 8KiB - MPU */
> +				 <0x490f1000 0x490f1000 0x10000>, /* L3 Interconnect */
> +				 <0x49080000 0x49080000 0x10000>, /* DMEM 64KiB - L3 */
> +				 <0x490a0000 0x490a0000 0x10000>, /* CMEM 6KiB - L3 */
> +				 <0x490ce000 0x490c0000 0x10000>, /* SMEM 64KiB - L3 */
> +				 <0x490e0000 0x490e0000 0x10000>; /* PMEM 8KiB - L3 */
> +
> +			aess: aess {
> +				compatible = "ti,omap4-aess";
> +				status = "disabled";
> +				reg = <0 0xfff>, /* MPU private access */
> +				      <0x80000 0xffff>, /* DMEM - MPU */
> +				      <0xa0000 0xffff>, /* CMEM - MPU */
> +				      <0xc0000 0xffff>, /* SMEM - MPU */
> +				      <0xe0000 0xffff>, /* PMEM - MPU */
> +				      <0x490f1000 0xfff>, /* L3 Interconnect */
> +				      <0x49080000 0xffff>, /* DMEM - L3 */
> +				      <0x490a0000 0xffff>, /* CMEM - L3 */
> +				      <0x490ce000 0xffff>, /* SMEM - L3 */
> +				      <0x490e0000 0xffff>; /* PMEM - L3 */
> +				reg-names = "mpu", "dmem", "cmem", "smem", "pmem",
> +				      "dma", "dmem_dma", "cmem_dma", "smem_dma",
> +				      "pmem_dma";
> +				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&sdma 101>,
> +				      <&sdma 102>,
> +				      <&sdma 103>,
> +				      <&sdma 104>,
> +				      <&sdma 105>,
> +				      <&sdma 106>,
> +				      <&sdma 107>,
> +				      <&sdma 108>;
> +				dma-names = "fifo0", "fifo1", "fifo2", "fifo3", "fifo4",
> +				      "fifo5", "fifo6", "fifo7";
> +			};
>  		};
>  	};
>  };

Hmm so what registers is the driver accessing in the l3 interconnect
registers named dma above? If there's something sysc and syss register
related it's better off done in a generic way in ti-sysc.c.

In general looks OK to me for the ti,omap4-aess child device. Yeah seems
like no need to set up separate child device nodes for the memory ranges.

Regards,

Tony
