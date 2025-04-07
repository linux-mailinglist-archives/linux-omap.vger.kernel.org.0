Return-Path: <linux-omap+bounces-3555-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E329A7E8EA
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 19:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A46DD4409C3
	for <lists+linux-omap@lfdr.de>; Mon,  7 Apr 2025 17:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53E321ADA3;
	Mon,  7 Apr 2025 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXL7q/iV"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9C521A42C;
	Mon,  7 Apr 2025 17:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744047867; cv=none; b=KgywS/Afu7ljybF4lmXQujk43aBFAZq4Lh3KzaMySE9wfjJLwyc8LLgNd7B4b6MYpQ4VVNArOvxIKOHXQqVHfApAARW+m7qKuSZ6Fn5ilC3FnGq3EQPomJGRYG8ekyEsnLMevGThvsLcdnIMPdykm/n5MzHRmi/3Y3QDYaRyHRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744047867; c=relaxed/simple;
	bh=7zVyw8dBACn0jbPMoiyXuDYILfE08Q4qXUzBs6PoXIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YgzMzj++ooIBpvTRwCLD9ug/2tgZGgV4u8kGncGeBNyOKAoMNiMW29ZZC7Tiam7Zr0qUJ4S58DfvzhwWA8WwQrKFc8JMmaxE1sv6hsegjA5irC916Zr8K99QTN6yq+upDn04Jv/PJMedFJr6hXG+/e/rbY9R6yz3ZFE1/4gpSfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXL7q/iV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6486BC4CEDD;
	Mon,  7 Apr 2025 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744047866;
	bh=7zVyw8dBACn0jbPMoiyXuDYILfE08Q4qXUzBs6PoXIQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PXL7q/iVHF16iYIelGRyJ0X+jvpOeIcd1w/P3IAzcI6dT9KoqugVYED3VssP0vSNh
	 kN9QOBgSD8ikX3v1pZvrNOugHFgoYkkF4Gx+Z30Pnwdupso0SSk/Io14R+pPQx4Mfd
	 mIOhSaS+VyaJff5IJ20ScGDdXbl0LS6k11pf3CC39ZUBacwstJseoj/WI1joWkfQwH
	 RQUXfe6lAROhiiXfjO6xPHrXwIp46MqYgN6YnxAX1ZSgXvgOAsGPavZxTcBts4P3aF
	 nq35fvxQymYR4SS3TCBSrsMd1cHNcZiRvwJETq3zX5IT7bREZbHNcPlVAhvfBf9xQQ
	 5DPRZ4BapvsuA==
Date: Mon, 7 Apr 2025 10:44:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
 ssantosh@kernel.org, tony@atomide.com, richardcochran@gmail.com,
 glaroque@baylibre.com, schnelle@linux.ibm.com, m-karicheri2@ti.com,
 rdunlap@infradead.org, diogo.ivo@siemens.com, basharath@couthit.com,
 horms@kernel.org, jacob.e.keller@intel.com, m-malladi@ti.com,
 javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
 vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
 krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
Subject: Re: [PATCH net-next v4 00/11] PRU-ICSSM Ethernet Driver
Message-ID: <20250407104424.01cc42f2@kernel.org>
In-Reply-To: <20250407102528.1048589-1-parvathi@couthit.com>
References: <20250407102528.1048589-1-parvathi@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  7 Apr 2025 15:55:17 +0530 Parvathi Pudi wrote:
> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
> Megabit ICSS (ICSSM).
> 
> Support for ICSSG Dual-EMAC mode has already been mainlined [1] and the
> fundamental components/drivers such as PRUSS driver, Remoteproc driver,
> PRU-ICSS INTC, and PRU-ICSS IEP drivers are already available in the mainline
> Linux kernel. The current set of patch series builds on top of these components
> and introduces changes to support the Dual-EMAC using ICSSM on the TI AM57xx,
> AM437x and AM335x devices.
> 
> AM335x, AM437x and AM57xx devices may have either one or two PRU-ICSS instances
> with two 32-bit RISC PRU cores. Each PRU core has (a) dedicated Ethernet interface
> (MII, MDIO), timers, capture modules, and serial communication interfaces, and
> (b) dedicated data and instruction RAM as well as shared RAM for inter PRU
> communication within the PRU-ICSS.

This was posted prior to the "net-next is OPEN" announcement:
https://lore.kernel.org/all/20250407055403.7a8f40df@kernel.org/

In the interest of fairness towards those who correctly wait 
for the tree to be open I will ask you to repost this again,
in a couple of days.

Thanks!
-- 
pw-bot: defer

