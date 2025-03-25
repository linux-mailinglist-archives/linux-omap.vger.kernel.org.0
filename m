Return-Path: <linux-omap+bounces-3486-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEFCA70394
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 15:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 047493B6F49
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 14:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F1F25A2C0;
	Tue, 25 Mar 2025 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhrWVqlp"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD3E2571A7;
	Tue, 25 Mar 2025 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742912356; cv=none; b=B3PXyFxl89Gkh7EHGbfycPAM39lN/nFf+bR+fd0gGXCkvLdaMgIsYecVsp+7/nOPOM9ehFCLPbwAigigPpS1PCvtSM1C6pVg4Z33tdGDlrXkeCu/HYleKrNpb+3GwHvWFb5S+IOZy8P0Y2vJhDjO2mtTMTT+uoLNMmdMFD03Tyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742912356; c=relaxed/simple;
	bh=mIhScVX3smYC5tbYdAQOfnNOIXy7bHsGuGTi/Ntoec8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WkJPPvZdJmxg1hts/EGlKGZ7s8hOUmt8I5quFILsqNlIkEdtRsVmIWG19Cco2/99OC++5uHZAqj9WqXXPUez7TqfToZoQL/KTbmcSF8xqZO5EPvKpyJ1rOI7MOFv7EGxClULX85rD42/8IEEPc0hfIov+vF08YIh6MzWhNasoEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhrWVqlp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7334BC4CEE4;
	Tue, 25 Mar 2025 14:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742912354;
	bh=mIhScVX3smYC5tbYdAQOfnNOIXy7bHsGuGTi/Ntoec8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AhrWVqlp9FmUuV/jNdRQAaW5qnWpsJ3/qLccnJr/ovgjpIyWedl3qW+3jbOS9SJGa
	 NLqJDSa5S3X78ajVtMtqRF7JkLgXY/O5PtQVuhc3gJ1NC+T8ibFyhYROluKlITS87R
	 zrWIeuv+9GoC1Qk+wMW8WwrrUFLTSUoQLlJgO0ikh1cv43k209LY1yQTozcLCqqSF6
	 xroWsvJ8hq/PFEnb3p2/++7mTFN57g1CEvhqCQDBPK96EzHAymJfIRD0arNA7Mh9vd
	 0xjk6XxsETAk6zuGnukq3PHUsbrNB40rGnpIfrRR1mOIlzthHk9eyO9xoPglJV7jwe
	 myMF8ul+zv4dA==
Date: Tue, 25 Mar 2025 07:19:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, danishanwar@ti.com, srk@ti.com,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/9] net: ethernet: ti: am65-cpsw: add network
 flow classification support
Message-ID: <20250325071906.48550ac1@kernel.org>
In-Reply-To: <20250319-am65-cpsw-rx-class-v1-0-2bfded07490e@kernel.org>
References: <20250319-am65-cpsw-rx-class-v1-0-2bfded07490e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Mar 2025 15:38:26 +0200 Roger Quadros wrote:
> Adds support for -N/--config-nfc ethtool command for
> configuring RX classfiers.
> 
> Currently only raw Ethernet (flow-type ether) matching is added
> based on source/destination addresses and VLAN Priority (PCP).
> 
> The ALE policer engine is used to perform the matching and routing to
> a specific RX channel.
> 
> Test cases:
> 
> Increase number of RX channels to 8
> ip link set eth1 down
> ip link set eth0 down
> ethtool -L eth0 rx 8
> 
> 1) Ether source address test
> 	ethtool -N eth0 flow-type ether src xx:yy:zz:aa:bb:cc action 5
> 
>   Traffic from that address should route to channel 5
> 
> 2) Ether destination address test
> 	ethtool -N eth0 flow-type ether src yy:zz:aa:bb:cc:dd action 4
> 
>   Traffic to that address should route to channel 4
> 
> 3) Drop test
> 	ethtool -N end0 flow-type ether src xx:yy:zz:aa:bb:cc action -1
> 
>   Traffic from that address should be dropped
> 
> 4) VLAN PCP test
> 
> on Remote create VLAN with ID 5 and all traffic mapping to required priority to test. e.g. 7
> 	sudo ip link add link eno1 name eno1.5 type vlan id 5 egress-qos-map 0:7 1:7 2:7 3:7 4:7 5:7 6:7 7:7
> 	sudo ifconfig eno1.5 192.168.10.1
> 
> on DUT create VLAN with id 5
> 	ip link add link end0 name end0.5 type vlan id 5
> 	ifconfig end0.5 192.168.10.5
> 
> VLAN pcp 7 vid 5 route to RX channel 6
> 	ethtool -N end0 flow-type ether vlan 0xe005 action 6
> 
>   Traffic from that VLAN with PCP 7 should route to channel 6

No longer applies:

Applying: net: ethernet: ti: cpsw_ale: Update Policer fields for more ALE size/ports
Applying: net: ethernet: ti: cpsw_ale: return ALE index in cpsw_ale_add_vlan()
Applying: net: ethernet: ti: cpsw_ale: return ALE index in cpsw_ale_vlan_add_modify()
Applying: net: ethernet: ti: cpsw_ale: return ALE index in cpsw_ale_add_ucast()
Applying: net: ethernet: ti: cpsw_ale: add cpsw_ale_policer_reset_entry()
Applying: net: ethernet: ti: cpsw_ale: add cpsw_ale_policer_set/clr_entry()
Applying: net: ethernet: ti: cpsw_ale: add policer save restore for PM sleep
Applying: net: ethernet: ti: am65-cpsw: add network flow classification support
Applying: net: ethernet: ti: am65-cpsw: remove cpsw_ale_classifier_setup_default()
error: sha1 information is lacking or useless (drivers/net/ethernet/ti/am65-cpsw-nuss.c).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort".
hint: Disable this message with "git config set advice.mergeConflict false"
Patch failed at 0009 net: ethernet: ti: am65-cpsw: remove cpsw_ale_classifier_setup_default()
-- 
pw-bot: cr

