Return-Path: <linux-omap+bounces-2111-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E484796C1A7
	for <lists+linux-omap@lfdr.de>; Wed,  4 Sep 2024 17:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7ED37B2A789
	for <lists+linux-omap@lfdr.de>; Wed,  4 Sep 2024 14:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A241DC19C;
	Wed,  4 Sep 2024 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgcM3t41"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEBB1DC05F;
	Wed,  4 Sep 2024 14:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461907; cv=none; b=A/P7yayBtXwClwDrxc/nOGWmbhF/xIkudvi2E2X3KRRklRNV57s6aVTbIO05XElMOkYRqsu20XX1tTVIhjqn2pHJ/nfgIzPrYUUww7LpmxcX5gen6k7DA4cG5bSQIL17AI/mG9M7GezMOYNbZfT1PHfyYZ4Fk9zhdHikkG3tdHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461907; c=relaxed/simple;
	bh=UQnaAY6AWhM20C0iIDyykUuqjm6xEAysthXGZe2Wos4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+mDvcg6qpIC5OJcB9oanofwlREb16/P1LKwNu1RU1w+IsSiFZ1gmBHkf2rTQeUs3cgaFHfMdhrErhJX00bTADF2VpEiyQyL6ht12Gzy0+3yNOd/rH1coWVid4Qb8lhyY5Lagto/GUQLwVpoBfwvhzqdY69fS2lDOHUW2mYMnnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgcM3t41; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F71C4CEC2;
	Wed,  4 Sep 2024 14:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725461907;
	bh=UQnaAY6AWhM20C0iIDyykUuqjm6xEAysthXGZe2Wos4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QgcM3t41c0e2L97gdbL3uR6WCSplPsdOCaVX2IOGW0VTzUTMQmcogvAfF0xnP9t/j
	 qGRPURbXva4htrayPRZU5b9gms2oVZctYwCSJRB0PMOPIBrpnmiOSrq22tC4/z78C3
	 JqpJkSkR4rQZv8yOGv98P2DvB/xAeprr7/agV8DDjr9ggQQVJ9qWSe/bjPSCrYtZwV
	 Jl0l1kOLkkHTw/OaHnfi2YHrLSTwWDD/FUlOy/VZ3eCzJZqaWpHL6kOqEJLjbK9Igp
	 Z+K2GVtUyQpzVhMC5lnEQuD1HEbbQY/Y1RfZmS5jWMpkNuoq1bnhGQf3i1EONhqo7w
	 WzRLxvCui0gcw==
Date: Wed, 4 Sep 2024 09:58:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: linux-mtd@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
	Enric Balletbo i Serra <eballetbo@gmail.com>, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: mtd: ti, gpmc-nand: support partitions
 node
Message-ID: <172546190582.2558699.15930679272303980998.robh@kernel.org>
References: <20240903-gpmc-dtb-v2-1-8046c1915b96@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903-gpmc-dtb-v2-1-8046c1915b96@kernel.org>


On Tue, 03 Sep 2024 19:29:57 +0300, Roger Quadros wrote:
> Allow fixed-partitions to be specified through a partitions
> node.
> 
> Fixes the below dtbs_check warning:
> 
> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: nand@0,0: Unevaluated properties are not allowed ('partitions' was unexpected)
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
> Changes in v2:
> - reference mtd.yaml for standard mtd properties like partition as
>   suggested by Rob Herring.
> - Link to v1: https://lore.kernel.org/r/20240830-gpmc-dtb-v1-1-792cac1ef3cc@kernel.org
> ---
>  Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


