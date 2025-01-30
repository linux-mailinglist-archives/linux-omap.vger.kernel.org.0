Return-Path: <linux-omap+bounces-3243-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A5A232BB
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2025 18:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 190B1164267
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jan 2025 17:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958201EEA37;
	Thu, 30 Jan 2025 17:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="upySuXt6"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258852770C;
	Thu, 30 Jan 2025 17:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257795; cv=none; b=uS9siY3wV7+QlXujOFbja5vK2p8NMBHANnwy3v3+/C3upAvNix6y/bg9p/NK3LW+bwT6sP7Zkllj8Okx6apo2oLWvdaOjkFHaq5WPLZQNR8eN02nU+XWOumXFRiWGOpLsvmSunEJSZx3XRzJ9a7oFdt2Ddv2vNQLwrt1lr9evfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257795; c=relaxed/simple;
	bh=yH4FEbQVXyMxFaB7hk1ruwl/3FyAw8z0JzuE+B/DXpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERKgkTT7TUXz91oi/BYNTi8l//KPdKsPQn8p97lnyWS6Ou7qiZ5mOJE4PqqEAw3hzt27T6+goKtgAMdgpwOf6sVSTkcLNXzHLgUs24uA4lfZxc4S5UyD+AHWAFhY2PadjWTnocunoKe1nO3k5uyTYBhnZe33SeC+yaMADreU6PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=upySuXt6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F4AC4CED2;
	Thu, 30 Jan 2025 17:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738257793;
	bh=yH4FEbQVXyMxFaB7hk1ruwl/3FyAw8z0JzuE+B/DXpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upySuXt69EgxtJcJBjPKJLKq/sT++GHdJLl2ro5gBbZNK4U64HWApRXSLxfb8eFw0
	 CI/IjFGVut8N3OHewG3MvKiRmcSfSNNZ5ykiHjTTGmeYvMj9VBh5/2BZ1n2iVT7nRk
	 +EI23txGIo3cN3lTDEqeHccBBtQHqfvwuULpBtGjEi0XC4aivzW02RTO80hTOgADBc
	 wbX9ocvq5U3cJU64lLn7bWeQyrWuXI050ij/SsZRqm8NAzJfMoTZk8rUqPfzOJTngl
	 +g8cdyMfWtmFvIENKtDO8EOaaMMMKJtNs7wz+mFGikGXV2YXP/9TUsiVK8Mo47P7TW
	 GabRao+AJ+L0Q==
Date: Thu, 30 Jan 2025 17:23:04 +0000
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
Subject: Re: [RFC v2 PATCH 05/10] net: ti: prueth: Adds ethtool support for
 ICSSM PRUETH Driver
Message-ID: <20250130172304.GD13457@kernel.org>
References: <20250124122353.1457174-1-basharath@couthit.com>
 <20250124134056.1459060-6-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124134056.1459060-6-basharath@couthit.com>

On Fri, Jan 24, 2025 at 07:10:51PM +0530, Basharath Hussain Khaja wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> Changes for enabling ethtool support for the newly added PRU Ethernet
> interfaces. Extends the support for statistics collection from PRU internal
> memory and displays it in the user space. Along with statistics,
> enable/disable of features, configuring link speed etc.are now supported.
> 
> The firmware running on PRU maintains statistics in internal data memory.
> When requested ethtool collects all the statistics for the specified
> interface and displays it in the user space.
> 
> Makefile is updated to include ethtool support into PRUETH driver.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>

...

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c b/drivers/net/ethernet/ti/icssm/icssm_ethtool.c

...

