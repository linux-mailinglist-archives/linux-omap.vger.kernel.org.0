Return-Path: <linux-omap+bounces-3724-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7160AB98BD
	for <lists+linux-omap@lfdr.de>; Fri, 16 May 2025 11:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A76ED1BC59E1
	for <lists+linux-omap@lfdr.de>; Fri, 16 May 2025 09:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CA422FF4E;
	Fri, 16 May 2025 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TnezCxt3"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C94224AEB;
	Fri, 16 May 2025 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387565; cv=none; b=Ml72O3ehnVDPTjMcLFtUq728+WCsBh998xRNAnpK8DPf5hQN4/3RM2phBdbxA5LnJeW9a9YrCZD87YDYjzwORscPpmvOvJFrNjhTQCREzfRWHY+8YLN/tgc8Nt0Dy+tsB7+jwZgHnCkvMXr5yLLituXE7rOSHoJAgfD22285a68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387565; c=relaxed/simple;
	bh=2MttxbtF7IldfEHoer54Xo0Znt+TZd0PuXMschIbg+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z44g2w1t4xza+fPUQk6DqOK1gfnyrVyxnBomz6OYB6W9a7ZTI7xHKFfF1ohLyWYUf3jU6ky79Er6LeJZLQDMRYn/0hWdAZoCi2tJE0EQsPulKFWWdYHeBYOlK+2JJIe1yw7F/NZNwnqRZExTtr+x+EQLuz/eamrFvRMicbcLUWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TnezCxt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08B8C4CEE4;
	Fri, 16 May 2025 09:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747387564;
	bh=2MttxbtF7IldfEHoer54Xo0Znt+TZd0PuXMschIbg+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnezCxt3VGhZIcYaPZU7yIl5w1fdsJPRmG2VXpuvQCnHA8+ce+Q7hMl8vqJtusRuR
	 dMzSREur+aqrlhl7LHPsAU6sawDhKfT3w0BopXf/AVHFqY/1eJCcibtMEW2LzKWlqi
	 JfZdQznHs+xgWR0/PXxC5sR8loG08/so78xqI3P1uFVeUTIevmJgDy1Qe1cm/SCOdq
	 Iw5R8McmGnsV7uLsLtIJJFe/58M6fwIQSaBfgLeseXcOJMQ/ry6wXXQT3Ld4nXnyfY
	 uAf8XC6DY9350r3j250y30/+reE+pP8OIBpewObNR2tveVuhAXZ4Hbkdu5r0go1Xlo
	 T5y3G6NkIywKQ==
Date: Fri, 16 May 2025 10:25:59 +0100
From: Simon Horman <horms@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>, danishanwar@ti.com,
	srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 9/9] net: ethernet: ti: am65-cpsw: remove
 cpsw_ale_classifier_setup_default()
Message-ID: <20250516092559.GG1898636@horms.kernel.org>
References: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
 <20250514-am65-cpsw-rx-class-v4-9-5202d8119241@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-am65-cpsw-rx-class-v4-9-5202d8119241@kernel.org>

On Wed, May 14, 2025 at 03:04:29PM +0300, Roger Quadros wrote:
> The RX classifier can now be configured by user using ethtool -N.
> So drop cpsw_ale_classifier_setup_default().
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Hi Roger,

Could you shed some light on how this effects user's experience,
say after probing the driver but without issuing any ethtool commands?

...

