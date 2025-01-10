Return-Path: <linux-omap+bounces-3078-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9FAA08AEF
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 10:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C44E18844DC
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 09:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1E0209F23;
	Fri, 10 Jan 2025 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKGSw/ro"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB4E207A1D;
	Fri, 10 Jan 2025 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500132; cv=none; b=m9F7eR5eOEHiYvUZZckN0PwoDa2ua6S4BwLKQMCIQj1nU3WIAiqLEwWuuX1JQAR1v0lq6dENB4S8rnbWwkSU4xE7GpBF1LZii4neQUjRf2Sy+ZqVF2VV3g+kGHrzNN7y75cVKds/LQGQadRdrTMjpsHn28mpkGQXjhvG5BLnwkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500132; c=relaxed/simple;
	bh=BKCABSVpALUA1ywTn1GIpy2XS4PyMNAw2s550w+Mlh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrzKLWExPhDCTA1UuObAUM9AzjUA+MbJtSkHyB4cnT4VUvo/RNJZgbAgP1aM628rwjbSOixytJ4DclAQDhjgzg3xdSg4IsB1lF0mnCuStDfVwhyZkdKwuCqrvQIPI/pdloF4vQGRKXYfsGn8b8XHjnApq/o8I4zoROdbADllXqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKGSw/ro; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6295C4CED6;
	Fri, 10 Jan 2025 09:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736500131;
	bh=BKCABSVpALUA1ywTn1GIpy2XS4PyMNAw2s550w+Mlh4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KKGSw/roQS77bAIRuETTVgVVurDhFlU8CvGHrXc80sbWfcZYlMwqdsRjI5ZDaHMr0
	 TtgBX6DA4m2aSgf5656SxXb4L0KdhcaUQhedrvz1sEsF/GxWy2ImM7tdNuIHrMoy/E
	 lmTKdyDkTbWqYlkI9KjBJcMYAUEBGp2fY+EidrQosbivtiGMhtyWvwSUgOpFBN0f8k
	 ZNEzt+w4Brr0ewm4SUrpxwz+oPxu/OPMJEPdKd0sGltACnkrNK7r9oQFAjU7+0P5ER
	 zZy5dd0YI/W2n/lG/ycVra5nujdUx5fCY1qdkWZ2Gb0E811gWfNXRVbtFlXHfGtphB
	 7R6I31n2nfSmQ==
Message-ID: <75ead807-4ad1-4f82-8ce1-dea68ef9d9ab@kernel.org>
Date: Fri, 10 Jan 2025 11:08:47 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: omap-gpmc: Use of_property_present() for
 non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109182110.3970894-1-robh@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250109182110.3970894-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Rob,

On 09/01/2025 20:21, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> While we're here, simplify the 2 checks into a single check as they
> only differ in printing "NAND" vs "OneNAND" in the warning.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Possibly this check could just be removed altogether?

Yes, I agree it is better to just drop these checks.
Let me know if you want me to prepare the path. Thanks.

> ---
>  drivers/memory/omap-gpmc.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index e2a75a52563f..329bad46065c 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -2226,21 +2226,11 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>  		goto err;
>  	}
>  
> -	if (of_node_name_eq(child, "nand")) {
> +	if (of_node_name_eq(child, "nand") || of_node_name_eq(child, "onenand")) {
>  		/* Warn about older DT blobs with no compatible property */
> -		if (!of_property_read_bool(child, "compatible")) {
> +		if (!of_property_present(child, "compatible")) {
>  			dev_warn(&pdev->dev,
> -				 "Incompatible NAND node: missing compatible");
> -			ret = -EINVAL;
> -			goto err;
> -		}
> -	}
> -
> -	if (of_node_name_eq(child, "onenand")) {
> -		/* Warn about older DT blobs with no compatible property */
> -		if (!of_property_read_bool(child, "compatible")) {
> -			dev_warn(&pdev->dev,
> -				 "Incompatible OneNAND node: missing compatible");
> +				 "Incompatible '%pOFn' node: missing compatible", child);
>  			ret = -EINVAL;
>  			goto err;
>  		}

-- 
cheers,
-roger


