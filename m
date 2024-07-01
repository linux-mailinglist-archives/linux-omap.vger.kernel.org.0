Return-Path: <linux-omap+bounces-1628-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA491D91A
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 09:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ACD7281F92
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 07:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E108D8287E;
	Mon,  1 Jul 2024 07:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qX+S8bFY"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F34D7CF39;
	Mon,  1 Jul 2024 07:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819415; cv=none; b=sgKMhNnk265oPeX39HBUakI8gIC5I9YGioQ3+R8Ojl8vhndETLXF9QGOqqFgAO+AKcd5FzBaxWle5Te4TqRvK+4TX0hsQs3dxlNXzDrCHynGTM632rMRJ27m0ijDstfymfqe7qY8MRktKdFQBshQw1YZolX/1rmKD2HKm8cgAjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819415; c=relaxed/simple;
	bh=1ezVShk5sCBChJ0iV0z8OtUkC4EXC1HgqTAAEte11eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pB56CRSNrrGX83BaAIDSN+xM7eY8ukBtVsPiWOTrh4yIWtxygrM4nimRGPsJr4goW8wtNlm6NgSbryosoKrnzFxnWYysIwFQ/ylUYBIDTgDQx6l5GYDqbrbI6xrw8QNw/ImS6Y1YYWZHofrn1dTcOqvGcx3YA1XmrMKNbYH75e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qX+S8bFY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C14DC116B1;
	Mon,  1 Jul 2024 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719819415;
	bh=1ezVShk5sCBChJ0iV0z8OtUkC4EXC1HgqTAAEte11eM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qX+S8bFYG7Gmz56fZzp3yyNzO9QPWUpA8E0ShaDLxjbP8kbpPZIoce4iy6jg7vb8k
	 hCCkV0QUFYKtBqtF0V/fTMdyK4bVhaPfFwF/etP4FkUgSzrxF9AMYb00AzTlBBMAr/
	 VHuTOOSHMDs8n5uG1EhGz34Gob99Erl8xQrFRLe8Llq8FfbnnOQiRSbd55SmESDfmc
	 FlLrH4CT54Ghpf8XzW4pB0MTahSCbD2Hxw09SMEuXmI96IhI3eTIAxII40nk7yX9fK
	 r9dFDyP9BNKYSEAVhqpq/iIYmng/d7UT/+6a67NHPtvahrbBRbOlDV/6zh5k6a3KJ7
	 1WVFIspgS9niA==
Date: Mon, 1 Jul 2024 08:36:50 +0100
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
Subject: Re: [PATCH net-next v2 7/7] net: ethernet: ti: am65-cpsw: setup
 priority to flow mapping
Message-ID: <20240701073650.GO17134@kernel.org>
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
 <20240628-am65-cpsw-multi-rx-v2-7-c399cb77db56@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628-am65-cpsw-multi-rx-v2-7-c399cb77db56@kernel.org>

On Fri, Jun 28, 2024 at 03:01:56PM +0300, Roger Quadros wrote:
> Now that we support multiple RX queues, enable default priority
> to flow mapping so that higher priority packets come on higher
> channels (flows).
> 
> The Classifier checks for PCP/DSCP priority in the packet and
> routes them to the appropriate flow.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


