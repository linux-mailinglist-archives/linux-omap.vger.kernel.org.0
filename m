Return-Path: <linux-omap+bounces-4211-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C220BB24A52
	for <lists+linux-omap@lfdr.de>; Wed, 13 Aug 2025 15:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD6101BC4B2B
	for <lists+linux-omap@lfdr.de>; Wed, 13 Aug 2025 13:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5ED2E7188;
	Wed, 13 Aug 2025 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pV2RQoMR"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D7F185B67;
	Wed, 13 Aug 2025 13:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090774; cv=none; b=JfkYiCwzU79DI2iCW36S+vgbxz/93iJzjOCH4qtazJyIS6JrjBaXAIoF1hHtXAVxejNfzmqtLGPAwRBWEAynyw+9IdOhBBMpFkWYJXKptk0S2kDVCx7i+B4qxrwgsAb8jMIYc1u7OycjYoflYX5IhKu5BBiZm0i5rVswbWok9K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090774; c=relaxed/simple;
	bh=Jf6vDdI8OOf9LByA09StU26Yh8XWjKOx5YsRHZ9KMM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFDJGQvW/i1J4kP5V0TKbwDBQO08+KIMugv6f0+ydXuomp3ICAxCJOLlurmN4gIich4BBgpOmJ05Yz/T/UXyFSTQmFCPnTgqbCp6Wk5ZZ9EkBS2b0H7zvTfzTua/jD4WLKtmpbMCEeQjsEZ+Cbrr97jzKIRGDYpFXHZXBt5vmCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pV2RQoMR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4075C4CEEB;
	Wed, 13 Aug 2025 13:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755090773;
	bh=Jf6vDdI8OOf9LByA09StU26Yh8XWjKOx5YsRHZ9KMM0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pV2RQoMRJ2KvT4ix6r6Fy5k06i/w9ZJaIwdFKkPhMGU1XNy6/kXqTcr584735waBf
	 Kz1xPXrvygdtseSu0wr9huc8ziRlC0nDSsZA3oUCebHn3CEDAYFgBgXbxw2Zeh25dr
	 RxAp/yREvf+3PU0VWwLHZjS0hFhAaSL6xyS/BwDK/mUMINPxEpjvz0vsMZo2k4fEFe
	 UCGheo+TPz1SGg6KckcHZ7IvQSCZEspXfBV2bm3WtVcVcWblKLCodEvAl/Xt+CTTdC
	 j8bMpy3CsU4qtUohZKxq0RlXaV64o/gQQ7mJizGfReVC6EUAJKToeNaS30HTN6htKa
	 bzc9qPiNq4H1w==
Message-ID: <b9c504ee-6f5b-480c-9e73-83786e11aad9@kernel.org>
Date: Wed, 13 Aug 2025 16:12:48 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 9/9] net: ethernet: ti: am65-cpsw: remove
 cpsw_ale_classifier_setup_default()
To: Simon Horman <horms@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com, srk@ti.com,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
 <20250514-am65-cpsw-rx-class-v4-9-5202d8119241@kernel.org>
 <20250516092559.GG1898636@horms.kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250516092559.GG1898636@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Simon,

On 16/05/2025 12:25, Simon Horman wrote:
> On Wed, May 14, 2025 at 03:04:29PM +0300, Roger Quadros wrote:
>> The RX classifier can now be configured by user using ethtool -N.
>> So drop cpsw_ale_classifier_setup_default().
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> 
> Hi Roger,
> 
> Could you shed some light on how this effects user's experience,
> say after probing the driver but without issuing any ethtool commands?
> 

Default behavior is that all traffic is routed to channel 0.
I will mention this in the commit log.

-- 
cheers,
-roger


