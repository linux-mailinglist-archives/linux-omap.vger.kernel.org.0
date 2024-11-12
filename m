Return-Path: <linux-omap+bounces-2668-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFA39C5DA3
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2024 17:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41F52B27E01
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2024 14:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A329C1FC7D8;
	Tue, 12 Nov 2024 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="QSYXmIRg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BADE1F7093
	for <linux-omap@vger.kernel.org>; Tue, 12 Nov 2024 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731420943; cv=none; b=LM913zntrqEv6oHdafSBmPVAiJOi2qq0RzkGy/6C3JHh1RibCDwizY2ryepU3c8N7OakjTIGwROKMYnu1XFfI/O1axTT7rBUNlowfKxvoq5yWmx9XSwhzW/9lUaomBOs0takcV5aHvICV426WZAn6xDgL24qGXrGpk9V+/rCdz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731420943; c=relaxed/simple;
	bh=LESQCGjI8DAiQ135uHSAvBoRNnPxiNp3+kcoDh0rVw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGE4ByPjEGWYLay3zZP7YKUNIYgAy6NUdrvRMWg0UFqy1Q4KsTxZzPE8QJ1h+kfiB39y+6bkW/42ROkbgOogF5mJGmq0rMXyNThmTdWQmE25C7XbECKUsss0Bw3wZHHU4+uJ3dHGbmHJLWDqoPpzWYCbAEQEeiO95beX38k1zG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=QSYXmIRg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4314c452180so38199805e9.0
        for <linux-omap@vger.kernel.org>; Tue, 12 Nov 2024 06:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1731420938; x=1732025738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9YzOzaYWQsFk5kPoLvuqKt8I9P4v6HEHhJMazcvyhm4=;
        b=QSYXmIRgHEuXjqEQo4QlZj0vp3QiL4R2CXQSanhP02Ldqzt5uG+UU/t9kDI2zIAyhU
         ULdMTzUvoG5KvGeXYp8GD8Sg3bItIIP6Z2JvLfyfFTax88vlIcxkMj1k7GlGAGDFxxvc
         TwKgDzjj75SLPy5OgfGMyYru/IdnsGPiQJ6sU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731420938; x=1732025738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9YzOzaYWQsFk5kPoLvuqKt8I9P4v6HEHhJMazcvyhm4=;
        b=Lm5GRfRLLPYvcdPyLE4KXPkUhu6E5WFG+fr9aaHnBJnvqW5eftKUvHi7fMaCB27cVO
         5XLpPjPkFlTfJw/RYRI2yT+R219AHnfwcIoXJDKPm/OkeWBkwQkSZEwe4Zs0hq/756zu
         mwRt6ERuLWRWLxCIt/wQ7L0dP7DHqd5GiKmpud5Fg5rzDuz/SI/SELkLLaB2lgouJHJc
         WE9tfdRTFFdIFXOQUfuMObMAmZf0Mc1vXv2hj7vbQQrIN3pdGSPELy3X/0VrY+Gva4DL
         omkeoWkdHuqM8VGXOXFBUgOjVHZJyiV0OiTInDhKf98zbx5l+DeKOnBfZOBhy1dcHqqI
         rmlw==
X-Forwarded-Encrypted: i=1; AJvYcCWZRsA4ZGiRFLD0Dq606oRGFqxZoJ11LXZ4IOVvK+nn+yZu6ZiaNed+SLWZAywj5xLzRYIquu7B5blO@vger.kernel.org
X-Gm-Message-State: AOJu0YyrKabWUE8y2WIgiHd23wPUTjkyi6/xcB3uz/P/8xIRSTaHLLu6
	C8+8XHKnO9Fx7cbm8VslePUuHZfkSlTuZB9vUWP4KzlIj6zr4CDYj8IZDwUTTfo=
X-Google-Smtp-Source: AGHT+IEyVeNcARHSlw6N1RIzQxBvQ342kx7hTBJgw2lIoiaTHZTuy+X4HttGB3UTVuq1CMwTwoufiw==
X-Received: by 2002:a5d:59c2:0:b0:382:756:96d6 with SMTP id ffacd0b85a97d-38207569767mr2937909f8f.1.1731420937657;
        Tue, 12 Nov 2024 06:15:37 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda05ce0sm15252542f8f.103.2024.11.12.06.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 06:15:37 -0800 (PST)
Message-ID: <c583e1bb-f56b-4489-8012-ce742e85f233@smile.fr>
Date: Tue, 12 Nov 2024 15:15:36 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] ARM: dts: Configure interconnect target module for
 dra7 sata
To: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>
Cc: =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-pci@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>
References: <20210126124004.52550-1-tony@atomide.com>
 <20210126124004.52550-8-tony@atomide.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20210126124004.52550-8-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Tony, Roger, All,

