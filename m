Return-Path: <linux-omap+bounces-3253-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFDFA24968
	for <lists+linux-omap@lfdr.de>; Sat,  1 Feb 2025 14:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 770C07A345D
	for <lists+linux-omap@lfdr.de>; Sat,  1 Feb 2025 13:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA931B6D1F;
	Sat,  1 Feb 2025 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="DWilZUHe"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5901DFE8;
	Sat,  1 Feb 2025 13:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738416878; cv=none; b=VE3u36KGcIW6xmzOIfp0mVBUNfKRvsbHV69tU5ftWSXpvpSQyD7CdKj1YW6MQzW/NdbCRnpdxzHT/kQK2PbYaTnVKJucibt7FgvAiJLAR1XtnWPFpoWfpzZggu2rGMgNK9C7qBGw+NauF5vgoN+BezU8/tLNqZ5jhkLFfJbEiUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738416878; c=relaxed/simple;
	bh=wVUEdq+cZBCGi6YfBLorwgC/44y1mdBqVILwdx1VEMo=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=pE7gExzg4yy3DsCURTDzEQJsgQHUFKMXdYr2Ne9KmLu7onAyNgGOMbr/73yYaawKkoaXq939LYoDGJOpBdnBRYI7qcoE4yeGiHdIXfubghIXwpy4Qy10tl/6aDfMskLNRnV99B1J0Djv3fyoKYaFoAUIDTRkxjpAU3V+A3MIqtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=DWilZUHe; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zo3/A9st5oSX6NUjs1CyD3LM/r/HgObAUaSlHXW6a08=; b=DWilZUHesdU0Z/Bam98oNtEVj0
	89K+1OQeXa/ISF7g0aKRBag0fCsYJuOFHPyVZ5PyKVKihFrAdSd44G3kjR9MQyimPFLcR8yJXGGYh
	pOxpIJsY0EQywws1Z8OlQAUnVckvjhKXECGph3C96pR7oQ6aooWTku5ts0x6/zxOFqrA/hAxRVJPg
	7y1Jug1r3WlIxMB3Q1QY4hr1zt5I6SPWGcS2XKEH0o66ohQyvI5A85QrHNr61oxV9svY6SVIG8CIy
	PleR5oRWoJQ+BJy95eyPJXT6pm3KFOW97YDlm7Qk4S9ZKZloxEsxGAQbq/3oU8VDhAaVcTT6vaq/E
	26gGNXow==;
