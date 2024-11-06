Return-Path: <linux-omap+bounces-2591-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A93FD9BDE42
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 06:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 245821F23B90
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 05:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1EC190678;
	Wed,  6 Nov 2024 05:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UIOvMPv1"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20842F44;
	Wed,  6 Nov 2024 05:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730870591; cv=none; b=GvqUjw3hc5DsZaNVc6EKbK5i33vyj1N1lce1fKCFWuZ1ONUk9tl22UmFRs2KvpZ+4RcodLeUCMza4H7fz55/FIF+EG5sILupwEyRuFV4gHmxIFSbMLWshKXWXCMlwOZq9rrzAPcpKFDMtmgVnAjl5pqbzuQ9vg2SfMfDt4GE/2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730870591; c=relaxed/simple;
	bh=cgPTnK7yUflT4OFJfnZ0NuX/1f+xJZUNJYh58Q95Q94=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJimYimagzds1zPywwfwqm57GBLKqS+6cOPpdnm8QS9zEtH4QUhCbNekPCuQdfqPV0J4CRr7bDD3Cxw/7sfgwMe9zRbIE/KZSCDxSBA8Ql8W06g8p2Ee/czCglCLVMDQC7EeGHh++TdYWoahhH5qXNaevF7ugQeC1SEaSVNVGW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UIOvMPv1; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A65MwSe108097;
	Tue, 5 Nov 2024 23:22:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730870578;
	bh=6GXi7AtYzmKuPzltBFjWA+XDKlL2LBCCr8YexbafA3k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UIOvMPv1TA+ya7TesCTaMmnZcjmKRk/Ec8aTXvipz+5VbYa9ZyoQJHCokZwSBm+FG
	 CnVYP2aZG0d+H1KUwGExebVXUNRZjJHhAPhHxdfSAKxFXvhH+THXfUcGFEQQqdcguX
	 JWyoRK7+nArNZiw3Uwz9DOz+Fz5XbU/8Xq74p8EI=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A65Mv8n030993
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Nov 2024 23:22:58 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Nov 2024 23:22:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Nov 2024 23:22:57 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A65MuBI039366;
	Tue, 5 Nov 2024 23:22:57 -0600
Date: Wed, 6 Nov 2024 10:52:55 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Roger Quadros <rogerq@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        <linux-omap@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>,
        Pekka Varis <p-varis@ti.com>
Subject: Re: [PATCH net-next 1/2] net: ethernet: ti: am65-cpsw: update
 pri_thread_map as per IEEE802.1Q-2004
Message-ID: <35a2550e-a422-4938-af3c-a1fb4682ac56@ti.com>
References: <20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org>
 <20241105-am65-cpsw-multi-rx-dscp-v1-1-38db85333c88@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105-am65-cpsw-multi-rx-dscp-v1-1-38db85333c88@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Tue, Nov 05, 2024 at 04:18:10PM +0200, Roger Quadros wrote:

Hello Roger,

> IEEE802.1Q-2004 superseeds IEEE802.1D-2004. Now Priority Code Point (PCP)

nitpick: s/superseeds/supersedes

Also, according to:
https://standards.ieee.org/ieee/802.1D/3387/
IEEE 802.1D-2004 is superseded by 802.1Q-2014, so:
s/IEEE802.1Q-2004/IEEE802.1Q-2014/g

> 2 is no longer at a lower priority than PCP 0. PCP 1 (Background) is still
> at a lower priority than PCP 0 (Best Effort).
> 
> Reference:
> IEEE802.1Q-2004, Standard for Local and metropolitan area networks
>   Table G-2 - Traffic type acronyms
>   Table G-3 - Defining traffic types

In IEEE802.1Q-2014, the tables are:
Table I-2—Traffic type acronyms
Table I-3—Defining traffic types

> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/net/ethernet/ti/cpsw_ale.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
> index 8d02d2b21429..7dadd95cadc5 100644
> --- a/drivers/net/ethernet/ti/cpsw_ale.c
> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
> @@ -1692,26 +1692,29 @@ static void cpsw_ale_policer_reset(struct cpsw_ale *ale)
>  void cpsw_ale_classifier_setup_default(struct cpsw_ale *ale, int num_rx_ch)
>  {
>  	int pri, idx;
> -	/* IEEE802.1D-2004, Standard for Local and metropolitan area networks
> +	/* IEEE802.1Q-2004, Standard for Local and metropolitan area networks
>  	 *    Table G-2 - Traffic type acronyms
>  	 *    Table G-3 - Defining traffic types
> -	 * User priority values 1 and 2 effectively communicate a lower
> -	 * priority than 0. In the below table 0 is assigned to higher priority
> -	 * thread than 1 and 2 wherever possible.
> +	 * Also: https://en.wikipedia.org/wiki/IEEE_P802.1p#Priority_levels

Since links might change, it might be better to drop this and quote section
I.4 Traffic types and priority values of IEEE802.1Q-2014 which states:

"0 is thus used both for default priority and for Best Effort, and
Background is associated with a priority value of 1. This means that the
value 1 effectively communicates a lower priority than 0."

> +	 * Priority Code Point (PCP) value 1 (Background) communicates a lower
> +	 * priority than 0 (Best Effort). In the below table PCP 0 is assigned
> +	 * to a higher priority thread than PCP 1 wherever possible.
>  	 * The below table maps which thread the user priority needs to be
>  	 * sent to for a given number of threads (RX channels). Upper threads
>  	 * have higher priority.
>  	 * e.g. if number of threads is 8 then user priority 0 will map to
> -	 * pri_thread_map[8-1][0] i.e. thread 2
> +	 * pri_thread_map[8-1][0] i.e. thread 1
>  	 */
> -	int pri_thread_map[8][8] = {	{ 0, 0, 0, 0, 0, 0, 0, 0, },
> +
> +	int pri_thread_map[8][8] = {   /* BK,BE,EE,CA,VI,VO,IC,NC */
> +					{ 0, 0, 0, 0, 0, 0, 0, 0, },
>  					{ 0, 0, 0, 0, 1, 1, 1, 1, },
>  					{ 0, 0, 0, 0, 1, 1, 2, 2, },
> -					{ 1, 0, 0, 1, 2, 2, 3, 3, },
> -					{ 1, 0, 0, 1, 2, 3, 4, 4, },
> -					{ 1, 0, 0, 2, 3, 4, 5, 5, },
> -					{ 1, 0, 0, 2, 3, 4, 5, 6, },
> -					{ 2, 0, 1, 3, 4, 5, 6, 7, } };
> +					{ 0, 0, 1, 1, 2, 2, 3, 3, },
> +					{ 0, 0, 1, 1, 2, 2, 3, 4, },
> +					{ 1, 0, 2, 2, 3, 3, 4, 5, },
> +					{ 1, 0, 2, 3, 4, 4, 5, 6, },
> +					{ 1, 0, 2, 3, 4, 5, 6, 7 } };
>  
>  	cpsw_ale_policer_reset(ale);

Regards,
Siddharth.

