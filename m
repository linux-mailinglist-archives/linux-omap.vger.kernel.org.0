Return-Path: <linux-omap+bounces-4060-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE38AF8D88
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jul 2025 11:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C5105A64EA
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jul 2025 09:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EFE2F532E;
	Fri,  4 Jul 2025 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Dr/1zclY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IF4ZC77U"
X-Original-To: linux-omap@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF5E2F5326;
	Fri,  4 Jul 2025 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619469; cv=none; b=PhIZjVD4T9xyf0qyrIbfO1vKcBIXsT3e2X/hg6B0PzqmioQvVZxVggw4LXLk+pSjdIfAm0TIfOtsrrQH9UiCSXhaQbbysQMbqIu7q4ip/3cBxGz+kK6kO+1Jp+IcwX+lCEQChxSdhZqeNQLPnAHR3BIpGC6K9Zjzn2V0FQW86ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619469; c=relaxed/simple;
	bh=wuYMIxwGMEMR3DYWFdJ7l4qk19i6gD9BmnMrRAyqqfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itarA3q3sCT4UG2iqru6BSMTc1XSMzxvSjFNveonn+vNz3tVEHoRn7tbI0xYDEkrWEPiebieJ4HO5KsEkacq9JhZx2gU2GTYBo8lfgmrSbDz8I/x0RrbclfXlUUxAfa8T+j3GemeuY/0fFATy0UPQow7NtTo8NF4dL90qPM0yI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Dr/1zclY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IF4ZC77U; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 22FB87A00C0;
	Fri,  4 Jul 2025 04:57:44 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 04 Jul 2025 04:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751619463;
	 x=1751705863; bh=USFQgATkh8/GL2dbFYao1i5xeRL2FTm2q9EcU0XzEoM=; b=
	Dr/1zclY5VnCcX3Wrmn9rAI9DAJyukc2yq4xYBK/PD4syJlxiIfuGokDnlN6Vfni
	ZKYyl/QJKrSdE+lYQecP3Hk2KUT7gjLvl5RFZAdwKzTHQ/jw+Oj7T51motWFJUYV
	5arT/u39EB0E850TO4FoFlHBHzf4hzBhg74dGrJmDjxY3L7Z4Yudk/avRDzmqMDG
	CeHdeZC1xos+ipHFbp/ZRwzU0NzJqWPhgTFW31GyCJHv+208woRbR74D/ZgLyKys
	Z/yOdtfiob+h3WaiPkM4gTbWo1Ic80B9aPYzOotaQPP0MqnLiY7xF++DueSsef+o
	SjUpvM3vFfMkQGY1lcFIBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751619463; x=
	1751705863; bh=USFQgATkh8/GL2dbFYao1i5xeRL2FTm2q9EcU0XzEoM=; b=I
	F4ZC77UMFJHiBktdjeuEGtkZOtl/rj/n+Sy7Z1NE3CCQhv8ucBLnuhQt087Kr93s
	bMi7KUaNv2PVYXw7LMruqtaMks+QucHiMjkS0zrRF1Cy1e/Repb8566s1Xqn7ic1
	wXtXUZa7dweW/g0HIkYky6wAX84/mwYpzSaiXc18uRzh69h29zSyYXRN4V5JJFhP
	xYJnkjma8f6RI9eMUU02qyh8fpJ0XbcRnoe2oaGH8BAyq+Sa+rdTy1TBiwuL3t2B
	2+SYAn3g7XzzxzV4yk4N/vXy9Mt0u82nlIkookGgo0vNW2NAsLz5V8wqgXY2MnIu
	umHef8k16i7kg0I4/d/9g==
X-ME-Sender: <xms:h5dnaIy3yDqp7ePuo4llfq5xTyaRcqoiP3ITpTwHBXaEo8PNj1meVA>
    <xme:h5dnaMQKZEHmAmoRhGmixlOxweCv_u_Tk6TUxHm_E3gMavcpGDVRFQy0lX2JnhL4n
    M2Vn0C9svZ3GpsAmdA>
X-ME-Received: <xmr:h5dnaKUFVZUC2asEGUaw5XD5TtHlrSRjcs_tN2ozMJgGfGIECKYCrI11AV1mCk_WBIsMMNhX0hAMOOCVPLJPaOJyXdKZf2gTiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdejfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepffdtgeefveefgfeutdevveelgfelkeeu
    vdefgefgfeehfeeijeehudelhfejkefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrfh
    gvrhhrvgesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgs
    vgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvg
    hvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgv
    thdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtoh
    epkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggsvghnihesrhgvughh
    rghtrdgtohhmpdhrtghpthhtohepfigvihdrfhgrnhhgsehngihprdgtohhm
