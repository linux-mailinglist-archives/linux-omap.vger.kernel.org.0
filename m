Return-Path: <linux-omap+bounces-3487-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B317DA70381
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 15:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AD3016790B
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 14:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2EE25A2B1;
	Tue, 25 Mar 2025 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ix/myznc"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B22E3382;
	Tue, 25 Mar 2025 14:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742912511; cv=none; b=dV7iATtvc5Vc7Zc/cNYyhdWZVun9Xb1tI8CM5tx7FtZY3Lgui9b4xMmuN7qqFCMQC+IWxV+udrYD28DFg2ifFXr3wvmL7U7kAnlQNjswrAuHW7feASce3ihdkQMjR/poeTN0ESo+2CywzyAUKU1l9PcqxBOet61FZ+dzN7jrBT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742912511; c=relaxed/simple;
	bh=1xaIholjSupcAo+TJuOzRRk0LYc/jKmHF8F7TI5RCNc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMLz9dsNl25wIFULqhlLihJfZLcxZDn+5HveKBcvMPcDeTwgMVWSDmF7y24AqIP9ohIC9wdGJ2BWbhjxg934VCifB1eJ3Hc0VKCUsR+YhM8yySzXgRUyncJEEkZMYL9QO0t/sNTJf4pSmiyTUPDOlqjkvgaf0ZPFKlwuYU+SVA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ix/myznc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E01C4CEE4;
	Tue, 25 Mar 2025 14:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742912510;
	bh=1xaIholjSupcAo+TJuOzRRk0LYc/jKmHF8F7TI5RCNc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ix/myznchuQ712ZtKA5bn9E9Etfslzz32UKOW/7VLJ3EGZ9u3ILmx5R2Zg5BZSPlz
	 DgNvHwivVMLuJ7L6dAndqmX4ZE+RBUDVjxbXbpInHZLIfQEGySnAxNqjze6x80+NMF
	 GRfsquj4E4AMSWQ8Jb8EseoDf9EI3Y/Ok2a5/XEM97+TbTzTsEjeNo84anr4cZrXLm
	 5+pI6WM4Kqu096zrblwZMOH2eR08X9c4n62m00/XXZVUOcg7CzAAredKhleZO1xVSX
	 v0NOn08bh9LzJ2vTb5FZRKqLJ8aJR25/HyKVTyP0txAzf0D4RsSVpSEKa3Du4YZrZn
	 PnizrTSSRfP0w==
Date: Tue, 25 Mar 2025 07:21:41 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, danishanwar@ti.com, srk@ti.com,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 6/9] net: ethernet: ti: cpsw_ale: add
 cpsw_ale_policer_set/clr_entry()
Message-ID: <20250325072141.026b643d@kernel.org>
In-Reply-To: <20250319-am65-cpsw-rx-class-v1-6-2bfded07490e@kernel.org>
References: <20250319-am65-cpsw-rx-class-v1-0-2bfded07490e@kernel.org>
	<20250319-am65-cpsw-rx-class-v1-6-2bfded07490e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Mar 2025 15:38:32 +0200 Roger Quadros wrote:
> +/* FIXME: VLAN ID based flow routing not yet working, Only PCP matching for now
> + *		u32 port_mask, unreg_mcast = 0;
> + *
> + *		port_mask = BIT(cfg->port_id) | ALE_PORT_HOST;
> + *		if (!cfg->vid)
> + *			unreg_mcast = port_mask;
> + *		ale_idx = cpsw_ale_vlan_add_modify(ale, cfg->vid, port_mask,
> + *				unreg_mcast, port_mask, 0);
> + *		if (ale_idx < 0)
> + *			return -ENOENT;
> + *
> + *		regmap_field_write(ale->fields[POL_OVLAN_INDEX], ale_idx);
> + *		regmap_field_write(ale->fields[POL_OVLAN_MEN], 1);
> + */

This commented out code is odd.
Shouldn't you check if the user asked for ID match and return an error?

