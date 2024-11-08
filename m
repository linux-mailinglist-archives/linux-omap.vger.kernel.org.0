Return-Path: <linux-omap+bounces-2616-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 256AE9C1D32
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 13:42:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9441A1C2297E
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 12:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524AD1E882F;
	Fri,  8 Nov 2024 12:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQw1THIB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD66B194A48;
	Fri,  8 Nov 2024 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731069741; cv=none; b=Ht6lwmP4Kwjr+/ogzGEozB12V4cxczJj6S2qSrg7CBRGpLH3Ts3HwNDnHRrgMhhtz/gT+0Oe2DmpvLPEdP07glME6LOybq9qfm3Y3NPn81P/Tq3gyHjJpJRFD8IW/uimbI5LOPLvrEcy1++aQbpX8W4p1hE3wzMHAYmWCT88gVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731069741; c=relaxed/simple;
	bh=eUIn/lZFpU7IAeaMyDMGZ68p74XPBMr5khCYGxumA0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REWTR93N0Ufalf3HWveINEZ41iWOnRi+4GTll5tuDTxUWVhEqEyHKH/NpnomM2JHXlvkhRSA/IAwTydjnoyJEReAGkZnTNCcD8NhWu/c7ZDqj9oCDYI1JivauQLgp8laxiwqYVQhZHe/7Oki9bglUCCjKcNnMKXY4esd/7w9W+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQw1THIB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1CFC4CECD;
	Fri,  8 Nov 2024 12:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731069739;
	bh=eUIn/lZFpU7IAeaMyDMGZ68p74XPBMr5khCYGxumA0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eQw1THIBywfB3Dm8aDzRnkzQcvtU+IaZbInqacKdBgK1if0G7qMp9aVHcYSV36eUE
	 nFlZbbSF9ksBdfSKU57TZ69TrnUlEUMoql3c2SyaiFg1ZlmeR5Z2/HDqYCzwQHmcWI
	 B2mGbvN+5DQWhLxDFVAmtFgROZaTRb4CT/vADQJYVG6btc8OjBHhn9Bd+p6s33cAW3
	 r64BgHZ3LzgLlKt/SE9SFWQ4jKVy7FuXhnOTgFpXn2ydNjVm/8zUVi93jxDXzRJ6sy
	 sHn5Qok/0CTTW94MIDmHs/PtObOLNKtn4wa1mGTfwMZ5LokbGBQ1XstBNC8/h6aUbo
	 qjThQ1Avew8Bg==
Message-ID: <b26c1fa8-b3b7-4aa9-bc78-793ddfa3bc6b@kernel.org>
Date: Fri, 8 Nov 2024 14:42:14 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: ti/omap: gta04: fix pm issues caused by spi
 module
To: Andreas Kemnade <andreas@kemnade.info>, tony@atomide.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, hns@goldelico.com,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, aaro.koskinen@iki.fi, khilman@baylibre.com
Cc: stable@vger.kernel.org
References: <20241107225100.1803943-1-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241107225100.1803943-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 08/11/2024 00:51, Andreas Kemnade wrote:
> Despite CM_IDLEST1_CORE and CM_FCLKEN1_CORE behaving normal,
> disabling SPI leads to messages like:
> Powerdomain (core_pwrdm) didn't enter target state 0
> and according to /sys/kernel/debug/pm_debug/count off state is not
> entered. That was not connected to SPI during the discussion
> of disabling SPI. See:
> https://lore.kernel.org/linux-omap/20230122100852.32ae082c@aktux/
> 
> Fix excess DMA channel usage by disabling DMA only instead of disabling
> the SPI modules, so powermanagement can da all its work.

s/powermanagement/power management
s/da/do

> 
> Fixes: a622310f7f01 ("ARM: dts: gta04: fix excess dma channel usage")
> CC: stable@vger.kernel.org
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> index 3661340009e7a..11f8af34498b1 100644
> --- a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> @@ -612,19 +612,23 @@ &i2c3 {
>  };
>  
>  &mcspi1 {
> -	status = "disabled";

But according to commit a622310f7f01 ("ARM: dts: gta04: fix excess dma channel usage"),
these mcspi modules are not used. So it doesn't make sense to enable them even if it
seems to solve the power management issue?

Does bootloader leave the mcspi modules in a unwanted state?
Would it make sense for the bus driver to explicitly turn off all modules?

> +	/delete-property/ dmas;
> +	/delete-property/ dma-names;
>  };
>  
>  &mcspi2 {
> -	status = "disabled";
> +	/delete-property/ dmas;
> +	/delete-property/ dma-names;
>  };
>  
>  &mcspi3 {
> -	status = "disabled";
> +	/delete-property/ dmas;
> +	/delete-property/ dma-names;
>  };
>  
>  &mcspi4 {
> -	status = "disabled";
> +	/delete-property/ dmas;
> +	/delete-property/ dma-names;
>  };
>  
>  &usb_otg_hs {

-- 
cheers,
-roger