> +static const struct {
> +	char string[ETH_GSTRING_LEN];
> +	u32 offset;
> +} prueth_ethtool_stats[] = {
> +	{"txBcast", PRUETH_STAT_OFFSET(tx_bcast)},
> +	{"txMcast", PRUETH_STAT_OFFSET(tx_mcast)},
> +	{"txUcast", PRUETH_STAT_OFFSET(tx_ucast)},
> +	{"txOctets", PRUETH_STAT_OFFSET(tx_octets)},
> +	{"rxBcast", PRUETH_STAT_OFFSET(rx_bcast)},
> +	{"rxMcast", PRUETH_STAT_OFFSET(rx_mcast)},
> +	{"rxUcast", PRUETH_STAT_OFFSET(rx_ucast)},
> +	{"rxOctets", PRUETH_STAT_OFFSET(rx_octets)},

Hi Roger, Basharath, all,

There seems to be some overlap between the above and struct rtnl_link_stats64.

Please implement those stats which are present in struct rtnl_link_stats64
using ndo_get_stats64 and omit them from your implementation of
get_ethtool_stats.

IOW, get_ethtool_stats() is for extended stats, whereas is for standard
stats ndo_get_stats64().  And standard stats should not be presented to the
user as extended stats.

Link: https://docs.kernel.org/networking/statistics.html#notes-for-driver-authors

> +	{"tx64byte", PRUETH_STAT_OFFSET(tx64byte)},
> +	{"tx65_127byte", PRUETH_STAT_OFFSET(tx65_127byte)},
> +	{"tx128_255byte", PRUETH_STAT_OFFSET(tx128_255byte)},
> +	{"tx256_511byte", PRUETH_STAT_OFFSET(tx256_511byte)},
> +	{"tx512_1023byte", PRUETH_STAT_OFFSET(tx512_1023byte)},
> +	{"tx1024byte", PRUETH_STAT_OFFSET(tx1024byte)},
> +	{"rx64byte", PRUETH_STAT_OFFSET(rx64byte)},
> +	{"rx65_127byte", PRUETH_STAT_OFFSET(rx65_127byte)},
> +	{"rx128_255byte", PRUETH_STAT_OFFSET(rx128_255byte)},
> +	{"rx256_511byte", PRUETH_STAT_OFFSET(rx256_511byte)},
> +	{"rx512_1023byte", PRUETH_STAT_OFFSET(rx512_1023byte)},
> +	{"rx1024byte", PRUETH_STAT_OFFSET(rx1024byte)},

Similarly, the above, along with rxOverSizedFrames and rxUnderSizedFrames
below seem to be RMON (RFC 2819) statistics. So I think they should
be handled by implementing get_rmon_stats().

> +
> +	{"lateColl", PRUETH_STAT_OFFSET(late_coll)},
> +	{"singleColl", PRUETH_STAT_OFFSET(single_coll)},
> +	{"multiColl", PRUETH_STAT_OFFSET(multi_coll)},
> +	{"excessColl", PRUETH_STAT_OFFSET(excess_coll)},

And likewise, the section above and below seem to overlap
with Basic IEEE 802.3 MAC statistics which I believe
should be handled by implementing get_eth_mac_stats()

> +
> +	{"rxMisAlignmentFrames", PRUETH_STAT_OFFSET(rx_misalignment_frames)},
> +	{"stormPrevCounterBC", PRUETH_STAT_OFFSET(stormprev_counter_bc)},
> +	{"stormPrevCounterMC", PRUETH_STAT_OFFSET(stormprev_counter_mc)},
> +	{"stormPrevCounterUC", PRUETH_STAT_OFFSET(stormprev_counter_uc)},
> +	{"macRxError", PRUETH_STAT_OFFSET(mac_rxerror)},
> +	{"SFDError", PRUETH_STAT_OFFSET(sfd_error)},
> +	{"defTx", PRUETH_STAT_OFFSET(def_tx)},
> +	{"macTxError", PRUETH_STAT_OFFSET(mac_txerror)},
> +	{"rxOverSizedFrames", PRUETH_STAT_OFFSET(rx_oversized_frames)},
> +	{"rxUnderSizedFrames", PRUETH_STAT_OFFSET(rx_undersized_frames)},
> +	{"rxCRCFrames", PRUETH_STAT_OFFSET(rx_crc_frames)},
> +	{"droppedPackets", PRUETH_STAT_OFFSET(dropped_packets)},
> +
> +	{"txHWQOverFlow", PRUETH_STAT_OFFSET(tx_hwq_overflow)},
> +	{"txHWQUnderFlow", PRUETH_STAT_OFFSET(tx_hwq_underflow)},
> +	{"vlanDropped", PRUETH_STAT_OFFSET(vlan_dropped)},
> +	{"multicastDropped", PRUETH_STAT_OFFSET(multicast_dropped)},
> +};

...

