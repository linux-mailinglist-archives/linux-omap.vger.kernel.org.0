Return-Path: <linux-omap+bounces-79-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FED80041F
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 07:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C823281598
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 06:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCEE111BC;
	Fri,  1 Dec 2023 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="L6+6NhpQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFBE210FD;
	Thu, 30 Nov 2023 22:49:04 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id A97AD60476;
	Fri,  1 Dec 2023 06:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701413344;
	bh=a77eqWj6N02PlXTg0SQW+aEQ3VVkxgGfzSwt//8DJg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6+6NhpQmsh0XbTjmPEIujU28e0tMnGk8/2a0mTEhbmKuJXm5bIHsXQfFupGcpj2g
	 tM+4uKaewsguRypyYUgVFXB0gHYcGrLJ5kX/ay4P+oNpNQtPsVKNNERTIuRpB7riTc
	 Z2r27FlpwwZmh0jaJPcXNAG7YVGYt/HFPcVRcffil0JJ97yYsoOF2RUhFLWatvoLI/
	 MZxEur2csAa8xyVneAstc7zJF1rHjZy+BoOiq73GaTNbkqzRBtgXDJL7XdU5HkI0Yh
	 m/xqQ0Y8eAzdVFHlgGKRQ4WqI+5i7QP84YHhCL+L0V82SPHrU3d8krOENDY0V3PmlX
	 IvhKcTP5OnCtw==
Date: Fri, 1 Dec 2023 08:48:52 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux@armlinux.org.uk, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap2plus_defconfig: enable I2C devcies of bt200
Message-ID: <20231201064852.GG5169@atomide.com>
References: <20231120215635.4187399-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120215635.4187399-1-andreas@kemnade.info>

* Andreas Kemnade <andreas@kemnade.info> [231120 23:56]:
> Enable all available I2C drivers needed for the Epson Moverio BT200,
> that are:
> - LED
> - Subdevs of the TWL6032 PMIC
> - IMU sensors

Applying into omap-for-v6.8/defconfig thanks.

Tony

