Return-Path: <linux-omap+bounces-2239-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 591BF984730
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 16:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 041101F23E90
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 14:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F410B1A76CD;
	Tue, 24 Sep 2024 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5cAlLHv"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC9B1A7059;
	Tue, 24 Sep 2024 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727186563; cv=none; b=K02U0nT97ukMk9M61oHkJfCjBhXiPDyUWXQE3Hp5rYxB3txftlir8slJu9l53c3CpaeZO/b9++yoEZLEwygtAU7NenaT25ETmTTBI7BTYRbCZjXxRTg1tLnV8vhwMgPCx33VlgnungWV/RHBqRUULi636NSFC4FbUImeiQRJnMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727186563; c=relaxed/simple;
	bh=jaB/1OOU/ErsQ+6dfwNwKimyPs+tFlRPjxbR/gedMmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5iozcnPpHn/I53Kn3APh5YiI+3V+1DVA3+bLIFja6yecJNFD398xHcyOeCtbx7f69lZtD+IVM24bkSVWM82KWt/0yDgnqsCDDzTqPCMCK3EkMq/PU4WLEfjp/KeGa8m8VjNGbMfKUzfZCvlvw8KaOS0BNMZY1lftucxQgZZFRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5cAlLHv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B0CC4CEC4;
	Tue, 24 Sep 2024 14:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727186563;
	bh=jaB/1OOU/ErsQ+6dfwNwKimyPs+tFlRPjxbR/gedMmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5cAlLHvdXsb2GBnTrFT/g/Wf+38TFl6gINkhdAAx7i+xM2al43uHe0xGckNPpWwc
	 /WACAGFsLmcqjW9/Mjp+Ky3k+Y9B7RdiQbGooEnzj//Wq+UrCKgOZcYWgd5tUrKIbo
	 /fFlln9W94fhTWjREIpMC/s3/KHT3GURTi26blIQaY+oM4KuJpKNsUq2zrdjHL6RNV
	 IH8Oe5/yhGjghvnvBk03QgQFEE0tFV7kPy84C4Plnri5NFE0OUDVcgt5CQ3opSaiS7
	 Zt6wDTOK1LY1gxiGmmXluG5y2EH8Rl4f3vQQc7LTy5avYlyXF9gndAf0ekif9GIZej
	 /7NwXGUiqNc9Q==
Date: Tue, 24 Sep 2024 15:02:38 +0100
From: Simon Horman <horms@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-omap@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, srk@ti.com,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH net] net: ethernet: ti: cpsw_ale: Fix warning on some
 platforms
Message-ID: <20240924140238.GL4029621@kernel.org>
References: <20240924-am65-cpsw-multi-rx-fix-v1-1-0ca3fa9a1398@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-am65-cpsw-multi-rx-fix-v1-1-0ca3fa9a1398@kernel.org>

On Tue, Sep 24, 2024 at 03:28:48PM +0300, Roger Quadros wrote:
> The number of register fields cannot be assumed to be ALE_FIELDS_MAX
> as some platforms can have lesser fields.
> 
> Solve this by embedding the actual number of fields available
> in platform data and use that instead of ALE_FIELDS_MAX.
> 
> Gets rid of the below warning on BeagleBone Black
> 
> [    1.007735] WARNING: CPU: 0 PID: 33 at drivers/base/regmap/regmap.c:1208 regmap_field_init+0x88/0x9c
> [    1.007802] invalid empty mask defined
> [    1.007812] Modules linked in:
> [    1.007842] CPU: 0 UID: 0 PID: 33 Comm: kworker/u4:3 Not tainted 6.11.0-01459-g508403ab7b74-dirty #840
> [    1.007867] Hardware name: Generic AM33XX (Flattened Device Tree)
> [    1.007890] Workqueue: events_unbound deferred_probe_work_func
> [    1.007935] Call trace:
> [    1.007957]  unwind_backtrace from show_stack+0x10/0x14
> [    1.007999]  show_stack from dump_stack_lvl+0x50/0x64
> [    1.008033]  dump_stack_lvl from __warn+0x70/0x124
> [    1.008077]  __warn from warn_slowpath_fmt+0x194/0x1a8
> [    1.008113]  warn_slowpath_fmt from regmap_field_init+0x88/0x9c
> [    1.008154]  regmap_field_init from devm_regmap_field_alloc+0x48/0x64
> [    1.008193]  devm_regmap_field_alloc from cpsw_ale_create+0xfc/0x320
> [    1.008251]  cpsw_ale_create from cpsw_init_common+0x214/0x354
> [    1.008286]  cpsw_init_common from cpsw_probe+0x4ac/0xb88
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/netdev/CAMuHMdUf-tKRDzkz2_m8qdFTFutefddU0NTratVrEjRTzA3yQQ@mail.gmail.com/
> Fixes: 11cbcfeaa79e ("net: ethernet: ti: cpsw_ale: use regfields for number of Entries and Policers")
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


