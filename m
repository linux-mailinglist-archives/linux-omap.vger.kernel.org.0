Return-Path: <linux-omap+bounces-1644-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247F291E513
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 18:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4888C1C2216E
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 16:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B14516DC3C;
	Mon,  1 Jul 2024 16:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZj4cOGS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0423716DC39
	for <linux-omap@vger.kernel.org>; Mon,  1 Jul 2024 16:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719850462; cv=none; b=btzQaTGHjj7bN8Ph9+n3EXFg6S1Z4Yfr1uJu0lcNWO8ER8rKScwa01m0OJfjB1bgqwPAyrMisprhO23ZFqzYYevs6J3lZuTsKBk+eGnTzkqyYbxkb4nglMJuV60i1E9DMGIjL8Lba1uMfwL6HKSj+B375nvD4won248XqIVJgt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719850462; c=relaxed/simple;
	bh=0RU0GQGcEkH75BsHRkr45z+TTTqgKiPUKJEo3MLeH8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbo2ksRbyn+JozfpBkjnnN/ZzC5bV6CkXlrZaXM/IxzHRd2tI1YqB+hFW9CzONw3RdhkamErTOM4ebPBoDU/E3WDCj/AlU6+ETlaa00VOASbRG72J1cW6j/oprb+ns394cwKxu2SLU/KVYEih9amxR4gM7AibiAHPo1v1/OASd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZj4cOGS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-424ad991c1cso28991025e9.1
        for <linux-omap@vger.kernel.org>; Mon, 01 Jul 2024 09:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719850459; x=1720455259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qFC/haLZ9KzQj+xaIDgmhhZVWM9GxdpG2nMd31da2xM=;
        b=yZj4cOGSzAyUtDGChoHBtg6/IZy0RzhHD20ryD8yGabS2YaCfRNT8wilMvLrcmh/m4
         HGeITs6/ylht3qy9DipkZwfl4ruF52BNsYlw8HvPSD/U5Idp/Zni8oUC7yYwynpKe/AW
         5arKwsuMvi4Z7jY05G2d3MZKC0QK1l7HLZ0t4oa1IWeBG7rYnQaXqLZiCXisG+qt+xrT
         FzVmT4m9cS2e5i9HAaDBJBq91crpibDXcPoQdBfmiKGYUWMr0kNcumCM0e+YkOMvdjpn
         5DSHXuSXID1uAVr6vbAlPYkM5So9YYAQoGMBOnsoylKyKUdV9qu8iYMM3umKfBIaope/
         Oj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719850459; x=1720455259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFC/haLZ9KzQj+xaIDgmhhZVWM9GxdpG2nMd31da2xM=;
        b=hTfoPvPbe0zgPPmjDHhJh1WXJXVf7y0e66HpwPqHIP4hMXbIIqXOC0qc4TO3wO+HoL
         A0q7xL8grMvErR/KEFrVgMXIbBil70H2Hn1KdIYXFuD8Xd7qstOrzSZXJGHCLAsd8tns
         xj1VH3yvxAOa7rU5QXeglZVYWw1Hd/QNIZ/IyeMKEt4hvA49U4Q47BAbNCqnmnQBh+rl
         2WOXWbNEDtT3n6ohFI9v50Rxza68JqpaNZzFOL8cI03RnJV1j9lOTMrY/1UVPXVFwXrz
         vkVbz9zDLKahP1foeKscy1u9rbayhX2wgdrlNCmAFtIO+Cg32e8hCFbTEbzv2WwpZoBY
         e12w==
X-Forwarded-Encrypted: i=1; AJvYcCWh3Mj8CyjCLbITCcBneUpmHHSASWes5HkJJdY4v0U0KZy+r4+mlFpi9EoIfwphF9S51A+Myt0kwiO8CqjPXoWMSBasQ4DSYsux+Q==
X-Gm-Message-State: AOJu0Yxlo80tyB8NYQToc1Q/jaXGxa5cS8d882xlP2I+Rg6l3I3+/X7h
	+OjLzf+9Wg3jh23Q9MLr99RRjetGuqC59JCuh9U+Rs+N4bemGAwaZ9pQfTWq8Xw=
X-Google-Smtp-Source: AGHT+IGRrPzTXHiPkwd8Me5LrECNfH4SPW4Xfceuvlm6k2ecNUC83zwkdEYq2h00D81su32yvfY2Qg==
X-Received: by 2002:a05:600c:1c21:b0:424:addc:c7ae with SMTP id 5b1f17b1804b1-4257a02041emr46524535e9.28.1719850459405;
        Mon, 01 Jul 2024 09:14:19 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b09a2bcsm158762215e9.36.2024.07.01.09.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 09:14:19 -0700 (PDT)
Message-ID: <07b701a9-7b52-45b7-8dba-1c25d77cbf15@linaro.org>
Date: Mon, 1 Jul 2024 17:14:14 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] mtd: devices: add AT24 eeprom support
To: Marco Felsch <m.felsch@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Tony Lindgren <tony@atomide.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 loongarch@lists.linux.dev
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-4-3fd5f4a193cc@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/1/24 2:53 PM, Marco Felsch wrote:
> EEPROMs can become quite large nowadays (>=64K). Exposing such devices
> as single device isn't always sufficient. There may be partitions which
> require different access permissions. Also write access always need to
> to verify the offset.
> 
> Port the current misc/eeprom/at24.c driver to the MTD framework since
> EEPROMs are memory-technology devices and the framework already supports

I was under the impression that MTD devices are tightly coupled by erase
blocks. But then we see MTD_NO_ERASE, so what are MTD devices after all?

> partitioning. This allow using of-paritions like we do for SPI-NOR
> devices already:

