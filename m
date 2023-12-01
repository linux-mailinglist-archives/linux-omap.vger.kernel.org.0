Return-Path: <linux-omap+bounces-82-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E53800454
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 08:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 739211C20B5F
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 07:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65951173E;
	Fri,  1 Dec 2023 07:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="CwGaHDPb"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA64D1729;
	Thu, 30 Nov 2023 23:06:10 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 5494060476;
	Fri,  1 Dec 2023 07:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701414370;
	bh=RXpbKQwq6L7Fxm/0BkFGv54CyvhTReyPPdkffpuvbsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwGaHDPbV2JUMhJAKfc8j7Oy8P/WEbo+xFfr15UKt2im8yKC2LOjQMJCewDqx96jE
	 aSpg2thl/1PEa9AAgZ3zAxGK7PamGvw8cf4LGwEvS9y8pz32Pq9V7R0r8b/JvY3onO
	 hL6fD6K/kf1NYVkvcgzntGzcqcsGH7plpBC1P0chyvE6IuaS6seg05FMm1yy7U3xVh
	 kDAIW+LTJ/xqEvT34t5Q3LW1enGtJuC1kx9Msk2qc+/27leT2CBwMKeLItMVLfNd4I
	 gqu3P9kcEH/z9f6T+MXXZ+3O/pNw6AFdQf0lk+BbDJBF38evhqGzPSl6ZxZSrbOAHe
	 5hLhE3He+9HYg==
Date: Fri, 1 Dec 2023 09:05:51 +0200
From: Tony Lindgren <tony@atomide.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: debug: reuse the config DEBUG_OMAP2UART{1,2} for
 OMAP{3,4,5}
Message-ID: <20231201070551.GJ5169@atomide.com>
References: <20231025112136.3445-1-lukas.bulwahn@gmail.com>
 <20231201070207.GI5169@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201070207.GI5169@atomide.com>

* Tony Lindgren <tony@atomide.com> [231201 09:02]:
> * Lukas Bulwahn <lukas.bulwahn@gmail.com> [231025 14:21]:
> > Simply reuse the config DEBUG_OMAP2UART{1,2}; there is no need to define
> > separate config symbols for OMAP{3,4,5}. So, just delete the dead
> > references to DEBUG_OMAP{3,4,5}UART{1,2}.
> 
> Thanks applying into omap-for-v6.8/debug.

It's been already applied by Arnd, no need to do anything :)

Regards,

Tony

