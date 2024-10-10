Return-Path: <linux-omap+bounces-2383-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C5E9985A3
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 14:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00B95283113
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 12:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27BE1C3F2F;
	Thu, 10 Oct 2024 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7c8xwrX"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB3718FDBE;
	Thu, 10 Oct 2024 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728562404; cv=none; b=XKWY9Net2IIkrva54YpMGXeUrIBimfOpvvseGxuUG3ab9qvnHcTTJvB5sicTKmbsTIMmkcfWNC48CXo7H2chSwYxpzpgj8yOfrI1yN2L+mswzpD7SBFOAv2E0dpMx7yiaWK0M2B9VuidpON3XoRGEu1nN0gn1jjYUOd/8gwrsX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728562404; c=relaxed/simple;
	bh=Tc6A6TaGVOox3EIjIA4GenN9OJksko5HfFiGTMLyOdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b3EWJcW8/6VAjnQ2xRtSSEGqY0+iD4pVoTD5geAHpMO4VD4/7slDqo2QnlGpzQx4f5vSO5VW1NpQ9bAOuOdoXcm1T67FyE28gb1c6WnPcRG0+tF39b+8Hn62LEa6ny2wHq8MAptqZNDIl+eHQexdQPZ8sc5ZvWAJIIFbOd6liyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7c8xwrX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7EAC4CEC5;
	Thu, 10 Oct 2024 12:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728562403;
	bh=Tc6A6TaGVOox3EIjIA4GenN9OJksko5HfFiGTMLyOdo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m7c8xwrXmArRa9h19qkaCkYGSI8npxe+vBHX9lQ6hjifhqzIfoZHoslZO37k/RoRB
	 Et8W25eMf/DBaRLn/L+uzMlfn5+sKCNgSHFsF8C2gAaZoSeLBN0pFinnjCpL8MDiJF
	 SEf8A68mQAyeX2Z+ir5+a6/27Wx3tkkqlDt7thOB97ltIlfbI75Pez3NqxPfbutOId
	 uSKy3bC/ytkc70c9kmizGrtgAhReol0YWNkeUnxPefSJdfbkdOP3tuCx81DOtNfjBj
	 YJtGjJe5nmBk6oIngzBsDr51dflFEWpH5zPv3hRgvY0VOPI+6a4DJhccHPbRB0VHr+
	 uQ9zQruF096wg==
Message-ID: <9a99bf9e-ea1b-4fab-8b50-a2bd8a320579@kernel.org>
Date: Thu, 10 Oct 2024 15:13:18 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/3] net: ethernet: ti: cpsw_ale: Remove
 unused accessor functions
To: Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, netdev@vger.kernel.org,
 linux-omap@vger.kernel.org, llvm@lists.linux.dev
References: <20241010-ti-warn-v2-0-9c8304af5544@kernel.org>
 <20241010-ti-warn-v2-3-9c8304af5544@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241010-ti-warn-v2-3-9c8304af5544@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/10/2024 14:04, Simon Horman wrote:
> W=1 builds flag that some accessor functions for ALE fields are unused.
> 
> Address this by splitting up the macros used to define these
> accessors to allow only those that are used to be declared.
> 
> The warnings are verbose, but for example, the mcast_state case is
> flagged by clang-18 as:
> 
> .../cpsw_ale.c:220:1: warning: unused function 'cpsw_ale_get_mcast_state' [-Wunused-function]
>   220 | DEFINE_ALE_FIELD(mcast_state,           62,     2)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> .../cpsw_ale.c:145:19: note: expanded from macro 'DEFINE_ALE_FIELD'
>   145 | static inline int cpsw_ale_get_##name(u32 *ale_entry)                   \
>       |                   ^~~~~~~~~~~~~~~~~~~
> <scratch space>:196:1: note: expanded from here
>   196 | cpsw_ale_get_mcast_state
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Compile tested only.
> No functional change intended.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

