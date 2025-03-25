Return-Path: <linux-omap+bounces-3489-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B97A70399
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 15:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B53801886082
	for <lists+linux-omap@lfdr.de>; Tue, 25 Mar 2025 14:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E8825A2A2;
	Tue, 25 Mar 2025 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTreOajM"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D3914293;
	Tue, 25 Mar 2025 14:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742912669; cv=none; b=Lk4DjdXPrqZrIJUq9lUW2THqzguqyHgtdY1NBU8nFf7eoV6z+Vy0lKjvES7EmKyrOyFUgVfK5GReLZGH4f1R02opeboulubqBWax6i9SFSj9h2GmD9cOUY9GpkKibPyUqSy3hzqlsDi3tVut1TFZy+D78JoQryCIORHP0l1OHuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742912669; c=relaxed/simple;
	bh=DX7yDbf1Ox7qVZrPSSz2HjPTH6USs1+MDOc8YwVoUoY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oXwPGWb2HOoyOU3VQXlw2n4FyBo5UzR5UIqbQ+ZcqBlutVV7bvXd4bhQPWw2usqrHk1TWqAeSoIL70QpJBqqPQzjQmvOQq9f2imrVRtg+U5BbE9J5/u9ivmCpoaoh1Twn61dI8H5N+QGSlXnGn91uTFR8Qjx6bS3BQG9oxwOxxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTreOajM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D652C4CEE4;
	Tue, 25 Mar 2025 14:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742912668;
	bh=DX7yDbf1Ox7qVZrPSSz2HjPTH6USs1+MDOc8YwVoUoY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tTreOajMRptfK41qXn49rLrpOXbNr9XtxMdz/zFtVW8z2BU99JeVCe7SnBjf2hMp5
	 dGCzC9BvADdshcB/BkdUuLYQuhUMi31YaifctgD9Kk5W4/JsD81iqXqkDwDf39VKzU
	 G3o0dY3bm0PRs0+JC5ANDH7HVHZMDgUWLCPM8gLuJExAkn/f1+/9hoNbVJU7Jk6Rdu
	 V+B2XUXbyZDYEeaa6dWxPgMR6FgO4LSvl2uIZcinUd+2zN3wPWz559OR8M+rb8s+yS
	 9pqtFFPK692X6sWzfKmvG6PVTrmu+qPpA6OfDVEU28TkdqLr8nnlAIjRnWKtowhiFB
	 0mbcnWFcNG91g==
Date: Tue, 25 Mar 2025 07:24:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, danishanwar@ti.com, srk@ti.com,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 8/9] net: ethernet: ti: am65-cpsw: add network
 flow classification support
Message-ID: <20250325072419.778810f3@kernel.org>
In-Reply-To: <20250319-am65-cpsw-rx-class-v1-8-2bfded07490e@kernel.org>
References: <20250319-am65-cpsw-rx-class-v1-0-2bfded07490e@kernel.org>
	<20250319-am65-cpsw-rx-class-v1-8-2bfded07490e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Mar 2025 15:38:34 +0200 Roger Quadros wrote:
> +	if (fs->location == RX_CLS_LOC_ANY ||
> +	    fs->location >= port->rxnfc_max)
> +		return -EINVAL;

Could you clarify in the commit message that the rules are evaluated 
in strict order? And what the order is?

