Return-Path: <linux-omap+bounces-3725-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9017EABA790
	for <lists+linux-omap@lfdr.de>; Sat, 17 May 2025 03:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE8EA16C172
	for <lists+linux-omap@lfdr.de>; Sat, 17 May 2025 01:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6B88632E;
	Sat, 17 May 2025 01:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRzE2iTU"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4904317D;
	Sat, 17 May 2025 01:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747445344; cv=none; b=B2UjdoqGtmIR9iy3X+WCJIVyER0EMiNbe7H7EGlfwlTwfcnnHsSHeUmNNX0Yq9GSCTgnwA+WEgP3UvcjeCP3TbYH5Mp5hpcoR9TUp2bNAQMf0l7/PF8i/7ir24BHVjrOr0E+rTHK4dE4SnTwQzZiq9qKR+JNWvQP5JSyskp2Tp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747445344; c=relaxed/simple;
	bh=MwwvR1eeTUTa1bBfsMSEkHdDM7ZsJIeMUuDo9Bg5f7A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VxctuNvNiEY4zO6mg3czuqKTxI9T2cOOsZ5WLl74XGF9hTwnpz/YUKhzj6SHs7hkF7Mgsn9UDb7p9gIIlQ2sMOUWtfDeYGxMaATNQ71SIiGvSaIu7KRn5Cc+57vAP+2oiwLx75mG8RMbcNbep/StdnBk0Nd/gqVMtfWtLx+itz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRzE2iTU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C22C4CEE4;
	Sat, 17 May 2025 01:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747445343;
	bh=MwwvR1eeTUTa1bBfsMSEkHdDM7ZsJIeMUuDo9Bg5f7A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DRzE2iTU2INUYNzIRpQcbne/Obq3Kf+JirphFHGrP2O88rtWAiW5AQcioEywJbnXt
	 al8eFyEeTRrFHGTSvo3YYWB25b0IkDhe8wN2RToQWD1Vvl29Sa4YBlvdu8jDnUaIfR
	 aq/dwMjY8MSZqovBPYo11PTX9+dBduy8Oopslu/1WI9Vx1iFJvqd2cTdAwwwYV+J1r
	 uLVz+u1FDF16LbhHa8xRvMAR5kEjgTRKJiIo5mDHm6zrZ5NFfj8FaQuTpUkpTHc7kU
	 g723ws9CHUxBWHzytagN3Cgcp1+UwuDNAbC9h8e4w6lhEjsKW6bewe/BzLQfkz/KlS
	 k5TdZ4bj54rog==
Date: Fri, 16 May 2025 18:29:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <linux@armlinux.org.uk>, danishanwar@ti.com, srk@ti.com,
 linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 8/9] net: ethernet: ti: am65-cpsw: add
 network flow classification support
Message-ID: <20250516182902.5a5bfd98@kernel.org>
In-Reply-To: <20250514-am65-cpsw-rx-class-v4-8-5202d8119241@kernel.org>
References: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
	<20250514-am65-cpsw-rx-class-v4-8-5202d8119241@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 May 2025 15:04:28 +0300 Roger Quadros wrote:
> The TRM doesn't mention anything about order of evaluation of the
> classifier rules however it does mention in [1]
> "if multiple classifier matches occur, the highest match
> with thread enable bit set will be used."

So we're not sure how to maintain the user requested ordering?
Am I reading this correctly? If so then ..

> +	if (fs->location == RX_CLS_LOC_ANY ||

.. why are we rejecting LOC_ANY? 

I'd think that, in fact, LOC_ANY should be the only loc we can support.
Note that ethtool hides the location logic on the CLI, if user doesn't
request a location and driver reports RX_CLS_LOC_SPECIAL ethtool will
set the location to LOC_ANY.

> +	    fs->location >= port->rxnfc_max)
> +		return -EINVAL;

