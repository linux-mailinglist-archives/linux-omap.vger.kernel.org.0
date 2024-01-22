Return-Path: <linux-omap+bounces-329-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E06835D78
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 09:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 764711F2574A
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 08:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3F438FAD;
	Mon, 22 Jan 2024 08:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rn+PrnE6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="03jwonnZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="maN0sgPP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3ctN9PAT"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7517339FE9;
	Mon, 22 Jan 2024 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705913864; cv=none; b=ts0gc6REINw1EPQKUohJ0gUQE1J/aU60dXeRmK53bu8XDfqwxixEYl3U7ErNCvy6SLHX+pXpheeblyoItdVwpdXKMveKH87GXgbp7PIhTaXWhEJVI+QS/lhcjNiY41iw1iXEIfXkyw7nHfmBpfTe4a/b3uyg0EGcHRbMurUfuEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705913864; c=relaxed/simple;
	bh=KA1JVTbOBM3uBfYU6S2UqF+B/JP1ASsLjDXyfPbhQ+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tizNzCn6F/ILRY1ABcnT81MDcQvP1hr6nSacnEqZ9/fK6fU4emUz/vjh7gWGdmEOgV61H40eBdryfP2NQtBTjgKONjLhJWozsQDdAiVCWOhkFN9+6SwTiYmyyVuc4EFFwlAPLkwf9lbUSGTWTUCGujp6hd5QE7dwVYjivs1I3zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rn+PrnE6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=03jwonnZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=maN0sgPP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3ctN9PAT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5B2CC1FBB7;
	Mon, 22 Jan 2024 08:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705913860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iiQ6RpqMIcBoOOnsDSCp7bi1bWTsKeg9JbKPmZLkpT4=;
	b=rn+PrnE6VzmU1xq5Lo1uHES1GwA/SCbmRys1kfsUvfsYiLc3PBwwoBUrcL4tXgI5cdObY6
	mkiSJpyX/bbTJgYRaJL4ythvDgS43+8KzNBi7N+U8rFyrMy4kVDFR1wlRhz/GRlLj7Ytgw
	6uRaEgm8HzFFsajZEe7ZPUTn/lwKWY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705913860;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iiQ6RpqMIcBoOOnsDSCp7bi1bWTsKeg9JbKPmZLkpT4=;
	b=03jwonnZDGYa/BFArL9WK1gOUCWlJo0lkyv9puGq83AxUkuGTYkZJrc9TWHViKVc1S7mNY
	NScYO43W1dtJHbCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1705913859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iiQ6RpqMIcBoOOnsDSCp7bi1bWTsKeg9JbKPmZLkpT4=;
	b=maN0sgPPpU/h5kuJO7NGKfbktoMP2iGI1EqgERLaXWaqQOD7DA5SFLrMk+thqO2/L0+Psb
	y4FR36Rl5qzD/HWMHusV3b0fE0iII1f0WSmGmfqYOi/6mrETRrMa4QyN2wq8fXiBZ+Ara/
	NMgar+3qkAUAV/hI6hRlQANpPzxu1bM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1705913859;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iiQ6RpqMIcBoOOnsDSCp7bi1bWTsKeg9JbKPmZLkpT4=;
	b=3ctN9PATQk2ZO+iPHbYzxccXuMJpw9fM+zOw4Lpjuyb2DMTDcDVrzj6DjJQAOGJTC8OpOz
	tlEe+EXWSO7zmkDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D072013995;
	Mon, 22 Jan 2024 08:57:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SGfMLwIurmXcZgAAD6G6ig
	(envelope-from <dkirjanov@suse.de>); Mon, 22 Jan 2024 08:57:38 +0000
Message-ID: <8f031b17-9d86-42bf-b857-a7a46942a1cf@suse.de>
Date: Mon, 22 Jan 2024 11:57:37 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] net: ethernet: ti: cpsw_new: enable mac_managed_pm to
 fix mdio
Content-Language: en-US
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Ravi Gunasekaran <r-gunasekaran@ti.com>, Roger Quadros <rogerq@kernel.org>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 Sinthu Raja <sinthu.raja@ti.com>
References: <20240122083414.6246-1-sinthu.raja@ti.com>
From: Denis Kirjanov <dkirjanov@suse.de>
In-Reply-To: <20240122083414.6246-1-sinthu.raja@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.12 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.03)[55.35%];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.12



On 1/22/24 11:34, Sinthu Raja wrote:
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
Please add "Fixes" tag

> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
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

