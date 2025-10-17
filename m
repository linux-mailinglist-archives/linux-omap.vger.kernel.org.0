Return-Path: <linux-omap+bounces-4695-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBAEBEBC17
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 22:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D464A4E8AA0
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 20:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5472773E5;
	Fri, 17 Oct 2025 20:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="covli+xm"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx11lb.world4you.com (mx11lb.world4you.com [81.19.149.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042E2354AF3;
	Fri, 17 Oct 2025 20:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760734296; cv=none; b=U+yw9dtr0IawRJyn4HEm+OcLWhORM8CUHgWatfgGrdrt9+l+y/flFh4Kj4PxJJwvYxroJCfeDxqIKdRn+Q+cyygnNdv0V1hm3EHqT91gP/l07cKolfymxg4ku0YzvzTw7g+KxSAfy8xsPsx9krkcaRlEAdZd+9ywSYdLs3G6mfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760734296; c=relaxed/simple;
	bh=Gl/VpvtYhDlw6moiVzcx72Hb4vUBHeYaby7760EFFXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DyTmUJVaWgE/05+cUxj6mFO6jz3MaAk49WemTQ3/SEq4M2Z9MEc8+r2JbpjfR7EryAdKB+tyglhjkbpEeSN9L7tG5Egedk9e/5DHhyCFjE6XCkIWzWnJIlKqBgWjd04N1XbWrm9dqXtq8sK7V536L2VpcBSBvMHkLbmRyyWUIFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=covli+xm; arc=none smtp.client-ip=81.19.149.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H0ZeLgYGbD+8mm30PUM1msF9tQhQTxdlx3Q1g7f8tls=; b=covli+xmoAXX6a1XEqlvEx5l/j
	u1nCeOH97b+9GbiA44EXTGklH6f1w328YfMfSrvJ7x0R2X5ncbb2TtJZVHgITc/6Na56LCEjTYFMf
	PC19+uE2cGhxDSux1O4OJxLY2F/jPQ7wzshmMyeZoyai6qzHAozxZcpk7v7iwLKiqXQU=;
Received: from [93.82.65.102] (helo=[10.0.0.160])
	by mx11lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1v9rQB-000000001HS-1NEB;
	Fri, 17 Oct 2025 22:51:31 +0200
Message-ID: <9e96d5ce-ef8f-4200-bad7-09618cac8f28@engleder-embedded.com>
Date: Fri, 17 Oct 2025 22:51:29 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/4] net: fec: use new iterator phy_for_each
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>
References: <68a7779c-acc2-45fc-b262-14d52e929b01@gmail.com>
 <fff4a855-d7d4-4543-a11b-e3e1f6611196@gmail.com>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <fff4a855-d7d4-4543-a11b-e3e1f6611196@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 17.10.25 22:41, Heiner Kallweit wrote:
> Use new iterator phy_for_each() to simplify the code.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/net/ethernet/freescale/fec_main.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
> index 1edcfaee6..d7c39ef2d 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -2552,7 +2552,6 @@ static int fec_enet_mii_init(struct platform_device *pdev)
>   	int err = -ENXIO;
>   	u32 mii_speed, holdtime;
>   	u32 bus_freq;
> -	int addr;
>   
>   	/*
>   	 * The i.MX28 dual fec interfaces are not equal.
> @@ -2667,11 +2666,8 @@ static int fec_enet_mii_init(struct platform_device *pdev)
>   	of_node_put(node);
>   
>   	/* find all the PHY devices on the bus and set mac_managed_pm to true */
> -	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
> -		phydev = mdiobus_get_phy(fep->mii_bus, addr);
> -		if (phydev)
> -			phydev->mac_managed_pm = true;
> -	}
> +	phy_for_each(fep->mii_bus, phydev)
> +		phydev->mac_managed_pm = true;
>   
>   	mii_cnt++;
>   

Reviewed-by: Gerhard Engleder <gerhard@engleder-embedded.com>

