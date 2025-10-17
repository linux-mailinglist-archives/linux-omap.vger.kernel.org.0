Return-Path: <linux-omap+bounces-4697-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0810FBEBC2C
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 22:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65DB740090E
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 20:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9DF279DA6;
	Fri, 17 Oct 2025 20:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="CIAsl9LX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx11lb.world4you.com (mx11lb.world4you.com [81.19.149.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F626269AEE;
	Fri, 17 Oct 2025 20:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760734351; cv=none; b=Ji22l2s+UhpWSCJKJ0XH0PswxYOm3yzTaGfOPy3lW1Pg8s6NiPRMG1TxDueeLffhlSL+jLr9mH8bdBo9hauYhrXfpxT4+utjqL9xBcTtZLSou2lTpRLfAWBpZGqfuQabEO2RS/2CoV3cw1IN0lbiJ6r7acjsaNcnL0zteX+jRIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760734351; c=relaxed/simple;
	bh=VGRTMhFA8sysC9d7ns8PJyBLOVC99HsYgqKP1k1nU6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sGS5QFA/qudZXD25cgoke+nvJh8u3fXgb9+EFCoSxch3/DGKHUBMElZfTCfDmjEhIHMog19VmF4e3D52HNRdaAbae2rxp+84HnHvHVhC0vwbhAD8JngulBPYloHiQCDhXm31g41Dngb30nhRJDXkYyGQuAo0KdpuuQnoUOMiPWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=CIAsl9LX; arc=none smtp.client-ip=81.19.149.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P/ZQYlcvylGlYVzy1cJ4oytjvyf3CVvNoc8ZU9T0G8I=; b=CIAsl9LXnDQWjJWw+abLEnt2wv
	ZCX5uwKTLPIJz6Oy689PH9m6QlsMp9OwtgMrJ1oe2aD3lnXmgPnjcF9I/iqCoRR2TVMVaB0yv5iRo
	rKVf7GJwF8VRoxkFSX9Nj08WwH2Ybuy1RZy1CNrHzfe+UMhood3BRmw3V12Sfugs88v0=;
Received: from [93.82.65.102] (helo=[10.0.0.160])
	by mx11lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1v9rR6-000000001P0-02cx;
	Fri, 17 Oct 2025 22:52:28 +0200
Message-ID: <4a220296-9bc2-4db0-b3cc-f6365d6caa51@engleder-embedded.com>
Date: Fri, 17 Oct 2025 22:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/4] net: phy: use new iterator phy_for_each in
 mdiobus_prevent_c45_scan
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
 <43b95134-0646-4129-840c-bea85cffcc65@gmail.com>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <43b95134-0646-4129-840c-bea85cffcc65@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 17.10.25 22:43, Heiner Kallweit wrote:
> Use new iterator phy_for_each() to simplify the code.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/net/phy/mdio_bus_provider.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/phy/mdio_bus_provider.c b/drivers/net/phy/mdio_bus_provider.c
> index a2391d4b7..20792480d 100644
> --- a/drivers/net/phy/mdio_bus_provider.c
> +++ b/drivers/net/phy/mdio_bus_provider.c
> @@ -249,20 +249,15 @@ static int mdiobus_scan_bus_c45(struct mii_bus *bus)
>    */
>   static bool mdiobus_prevent_c45_scan(struct mii_bus *bus)
>   {
> -	int i;
> +	struct phy_device *phydev;
>   
> -	for (i = 0; i < PHY_MAX_ADDR; i++) {
> -		struct phy_device *phydev;
> -		u32 oui;
> -
> -		phydev = mdiobus_get_phy(bus, i);
> -		if (!phydev)
> -			continue;
> -		oui = phydev->phy_id >> 10;
> +	phy_for_each(bus, phydev) {
> +		u32 oui = phydev->phy_id >> 10;
>   
>   		if (oui == MICREL_OUI)
>   			return true;
>   	}
> +
>   	return false;
>   }
>   

Reviewed-by: Gerhard Engleder <gerhard@engleder-embedded.com>

