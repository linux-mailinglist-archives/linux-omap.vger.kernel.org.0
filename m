Return-Path: <linux-omap+bounces-2241-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BBB984A05
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 18:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0934D1C2265F
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 16:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB871ABEBD;
	Tue, 24 Sep 2024 16:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="0yQK//tf"
X-Original-To: linux-omap@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC2E1A4F0C;
	Tue, 24 Sep 2024 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727196803; cv=none; b=nfjmw8LbaYIB7ohwF810CAChRPGCGlIOEBLvL1ExZieIOJJQjlHBWm9h8/WNvW8K+IG1YkuiDdIxQ6ACb7KSgCcpFe4tO0MIsXc7vC4EyvhJatqwrJa6RhAA2EDIP0h907M5mf5aq4pqRp5A3JmokNAKvxBK/t9rW+aH0DAhPMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727196803; c=relaxed/simple;
	bh=4AfOwKBsz+Hue+wqsjnOb5eB1YfYBPv7QSwJXi4tWew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqVp+W5Kdh8pI2dCo3cAwrApUjswGNW+5MtBnd8LxdBd5WOXQDQYeOhLxKZtBFBasYqDGZZPOrxNX4I8SNE+SgZLKcaboCxdmdYkILeSeZ7biTf5c0S0cuk6FF/TqVFg14sWzTxfjVckb+a2jvPR62zWWLc3kqulClk6T20K2Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=0yQK//tf; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lghdmMqPtdFFzMso3aFSPggmycBw6rFOEbv5T/gFw6U=; b=0yQK//tfIzJWo2mOwQoF9qJvUb
	x0HZfTXf5yiv8JxhubWkXnnitYNaZ0+xAEaAXdq5Qp9ZjOHXjxrmjpkr+bz6AhPAm8kdhA3+Wqr8/
	85KbqRYIARcW5IeXIpgKHpTVE+R4/G+2brKMGz8iVV8IT08nfslY3vFZu5zydZTY3Nb8646lgkodB
	0XHrR0+dBe7diwBJ1jaVk18onQiWklJKdNdnmwz/TM0Tjk4YxbNY09OTsBA168Yz44toh6sV9AMYN
	VvBSw7hbC8nnW/9CCE6gL8hA51ltHPvMPwZV763tSOIqxF26fKDB5zd3c9bbVSHi6hD1K5CekD9lv
	H+7oNTiw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35852)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1st8mt-0005hM-15;
	Tue, 24 Sep 2024 17:53:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1st8mr-0006WV-2a;
	Tue, 24 Sep 2024 17:53:17 +0100
Date: Tue, 24 Sep 2024 17:53:17 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org, Paul Walmsley <paul@pwsan.com>,
	Tony Lindgren <tony@atomide.com>
Subject: Re: clk mess on omap4460 with mpu clock
Message-ID: <ZvLufU15ZJ4CKuuv@shell.armlinux.org.uk>
References: <20240603234139.280629b2@aktux>
 <CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
 <20240903143357.2532258b@akair>
 <CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
 <20240903192203.1dddbf0d@akair>
 <ZtdQ+Ay9DKAooahN@shell.armlinux.org.uk>
 <20240923140447.60c5efff@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923140447.60c5efff@akair>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Sep 23, 2024 at 02:04:47PM +0200, Andreas Kemnade wrote:
> So the way forward is to check whether that registration is really
> needed at:
> https://elixir.bootlin.com/linux/v6.11/source/drivers/bus/ti-sysc.c#L2380
> If yes, then
> a) increade the size of the name in the clk subsystem or
> b) workaround like
> https://elixir.bootlin.com/linux/v6.11/source/drivers/bus/ti-sysc.c#L353

I'll also mention that if one is using DT, then the clkdev tables should
not be relevant - the lookups of clocks should be done by parsing the
clocks property in the description of the device.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

