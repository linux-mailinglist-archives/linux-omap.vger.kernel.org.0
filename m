Return-Path: <linux-omap+bounces-4696-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA391BEBC26
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 22:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 627514E8196
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 20:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4D2277C98;
	Fri, 17 Oct 2025 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="kyJCHcyb"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx11lb.world4you.com (mx11lb.world4you.com [81.19.149.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151AD1D5CC6;
	Fri, 17 Oct 2025 20:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760734325; cv=none; b=jrSzg3IZvU0xlqOo85LC1//lvuh1f0VYWoIaQp180PWVvldQ5N4qbpSdeKy8/Y6AMcVXM7uV2oT00AEd6yzehfKgm4JpTIn27f6Cwy3a/EC1I8SqWq9rSxusUHz5KKNycx6OCyUIL1Ocia5lVH9LqHPBocrL2sjkmx262XfZkik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760734325; c=relaxed/simple;
	bh=KUXF39R9R+uUXZDMNYJHPlpKwIMDUVWtJgvw8t3kA4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvSwbeSROOBoLyc41Pto5cj3jUk0YWbslrX4cj4j/UY+EYNj7ChHNU63qxZVI0J3sNq5RXTVNok1QW6KshumFaZiBFpgp2qaJS5eJFsB7xUNNp0ErZku+tjYmZHNf5Ifm3mYcLVoCtSSiJeg9InwqK051CejtPxuSuhHVE02FMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=kyJCHcyb; arc=none smtp.client-ip=81.19.149.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=06RvTrhmjwhAQ4yqa++w1fdHeqcnFbHo8zZqh/FbHIA=; b=kyJCHcybQnKflh2qGO34aUjYY6
	tY+vioFrvh3iMVHUedijPLcFnQLRyRuJ9pJyHJxMT898/uF9F5DmkQk+KZuedpvM6FOqdPfc+nJ4/
	38N7SwM2eEv++BirdVv/DDiBDXfTxPxx8H18WP3i4adIRn9RDOLC3WXwqNvWtgtSlV7c=;
Received: from [93.82.65.102] (helo=[10.0.0.160])
	by mx11lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1v9rQf-000000001Ls-1zHp;
	Fri, 17 Oct 2025 22:52:01 +0200
Message-ID: <21605393-1cdd-48ea-8da7-a43c5e354005@engleder-embedded.com>
Date: Fri, 17 Oct 2025 22:51:59 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/4] net: davinci_mdio: use new iterator
 phy_for_each
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
 <73ee007f-ba94-47c4-8d78-698cffcbacc2@gmail.com>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <73ee007f-ba94-47c4-8d78-698cffcbacc2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes

On 17.10.25 22:42, Heiner Kallweit wrote:
> Use new iterator phy_for_each() to simplify the code.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/net/ethernet/ti/davinci_mdio.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
> index 68507126b..5a7ed5ebf 100644
> --- a/drivers/net/ethernet/ti/davinci_mdio.c
> +++ b/drivers/net/ethernet/ti/davinci_mdio.c
> @@ -548,8 +548,8 @@ static int davinci_mdio_probe(struct platform_device *pdev)
>   	struct davinci_mdio_data *data;
>   	struct resource *res;
>   	struct phy_device *phy;
> -	int ret, addr;
>   	int autosuspend_delay_ms = -1;
> +	int ret;
>   
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
> @@ -652,14 +652,10 @@ static int davinci_mdio_probe(struct platform_device *pdev)
>   		goto bail_out;
>   
>   	/* scan and dump the bus */
> -	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
> -		phy = mdiobus_get_phy(data->bus, addr);
> -		if (phy) {
> -			dev_info(dev, "phy[%d]: device %s, driver %s\n",
> -				 phy->mdio.addr, phydev_name(phy),
> -				 phy->drv ? phy->drv->name : "unknown");
> -		}
> -	}
> +	phy_for_each(data->bus, phy)
> +		dev_info(dev, "phy[%d]: device %s, driver %s\n",
> +			 phy->mdio.addr, phydev_name(phy),
> +			 phy->drv ? phy->drv->name : "unknown");
>   
>   	return 0;
>   

Reviewed-by: Gerhard Engleder <gerhard@engleder-embedded.com>

