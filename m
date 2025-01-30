Return-Path: <linux-omap+bounces-3241-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77602A23126
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2025 16:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72F353A688E
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2025 15:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E211E9B3D;
	Thu, 30 Jan 2025 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNqhNetF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AAD1E1C22;
	Thu, 30 Jan 2025 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738252049; cv=none; b=LvZckarFbCHmAYYcLxm6TES2fb5pF/8IXfm51MxfqHL88rEh85s1UImLEmiXD6Rb1TD10ZZGN4RMkxB0yr5WzDfbuoteHed49pRKyKbtxtTCtEBPtKwKX3jw8dThicBkxznkQvTXYdbCmVTKkFdN+YC/Yt4+A8gx1zJhAYLHTog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738252049; c=relaxed/simple;
	bh=entpPE/XLPTAVOjCVIGfmXrS7TW5SiMVBiEBoUBQ29w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vo+W2GokPkZeeVLppuYCAyXKE7lVAJiVIe4Xn+xEVuu8NE4BMjHiXDQd+mgLQjMbWIntNbS2MOop8PAakCBw8LTi6jgIPT9zjkYoTZjfDXMDc+beK4P1zySsysDhlo+4CV4rpEUkJhthOydYA97Yd96FFb29DDlDjjm691LO7oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNqhNetF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A69C4CED2;
	Thu, 30 Jan 2025 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738252049;
	bh=entpPE/XLPTAVOjCVIGfmXrS7TW5SiMVBiEBoUBQ29w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNqhNetF+tuv+izOBYtId4d7tRJktDS290e2LBOm4cuIvpZ6A7E38D1G0SYYXcSeb
	 cbfc0TbNwZSvOERlqgXg8URWDnl6mi8Mp31xTLHfotUn9rbZ9vuLWxsC2q8jnvqPyH
	 efPv2J30V36odxeIFjJ1uDWqbsSqmoauwdBOALu3Y/2p44ccNLjI7DYvOFS0WRVOvT
	 vtGm9OsViLdQnCS4xO4b/bB9J7BRo4spcc3syfrZBZTBz9PUkhCNwh4lplMD9wrK6n
	 JaIC9wW9InxbK3UabzuKAkfjlzhg1gt2rwx4vyTzf9J/Kj4WYDk7YEKAoUQp8KBGho
	 LrO9SaR8Vyt9w==
Date: Thu, 30 Jan 2025 15:47:19 +0000
From: Simon Horman <horms@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	tony@atomide.com, richardcochran@gmail.com, parvathi@couthit.com,
	schnelle@linux.ibm.com, rdunlap@infradead.org,
	diogo.ivo@siemens.com, m-karicheri2@ti.com,
	jacob.e.keller@intel.com, m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
Subject: Re: [RFC v2 PATCH 03/10] net: ti: prueth: Adds PRUETH HW and SW
 configuration
Message-ID: <20250130154719.GB13457@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124122353.1457174-4-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124122353.1457174-4-basharath@couthit.com>

On Fri, Jan 24, 2025 at 05:53:46PM +0530, Basharath Hussain Khaja wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Updates for MII_RT hardware peripheral configuration such as RX and TX
> configuration for PRU0 and PRU1, frame sizes, and MUX config.
> 
> Updates for PRU-ICSS firmware register configuration and DRAM, SRAM and
> OCMC memory initialization, which will be used in the runtime for packet
> reception and transmission.
> 
> DUAL-EMAC memory allocation for software queues and its supporting
> components such as the buffer descriptors and queue discriptors. These

nit: descriptors

> software queues are placed in OCMC memory and are shared with CPU by
> PRU-ICSS for packet receive and transmit.
> 
> All declarations and macros are being used from common header file
> for various protocols.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c

...

