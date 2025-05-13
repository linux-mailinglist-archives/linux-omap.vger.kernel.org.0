Return-Path: <linux-omap+bounces-3695-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F30CAB5035
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 11:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16A151B40BF1
	for <lists+linux-omap@lfdr.de>; Tue, 13 May 2025 09:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A9E23956A;
	Tue, 13 May 2025 09:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDL938PQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57641E9B03;
	Tue, 13 May 2025 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747129652; cv=none; b=OlC07b2App+9D3e3bOjEOpsfj1KfD7GzsWda9eJx4Axh4erZJvh71ZARAVhMxCKAGCX8L6NS2iL7hCyBYdC/vk7RvWqNXEv14/WpPpfZUeaepvRtQkSHusm+PnzxlgZXDW2qiiKr1+OYUkuw0U657YVx2NDnQwyoF2BFSeHm7Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747129652; c=relaxed/simple;
	bh=xdZRAhNT35b5XbONWZpeY/LWsNXSL4jD++flhQxZj+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pm5uiGVoPodNDvAGNksMZYCTkG9gyyhFipLbisGCvghFaQOBPmX6pnWKf0Z18ei7GU54Uh1Qs5DKUnW9F693XkkuclXs71ADn98Yz40beJF+wMRG44rX1Glvlgp0oyaZ+bG/dtyPBrWi/lNAh4s5ajSfvpF4MvghqZP9yZ4vrZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDL938PQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB88C4CEE4;
	Tue, 13 May 2025 09:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747129651;
	bh=xdZRAhNT35b5XbONWZpeY/LWsNXSL4jD++flhQxZj+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDL938PQADFWvv1iYObPBQQN0mxoiEw+n1aZ8rwiWW8ckHeMPhXAUvnyuFTUmMctt
	 RBYOwvDyXj5YbwOSseS5nNUvOi4A7ylzUidJgq6CBqJePPoTrMfznVqr7WRkXzKoUS
	 4qCva9J5YLTaHQqM5kYbrnV+hSKlLnBXLGmdjDwQmPkviDNHQC8pP8+io4yKK9KW9f
	 9t9+hATyYNXCrRZTlFtCuHijFlFpGl4aX3IPcmImJ6HqJUXrY9+c6+LkFZZi26OQ2Y
	 zrYQ7iAC1XD/wdWROWl960ipCy7gn56+DxRvNj7HbxTgTUvTT8MSdXtWqSfyfWXGQu
	 by6UdqRUqPF/A==
Date: Tue, 13 May 2025 10:47:26 +0100
From: Lee Jones <lee@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] mfd: Remove node variables that are unused with
 CONFIG_OF=n
Message-ID: <20250513094726.GG2936510@google.com>
References: <20250508-mfd-fix-unused-node-variables-v1-1-df84d80cca55@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508-mfd-fix-unused-node-variables-v1-1-df84d80cca55@kernel.org>

On Thu, 08 May 2025, Nathan Chancellor wrote:

> A recent cleanup introduced a few instances of -Wunused-variable in
> configurations without CONFIG_OF because of_fwnode_handle() does not
> reference its argument in that case:
> 
>   drivers/mfd/twl4030-irq.c: In function 'twl4030_init_irq':
>   drivers/mfd/twl4030-irq.c:679:46: warning: unused variable 'node' [-Wunused-variable]
>     679 |         struct                  device_node *node = dev->of_node;
>         |                                              ^~~~
>   drivers/mfd/max8925-core.c: In function 'max8925_irq_init':
>   drivers/mfd/max8925-core.c:659:29: warning: unused variable 'node' [-Wunused-variable]
>     659 |         struct device_node *node = chip->dev->of_node;
>         |                             ^~~~
>   drivers/mfd/88pm860x-core.c: In function 'device_irq_init':
>   drivers/mfd/88pm860x-core.c:576:29: warning: unused variable 'node' [-Wunused-variable]
>     576 |         struct device_node *node = i2c->dev.of_node;
>         |                             ^~~~
> 
> Use the value of these variables as the argument to of_fwnode_handle()
> directly, clearing up the warnings.
> 
> Fixes: e3d44f11da04 ("mfd: Switch to irq_domain_create_*()")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/mfd/88pm860x-core.c | 5 ++---
>  drivers/mfd/max8925-core.c  | 5 ++---
>  drivers/mfd/twl4030-irq.c   | 5 ++---
>  3 files changed, 6 insertions(+), 9 deletions(-)

Doesn't apply.  Which base commit / repo / branch are you using?

-- 
Lee Jones [李琼斯]

