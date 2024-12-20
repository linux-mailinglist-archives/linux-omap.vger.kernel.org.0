Return-Path: <linux-omap+bounces-2863-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 493219F8A98
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 04:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5D1B1685F8
	for <lists+linux-omap@lfdr.de>; Fri, 20 Dec 2024 03:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEE117E00E;
	Fri, 20 Dec 2024 03:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQwj7UC1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707A17083F;
	Fri, 20 Dec 2024 03:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734665419; cv=none; b=sVN2JI65TVJDIVuEXbRSY7o/RcuT5FdNUDaiBmOc4vjRl2bpOnTCu4749/9NwK+VgHlWJJAnotGljAFdkyI+jteI07KaqNN5nGvH5RyS+WVlZTWlnvEiey4ekfRAbjoTsCo5Rr2yDqkFLUihnT03/u9v47JhHdSUiZ5Za1qtoNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734665419; c=relaxed/simple;
	bh=+QK6tAfsTZuJDAcWE/msZILKZKalo9ejnS+DlgtT+/U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=anwWTLg/bRHrn3rJ2WU+XZrjGaMzZRBZa6WuOs53VyQvSFrfq31WrhJjECKmOf/CCfSmFlCr7qhu/eyqN5yE6pozpZGj1ufU8hDQkZWqdT55RLE2ajtkvM08R5RkiIFjaBMhDqY+Kdl5pntueXDcsj8xjzikUfwW7JFCjC3wAI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQwj7UC1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45ED0C4CED0;
	Fri, 20 Dec 2024 03:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734665419;
	bh=+QK6tAfsTZuJDAcWE/msZILKZKalo9ejnS+DlgtT+/U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fQwj7UC1YgPKhZfkGZL0bxQwz2KZqVvM/pKkTOXVly9EGPFPqLYMjYXZwd9U8JFcd
	 kdvQGpSAJNyCcCLOGrO6sWekBfpcyGvXabZbLWsqLsZruFB4Qkpnnl432trAIJ7vNp
	 hEHEDta6QefEW5MsLTJvxaOG/Q6HIKqh639tR1zUI2KM4/qphw87jeR0BZurh/FVFN
	 LMPtWKEsXgOkV8ml6Ef/dTX5SGDfjWaZJwKfyQSCCItoTCgooNdoaqSFmyACcsD+Og
	 teNWKmxaPMwS7pRRV+LJ61jeFVPpgEke3jjxoJCev8VQ14+uX4oTtuUTM6dokkBNRA
	 AMsEMaVNwpXog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D3E3806656;
	Fri, 20 Dec 2024 03:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: add and use phy_disable_eee
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173466543676.2462446.11795736705448322037.git-patchwork-notify@kernel.org>
Date: Fri, 20 Dec 2024 03:30:36 +0000
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
In-Reply-To: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux@armlinux.org.uk, andrew@lunn.ch,
 andrew+netdev@lunn.ch, pabeni@redhat.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, horms@kernel.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Dec 2024 22:29:58 +0100 you wrote:
> If a MAC driver doesn't support EEE, then the PHY shouldn't advertise it.
> Add phy_disable_eee() for this purpose, and use it in cpsw driver.
> 
> Heiner Kallweit (3):
>   net: phy: add phy_disable_eee
>   net: ethernet: ti: cpsw: disable PHY EEE advertisement
>   ARM: dts: ti/omap: remove eee-broken properties
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: phy: add phy_disable_eee
    https://git.kernel.org/netdev/net-next/c/b55498ff14bd
  - [net-next,2/3] net: ethernet: ti: cpsw: disable PHY EEE advertisement
    https://git.kernel.org/netdev/net-next/c/c9f5a5dabbf5
  - [net-next,3/3] ARM: dts: ti/omap: remove eee-broken properties
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



