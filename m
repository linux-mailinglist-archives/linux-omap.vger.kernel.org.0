Return-Path: <linux-omap+bounces-1627-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0626591D917
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 09:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D056B220A5
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 07:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFB876EEA;
	Mon,  1 Jul 2024 07:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhKIPozW"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6FD502BD;
	Mon,  1 Jul 2024 07:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819398; cv=none; b=c3aUx4zczMlc6uN+EOmS+9ZMrE6EXoRadWtQiif8oVOeNUc9EsHLqzLwg7Gpt4M+k6BuRa/L4iM3TQosOKUMJbFhuNWVgkoEGRulQH10zWn304XVxS18KUC0mjrZZ0xBVmIxNM7V8EB3XvSdCwzrY3HvbqQYNjPbdr/lCfUVD3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819398; c=relaxed/simple;
	bh=11VM0ibBnsQi0MHqSOL0fR+Syf+EPVnUrFcvcCSZRxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyVspJuW4VySa8AZgXMcFsM7uHNiPxoeHKdEHmGdT/+WVtMEAlV3bagTJ18Zjqjs0E4sTNdecIa/NznbEUwEHfLsbP9YIvwfjmfHV393zB4UBSXIFEI1bYmFS5RTsh1y4ydb3zwp3zH9MFyvga4hjmbBUzZE5mwx1FLM4UwFyPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhKIPozW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF13DC116B1;
	Mon,  1 Jul 2024 07:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719819397;
	bh=11VM0ibBnsQi0MHqSOL0fR+Syf+EPVnUrFcvcCSZRxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RhKIPozWUFB+KGCxJS5mX4j+rH80u8SgfD61youE/4toeG8W34weXOEXsb4hoikcw
	 70KppKVJFOkb/ROHdu++pCw9XI4MlnnbSufVTelojlG9VIO5yEzjkdiiDCzmaRowHO
	 wfKONPO5VIQgI+Y4UOWN/T+4VN9omcyjrLEHbPoD/byj0LQjZ0mUX3oOt7BPhj1xRW
	 oqpHccvlZlnZBqwPUCDsMn/+5jEMqxbMtzEaSomP6HQJ2BmGMzfUonCztKiGxqpN+8
	 RopKN3JPSqjKtgJM6pq1nS1TgYoHbtnW2gpTRP/KbpfQ9B8nlidIff4pjjw3MRoPgT
	 BO/imqexI15rw==
Date: Mon, 1 Jul 2024 08:36:32 +0100
From: Simon Horman <horms@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Julien Panis <jpanis@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
	srk@ti.com, vigneshr@ti.com, danishanwar@ti.com,
	pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/7] net: ethernet: ti: cpsw_ale: add Policer
 and Thread control register fields
Message-ID: <20240701073632.GN17134@kernel.org>
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
 <20240628-am65-cpsw-multi-rx-v2-4-c399cb77db56@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628-am65-cpsw-multi-rx-v2-4-c399cb77db56@kernel.org>

On Fri, Jun 28, 2024 at 03:01:53PM +0300, Roger Quadros wrote:
> Adds regfileds for Policer registers and Thread mapping/control registers.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


