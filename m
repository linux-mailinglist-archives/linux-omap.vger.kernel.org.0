Return-Path: <linux-omap+bounces-2976-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FF7A01627
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 18:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 302027A0116
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 17:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE371CEE8A;
	Sat,  4 Jan 2025 17:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNZ6qNxC"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C42F1C68A6;
	Sat,  4 Jan 2025 17:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736012740; cv=none; b=lUC2T5QtJZokVHtdrUvTJUdT/I/1IjDFH/aWlz7Iqi42LdcrZVjpAHsn0XX4V7YdJEs/ugqO+Ivz19xxySt24Bod0jNvvgzkx46IvcZMi+LskhwvWoXQtk4yWL9Bvs1BFnJpqs1sKsIPjdzCwzfCfFdWREca4RDA3rKF48oDX0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736012740; c=relaxed/simple;
	bh=8Zk7Zz4JZnNnEvPq23r63XU89ZL+EnyhlxziLMNNfEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AKDRM6eL9cgU4IdwtzhiBvrSHnUh3NaugTPparCans9cGfN4mMbZQFyohhqu7E84Lk8jHcx1InoO+D2bQvxTBdoy07lhfUfWzwgXoKf1Q0GSZbmeh4NWW0Sx297w8nqY9pyz4glwn506rK+ffnug9K6h20NkfDrpgHp0ReHmwNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNZ6qNxC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E488C4CED1;
	Sat,  4 Jan 2025 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736012740;
	bh=8Zk7Zz4JZnNnEvPq23r63XU89ZL+EnyhlxziLMNNfEQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=nNZ6qNxCcGErP+GRXPNGgu0lIHKj/f/uO1gAD4YXLvP4mNgOjtyB5Kh9aL6ybLCp9
	 HsOO8UlaIDSiXUwkyes/QKVuzD2w3ZRZCq3cJWk5J10GsACOJmqHJgziq5vKUodL+m
	 LnYT+4ig/RcTTN7jPSU2XIZ1rDe+EfANBWpNnvPorlyYDsLo0wDLTTV5PXnWWnID0J
	 S8jXmS3oSxHyuMLPIO69okUVLbvQu64hMJBxh0UeeUCMyUA1Zibo3ac0Jl1Qkq/pET
	 oMvAo7kBqWa9f6cgZldQ3AthL4u51gNIu2sb53XdTBppvagBjY1FjHcmYD7PHD4ipp
	 OMmb2SjXxafdg==
Message-ID: <3bde5a34-4bb8-42a3-ad5c-eeb495c6aa6d@kernel.org>
Date: Sat, 4 Jan 2025 19:45:35 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: ti/omap: omap4-serial: fix interrupts syntax
To: Andreas Kemnade <andreas@kemnade.info>, tony@atomide.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com, aaro.koskinen@iki.fi
References: <20241230195556.112118-1-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241230195556.112118-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andreas,

On 30/12/2024 21:55, Andreas Kemnade wrote:
> Usually interrupts are overwritten in the board file to specify a
> mux-dependent dedicated wakeup irq, so there is interrupts and
> interrupts-extended property which is not allowed. That has generated a
> lot of noise during dts changes if just a phandle involved has randomly
> changed.
> 
> Avoid that mess by specifying interrupts-extended in the dtsi file.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/linux-omap/173558214240.2262575.18233884215338168789.robh@kernel.org/
> Closes: https://lore.kernel.org/linux-omap/172784021601.525825.18405282128990798038.robh@kernel.org/
> ---
>  arch/arm/boot/dts/ti/omap/omap4-l4.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
> index 3fcef3080eae..150dd84c9e0f 100644
> --- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
> @@ -1414,7 +1414,7 @@ SYSC_OMAP2_SOFTRESET |
>  			uart3: serial@0 {
>  				compatible = "ti,omap4-uart";
>  				reg = <0x0 0x100>;
> -				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts-extended = <&wakeupgen GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;

At this point interrupts-extended is not applicable.

We could use
	/delete-property/ interrupts
in the board files that needs multiple interrupt parents?

>  				clock-frequency = <48000000>;
>  			};
>  		};
> @@ -1765,7 +1765,7 @@ SYSC_OMAP2_SOFTRESET |
>  			uart1: serial@0 {
>  				compatible = "ti,omap4-uart";
>  				reg = <0x0 0x100>;
> -				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts-extended = <&wakeupgen GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
>  				clock-frequency = <48000000>;
>  			};
>  		};
> @@ -1794,7 +1794,7 @@ SYSC_OMAP2_SOFTRESET |
>  			uart2: serial@0 {
>  				compatible = "ti,omap4-uart";
>  				reg = <0x0 0x100>;
> -				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts-extended = <&wakeupgen GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
>  				clock-frequency = <48000000>;
>  			};
>  		};
> @@ -1823,7 +1823,7 @@ SYSC_OMAP2_SOFTRESET |
>  			uart4: serial@0 {
>  				compatible = "ti,omap4-uart";
>  				reg = <0x0 0x100>;
> -				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts-extended = <&wakeupgen GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
>  				clock-frequency = <48000000>;
>  			};
>  		};

-- 
cheers,
-roger


