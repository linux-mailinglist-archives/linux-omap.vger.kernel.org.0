Return-Path: <linux-omap+bounces-1698-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CECC927384
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 12:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B04791F2583F
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 10:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504081AB8EF;
	Thu,  4 Jul 2024 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="s8FQsX16"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA69D1AB506;
	Thu,  4 Jul 2024 09:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720087193; cv=none; b=SVBPxJiCAy+BYAo9cp4miSnBvYLAZBDm9mV4OKAbiDkgiHsLowV2I9/3cyUiq3KCD2slxXrMvwIliexH4vMTGP6+u057OL4fFqN4oNeScWsFNT9WvEfvlF4WkQEfUP/UiFZ4jXfUBPZfLJ7tnlMECsgiI68vukz2sxPENYBYaVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720087193; c=relaxed/simple;
	bh=UF47+XUuv9s9PwibAJ5mZ7A9Nmb6w9fEqaLcPaPyT6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lvaQQwu0Xw0dOg83978B5aI9ED7vAgD0EqtMWjiIZ7uoj9t+fbOEs7s56PGC8nVWXA+tamzQ+ciG4E0rpL0/PX34+MmmZbV3Exek+/L48MyG4FSyE84YSMQY4iHIiXFKT/+FWd/AsBPKdjaGypwVTogGF97VtouLpGKN3GN0Es4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=s8FQsX16; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4649xNIJ042282;
	Thu, 4 Jul 2024 04:59:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720087163;
	bh=MBQIYIi7yNxKONGlWf4PZynY85z1j+VFsd0JANSa7lQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=s8FQsX160NRNDL439QkMuqTP5+SOdLbAuxFwGWSr5YSIKzpuc9oa33B0LmRLwEyg4
	 +tG54OrhoaABwCX3e+tRo2vNBjfyBcpqIbNh2BjuWpxHSrOtYCFIwvfEVXUlitxjS5
	 wtCGpiNebtrgPwgavRtvVZqHgiSIUiNHzChog4jY=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4649xNjr080739
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Jul 2024 04:59:23 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 Jul 2024 04:59:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 4 Jul 2024 04:59:22 -0500
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4649xHxt063842;
	Thu, 4 Jul 2024 04:59:18 -0500
Message-ID: <8aabc426-4dd2-43ce-bb79-9aef43eb1ac2@ti.com>
Date: Thu, 4 Jul 2024 15:29:17 +0530
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/6] net: ethernet: ti: am65-cpsw: Add multi
 queue RX support
To: Roger Quadros <rogerq@kernel.org>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>,
        Julien Panis <jpanis@baylibre.com>
CC: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        <srk@ti.com>, <vigneshr@ti.com>, pekka Varis <p-varis@ti.com>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
References: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180



On 03/07/24 7:21 pm, Roger Quadros wrote:
> Hi,
> 
> am65-cpsw can support up to 8 queues at Rx. So far we have
> been using only one queue (i.e. default flow) for all RX traffic.
> 
> This series adds multi-queue support. The driver starts with
> 1 RX queue by default. User can increase the RX queues via ethtool,
> e.g. 'ethtool -L ethx rx <N>'
> 
> The series also adds regmap and regfield support to some of the
> ALE registers. It adds Policer/Classifier registers and fields.
> 
> Converting the existing ALE control APIs to regfields can be a separate
> exercise.
> 
> Some helper functions are added to read/write to the Policer/Classifier
> registers and a default Classifier setup function is added that
> routes packets based on their PCP/DSCP priority to different RX queues.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
> Changes in v3:
> - code style fixes
> - squashed patches 5 and 6
> - added comment about priority to thread mapping table.
> - Added Reviewed-by Simon Horman.
> - Link to v2: https://lore.kernel.org/r/20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org
> 
> Changes in v2:
> - rebase to net/next
> - fixed RX stall issue during iperf
> - Link to v1: https://lore.kernel.org/r/20240606-am65-cpsw-multi-rx-v1-0-0704b0cb6fdc@kernel.org
> 
> ---
> Roger Quadros (6):
>       net: ethernet: ti: am65-cpsw: Introduce multi queue Rx
>       net: ethernet: ti: cpsw_ale: use regfields for ALE registers
>       net: ethernet: ti: cpsw_ale: use regfields for number of Entries and Policers
>       net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields
>       net: ethernet: ti: cpsw_ale: add policer/classifier helpers and setup defaults
>       net: ethernet: ti: am65-cpsw: setup priority to flow mapping
> 
>  drivers/net/ethernet/ti/am65-cpsw-ethtool.c |  62 +++--
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 370 ++++++++++++++++------------
>  drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  36 +--
>  drivers/net/ethernet/ti/cpsw_ale.c          | 287 +++++++++++++++++++--
>  drivers/net/ethernet/ti/cpsw_ale.h          |  62 ++++-
>  5 files changed, 609 insertions(+), 208 deletions(-)
> ---
> base-commit: 84562f9953ec5f91a4922baa2bd4f2d4f64fac31
> change-id: 20240606-am65-cpsw-multi-rx-fb6cf8dea5eb
> 
> Best regards,

For this series,
Reviewed-by: MD Danish Anwar <danishanwar@ti.com>

-- 
Thanks and Regards,
Danish

