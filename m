Return-Path: <linux-omap+bounces-73-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AFA7FEE81
	for <lists+linux-omap@lfdr.de>; Thu, 30 Nov 2023 13:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 018BBB20DA9
	for <lists+linux-omap@lfdr.de>; Thu, 30 Nov 2023 12:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AB74503C;
	Thu, 30 Nov 2023 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="uWAXf+L0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181F8D40;
	Thu, 30 Nov 2023 04:03:53 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 9265660513;
	Thu, 30 Nov 2023 12:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701345832;
	bh=ZB+5YYefmO6mtWWWUgT4TJQgoKAu1WOumvl/X7BvrBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uWAXf+L0fZHwcUkdeXJ6TRA8x43D22SAkOSHBWlh89dXu1bUme9JHQl9PzlKynOSP
	 jgi0KRketGm1OXD8U2e5Q/bkjBgQ4lYicWaJ+6an3FPbY/uXBaHKepdfxqTgbi48w8
	 Gr6I2xBkyRDOKOvt4BbKDh8sGMioP0ApjlJLNQKXblGD+UNZtlSWJ4jQb62Jvk92bD
	 9OLjFQA5oZUtjtbOmAXyJ1Ziqo+INeoFm+ET0w8I770+O+0GJ9rKUG8RrWKcq5Jm74
	 sE4KmR1NA3PMrInIOuLEvx851tSthWF6VjG9C9wgkehqeOXHkTGUpDb2PoJvwcoAHM
	 6cT5uwfm1gl7w==
Date: Thu, 30 Nov 2023 14:03:22 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, bcousson@baylibre.com, mturquette@baylibre.com,
	sboyd@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 5/5] ARM: dts: omap4-embt2ws: enable 32K clock on WLAN
Message-ID: <20231130120322.GC5169@atomide.com>
References: <20230916100515.1650336-1-andreas@kemnade.info>
 <20230916100515.1650336-6-andreas@kemnade.info>
 <20231007065330.GP34982@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007065330.GP34982@atomide.com>

* Tony Lindgren <tony@atomide.com> [231007 06:53]:
> * Andreas Kemnade <andreas@kemnade.info> [230916 13:05]:
> > WLAN did only work if clock was left enabled by the original system,
> > so make it fully enable the needed resources itself.
> 
> Seems applying this dts change before the clock patch is applied
> would break wlan so please let me know when this is safe to apply.

Applying into omap-for-v6.8/dt thanks.

Tony

