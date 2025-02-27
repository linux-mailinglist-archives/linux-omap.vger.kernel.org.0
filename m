Return-Path: <linux-omap+bounces-3305-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1860A47BCB
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2025 12:18:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7C50189358D
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2025 11:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B688B22B5B2;
	Thu, 27 Feb 2025 11:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ukm+VJdB"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9868F22A4C5;
	Thu, 27 Feb 2025 11:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654899; cv=none; b=YQJaLRGvQfQjvG9oHPizd6b7BUjMNFGQb5utV1vFyoejv79asMn+nCji+WcuyRgtj5O/yaHZTWwfBgM95cyRavwwkO8vUqAHCOSfXB27lOpWUe/HX93dfyNg1MxTtQOdE/b7F/7JvrU3m59XFTPUFle8xRm/0U6iOjdUKhjlzfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654899; c=relaxed/simple;
	bh=b8B0EikosVZ437a/eglgDC8USmkxAH6JQNTKeLA7SjU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pE3qZ+de/S81a/JTAY+z2aHrY824TVhuU7zkgD6kpiM7Jw1e8ru7Ai5NhgMasvBG8TDuumyI1/r83ObiBr6lYaz7JD5uM8WnWgA61yWxM2xoM7muJdMO99hlSlrt+An9zWavwZJBRUj/OZ2VJiCTFdkppcRuFKJoGUiDMzyVTWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ukm+VJdB; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51RBEhbp1752657
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 05:14:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740654883;
	bh=CdJSw/chnCmKUnyDanFAYQUq+B+4rxHEynYliRPKg9I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Ukm+VJdBwN/9eAgRk7lq3nqBF/tGAqpn1gTRDCCvMPxi9jboA1H0AJUl5SHHOZ4aX
	 LcFt+EnyG9amVrasX75wI52J6+izGlm2DMzw5H4+BYJo8/pe7d5hP7FUdCcMP+s6pK
	 yaJymDkDgiqk1bez8J67a1Gl+Ld61F7zTP5rUNjo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51RBEhYN009041
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Feb 2025 05:14:43 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Feb 2025 05:14:42 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Feb 2025 05:14:42 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51RBEfqT031097;
	Thu, 27 Feb 2025 05:14:42 -0600
Date: Thu, 27 Feb 2025 16:44:41 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <netdev@vger.kernel.org>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] net: ethernet: ti: cpsw_new: populate netdev
 of_node
Message-ID: <20250227111441.athqur6dcesdk5gb@uda0492258>
References: <20250227074704.4067481-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250227074704.4067481-1-alexander.sverdlin@siemens.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Thu, Feb 27, 2025 at 08:46:46AM +0100, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> So that of_find_net_device_by_node() can find cpsw-nuss ports and other DSA
> switches can be stacked downstream. Tested in conjunction with KSZ8873.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

> ---
>  drivers/net/ethernet/ti/cpsw_new.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
> index cec0a90659d94..66713bc931741 100644
> --- a/drivers/net/ethernet/ti/cpsw_new.c
> +++ b/drivers/net/ethernet/ti/cpsw_new.c
> @@ -1418,6 +1418,7 @@ static int cpsw_create_ports(struct cpsw_common *cpsw)
>  		ndev->netdev_ops = &cpsw_netdev_ops;
>  		ndev->ethtool_ops = &cpsw_ethtool_ops;
>  		SET_NETDEV_DEV(ndev, dev);
> +		ndev->dev.of_node = slave_data->slave_node;
>  
>  		if (!napi_ndev) {
>  			/* CPSW Host port CPDMA interface is shared between

Regards,
Siddharth.

