Return-Path: <linux-omap+bounces-2619-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 033109C1D6D
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 13:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3BBE1F26287
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 12:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1B31E884B;
	Fri,  8 Nov 2024 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTIGi00k"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758E71D0F5C;
	Fri,  8 Nov 2024 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731070635; cv=none; b=Vba0Kzu86RsyYNZwKyeYw5/M7bXQmhds/z1w3XqYIzWetF0lIUKX/kZb09f7WlkkXZ2dzNcsZ+Du5kgLyN2eCUN/f8xlC6DMDGF51rId3sye16fhJEp5hAQIJPsG6WuwB0N+Mj9hWyTOdVuFLEcGGt6gTSF17icEgmN5Zq8/x6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731070635; c=relaxed/simple;
	bh=75ffRzCysh6jS7kzWfREO207al7HC81GJpgcWXZDsF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0/EbctTNgFI6J795ABMLhB4LHRH216fUUCceSuJnJ2MWSopXRQrw2OS/2lkuy6xg5dzLZQM2thgGk17BlmLkFZNsW4Pm0W2zIFffHsh2+JLzarXMCqsOUe1fgfuZ4Iw5UvTvldu7UD8G/kdur7vpDIjtCdqdbYjSyeIPaFY16E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTIGi00k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C99FC4CECD;
	Fri,  8 Nov 2024 12:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731070635;
	bh=75ffRzCysh6jS7kzWfREO207al7HC81GJpgcWXZDsF8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NTIGi00kae4U0HFuyRWbUfecUh8OmI+d/dnMLjUrjzcReKiV2qHIlPyFJoRdZGbpc
	 lpePIKjMt8UjmiHsBQhMR5xuZ1vWvfsGUWfhKYhcQ1FNV8juAgomEJL29PQrX3hMnO
	 /zshIGiSdHkPt5kU2Y8j7ypkD9TuuwFJLG2Xq2crpIg8+9kDuQNjP9XY07TmAwwAPw
	 6XBeAK/qZFGDzygiQI87lWEIOGFKhE1SufQa0/ow2SjpeTLbx/LNySmUCj866Onaeu
	 xOpBWSIo/KNRaZMcn2jcZDpAUaPZe+T4bLC2NDkDlgtMghwinoA+J2dMqYlCfPh4DW
	 N3ML9SfByt5UQ==
Message-ID: <a5d6b72c-bbe5-46c2-ad98-a973a2623cb4@kernel.org>
Date: Fri, 8 Nov 2024 14:57:10 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: ethernet: ti: am65-cpsw: enable DSCP
 to priority map for RX
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, srk@ti.com,
 Pekka Varis <p-varis@ti.com>
References: <20241107-am65-cpsw-multi-rx-dscp-v2-0-9e9cd1920035@kernel.org>
 <20241107-am65-cpsw-multi-rx-dscp-v2-2-9e9cd1920035@kernel.org>
 <908cc747-18a1-49c0-9b06-1c2f64e4c84e@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <908cc747-18a1-49c0-9b06-1c2f64e4c84e@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/11/2024 14:37, Siddharth Vadapalli wrote:
> On Thu, Nov 07, 2024 at 02:29:30PM +0200, Roger Quadros wrote:
> 
> Hello Roger,
> 
> I accidentally reviewed and replied to the patch from the v1 series, but
> the comments still hold for this patch. For the sake of convenience, I
> am providing the same feedback as the v1 patch below.

No problem, let's continue the discussion in v1 as I have already replied there.

-- 
cheers,
-roger

