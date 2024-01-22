Return-Path: <linux-omap+bounces-334-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2962D836449
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 14:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C0971C22748
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 13:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32CC3CF70;
	Mon, 22 Jan 2024 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiXeXdC2"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7593C3CF42;
	Mon, 22 Jan 2024 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705929498; cv=none; b=QzDPOS+bO/aOWZYFH550k5isEX2Nw8jUFb4N+mAxI9gDvn7pkesZ8JBkSixNSjVKKXBJT4nR6VbhV055Pe3W8ZT21kJeCCuYwpzoapyQCOAbS7q44Gt2VyzQbCfGe4Klz/xJCb1Eu2kJcUfSE86XtmC2yBmX52WDkbp5P788hyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705929498; c=relaxed/simple;
	bh=8nLLKjq7oCgzDw9ZUQYrf7nyBzR8EtSEWOgsdOU6lQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmNskOwsT2OLvfPAXNShnJZKFRC/vvteqLQoUhndsbqUW+FqJdScC30wpYeYN6Hp8fjv9jtMZTlJ/LYJA+QzLK/2bh2e+jjTdOZQT29sHl/uhKvNC1i21j+7BdnMYNSab7SkkkCsqov+k1KaQr+Co47aHtLK02iCIIeDRwfhkg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiXeXdC2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F57C433C7;
	Mon, 22 Jan 2024 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705929498;
	bh=8nLLKjq7oCgzDw9ZUQYrf7nyBzR8EtSEWOgsdOU6lQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BiXeXdC2+ZiP2FRLKDQwzYdq0y5ubv9vBTA0B0ikOHQas0ZfvD3KOcNNxTl19GbpK
	 fPKUc5VSlnYIcQfjFZzYbjGYQ8n0JHPASQPSw8WutcXa7in05wIxdZZLBP3ZskEzEz
	 41Vk2gpgNX+xaT6lHj60V1ffkx7NEeEh0O+zN799EoRwDygLV58J4BWdkHQ1MGfSvB
	 fZXc4u8IwlCVXXrucG0Fmk8kbzJgNlJFItu6+EPHoDV7dRqP4ImMordg2WrQmFOoSH
	 wBDpT2Izrb6HOtTSMoiDmawcf/QUOm7yeGiT12xIyxtMBJ48RAuc8ynfaFELMHhip0
	 VB0kfR4U6A25Q==
Message-ID: <e97a55a9-34ae-46a3-9646-9bf70f6976ff@kernel.org>
Date: Mon, 22 Jan 2024 15:18:13 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] net: ethernet: ti: cpsw_new: enable mac_managed_pm to
 fix mdio
Content-Language: en-US
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>,
 Denis Kirjanov <dkirjanov@suse.de>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Ravi Gunasekaran <r-gunasekaran@ti.com>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 Sinthu Raja <sinthu.raja@ti.com>
References: <20240122093326.7618-1-sinthu.raja@ti.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240122093326.7618-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 22/01/2024 11:33, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The below commit  introduced a WARN when phy state is not in the states:
> PHY_HALTED, PHY_READY and PHY_UP.
> commit 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")
> 
> When cpsw_new resumes, there have port in PHY_NOLINK state, so the below
> warning comes out. Set mac_managed_pm be true to tell mdio that the phy
> resume/suspend is managed by the mac, to fix the following warning:
> 
> WARNING: CPU: 0 PID: 965 at drivers/net/phy/phy_device.c:326 mdio_bus_phy_resume+0x140/0x144
> CPU: 0 PID: 965 Comm: sh Tainted: G           O       6.1.46-g247b2535b2 #1
> Hardware name: Generic AM33XX (Flattened Device Tree)
>  unwind_backtrace from show_stack+0x18/0x1c
>  show_stack from dump_stack_lvl+0x24/0x2c
>  dump_stack_lvl from __warn+0x84/0x15c
>  __warn from warn_slowpath_fmt+0x1a8/0x1c8
>  warn_slowpath_fmt from mdio_bus_phy_resume+0x140/0x144
>  mdio_bus_phy_resume from dpm_run_callback+0x3c/0x140
>  dpm_run_callback from device_resume+0xb8/0x2b8
>  device_resume from dpm_resume+0x144/0x314
>  dpm_resume from dpm_resume_end+0x14/0x20
>  dpm_resume_end from suspend_devices_and_enter+0xd0/0x924
>  suspend_devices_and_enter from pm_suspend+0x2e0/0x33c
>  pm_suspend from state_store+0x74/0xd0
>  state_store from kernfs_fop_write_iter+0x104/0x1ec
>  kernfs_fop_write_iter from vfs_write+0x1b8/0x358
>  vfs_write from ksys_write+0x78/0xf8
>  ksys_write from ret_fast_syscall+0x0/0x54
> Exception stack(0xe094dfa8 to 0xe094dff0)
> dfa0:                   00000004 005c3fb8 00000001 005c3fb8 00000004 00000001
> dfc0: 00000004 005c3fb8 b6f6bba0 00000004 00000004 0059edb8 00000000 00000000
> dfe0: 00000004 bed918f0 b6f09bd3 b6e89a66
> 
> Fixes: 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume() state")
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> 
> Changes in V2:
> Address review comment
> 	Add Fixes tag.
> 
> V1: https://patchwork.kernel.org/project/netdevbpf/patch/20240122083414.6246-1-sinthu.raja@ti.com/
> 
>  drivers/net/ethernet/ti/cpsw_new.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
> index 498c50c6d1a7..087dcb67505a 100644
> --- a/drivers/net/ethernet/ti/cpsw_new.c
> +++ b/drivers/net/ethernet/ti/cpsw_new.c
> @@ -773,6 +773,9 @@ static void cpsw_slave_open(struct cpsw_slave *slave, struct cpsw_priv *priv)
>  			slave->slave_num);
>  		return;
>  	}
> +
> +	phy->mac_managed_pm = true;
> +
>  	slave->phy = phy;
>  
>  	phy_attached_info(slave->phy);

I believe this cpsw.c will also be affected by the same issue. Right?
Also you will need to Cc: stable@vger.kernel.org # v6.0+

-- 
cheers,
-roger

