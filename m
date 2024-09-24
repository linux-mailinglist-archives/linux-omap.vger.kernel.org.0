Return-Path: <linux-omap+bounces-2242-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E50F1984A4B
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 19:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 868CCB23371
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2024 17:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3D11AC428;
	Tue, 24 Sep 2024 17:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="UUeEnJsB"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E884A2E419;
	Tue, 24 Sep 2024 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727198958; cv=none; b=Aqabs4XOAOUqPhN9X2468k0nxZwtm9d/ZZ9xJkvtiLaTJ4n9iTiP1zAEj/TFcZANXTAnbBB+3+mndI5DtbGqMgEpPvZeQr0Z0fg1rITv0nyPXfT/cRpRVTuNoboNlZXyuM3SrARUQt7NhFny0TIldEL3BfN/I7QmuJChC3ZNKI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727198958; c=relaxed/simple;
	bh=1MiYoJ352dg3Tzl7QgwgHf+oqQEjGcjapxsqge4jKa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqW2+xrtTzKYoGQooIxH/mJWkqoK1uV4CS7gfWuI0TkBAL9Zvy3PTgAFF8LfCC2qrlWEemE+FbvMt0AChLx2O+gaEE7xVljcVJCVWDw04YSuSDV83JdFC6o0UCH0uPa0BJSLC0Qr3p9nUcqLxs+9wKfeEWmu1J1XBRlmvz7NR+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=UUeEnJsB; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 1691360365;
	Tue, 24 Sep 2024 17:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1727198382;
	bh=1MiYoJ352dg3Tzl7QgwgHf+oqQEjGcjapxsqge4jKa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UUeEnJsBUUxBeUugiL01ollULfa2nuiEOuB3MOfG0KNkVBZd1Rk5Eqd+++BsNjAzK
	 E7TpHF9D4pkvN33n+CVhTDl6W78CCed4PugJJvC314O0UNhRsfxSBkXBnW6GeH/uWr
	 4BYp+EdX2bmqvboL4Ge26U4awQsntz8Er8VkfvrowpOeFDD53SCgCpUvTh7IJR6AaY
	 EN2mKxyRRVB4NlmwkAZMuoZN7+njzB5y9uZ5VmbDK+H51RjoM1oszreUH9017jGr73
	 RhXCBaAVY9W1RnBGnNgqC2k0tc2za24mWYTOP+lO9+2Cbj7J8Zcbagx74ZbE4WRYq/
	 NegJ8D0gzGBdQ==
Date: Tue, 24 Sep 2024 20:19:26 +0300
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] MAINTAINERS: sync omap devicetree maintainers with omap
 platform
Message-ID: <20240924171926.GA5102@atomide.com>
References: <20240915195321.1071967-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240915195321.1071967-1-andreas@kemnade.info>

* Andreas Kemnade <andreas@kemnade.info> [240915 19:53]:
> Both used to go through Tony's branches, so lets keep things together.
> This was missed at the time when Co-Maintainers were added.

Acked-by: Tony Lindgren <tony@atomide.com>

