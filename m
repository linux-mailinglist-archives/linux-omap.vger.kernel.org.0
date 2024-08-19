Return-Path: <linux-omap+bounces-1925-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A9E956D20
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 16:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49A841C2258D
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 14:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE2C16DC0D;
	Mon, 19 Aug 2024 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Oo3CeQMm"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EB816D4F0;
	Mon, 19 Aug 2024 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724077421; cv=none; b=HkHxwOHHvfRV3Il8XsPqGzeSU5WlLp203ouPtfjTC8R/G7KPTAkhG8YNxABCbpxI2mAjOiUMMIet5E6GjhvvpFxjDsVr3zNeYKXhAkjWx+oR2sf/0ya4wpPPLai4wuzetfhF1x7KWSr0x0Zj9Zr4lpFxVL5S2F4HDNfwaBkPRpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724077421; c=relaxed/simple;
	bh=gGZDsocDzpaQYqhsw+0xgjR/qwItyD0Y75zesYVV/68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmBtBJHTqdKx7JWyGmqatzZq0/wufBWbgBc99U/qPWLWuVxZi7O/d3BWuCwYwXy2dbyfNJatXoAZgVgEXe2vD60kuhfTlUb2n1rZ5KB9mC4l3z4hJOZsG3tuea7WNWBWgzeNHO2IZWdbh+XkINWdPg60p+z8dq2QtO4VY+VHg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Oo3CeQMm; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=56aeBW2Nwfu08Vcfzw6WZhyzwb5I2iH2wgj1pLyfRu4=; b=Oo3CeQMmpXZ3kwqxSxbbqRYoOr
	FT8VWPR3SfAwrzzPh7oT7BTmZwvIRT9trlO2wNHLsTstFOiz8Qti4z2EL0BIHSlUcWBBf/GuxgfUp
	382v+5iOguTD4va99SN50C3W+urD9B1oWgo/XLUblufBBdoBC7dwMrS2KLLYqyDNd8LI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sg3Hw-0057SI-5q; Mon, 19 Aug 2024 16:23:16 +0200
Date: Mon, 19 Aug 2024 16:23:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Jeremy J. Peper" <jeremy@jeremypeper.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Richard Earnshaw <richard.earnshaw@arm.com>,
	Richard Sandiford <richard.sandiford@arm.com>,
	Ramana Radhakrishnan <ramanara@nvidia.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	linux-samsung-soc@vger.kernel.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	debian-arm@lists.debian.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Message-ID: <a6316f7c-4064-4145-aa6a-d34197a3981a@lunn.ch>
References: <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <3413899.e9J7NaK4W3@earth>
 <790bf2c4-2ecf-429c-8e28-ad5807ffed7a@app.fastmail.com>
 <a8c009b5-ada0-4f78-92f7-7a6c5075ccf1@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8c009b5-ada0-4f78-92f7-7a6c5075ccf1@app.fastmail.com>

On Mon, Aug 19, 2024 at 04:12:10PM +0200, Arnd Bergmann wrote:
> Two small additions:
> 
> On Mon, Aug 19, 2024, at 11:17, Arnd Bergmann wrote:
> > On Thu, Aug 15, 2024, at 21:53, jeremy@jeremypeper.com wrote:
> > I expect that the terastation pro2 is going to be fairly easy to
> > convert to DT as there is already support for similar Orion5x
> > machines. In this case I would just remove all the Orion5x board
> > files and you can add a dts file later on. The bit I'm unsure
> > about here is legacy PCI support. I see that the board file enables
> > both PCI and PCIe, but I don't know if both are actually used,
> > or if everything is on PCIe.
> >
> > I have some old patches for separating orion legacy PCI from
> > PCIe support, as only the latter has a modern driver (shared
> > with kirkwood and armadaxp). If you can confirm that the machine
> > actually uses PCI, I can dig those out from my backups.
> 
> I did find this myself later, the machine does use an on-board
> PCI connected SATA controller, which is obviously required to
> make the machine useful.
> 
> Doing a PCI host bridge driver with DT support correctly is
> a lot of work, especially if there is only a single machine
> using it. Since this uses the same drivers/ata/sata-mv.c
> driver as the other orion/kirkwood machines, I wonder if we
> can just pretend that this is a platform device and skip
> all of the PCI probing. I think this only needs a few
> small changes to the sata-mv.c driver, but it does require
> that the PCI bus is left in a known state by the boot loader.

It is a long time since i looked at Orion, so i could be wrong....

As far as i remember, it has a PCI controller and a PCIe
controller. They are slightly different. The PCIe part is i think
simpler to support, it follows the standards better. I _think_ the PCI
controller uses a GPIO for interrupt support, which causes a mess.

If only PCIe is needed, it should not be too hard to make work. I
would try to avoid the PCI controller is possible.

      Andrew

