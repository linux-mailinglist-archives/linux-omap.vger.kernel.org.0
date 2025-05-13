Return-Path: <linux-omap+bounces-3710-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F227EAB5B50
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 19:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CF581B41009
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 17:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C442BF3D7;
	Tue, 13 May 2025 17:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQ1OAIti"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDCE645;
	Tue, 13 May 2025 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157395; cv=none; b=UjXAS+vAGnfAj+7Ue3xTqhVhTbjwqM3FA46kWM+JEQC4/Fm4Wriwp++rmWBc/KRAQiz0I6Ia+NknGO3qNfkX5ePYRkd4WeXwuS1JaAJCNOmuxBeGRgIwjuXCc0G6zf8ZnS7emQk1HWeQHpTYo84bsWjACcPmhD/Ngg9fWey/dFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157395; c=relaxed/simple;
	bh=rDjH67j5NwZSbVGkBa9rq3itDu9hCffVypBXkgjOTgE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ya3RMy47wbRDhQ6bAELAuwTuan9EUbSjloGm8Z6X+sVQT5XmiMgzQhEzATcTUl4p/djJRsd/YyAIdn2bPrTjL3S2yljtDeb6q75dOyIHzc2U1WXyvi3WIcCEiHOA4JwlN4xIV++fQJt2IZTgMy7HI4rrt5qxdK23vjOWbWFhfig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQ1OAIti; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6BAC4CEE4;
	Tue, 13 May 2025 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747157395;
	bh=rDjH67j5NwZSbVGkBa9rq3itDu9hCffVypBXkgjOTgE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jQ1OAItitifdmF8CDpkU6/7uu6waXKfKVLpQziSUL8VOfKyYvhjlyN0U82tRw3ZTP
	 8eLBJrWxlIjLTDthgmPsDB+L+b47XdNU6puOevtQJ7J80fgF0iXEkKnYy6irVdv1nQ
	 eUAP4Zqu253rx7Hx/iDgAA1SFBA/Rpz5GpNq5Hm59DW2WMp2M6/y4Ijh5TnbrMLhoj
	 tuzq9bjt/sgrWPh4mvRSUngriq2ZNhRztGnoWQGbwuXyI6ZsQAPPizZlYUTdBPCwFd
	 fAOBZnpNuPvGisqrKvR4I09j5K4rN06EV4XVP7ope2xDm57pl2jkehJ+sQiUcrWLIt
	 WtSEnCuY6Jdjw==
Date: Tue, 13 May 2025 10:29:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, danishanwar@ti.com, srk@ti.com,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 8/9] net: ethernet: ti: am65-cpsw: add
 network flow classification support
Message-ID: <20250513102954.2e537e99@kernel.org>
In-Reply-To: <20250513-am65-cpsw-rx-class-v3-8-492d9a2586b6@kernel.org>
References: <20250513-am65-cpsw-rx-class-v3-0-492d9a2586b6@kernel.org>
	<20250513-am65-cpsw-rx-class-v3-8-492d9a2586b6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 May 2025 15:13:12 +0300 Roger Quadros wrote:
> +	mutex_lock(&port->rxnfc_lock);
> +	loc = am65_cpsw_policer_find_match(port, &cfg);
> +	if (loc >= 0 && loc != fs->location) {
> +		netdev_info(port->ndev,
> +			    "rule already exists in location %d. not adding\n",
> +			    loc);
> +		mutex_unlock(&port->rxnfc_lock);
> +		return -EINVAL;
> +	}
> +
> +	/* delete exisiting rule */
> +	if (loc >= 0) {
> +		rule = am65_cpsw_get_rule(port, loc);
> +		if (rule)
> +			am65_cpsw_del_rule(port, rule);
> +	}
> +
> +	rule = devm_kzalloc(port->common->dev, sizeof(*rule), GFP_KERNEL);

please don't use devm_ for objects you must support explicitly freeing

> +	if (!rule)
> +		return -ENOMEM;

missing unlock

> +
> +	INIT_LIST_HEAD(&rule->list);
> +	memcpy(&rule->cfg, &cfg, sizeof(cfg));
> +	rule->location = fs->location;
> +	ret = am65_cpsw_add_rule(port, rule);
> +	mutex_unlock(&port->rxnfc_lock);
-- 
pw-bot: cr

