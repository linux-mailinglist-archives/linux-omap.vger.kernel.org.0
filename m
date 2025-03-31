Return-Path: <linux-omap+bounces-3517-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707EA762E3
	for <lists+linux-omap@lfdr.de>; Mon, 31 Mar 2025 11:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 195411673AF
	for <lists+linux-omap@lfdr.de>; Mon, 31 Mar 2025 09:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F112A1DC745;
	Mon, 31 Mar 2025 09:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="zO7yvgN4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139297083C;
	Mon, 31 Mar 2025 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743411631; cv=none; b=ipG2+pbvCKjBKBJo0QbWbuu10XnQY2gyFAHK+pjYEKyO5wkclz/FHEATBKJ/glssr3vtASyMpaWkmZr7uvQ8jhndn29DSE0pAbUH35uGaTYnCPjs3S1R6x9SedVnY7Vp5T0km2b8ySZrjiUfDfZexbn5DHaMsCc5NjA94s+9ypw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743411631; c=relaxed/simple;
	bh=napwSWd5S8Bya3ev5krOVMpvA8ZN/WqtxQpabE0zxpg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sG62v54cQA3llGjMjAqqXrNOhJzUF3I1pI2dPXm6B7L+cspYZcz4igj0ICN5UFj1KykTOsHps7a/ZNMqoXLP9Zkzp/oXH+QozXJkLihFNZ6TvXMIQ6UM1ujXAEqFF2wrAxbzE0NLqCfcCuy+eG8QzN1YaiCXJkVffG8GLUiAVUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=zO7yvgN4; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KWr4Lqm1cmqHpRh/AqmCsQHoBFqR80xk7bvspb5WObI=; b=zO7yvgN4w26TreKKVEjvfOzvOW
	Q3UeGM2hzZguQXpx+GLxFhgDeRzyVBrDkqOSDRapP9NS5gnPz7ju4idZX0YUMtHjJ+ey3COJkw1A0
	FfeA3TdsaC7N9gVQNs3dz4FQiCSEgPlb/R94YrkwHWTlfJD8XBw9XExMQK7Xl1VY+RqigYHF/HS0B
	PMRJtrz4/CvI/XVJde7BHE6l2JdRXFNe3EScsDUy0B0s/ROHE/NUbRX7RJ84Ed/CrEFU+cBni1fM+
	NFUNpRIkCaDYh2ACFEQxCqFQgoUBalv7L38EY8CdjaEIHWIMyZHcn5Ti/STIjsIloMGyBwebSFKXv
	rpcNPz7A==;
Date: Mon, 31 Mar 2025 11:00:17 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Message-ID: <20250331110017.2b0aa9ae@akair>
In-Reply-To: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
References: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 13 Mar 2025 10:47:06 +0100
schrieb "A. Sverdlin" <alexander.sverdlin@siemens.com>:

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> This reverts commit 4700a00755fb5a4bb5109128297d6fd2d1272ee6.
> 
> It brakes target-module@2b300050 ("ti,sysc-omap2") probe on AM62x in a case
> when minimally-configured system tries to network-boot:
> 
> [    6.888776] probe of 2b300050.target-module returned 517 after 258 usecs
> [   17.129637] probe of 2b300050.target-module returned 517 after 708 usecs
> [   17.137397] platform 2b300050.target-module: deferred probe pending: (reason unknown)
> [   26.878471] Waiting up to 100 more seconds for network.
> 
> Arbitrary 10 deferrals is really not a solution to any problem.
> Stable mmc enumeration can be achiever by filling /aliases node properly
> (4700a00755fb commit's rationale).
> 
> After revert:
> 
> [    9.006816] IP-Config: Complete:
> [    9.010058]      device=lan0, ...
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

No regressions seen on GTA04, Pandaboard and BT200.
So

Tested-by: Andreas Kemnade <andreas@kemnade.info> # GTA04, Panda, BT200

