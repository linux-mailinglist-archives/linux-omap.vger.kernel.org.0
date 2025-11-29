Return-Path: <linux-omap+bounces-5072-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5492CC940B2
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 16:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 003DC346DD8
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 15:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C43C1C860C;
	Sat, 29 Nov 2025 15:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBmpQYWr"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255EB1A9FAC;
	Sat, 29 Nov 2025 15:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764429934; cv=none; b=MPdxZj2mUqDa6Gm3NVFfBpRDE0Wr+dYD8SQRNSQlyDXntaO9XNpMPbZkXjisaqrS4AKSpqVpRNnirrpm+k4iJz8PftesQioxA2N91165ZDaq1XhNCh8dtxcZA+ngnFWpypEk98u7TQz70tl92GT//Zr4MBKu8tGFXZdedFkpPac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764429934; c=relaxed/simple;
	bh=FDfNfdjZAK1CRX+PZryTBYkcC38g8MKCrpLm485korQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aS8jeRw0FWN8v/PMCkiBLENsAQEVLnh9zv2m7KgF4m7XudlXSh2YNB1u/6zkyLq6IxGEgY5yHBZ7wbjSOdP1xNidnyoIDfBj3A+AAvS6b3VNJTqqb/ltOMz24McK9jE11MNDIMuG/UkHgd4Y2DiRdyJhLfxxGISVBaUp5Lv1rF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBmpQYWr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8849C4CEF7;
	Sat, 29 Nov 2025 15:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764429933;
	bh=FDfNfdjZAK1CRX+PZryTBYkcC38g8MKCrpLm485korQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GBmpQYWr80Ajy6bRs3lLVE2ZsOP+GszaDMDxdeUyZVzD8z0yQ960oPHxMqUIzd+FG
	 upVxMvjKHMt6TAq2lXL4Xmw0MZng5Ax/I0/0CB12Czndo4NqnvxSvoS9chZrHtVU9L
	 yR/K4P99KsMcnLxbaYmkKZNNzqykxebdpKj7XLPsd69bd72ATNtV5K0MQQFtve1I3x
	 dROQ6HnlG1NzjqoD6Ol2tw/YBbb3n4c59a7pgUOcbQO74eLJMQfMdlOh5YdncdwPrv
	 ANTwFEuB+C3phNjh7LGu6Tcaculmb1wP5Qup0q5KeW6a786kW+fjeYzuM66TAWPs4G
	 RQxuXOxvYrg8w==
Message-ID: <58ccca49-f30c-4461-b4aa-4985f72c89fb@kernel.org>
Date: Sat, 29 Nov 2025 16:25:28 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] syscon: Wire up has-inaccessible-regs
To: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, arnd@arndb.de,
 lee@kernel.org, dakr@kernel.org, rafael@kernel.org,
 gregkh@linuxfoundation.org, broonie@kernel.org, tony@atomide.com,
 rogerq@kernel.org, khilman@baylibre.com, andreas@kemnade.info,
 aaro.koskinen@iki.fi, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
References: <20251129142042.344359-1-richard@nod.at>
 <20251129142042.344359-4-richard@nod.at>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251129142042.344359-4-richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/11/2025 15:20, Richard Weinberger wrote:
> Evaluate the has-inaccessible-regs device tree property to disable
> debugfs access if a register map contains dangerous/harmful registers.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/mfd/syscon.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index ae71a2710bed8..73fff0df3f42f 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -70,6 +70,16 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
>  	else if (of_property_read_bool(np, "native-endian"))
>  		syscon_config.val_format_endian = REGMAP_ENDIAN_NATIVE;
>  
> +
> +	/*
> +	 * Disable debugfs access if a register map has various inaccessible
> +	 * registers.
> +	 * In such a case the device driver has to know exactly how and when
> +	 * access is allowed but general access via userspace can cause harm.
> +	 */
> +	if (of_property_read_bool(np, "has-inaccessible-regs"))
> +		syscon_config.debugfs_disable = true;

So you mark ENTIRE device like that? Then you don't need the property.
Your compatible already tells you that (IOW, this is fully deducible
from the compatible).

Best regards,
Krzysztof

