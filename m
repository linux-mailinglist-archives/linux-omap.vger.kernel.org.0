Return-Path: <linux-omap+bounces-5498-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B81D322DC
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 14:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA6D13007668
	for <lists+linux-omap@lfdr.de>; Fri, 16 Jan 2026 13:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573E328726A;
	Fri, 16 Jan 2026 13:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jdOcwESw"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80020238D52;
	Fri, 16 Jan 2026 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571736; cv=none; b=lbNgTXERRnJxAO3hM8yNMlU0CIvE4GCVSFocG7PgK8UIYj4h1N8qv0H+kQ4BFSZKUXpGT7GstLmGD9eqetU7KGEV7ZT5wWZP4idFK8RMT0sSF55XXcNs/NYukkb1bw8YuqPJIZA/NiSzKFXclcbaRfduel+Q353sjyWUSe/9AHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571736; c=relaxed/simple;
	bh=I0XCyUeDtuxysS4p9zJrWOJAivWPd7yP+p1bN+bktSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWfG6G2N5JKq5ebeXhe+6yKfwWmYhNvjj/F9BHlNH+LEO68SwayXBGL8pCE3fe8nmpFJwR27UzZV/PYbBb4iSySK05E4L18e+mL86e+IwubhKkCB0PuGjBumtZj2KveH5RwXcKUZWtjFSov3YZFddHOcdHgdJ3SxnpuRI3VPDN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jdOcwESw; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ndo/z/ZlLRolf1OeTpw88B+RYHztIyRUkD+K94epJM4=; b=jd
	OcwESwJUMwTJqJ3m59hjuAnufo/Yg8UgR4YRnu/pp0tlumajmMYDO3I/PKXXopFak96VhNzvPlEPa
	haMNdiRURAt0Z1X9FOOYushPWJWyslLfapNSDosOQVvkr14eNF/FiigpF2bRXhLInmGlgZv8MpXVx
	7p8zgRq2uTYAuFQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vgkIK-0034xf-WE; Fri, 16 Jan 2026 14:55:21 +0100
Date: Fri, 16 Jan 2026 14:55:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Parvathi Pudi <parvathi@couthit.com>
Cc: Andrew Davis <afd@ti.com>, nm <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kevin Hilman <khilman@baylibre.com>, rogerq <rogerq@kernel.org>,
	tony <tony@atomide.com>, robh <robh@kernel.org>,
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>,
	richardcochran <richardcochran@gmail.com>,
	aaro koskinen <aaro.koskinen@iki.fi>,
	andreas <andreas@kemnade.info>,
	linux-omap <linux-omap@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	netdev <netdev@vger.kernel.org>, danishanwar <danishanwar@ti.com>,
	pratheesh <pratheesh@ti.com>, j-rameshbabu <j-rameshbabu@ti.com>,
	praneeth <praneeth@ti.com>, srk <srk@ti.com>,
	rogerq <rogerq@ti.com>, krishna <krishna@couthit.com>,
	mohan <mohan@couthit.com>, pmohan <pmohan@couthit.com>,
	basharath <basharath@couthit.com>,
	Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [PATCH v4 2/2] arm: dts: ti: Adds support for AM335x and AM437x
Message-ID: <2a977fd4-910a-4838-9ed6-97224d6ab775@lunn.ch>
References: <20260105162546.1809714-1-parvathi@couthit.com>
 <20260105162546.1809714-3-parvathi@couthit.com>
 <84b08398-5622-45c9-a8fa-54639c1cf0b3@ti.com>
 <2110802326.88645.1767873743162.JavaMail.zimbra@couthit.local>
 <180076068.145887.1768567659299.JavaMail.zimbra@couthit.local>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <180076068.145887.1768567659299.JavaMail.zimbra@couthit.local>

> On the AM335x board, the CPSW MDIO and PRUSS MDIO signals are routed to the same physical
> pins (as shown in the schematic, see page 10 “MII_MUX” in tmdxice3359_sch_3h0013_v2_1a.pdf
> from https://www.ti.com/lit/zip/TIDR336 ). Because of this shared routing, the pinmux
> configuration applied by U-Boot for CPSW MDIO remains active even if the CPSW MDIO node is
> later disabled in Linux, and Linux does not automatically revert the pins to their reset state.

It is generally a bad idea to rely on the bootloader. I would make the
CPSW MDIO configure the pins how it needs it. The PRUSS MDIO should
also configure the pins how it needs them. However, it is not as
simple as that...

Looking at the schematic, what you have is ugly. You literally wire
the outputs together, without a hardware mux. For MDC you assume one
is Hi-Z, while the other drives the line. For MDIO it does not matter,
both are inputs. so Hi-Z.

I actually think you might need to represent this in Linux, with
something i would call a pinmux-mux. You give it two sets of pinmux
configurations. The active device claims the mux and gets it to set
the two sets of pinmux as needed. Also, just setting the pinmux to
GPIO is not sufficient, you also need to ensure the GPIO is configured
for input, so the lines go Hi-Z. Often pinmux and GPIO controllers are
interconnected, so the pinmux subsystem might be able to do that for
you.

I don't know if a pinmux-mux already exists in Linux. You probably
want to ask on the pinmux mailing list, or they might have a different
idea how to cleanly do this.

	Andrew

