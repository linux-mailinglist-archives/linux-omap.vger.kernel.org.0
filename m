Return-Path: <linux-omap+bounces-3528-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C1FA78EA7
	for <lists+linux-omap@lfdr.de>; Wed,  2 Apr 2025 14:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20CE9163501
	for <lists+linux-omap@lfdr.de>; Wed,  2 Apr 2025 12:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07077239570;
	Wed,  2 Apr 2025 12:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o8i7JTn7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8664D2356DB;
	Wed,  2 Apr 2025 12:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597450; cv=none; b=Bfc+CzG9cS3mNxYU5B/4X0f9N/mI6JRoVNvFtMCdbjvtJ+TV6Sroe5PWEhOzZcSeJB2ctelD1an1uQHkhIK6voZ8r3ceKpC8I44aKuppIcnhxacOlMa5kcROL6brymi1sWRk/IG7/D8BLGenQQG7hCgBqNqig8EKX5xoesEwAt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597450; c=relaxed/simple;
	bh=XKQaPTbRKvCbo3F0ZS3qDmjQ39ONiGZQ/d2wF9XPviU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fe0wlx0SV5l6J0SVTuAYOryynjWHUZEfFcs/G4pBgUJ38lmi/e9e5+Lzgh56NWQeDpcsxVGqhN+dLek1YuxmMuVc9/f+34PAWAg4zQGf7rHsiqq79Pe10uYMWu+hdJBt95o0hCggGFrX8lzpMVdCbzdSbtRhl21HRKTDYixbpGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o8i7JTn7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58038C4CEDD;
	Wed,  2 Apr 2025 12:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743597450;
	bh=XKQaPTbRKvCbo3F0ZS3qDmjQ39ONiGZQ/d2wF9XPviU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o8i7JTn7K/m8DmKe6878Wv+PFTXU9TW4y70GpjrP1voHwch+nzMuGE7Zm0SJ12ibw
	 qLtyuWeEBSxT5QX5qiO9d0S5S3UjsIz3ZlwWWZqJdR4hyxTFByHHMgRxM6XUBI/Dnz
	 LD+1dkhvZwAdw3nhfcpIxjwrdHp59/71EolN3x3i9cDGjV3uKeB2VU73+RQxJRt1Py
	 9raATHyU2JSp7al0QtpKu8YUSVwLpZCCXf76wxfCRYepyMVb1PA2X3T8+DnWgbjDtQ
	 /Gk9YSuk58cNzBBB1HyO5gJDMT3M/nGF1B+hw6eVRdR4wrfeU2J4iQeoTHup0dx+tf
	 /OhW0YTd3E7iw==
Message-ID: <a5a47ca2-a64a-409f-a143-637699e316c7@kernel.org>
Date: Wed, 2 Apr 2025 15:37:25 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 6/9] net: ethernet: ti: cpsw_ale: add
 cpsw_ale_policer_set/clr_entry()
To: Jakub Kicinski <kuba@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 danishanwar@ti.com, srk@ti.com, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250319-am65-cpsw-rx-class-v1-0-2bfded07490e@kernel.org>
 <20250319-am65-cpsw-rx-class-v1-6-2bfded07490e@kernel.org>
 <20250325072141.026b643d@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250325072141.026b643d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/03/2025 16:21, Jakub Kicinski wrote:
> On Wed, 19 Mar 2025 15:38:32 +0200 Roger Quadros wrote:
>> +/* FIXME: VLAN ID based flow routing not yet working, Only PCP matching for now
>> + *		u32 port_mask, unreg_mcast = 0;
>> + *
>> + *		port_mask = BIT(cfg->port_id) | ALE_PORT_HOST;
>> + *		if (!cfg->vid)
>> + *			unreg_mcast = port_mask;
>> + *		ale_idx = cpsw_ale_vlan_add_modify(ale, cfg->vid, port_mask,
>> + *				unreg_mcast, port_mask, 0);
>> + *		if (ale_idx < 0)
>> + *			return -ENOENT;
>> + *
>> + *		regmap_field_write(ale->fields[POL_OVLAN_INDEX], ale_idx);
>> + *		regmap_field_write(ale->fields[POL_OVLAN_MEN], 1);
>> + */
> 
> This commented out code is odd.
> Shouldn't you check if the user asked for ID match and return an error?

I think I'll drop the comment.

-- 
cheers,
-roger


