Return-Path: <linux-omap+bounces-1228-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 276298AA819
	for <lists+linux-omap@lfdr.de>; Fri, 19 Apr 2024 07:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83BE9283CB8
	for <lists+linux-omap@lfdr.de>; Fri, 19 Apr 2024 05:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27B3BA50;
	Fri, 19 Apr 2024 05:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="TcWyMBhd"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E031B79F9
	for <linux-omap@vger.kernel.org>; Fri, 19 Apr 2024 05:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713506037; cv=none; b=fJWUV5bNguz5ER3SBDCcGdpv6AKnBDXDyngQ/Dqs6wB0gcZ47uUMcBmn0wkt6h06hFGPUIaj+a7LdO/KzfpZPpZm3c9vdRlJy/pt1UMFpkyWr4HE8BhKAe4of2PjlliPYcNNQSwKSmS0QiSH1xufUQjmzuDgRmaV/e0TGWmk0kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713506037; c=relaxed/simple;
	bh=y50jgZzX1tasZ1nJ/OeWEJ4WOTL45ZecBsv9LB8WKxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bo6BO2PRR4PEOeP+4L72EoWL/07/mRNIk0tAoaDRsq1AUOsdiVUFypkJ4rb1DW9CGZvuFtXkJO5BAom4YcQaNukOZaBGsuUf9QukBkEGhhpo+7BJ5hEB6VJuqCOHsOVZd8cz9rP3bvXYSSjd/RlMV7O8bh06CGUP9YuLhfVWpbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=TcWyMBhd; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 4AD5360506;
	Fri, 19 Apr 2024 05:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1713506028;
	bh=y50jgZzX1tasZ1nJ/OeWEJ4WOTL45ZecBsv9LB8WKxE=;
	h=Date:From:To:Cc:Subject:From;
	b=TcWyMBhdTIv3N992WKxfFLFq81in7QH91G9P0WAYnavKogt3hy2hfS0qo6q8+L7cN
	 EBH3kGkErEL7PV48gC+OnabBcEyL+6dXMiiBRYx2ys87yJjeq4VCjC1dcLFwmZ7wja
	 3SBpj140XWPmNXI9iHBfI6gLbONttj0MgCONGQOXYoaBPEedc4sz5SZ2YJp4AjBhNs
	 wbrUuOgQ1wMY80rJWeM0GgGWUSxYzbgqHN5SFTI1meRab4lURyD0ppqdgWVsZoEimP
	 aUSDr8yEkp5bU3ZKUnDoFava3Q+Gf/LO6RziV/5/E++P7fAMcGF0um9C5VP7YoHNDC
	 tAxYBPfodmE7g==
Date: Fri, 19 Apr 2024 08:52:49 +0300
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Adam Ford <aford173@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>, Andrew Davis <afd@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	Carl Philipp Klemm <philipp@uvos.xyz>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Merlijn Wajer <merlijn@wizzup.org>, Nishanth Menon <nm@ti.com>,
	Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	"Sicelo A. Mhlongo" <absicsz@gmail.com>,
	Tero Kristo <kristo@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Vignesh R <vigneshr@ti.com>
Subject: Adding more mach-omap2 maintainers
Message-ID: <20240419055249.GE5156@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I want to add some more maintainers for omaps to ensure continued support.
There are many generations of omaps, and having multiple maintainers allows
us to split the work. The earlier split by category to things like PM,
clocks, and SoC core interconnect hwmod/ti-sysc no longer exactly current
as the work has been completed, and people have moved on.

TI is naturally mainly interested in their active parts am3, am4 and dra7.
Additionally, the community folks are interested in maintaining also some
of the older devices, mostly based on omap3 and omap4.

So I'd like to add two maintainers from TI, and two community maintainers.
This allows both the TI and community maintainers take turns with the
merge windows and chasing down regressions.

I've started working full time at Intel and will be stepping back. I'll
be still around here and there too as a hobbyist maintainer tinkering
with some mobile devices I use :)

Over the past week, I've privately asked some folks who I trust to help.
I started with people who have been active recently related to omap
touching SoC devices.

From folks working on TI SoCs, I'd like to have Andrew Davis and
Roger Quardos to join. They both have a long history on working on omap
based devices, and are actively working on the SoC devices that are used
both for omaps and the new K3 SoCs. Kevin Hilman might be also able to
help a bit on some related Linux generic issues.

From the community side, I'd like to have Aaro Koskinen and Andreas Kemnade
to join. Both Aaro and Andreas have been working on multiple mainline
supported omap devices such as n900 and gta04.

I'd assume we get the final list sorted out over next week or so and then
I'll send a patch for the MAINTAINERS file. I've tried to Cc a bunch of
folks who have been involved, but probably missed lots of folks who have
been involved, so please add to Cc as needed.

Regards,

Tony

