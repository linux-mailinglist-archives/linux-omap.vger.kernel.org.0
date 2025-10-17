Return-Path: <linux-omap+bounces-4694-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 505CEBEBC11
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 22:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D21B519C71BD
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 20:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F60275105;
	Fri, 17 Oct 2025 20:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="ixF/2kaZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx11lb.world4you.com (mx11lb.world4you.com [81.19.149.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627971D5CC6;
	Fri, 17 Oct 2025 20:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760734267; cv=none; b=fU8doLUh5RiauezPGfqJOOz/6zjk38O6N5U7gZIvUkY35dkk9WMPsbXzC6Rs193ZyRLixd3L1y17mmXlySIBi7MwO05z8bYifN73knkEWbx5TzFQh3rxfIRGcz2St4MTlDMnFwpkxYr3OKK9XUtPYajcQKNTj1LlB9gYqKad/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760734267; c=relaxed/simple;
	bh=pWFJ//3gzqpFvcOcER3z0HAT5rDRudAQ/oyCzf3Nbhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZhin+dnGTcKtSfy7Gv4kIjt/YPoPL0KyxCYIJ7PS2OA2FSx/dPwIcV2CBobuVtA/xGS/qQgNvVz2W8li6tUPhuDSHaUCZZ0tlVlThOQcv6TTDv9/oJ1Id+RlFbaNllDYMcqmYx5Ykjt2bpaziIgcQsdtjrT+1UKLb4N7sMbvqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=ixF/2kaZ; arc=none smtp.client-ip=81.19.149.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bi1gsBD6UtknR/EOneLGa2QC3ZSGy0nQIUJOZ9POg1M=; b=ixF/2kaZ/ENMsdCMHIprwKde/u
	2mIPl4h12hKtV0MrqtUxIaDdRPgkfzlDAooTQ6lKmf3BZ+0Z5PIBHiA0z5lPbb8CEpCNkGFQe+Csi
	/ypIRWg3BEyUs031DCUDwCh2xV+f05EAsXaEopmNrrPmFO67BqNYsA+LPauI0OziN6TA=;
Received: from [93.82.65.102] (helo=[10.0.0.160])
	by mx11lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1v9rPi-000000001EP-0mkA;
	Fri, 17 Oct 2025 22:51:02 +0200
Message-ID: <16b42275-a7c5-4009-8e12-a650fd9ff9e6@engleder-embedded.com>
Date: Fri, 17 Oct 2025 22:51:00 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] net: phy: add iterator phy_for_each
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
 <7d33ee44-8558-40d9-b258-2942b2caf95f@gmail.com>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <7d33ee44-8558-40d9-b258-2942b2caf95f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes



On 17.10.25 22:41, Heiner Kallweit wrote:
> Add an iterator for all PHY's on a MII bus, and phy_find_next()
> as a prerequisite.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/net/phy/phy_device.c | 14 +++++++-------
>   include/linux/phy.h          | 11 ++++++++++-
>   2 files changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index 7a67c900e..72d58b38d 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1214,22 +1214,22 @@ int phy_get_c45_ids(struct phy_device *phydev)
>   EXPORT_SYMBOL(phy_get_c45_ids);
>   
>   /**
> - * phy_find_first - finds the first PHY device on the bus
> + * phy_find_next - finds the next PHY device on the bus
>    * @bus: the target MII bus
> + * @pos: cursor
>    */
> -struct phy_device *phy_find_first(struct mii_bus *bus)
> +struct phy_device *phy_find_next(struct mii_bus *bus, struct phy_device *pos)
>   {
> -	struct phy_device *phydev;
> -	int addr;
> +	for (int addr = pos ? pos->mdio.addr + 1 : 0;
> +	     addr < PHY_MAX_ADDR; addr++) {
> +		struct phy_device *phydev = mdiobus_get_phy(bus, addr);
>   
> -	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
> -		phydev = mdiobus_get_phy(bus, addr);
>   		if (phydev)
>   			return phydev;
>   	}
>   	return NULL;
>   }
> -EXPORT_SYMBOL(phy_find_first);
> +EXPORT_SYMBOL_GPL(phy_find_next);
>   
>   /**
>    * phy_prepare_link - prepares the PHY layer to monitor link status
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 3c7634482..b0497f47b 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -1848,7 +1848,7 @@ int phy_sfp_probe(struct phy_device *phydev,
>   	          const struct sfp_upstream_ops *ops);
>   struct phy_device *phy_attach(struct net_device *dev, const char *bus_id,
>   			      phy_interface_t interface);
> -struct phy_device *phy_find_first(struct mii_bus *bus);
> +struct phy_device *phy_find_next(struct mii_bus *bus, struct phy_device *pos);
>   int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
>   		      u32 flags, phy_interface_t interface);
>   int phy_connect_direct(struct net_device *dev, struct phy_device *phydev,
> @@ -1875,6 +1875,15 @@ bool phy_check_valid(int speed, int duplex, unsigned long *features);
>   int phy_restart_aneg(struct phy_device *phydev);
>   int phy_reset_after_clk_enable(struct phy_device *phydev);
>   
> +static inline struct phy_device *phy_find_first(struct mii_bus *bus)
> +{
> +	return phy_find_next(bus, NULL);
> +}
> +
> +#define phy_for_each(_bus, _phydev)			\
> +	for (_phydev = phy_find_first(_bus); _phydev;	\
> +	     _phydev = phy_find_next(_bus, _phydev))
> +
>   #if IS_ENABLED(CONFIG_PHYLIB)
>   int phy_start_cable_test(struct phy_device *phydev,
>   			 struct netlink_ext_ack *extack);

Reviewed-by: Gerhard Engleder <gerhard@engleder-embedded.com>

