Return-Path: <linux-omap+bounces-81-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F39800442
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 08:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5C76B2124C
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 07:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445A91172F;
	Fri,  1 Dec 2023 07:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="RWrBD8D4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152F21725;
	Thu, 30 Nov 2023 23:02:27 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 9CAB36032E;
	Fri,  1 Dec 2023 07:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701414146;
	bh=T8JMiYZNsTJUoKXUtVyfyVWVbi2lERt92r3CrXZczEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWrBD8D4Wn/H8eg46GPJijn8NrOiUogrLvyhwt6MGVWraVexd/b1Rz8d8Iv7AEHLp
	 mJ4SJ/+1eiUrqDasiruVR/TQiaf3X0Szq7LC/xw9ymIX//JjAYCUPJddzqCqVdDDKl
	 87YYbaZNzemSW0GfGTacF/JRXqLWEa23aW/SeU1TapuiwUDq1D4d5jjZJlEzav4GQz
	 4cJ0Np27jEJCSVyHUbexC9vCa0QEaISeKNcl8yF3eOuZSRWIpzPuhL4Ltn4VbYLVpp
	 eOHM90yiYKtYvsRq7/BOzkVhtfQRHTLDPQtF5/hjZp9bJcRhSxTosAyKWPVs3T/Zrh
	 8HBVXwX9oSTgw==
Date: Fri, 1 Dec 2023 09:02:07 +0200
From: Tony Lindgren <tony@atomide.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: debug: reuse the config DEBUG_OMAP2UART{1,2} for
 OMAP{3,4,5}
Message-ID: <20231201070207.GI5169@atomide.com>
References: <20231025112136.3445-1-lukas.bulwahn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025112136.3445-1-lukas.bulwahn@gmail.com>

* Lukas Bulwahn <lukas.bulwahn@gmail.com> [231025 14:21]:
> Simply reuse the config DEBUG_OMAP2UART{1,2}; there is no need to define
> separate config symbols for OMAP{3,4,5}. So, just delete the dead
> references to DEBUG_OMAP{3,4,5}UART{1,2}.

Thanks applying into omap-for-v6.8/debug.

Tony