X-ME-Proxy: <xmx:h5dnaGgRRYevqoMdxIkYsoMnzpEwu0pNJCRCJcTFsKIPW0BIsWGslg>
    <xmx:h5dnaKCdLx4MYN94d2T3nOyWAl2RnY0frqlxLDSCkao496knxVBGfQ>
    <xmx:h5dnaHJ5SjLMY_lvvU3DW_8SSWaLuJ8R2O18tI9Kg22woFPhxldnPg>
    <xmx:h5dnaBCzh5ayu5tZKL1wEvnt50eePvTtZGLn_zj7dTA268hrm5Yrng>
    <xmx:h5dnaDz-jPh8bR8XsNIlqxcl6GNFwgtvAaU1cczzuw2qtUirGWEk8I4B>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jul 2025 04:57:42 -0400 (EDT)
Date: Fri, 4 Jul 2025 10:57:40 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>, Paul Barker <paul@pbarker.dev>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 46/80] net: ethernet: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <20250704085740.GA137171@ragnatech.se>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075435.3220683-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704075435.3220683-1-sakari.ailus@linux.intel.com>

Hej Sakari,

Thanks for your work, this is a nice improvement!

On 2025-07-04 10:54:35 +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
> 
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
> 
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
> 
>  drivers/net/ethernet/cadence/macb_main.c  | 5 -----
>  drivers/net/ethernet/freescale/fec_main.c | 8 --------
>  drivers/net/ethernet/renesas/ravb_main.c  | 4 ----

For RAVB,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

