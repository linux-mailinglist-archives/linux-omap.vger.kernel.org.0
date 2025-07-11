Return-Path: <linux-omap+bounces-4089-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76005B016D5
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jul 2025 10:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 829CB1CA0C13
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jul 2025 08:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D355212FB7;
	Fri, 11 Jul 2025 08:51:48 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBCC18DF6E;
	Fri, 11 Jul 2025 08:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752223908; cv=none; b=M+K+MYT+32MDTloryijf1n4MdbAknfavh9Sa79YsnmjdoOJ75si8KiFCsFBDXEcJ92OJtOmkRx794qbG8ncXzVIDxlMliBpM1dm45a9QhaRLKCyI3YbxonfcmRa/MLotAzMoA1v7WqnDSgBtFFwSZr6K5abX6rSb+3Ay7hhsDgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752223908; c=relaxed/simple;
	bh=BVo7j5DGUp5cax0t1bvbZwiXqosmMCAmt2dyA2wY4Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ds1NL0HDgXm+N3GZz/p1qqu0mFwjPFF/eOs1/garFxS83g0NLsEzoDNUKfmxCzE17dlnN4w0MCDkX99i0js6YQ7P5AqQ0HyJ743ocEKnpIbcfk683lvgbx6I/gkbqEcE2aHlszwjDrKYo5KDZJVSqyf6ogIv2Oap0rC137E+grY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D699516F2;
	Fri, 11 Jul 2025 01:51:34 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D9C93F6A8;
	Fri, 11 Jul 2025 01:51:42 -0700 (PDT)
Date: Fri, 11 Jul 2025 09:51:39 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: versatile: clock: convert from round_rate() to
 determine_rate()
Message-ID: <20250711-invaluable-enchanted-baboon-53fb4f@sudeepholla>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
 <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>

On Thu, Jul 10, 2025 at 07:42:18PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  arch/arm/mach-versatile/spc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-versatile/spc.c b/arch/arm/mach-versatile/spc.c
> index 790092734cf6155daa63c44a1e5af00ecef30737..812db32448fcd415fa1a60f8bb971661369151e1 100644
> --- a/arch/arm/mach-versatile/spc.c
> +++ b/arch/arm/mach-versatile/spc.c
> @@ -497,12 +497,13 @@ static unsigned long spc_recalc_rate(struct clk_hw *hw,
>  	return freq * 1000;
>  }
>  
> -static long spc_round_rate(struct clk_hw *hw, unsigned long drate,
> -		unsigned long *parent_rate)
> +static int spc_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
>  {
>  	struct clk_spc *spc = to_clk_spc(hw);
>  
> -	return ve_spc_round_performance(spc->cluster, drate);
> +	req->rate = ve_spc_round_performance(spc->cluster, req->rate);
> +
> +	return 0;
>  }
>  
>  static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -515,7 +516,7 @@ static int spc_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  static struct clk_ops clk_spc_ops = {
>  	.recalc_rate = spc_recalc_rate,
> -	.round_rate = spc_round_rate,
> +	.determine_rate = spc_determine_rate,
>  	.set_rate = spc_set_rate,
>  };
>  
> 
> -- 
> 2.50.0
> 

-- 
Regards,
Sudeep

