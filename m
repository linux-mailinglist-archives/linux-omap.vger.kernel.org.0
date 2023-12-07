Return-Path: <linux-omap+bounces-147-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B5808E56
	for <lists+linux-omap@lfdr.de>; Thu,  7 Dec 2023 18:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B86B5B20BA1
	for <lists+linux-omap@lfdr.de>; Thu,  7 Dec 2023 17:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33B448CCB;
	Thu,  7 Dec 2023 17:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRSgnLgp"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D7845978;
	Thu,  7 Dec 2023 17:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C3CC433C8;
	Thu,  7 Dec 2023 17:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701969227;
	bh=DRPKptBBmLOx5+OFyOUopYmLskN58QcplGFuspiJ3n4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRSgnLgpAB2E+67FK4MbwV1WZOHG/yHsV+TYfLKc4iM9XaZRCVQKBdDHjV1Zjl2e7
	 8DP/Rbh2ZreW2H2NsjROtKzxNqy7jO8bKS2ZQjn9KjHOidM6Anb4so4FRH5ihwIVWc
	 4wgzzvXH/ReD0Avhsbv502RlcQhSWlqCecj7MEp2bohIBM3Lj1fBriDKWO6FiBQDlX
	 vv8cYjHkpftvaL6NhK9xcb7Qw+Zre+tFwtRABPZgd/pxOpLwqu1Gf5zMhvt/Px76IE
	 Keh83FDvSNNA9ul2ua+N43/vQcGuEMARNSXkX5+3riS/G0lVjgqjNpjUoZl0/dlKnV
	 Avyl9oapOmRhQ==
Date: Thu, 7 Dec 2023 17:13:41 +0000
From: Lee Jones <lee@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 5/6] mfd: twl4030-power: accept standard property for
 power controller
Message-ID: <20231207171341.GH111411@google.com>
References: <20231203222903.343711-1-andreas@kemnade.info>
 <20231203222903.343711-6-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231203222903.343711-6-andreas@kemnade.info>

On Sun, 03 Dec 2023, Andreas Kemnade wrote:

> Instead of only accepting the ti specific properties accept also
> the standard property. For uniformity, search in the parent node

Search 'in' the parent node or 'from' the parent node?

Where is the property?

> for the tag. The code for powering of is also isolated from the

Should this be "off"?

> rest in this file. So it is a pure Linux design decision to put it
> here.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/mfd/twl4030-power.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mfd/twl4030-power.c b/drivers/mfd/twl4030-power.c
> index e35b0f788c504..3ef892e63b88f 100644
> --- a/drivers/mfd/twl4030-power.c
> +++ b/drivers/mfd/twl4030-power.c
> @@ -686,6 +686,9 @@ static bool twl4030_power_use_poweroff(const struct twl4030_power_data *pdata,
>  	if (of_property_read_bool(node, "ti,use_poweroff"))
>  		return true;
>  
> +	if (of_device_is_system_power_controller(node->parent))
> +		return true;
> +
>  	return false;
>  }
>  
> -- 
> 2.39.2
> 

-- 
Lee Jones [李琼斯]

