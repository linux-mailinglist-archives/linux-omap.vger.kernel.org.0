Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83F32424FF
	for <lists+linux-omap@lfdr.de>; Wed, 12 Aug 2020 07:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgHLFbh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Aug 2020 01:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgHLFbh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Aug 2020 01:31:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C324AC06174A;
        Tue, 11 Aug 2020 22:31:36 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 5B25D28DF93
Subject: Re: [PATCH 06/13] ARM: dts: omap4-panda-common: Add CMA pools and
 enable IPU & DSP
To:     Suman Anna <s-anna@ti.com>, Tony Lindgren <tony@atomide.com>
Cc:     Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernelci-results@groups.io
References: <20200709231954.1973-1-s-anna@ti.com>
 <20200709231954.1973-7-s-anna@ti.com>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <3e44fc46-07ac-6103-5c4d-8c7389453b87@collabora.com>
Date:   Wed, 12 Aug 2020 06:31:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200709231954.1973-7-s-anna@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/07/2020 00:19, Suman Anna wrote:
> The CMA reserved memory nodes have been added for the IPU and DSP
> remoteproc devices on all the OMAP4-based Panda boards. These nodes
> are assigned to the respective rproc device nodes, and both the
> IPU and DSP remote processors are enabled for all these boards.
> 
> The current CMA pools and sizes are defined statically for each device.
> The starting addresses are fixed to meet current dependencies on the
> remote processor firmwares, and will go away when the remote-side
> code has been improved to gather this information runtime during
> its initialization.
> 
> An associated pair of the rproc node and its CMA node can be disabled
> later on if there is no use-case defined to use that remote processor.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  arch/arm/boot/dts/omap4-panda-common.dtsi | 30 +++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/omap4-panda-common.dtsi b/arch/arm/boot/dts/omap4-panda-common.dtsi
> index 55ea8b6189af..ef79028fc95f 100644
> --- a/arch/arm/boot/dts/omap4-panda-common.dtsi
> +++ b/arch/arm/boot/dts/omap4-panda-common.dtsi
> @@ -12,6 +12,26 @@ memory@80000000 {
>  		reg = <0x80000000 0x40000000>; /* 1 GB */
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		dsp_memory_region: dsp-memory@98000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x98000000 0x800000>;
> +			reusable;
> +			status = "okay";
> +		};
> +
> +		ipu_memory_region: ipu-memory@98800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x98800000 0x7000000>;
> +			reusable;
> +			status = "okay";
> +		};
> +	};
> +
>  	chosen {
>  		stdout-path = &uart3;
>  	};
> @@ -571,3 +591,13 @@ hdmi_out: endpoint {
>  		};
>  	};
>  };
> +
> +&dsp {
> +	status = "okay";
> +	memory-region = <&dsp_memory_region>;
> +};
> +
> +&ipu {
> +	status = "okay";
> +	memory-region = <&ipu_memory_region>;
> +};
> 

This appears to be causing some BUG alert messages:

  BUG: Bad page state in process swapper/0  pfn:9c801

as reported on kernelci.org:

  https://kernelci.org/test/case/id/5f326c6661360154c452c1c9/

I've run a bisection and it landed on this commit.  If you fix it
with another patch, please add:

  Reported-by: "kernelci.org bot" <bot@kernelci.org>

Hope this helps!

Thanks,
Guillaume