Received: from [122.175.9.182] (port=55603 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1teDdm-000408-2Y;
	Sat, 01 Feb 2025 19:04:31 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id ABA701781C56;
	Sat,  1 Feb 2025 19:04:24 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 89B451782035;
	Sat,  1 Feb 2025 19:04:24 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jZ8z6HCOusIZ; Sat,  1 Feb 2025 19:04:24 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 2FBA81781C56;
	Sat,  1 Feb 2025 19:04:24 +0530 (IST)
Date: Sat, 1 Feb 2025 19:04:23 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: horms <horms@kernel.org>
Cc: basharath <basharath@couthit.com>, danishanwar <danishanwar@ti.com>, 
	rogerq <rogerq@kernel.org>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, krzk+dt <krzk+dt@kernel.org>, 
	conor+dt <conor+dt@kernel.org>, nm <nm@ti.com>, 
	ssantosh <ssantosh@kernel.org>, tony <tony@atomide.com>, 
	richardcochran <richardcochran@gmail.com>, 
	parvathi <parvathi@couthit.com>, schnelle <schnelle@linux.ibm.com>, 
	rdunlap <rdunlap@infradead.org>, diogo ivo <diogo.ivo@siemens.com>, 
	m-karicheri2 <m-karicheri2@ti.com>, 
	jacob e keller <jacob.e.keller@intel.com>, 
	m-malladi <m-malladi@ti.com>, 
	javier carrasco cruz <javier.carrasco.cruz@gmail.com>, 
	afd <afd@ti.com>, s-anna <s-anna@ti.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	netdev <netdev@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-omap <linux-omap@vger.kernel.org>, 
	pratheesh <pratheesh@ti.com>, prajith <prajith@ti.com>, 
	vigneshr <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, 
	mohan <mohan@couthit.com>
Message-ID: <1286353335.481759.1738416863757.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250130154719.GB13457@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com> <20250124122353.1457174-4-basharath@couthit.com> <20250130154719.GB13457@kernel.org>
Subject: Re: [RFC v2 PATCH 03/10] net: ti: prueth: Adds PRUETH HW and SW
 configuration
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds PRUETH HW and SW configuration
Thread-Index: n2HoAXM84Klo9Mhl6VoWMj4Ct565vg==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

> On Fri, Jan 24, 2025 at 05:53:46PM +0530, Basharath Hussain Khaja wrote:
>> From: Roger Quadros <rogerq@ti.com>
>> 
>> Updates for MII_RT hardware peripheral configuration such as RX and TX
>> configuration for PRU0 and PRU1, frame sizes, and MUX config.
>> 
>> Updates for PRU-ICSS firmware register configuration and DRAM, SRAM and
>> OCMC memory initialization, which will be used in the runtime for packet
>> reception and transmission.
>> 
>> DUAL-EMAC memory allocation for software queues and its supporting
>> components such as the buffer descriptors and queue discriptors. These
> 
> nit: descriptors
> 

Sure. We will change in the next version.

>> software queues are placed in OCMC memory and are shared with CPU by
>> PRU-ICSS for packet receive and transmit.
>> 
>> All declarations and macros are being used from common header file
>> for various protocols.
>> 
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> 
> ...
> 
>> +static void icssm_prueth_mii_init(struct prueth *prueth)
>> +{
>> +	struct regmap *mii_rt;
>> +	u32 rxcfg_reg, rxcfg;
>> +	u32 txcfg_reg, txcfg;
>> +
>> +	mii_rt = prueth->mii_rt;
>> +
>> +	rxcfg = PRUSS_MII_RT_RXCFG_RX_ENABLE |
>> +		PRUSS_MII_RT_RXCFG_RX_DATA_RDY_MODE_DIS |
>> +		PRUSS_MII_RT_RXCFG_RX_L2_EN |
>> +		PRUSS_MII_RT_RXCFG_RX_CUT_PREAMBLE |
>> +		PRUSS_MII_RT_RXCFG_RX_L2_EOF_SCLR_DIS;
>> +
>> +	/* Configuration of Port 0 Rx */
>> +	rxcfg_reg = PRUSS_MII_RT_RXCFG0;
>> +
>> +	regmap_write(mii_rt, rxcfg_reg, rxcfg);
>> +
>> +	/* Configuration of Port 1 Rx */
>> +	rxcfg_reg = PRUSS_MII_RT_RXCFG1;
>> +
>> +	rxcfg |= PRUSS_MII_RT_RXCFG_RX_MUX_SEL;
>> +
>> +	regmap_write(mii_rt, rxcfg_reg, rxcfg);
>> +
>> +	txcfg = PRUSS_MII_RT_TXCFG_TX_ENABLE |
>> +		PRUSS_MII_RT_TXCFG_TX_AUTO_PREAMBLE |
>> +		PRUSS_MII_RT_TXCFG_TX_32_MODE_EN |
>> +		(TX_START_DELAY << PRUSS_MII_RT_TXCFG_TX_START_DELAY_SHIFT) |
>> +		(TX_CLK_DELAY_100M << PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_SHIFT);
>> +
>> +	/* Configuration of Port 0 Tx */
>> +	txcfg_reg = PRUSS_MII_RT_TXCFG0;
>> +
>> +	regmap_write(mii_rt, txcfg_reg, txcfg);
>> +
>> +	txcfg	|= PRUSS_MII_RT_TXCFG_TX_MUX_SEL;
> 
> nit: a space seems more appropriate than a tab before '|='
> 

Sure. We will remove extra spaces in the next version.

>> +
>> +	/* Configuration of Port 1 Tx */
>> +	txcfg_reg = PRUSS_MII_RT_TXCFG1;
>> +
>> +	regmap_write(mii_rt, txcfg_reg, txcfg);
>> +
>> +	txcfg_reg = PRUSS_MII_RT_RX_FRMS0;
>> +
>> +	/* Min frame length should be set to 64 to allow receive of standard
>> +	 * Ethernet frames such as PTP, LLDP that will not have the tag/rct.
>> +	 * Actual size written to register is size - 1 per TRM. This also
>> +	 * includes CRC/FCS.
>> +	 */
>> +	txcfg = (((PRUSS_MII_RT_RX_FRMS_MIN_FRM - 1) <<
>> +			PRUSS_MII_RT_RX_FRMS_MIN_FRM_SHIFT) &
>> +			PRUSS_MII_RT_RX_FRMS_MIN_FRM_MASK);
>> +
>> +	/* For EMAC, set Max frame size to 1528 i.e size with VLAN.
>> +	 * Actual size written to register is size - 1 as per TRM.
>> +	 * Since driver support run time change of protocol, driver
>> +	 * must overwrite the values based on Ethernet type.
>> +	 */
>> +	txcfg |= (((PRUSS_MII_RT_RX_FRMS_MAX_SUPPORT_EMAC - 1) <<
>> +			   PRUSS_MII_RT_RX_FRMS_MAX_FRM_SHIFT)	&
>> +			   PRUSS_MII_RT_RX_FRMS_MAX_FRM_MASK);
>> +
>> +	regmap_write(mii_rt, txcfg_reg, txcfg);
>> +
>> +	txcfg_reg = PRUSS_MII_RT_RX_FRMS1;
>> +
>> +	regmap_write(mii_rt, txcfg_reg, txcfg);
>> +}
> 
> ...
> 
>> @@ -377,6 +705,70 @@ static int icssm_prueth_probe(struct platform_device *pdev)
>>  		}
>>  	}
>>  
>> +	pruss = pruss_get(prueth->pru0 ? prueth->pru0 : prueth->pru1);
>> +	if (IS_ERR(pruss)) {
>> +		ret = PTR_ERR(pruss);
>> +		dev_err(dev, "unable to get pruss handle\n");
>> +		goto put_pru;
>> +	}
>> +	prueth->pruss = pruss;
>> +
>> +	ret = pruss_cfg_ocp_master_ports(prueth->pruss, 1);
>> +	if (ret) {
>> +		dev_err(dev, "couldn't enabled ocp master port: %d\n", ret);
>> +		goto put_pruss;
>> +	}
> 
> FTR, I applied this patch set on top of the patch at the link below
> so that pruss_cfg_ocp_master_ports() is present.
> 
> - [PATCH v2 1/1] soc: ti: PRUSS OCP configuration
>  https://lore.kernel.org/all/20250108125937.10604-2-basharath@couthit.com/
> 
>  ...
> 
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h
>> b/drivers/net/ethernet/ti/icssm/icssm_prueth.h
> 
> ...
> 
>> +/**
>> + * struct prueth_queue - Information about a queue in memory
> 
> struct prueth_queue_info
> 

We will address this in the next version.

>> + * @buffer_offset: buffer offset in OCMC RAM
>> + * @queue_desc_offset: queue descriptor offset in Shared RAM
>> + * @buffer_desc_offset: buffer descriptors offset in Shared RAM
>> + * @buffer_desc_end: end address of buffer descriptors in Shared RAM
>> + */
>> +struct prueth_queue_info {
>> +	u16 buffer_offset;
>> +	u16 queue_desc_offset;
>> +	u16 buffer_desc_offset;
>> +	u16 buffer_desc_end;
>> +} __packed;
> 
> ...

Thanks & Best Regards,
Basharath

