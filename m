Return-Path: <linux-omap+bounces-5393-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D24FD04454
	for <lists+linux-omap@lfdr.de>; Thu, 08 Jan 2026 17:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E30C303C7D4
	for <lists+linux-omap@lfdr.de>; Thu,  8 Jan 2026 16:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5082125F797;
	Thu,  8 Jan 2026 16:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PqzAlLfD"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE682356A4;
	Thu,  8 Jan 2026 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767888764; cv=none; b=qOy/9C03RONpJRKlGXEuh1WWXLWO+Y7tLLOJo1j4i4rJarjVOw76BYeVxI+q7CxY86GbSQXIY4lOe2NLGANQxRkoVe8fzU1oDn7/AQdCoPUKusnibJEIZDe8Lb0EcWsFxwqYcSEA/6x5IeyALSLSvAUdBAkRPt4heHQnwXCMlOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767888764; c=relaxed/simple;
	bh=x4S9AWO2aP5LqVW9zJTVkSe9QnYTdpatZvDuiOQVYfw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LI/7W8b9l6TWIvLLxbqoWM1LkSaRqsMekCHA3A5jNFhEkSacJLJqDjSF13kFpsKUpgFP8/qK0tE8ZnArmPnWXtLt4ZX5VTK2zreKUPny0e2lH1z0aDWXUAjYRIl53akO+mrbzeh3P4j3RC1qzrMHj3ntRsN5rhRbOQyT9k1l2RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PqzAlLfD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3ADBC116C6;
	Thu,  8 Jan 2026 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767888764;
	bh=x4S9AWO2aP5LqVW9zJTVkSe9QnYTdpatZvDuiOQVYfw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PqzAlLfDZzBpDUFPQf8bXOtLs0RGp42oJB10SsEdt/cHe01C0HUl4y3qy4U2YabzI
	 LubySt7MbwV2ib66x4/mWI9qFk5rMJWe1xeMjEuWSAeeDHA1Tytbit1iJvIgHHuBWl
	 xfp2hqqhn+HJcYJTb7kZULoe+Oukc6wlkzmU4JRBvRz0IWK8elpco58JUGS3T7uh23
	 WIU5GBdh4ly6ZnSWOhlf+sQmDrq8fo3sztSe/+MnNrGxv/z5XhET7Rj5Tswbb57N1H
	 djUqmDkRf7PXQaZ8SAdFj+LdWxaqvpPMxtJ6qIR8VyMxoYtfSdy/dPZ8lGakBvy19U
	 73j6/maUs8R7w==
Date: Thu, 8 Jan 2026 08:12:43 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Stefan Wiehler <stefan.wiehler@nokia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, Roger
 Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 0/3] cpsw_ale: Remove obsolete macros
Message-ID: <20260108081243.7e261c36@kernel.org>
In-Reply-To: <20260107145846.3144585-1-stefan.wiehler@nokia.com>
References: <20260107145846.3144585-1-stefan.wiehler@nokia.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 Jan 2026 15:58:16 +0100 Stefan Wiehler wrote:
> Remove a bunch of obsolete macros from the CPSW ALE driver.

Dead code is not a bug, this should target net-next without the fixes
tags. Probably a single commit is best. You can just quote the 3
commits which removed the used of the macros in the body.
-- 
pw-bot: cr