>  drivers/net/ethernet/ti/davinci_mdio.c    | 7 -------
>  4 files changed, 24 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 53aaf6b08e39..9b7cbb3e3108 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -360,7 +360,6 @@ static int macb_mdio_read_c22(struct mii_bus *bus, int mii_id, int regnum)
>  	status = MACB_BFEXT(DATA, macb_readl(bp, MAN));
>  
>  mdio_read_exit:
> -	pm_runtime_mark_last_busy(&bp->pdev->dev);
>  	pm_runtime_put_autosuspend(&bp->pdev->dev);
>  mdio_pm_exit:
>  	return status;
> @@ -406,7 +405,6 @@ static int macb_mdio_read_c45(struct mii_bus *bus, int mii_id, int devad,
>  	status = MACB_BFEXT(DATA, macb_readl(bp, MAN));
>  
>  mdio_read_exit:
> -	pm_runtime_mark_last_busy(&bp->pdev->dev);
>  	pm_runtime_put_autosuspend(&bp->pdev->dev);
>  mdio_pm_exit:
>  	return status;
> @@ -438,7 +436,6 @@ static int macb_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
>  		goto mdio_write_exit;
>  
>  mdio_write_exit:
> -	pm_runtime_mark_last_busy(&bp->pdev->dev);
>  	pm_runtime_put_autosuspend(&bp->pdev->dev);
>  mdio_pm_exit:
>  	return status;
> @@ -484,7 +481,6 @@ static int macb_mdio_write_c45(struct mii_bus *bus, int mii_id,
>  		goto mdio_write_exit;
>  
>  mdio_write_exit:
> -	pm_runtime_mark_last_busy(&bp->pdev->dev);
>  	pm_runtime_put_autosuspend(&bp->pdev->dev);
>  mdio_pm_exit:
>  	return status;
> @@ -5358,7 +5354,6 @@ static int macb_probe(struct platform_device *pdev)
>  		    macb_is_gem(bp) ? "GEM" : "MACB", macb_readl(bp, MID),
>  		    dev->base_addr, dev->irq, dev->dev_addr);
>  
> -	pm_runtime_mark_last_busy(&bp->pdev->dev);
>  	pm_runtime_put_autosuspend(&bp->pdev->dev);
>  
>  	return 0;
> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
> index d4eed252ad40..e6979599ae7e 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -2207,7 +2207,6 @@ static int fec_enet_mdio_read_c22(struct mii_bus *bus, int mii_id, int regnum)
>  	ret = FEC_MMFR_DATA(readl(fep->hwp + FEC_MII_DATA));
>  
>  out:
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return ret;
> @@ -2256,7 +2255,6 @@ static int fec_enet_mdio_read_c45(struct mii_bus *bus, int mii_id,
>  	ret = FEC_MMFR_DATA(readl(fep->hwp + FEC_MII_DATA));
>  
>  out:
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return ret;
> @@ -2288,7 +2286,6 @@ static int fec_enet_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
>  	if (ret)
>  		netdev_err(fep->netdev, "MDIO write timeout\n");
>  
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return ret;
> @@ -2332,7 +2329,6 @@ static int fec_enet_mdio_write_c45(struct mii_bus *bus, int mii_id,
>  		netdev_err(fep->netdev, "MDIO write timeout\n");
>  
>  out:
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return ret;
> @@ -2814,7 +2810,6 @@ static void fec_enet_get_regs(struct net_device *ndev,
>  		buf[off] = readl(&theregs[off]);
>  	}
>  
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  }
>  
> @@ -3590,7 +3585,6 @@ fec_enet_open(struct net_device *ndev)
>  err_enet_alloc:
>  	fec_enet_clk_enable(ndev, false);
>  clk_enable:
> -	pm_runtime_mark_last_busy(&fep->pdev->dev);
>  	pm_runtime_put_autosuspend(&fep->pdev->dev);
>  	pinctrl_pm_select_sleep_state(&fep->pdev->dev);
>  	return ret;
> @@ -3621,7 +3615,6 @@ fec_enet_close(struct net_device *ndev)
>  		cpu_latency_qos_remove_request(&fep->pm_qos_req);
>  
>  	pinctrl_pm_select_sleep_state(&fep->pdev->dev);
> -	pm_runtime_mark_last_busy(&fep->pdev->dev);
>  	pm_runtime_put_autosuspend(&fep->pdev->dev);
>  
>  	fec_enet_free_buffers(ndev);
> @@ -4568,7 +4561,6 @@ fec_probe(struct platform_device *pdev)
>  
>  	INIT_WORK(&fep->tx_timeout_work, fec_enet_timeout_work);
>  
> -	pm_runtime_mark_last_busy(&pdev->dev);
>  	pm_runtime_put_autosuspend(&pdev->dev);
>  
>  	return 0;
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index c9f4976a3527..b8bfc3cdbb6b 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1974,7 +1974,6 @@ static int ravb_open(struct net_device *ndev)
>  out_set_reset:
>  	ravb_set_opmode(ndev, CCC_OPC_RESET);
>  out_rpm_put:
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  out_napi_off:
>  	if (info->nc_queues)
> @@ -2383,7 +2382,6 @@ static int ravb_close(struct net_device *ndev)
>  	if (error)
>  		return error;
>  
> -	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);
>  
>  	return 0;
> @@ -3089,7 +3087,6 @@ static int ravb_probe(struct platform_device *pdev)
>  	netdev_info(ndev, "Base address at %#x, %pM, IRQ %d.\n",
>  		    (u32)ndev->base_addr, ndev->dev_addr, ndev->irq);
>  
> -	pm_runtime_mark_last_busy(&pdev->dev);
>  	pm_runtime_put_autosuspend(&pdev->dev);
>  
>  	return 0;
> @@ -3274,7 +3271,6 @@ static int ravb_resume(struct device *dev)
>  
>  out_rpm_put:
>  	if (!priv->wol_enabled) {
> -		pm_runtime_mark_last_busy(dev);
>  		pm_runtime_put_autosuspend(dev);
>  	}
>  
> diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
> index 68507126be8e..9f049ebbf107 100644
> --- a/drivers/net/ethernet/ti/davinci_mdio.c
> +++ b/drivers/net/ethernet/ti/davinci_mdio.c
> @@ -234,7 +234,6 @@ static int davinci_mdiobb_read_c22(struct mii_bus *bus, int phy, int reg)
>  
>  	ret = mdiobb_read_c22(bus, phy, reg);
>  
> -	pm_runtime_mark_last_busy(bus->parent);
>  	pm_runtime_put_autosuspend(bus->parent);
>  
>  	return ret;
> @@ -251,7 +250,6 @@ static int davinci_mdiobb_write_c22(struct mii_bus *bus, int phy, int reg,
>  
>  	ret = mdiobb_write_c22(bus, phy, reg, val);
>  
> -	pm_runtime_mark_last_busy(bus->parent);
>  	pm_runtime_put_autosuspend(bus->parent);
>  
>  	return ret;
> @@ -268,7 +266,6 @@ static int davinci_mdiobb_read_c45(struct mii_bus *bus, int phy, int devad,
>  
>  	ret = mdiobb_read_c45(bus, phy, devad, reg);
>  
> -	pm_runtime_mark_last_busy(bus->parent);
>  	pm_runtime_put_autosuspend(bus->parent);
>  
>  	return ret;
> @@ -285,7 +282,6 @@ static int davinci_mdiobb_write_c45(struct mii_bus *bus, int phy, int devad,
>  
>  	ret = mdiobb_write_c45(bus, phy, devad, reg, val);
>  
> -	pm_runtime_mark_last_busy(bus->parent);
>  	pm_runtime_put_autosuspend(bus->parent);
>  
>  	return ret;
> @@ -332,7 +328,6 @@ static int davinci_mdio_common_reset(struct davinci_mdio_data *data)
>  	data->bus->phy_mask = phy_mask;
>  
>  done:
> -	pm_runtime_mark_last_busy(data->dev);
>  	pm_runtime_put_autosuspend(data->dev);
>  
>  	return 0;
> @@ -441,7 +436,6 @@ static int davinci_mdio_read(struct mii_bus *bus, int phy_id, int phy_reg)
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(data->dev);
>  	pm_runtime_put_autosuspend(data->dev);
>  	return ret;
>  }
> @@ -478,7 +472,6 @@ static int davinci_mdio_write(struct mii_bus *bus, int phy_id,
>  		break;
>  	}
>  
> -	pm_runtime_mark_last_busy(data->dev);
>  	pm_runtime_put_autosuspend(data->dev);
>  
>  	return ret;
> -- 
> 2.39.5
> 

-- 
Kind Regards,
Niklas Söderlund