Le 26/01/2021 à 13:39, Tony Lindgren a écrit :
> We can now probe devices with device tree only configuration using
> ti-sysc interconnect target module driver. Let's configure the
> module, but keep the legacy "ti,hwmods" peroperty to avoid new boot
> time warnings. The legacy property will be removed in later patches
> together with the legacy platform data.
> 
> Note that the old sysc register offset is wrong, the real offset is at
> 0x1100 as listed in TRM for SATA_SYSCONFIG register. Looks like we've been
> happily using sata on the bootloader configured sysconfig register and
> nobody noticed. Also the old register range for SATAMAC_wrapper registers
> is wrong at 7 while it should be 8. But that too seems harmless.
> 
> There is also an L3 parent interconnect range that we don't seem to be
> using. That can be added as needed later on.

Since the switch from a kernel 5.10 to 6.1, the dra7 (AM574x) sata interface
doesn't work as expected.

Using a kernel 6.1 with a preformated ext4 SATA disc, any copied file will be
corrupted when the filesystem is umounted.

mount /dev/sda1 /mnt
cp /<test_file> /mnt/
sync
sha256sum /mnt/<test_file> /<test_file>
<same hash>
umount /mnt

mount /dev/sda1 /mnt
sha256sum /mnt/<test_file> /<test_file>
/mnt/<test_file> is corrupted.

git bisect report 8af15365a368 ("ARM: dts: Configure interconnect target module
for dra7 sata") as the first bad commit [1] (merged in 5.13).

While looking for existing SATA issue on dra7 SoC, I found this old patch:

"On TI Platforms using LPAE, SATA breaks with 64-bit DMA. Restrict it to
32-bit." [2].

Even if it's not the correct fix, disabling 64-bit DMA allows to use the sata
disc correctly. The discussion about this issue seems to have stopped [3] and
the suggested change was never merged.

The SATA port is unlikely not available on TI AM57 EVM boards or the beaglebone-AI.

Any suggestion?

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=8af15365a36845c4c15d4c8046ddccff331d5263
[2] https://lore.kernel.org/all/20200206111728.6703-1-rogerq@ti.com/T/
[3] https://lore.kernel.org/lkml/c753a232-403d-6ed2-89fd-09476c887391@ti.com/

Best regards,
Romain


> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/boot/dts/dra7-l4.dtsi | 29 ++++++++++++++++++++++++++---
>  arch/arm/boot/dts/dra7.dtsi    | 12 ------------
>  2 files changed, 26 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
> --- a/arch/arm/boot/dts/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
> @@ -572,11 +572,34 @@ target-module@8000 {			/* 0x4a108000, ap 29 1e.0 */
>  		};
>  
>  		target-module@40000 {			/* 0x4a140000, ap 31 06.0 */
> -			compatible = "ti,sysc";
> -			status = "disabled";
> -			#address-cells = <1>;
> +			compatible = "ti,sysc-omap4", "ti,sysc";
> +			ti,hwmods = "sata";
> +			reg = <0x400fc 4>,
> +			      <0x41100 4>;
> +			reg-names = "rev", "sysc";
> +			ti,sysc-midle = <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
> +			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>,
> +					<SYSC_IDLE_SMART_WKUP>;
> +			power-domains = <&prm_l3init>;
> +			clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 0>;
> +			clock-names = "fck";
>  			#size-cells = <1>;
> +			#address-cells = <1>;
>  			ranges = <0x0 0x40000 0x10000>;
> +
> +			sata: sata@0 {
> +				compatible = "snps,dwc-ahci";
> +				reg = <0 0x1100>, <0x1100 0x8>;
> +				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&sata_phy>;
> +				phy-names = "sata-phy";
> +				clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
> +				ports-implemented = <0x1>;
> +			};
>  		};
>  
>  		target-module@51000 {			/* 0x4a151000, ap 33 50.0 */
> diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
> --- a/arch/arm/boot/dts/dra7.dtsi
> +++ b/arch/arm/boot/dts/dra7.dtsi
> @@ -785,18 +785,6 @@ qspi: spi@0 {
>  			};
>  		};
>  
> -		/* OCP2SCP3 */
> -		sata: sata@4a141100 {
> -			compatible = "snps,dwc-ahci";
> -			reg = <0x4a140000 0x1100>, <0x4a141100 0x7>;
> -			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> -			phys = <&sata_phy>;
> -			phy-names = "sata-phy";
> -			clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
> -			ti,hwmods = "sata";
> -			ports-implemented = <0x1>;
> -		};
> -
>  		/* OCP2SCP1 */
>  		/* IRQ for DWC3_3 and DWC3_4 need IRQ crossbar */
>  