> +static void icssm_prueth_mii_init(struct prueth *prueth)
> +{
> +	struct regmap *mii_rt;
> +	u32 rxcfg_reg, rxcfg;
> +	u32 txcfg_reg, txcfg;
> +
> +	mii_rt = prueth->mii_rt;
> +
> +	rxcfg = PRUSS_MII_RT_RXCFG_RX_ENABLE |
> +		PRUSS_MII_RT_RXCFG_RX_DATA_RDY_MODE_DIS |
> +		PRUSS_MII_RT_RXCFG_RX_L2_EN |
> +		PRUSS_MII_RT_RXCFG_RX_CUT_PREAMBLE |
> +		PRUSS_MII_RT_RXCFG_RX_L2_EOF_SCLR_DIS;
> +
> +	/* Configuration of Port 0 Rx */
> +	rxcfg_reg = PRUSS_MII_RT_RXCFG0;
> +
> +	regmap_write(mii_rt, rxcfg_reg, rxcfg);
> +
> +	/* Configuration of Port 1 Rx */
> +	rxcfg_reg = PRUSS_MII_RT_RXCFG1;
> +
> +	rxcfg |= PRUSS_MII_RT_RXCFG_RX_MUX_SEL;
> +
> +	regmap_write(mii_rt, rxcfg_reg, rxcfg);
> +
> +	txcfg = PRUSS_MII_RT_TXCFG_TX_ENABLE |
> +		PRUSS_MII_RT_TXCFG_TX_AUTO_PREAMBLE |
> +		PRUSS_MII_RT_TXCFG_TX_32_MODE_EN |
> +		(TX_START_DELAY << PRUSS_MII_RT_TXCFG_TX_START_DELAY_SHIFT) |
> +		(TX_CLK_DELAY_100M << PRUSS_MII_RT_TXCFG_TX_CLK_DELAY_SHIFT);
> +
> +	/* Configuration of Port 0 Tx */
> +	txcfg_reg = PRUSS_MII_RT_TXCFG0;
> +
> +	regmap_write(mii_rt, txcfg_reg, txcfg);
> +
> +	txcfg	|= PRUSS_MII_RT_TXCFG_TX_MUX_SEL;

nit: a space seems more appropriate than a tab before '|='

> +
> +	/* Configuration of Port 1 Tx */
> +	txcfg_reg = PRUSS_MII_RT_TXCFG1;
> +
> +	regmap_write(mii_rt, txcfg_reg, txcfg);
> +
> +	txcfg_reg = PRUSS_MII_RT_RX_FRMS0;
> +
> +	/* Min frame length should be set to 64 to allow receive of standard
> +	 * Ethernet frames such as PTP, LLDP that will not have the tag/rct.
> +	 * Actual size written to register is size - 1 per TRM. This also
> +	 * includes CRC/FCS.
> +	 */
> +	txcfg = (((PRUSS_MII_RT_RX_FRMS_MIN_FRM - 1) <<
> +			PRUSS_MII_RT_RX_FRMS_MIN_FRM_SHIFT) &
> +			PRUSS_MII_RT_RX_FRMS_MIN_FRM_MASK);
> +
> +	/* For EMAC, set Max frame size to 1528 i.e size with VLAN.
> +	 * Actual size written to register is size - 1 as per TRM.
> +	 * Since driver support run time change of protocol, driver
> +	 * must overwrite the values based on Ethernet type.
> +	 */
> +	txcfg |= (((PRUSS_MII_RT_RX_FRMS_MAX_SUPPORT_EMAC - 1) <<
> +			   PRUSS_MII_RT_RX_FRMS_MAX_FRM_SHIFT)	&
> +			   PRUSS_MII_RT_RX_FRMS_MAX_FRM_MASK);
> +
> +	regmap_write(mii_rt, txcfg_reg, txcfg);
> +
> +	txcfg_reg = PRUSS_MII_RT_RX_FRMS1;
> +
> +	regmap_write(mii_rt, txcfg_reg, txcfg);
> +}

...

> @@ -377,6 +705,70 @@ static int icssm_prueth_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	pruss = pruss_get(prueth->pru0 ? prueth->pru0 : prueth->pru1);
> +	if (IS_ERR(pruss)) {
> +		ret = PTR_ERR(pruss);
> +		dev_err(dev, "unable to get pruss handle\n");
> +		goto put_pru;
> +	}
> +	prueth->pruss = pruss;
> +
> +	ret = pruss_cfg_ocp_master_ports(prueth->pruss, 1);
> +	if (ret) {
> +		dev_err(dev, "couldn't enabled ocp master port: %d\n", ret);
> +		goto put_pruss;
> +	}

FTR, I applied this patch set on top of the patch at the link below
so that pruss_cfg_ocp_master_ports() is present.

- [PATCH v2 1/1] soc: ti: PRUSS OCP configuration
  https://lore.kernel.org/all/20250108125937.10604-2-basharath@couthit.com/

  ...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.h b/drivers/net/ethernet/ti/icssm/icssm_prueth.h

...

> +/**
> + * struct prueth_queue - Information about a queue in memory

struct prueth_queue_info

> + * @buffer_offset: buffer offset in OCMC RAM
> + * @queue_desc_offset: queue descriptor offset in Shared RAM
> + * @buffer_desc_offset: buffer descriptors offset in Shared RAM
> + * @buffer_desc_end: end address of buffer descriptors in Shared RAM
> + */
> +struct prueth_queue_info {
> +	u16 buffer_offset;
> +	u16 queue_desc_offset;
> +	u16 buffer_desc_offset;
> +	u16 buffer_desc_end;
> +} __packed;

...

