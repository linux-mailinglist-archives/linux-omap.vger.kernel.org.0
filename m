Return-Path: <linux-omap+bounces-4770-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EF1C09E7A
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 20:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 755841B243EA
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 18:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B7E3016E1;
	Sat, 25 Oct 2025 18:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCVvP8HZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEF82C11D4
	for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 18:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761417810; cv=none; b=o5pyS6zdoT0wU9lArBXR9TrwQa6i2bERMohdPGVM8+4hjK1gFxgXR41Z3pMAjLzdegspMzBQ6XIY720jdYkSzYzPrBy1zgGV84NBzDfzByZzhal8PqDxM5rfQpe7qjjcyX0mi+p46OOHEs5292crb0Ed6Wrogcl6mc69Mzf610c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761417810; c=relaxed/simple;
	bh=dxk8GxWYmXoS/kR/2B6MJ5d695nLp/wTtHjmfAoCuxk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wut8psQ7AdzuOYMrBMVdebpK/K0OJBgq3KCzHTa62LutzEXpHiPRWQbPbyZeZEVzuYII18bDzsdMxTbOd5x1akezs9uks3zF3SX8vnnH8nlvgfZvH0tZker9EBrmazvEZnlaFPK5pHnMlF0AjCQlLVojSgsqnEuLUZb4cbBRn0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCVvP8HZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-427091cd4fdso1896421f8f.1
        for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761417807; x=1762022607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CWNok4IQiL53qK04RvlXuFVO8RcguXVZm8vK7lpoxs4=;
        b=cCVvP8HZ5rGuA3p8pjDknDdg/4DI8nBsbEqQ/7YgZJjdrcssnyHwzFuf/7Nbpn4ku3
         x4D7PL0lpNpUdNbmkwyJgu0uawtY1I4ps42/1NEy+MAB/ZrW1j6xAGCrcl5HpsMOifH/
         UKB2fNmQtzWdaxQ89tzw+XitBZH3k7lcwP4/VEo3OqD+h7nbvxVbptdMcicXx/i1dnNO
         iSpGNqXz/G6S/0mVfG5CBZ2tSe1+m45ShJ0kGlOzh2o1VkAoAlRAF60CwYv8GanfJTeu
         eAI06n3YolpKeNqySC4K/g4Ydx4b7jOIr/mCr0JErIUYNgKBWiSf/+etewOA7aZz9tK1
         ta3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761417807; x=1762022607;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWNok4IQiL53qK04RvlXuFVO8RcguXVZm8vK7lpoxs4=;
        b=Zf7bT3B6JCjpBySbTzDv1Vbh7wGVWkXZHr1bd8OyULPVO9e187BqAtQ7dRi2HGoQvx
         pnJRaX42NgSeDCbLLpaIlPU17l/5BRsKBtXqPjV4ahz3wmvl35ZWomDjHc6O2ipLbIIV
         j18FWLtX7yZ+kTEHkX1uDjSMzyL8I6yKOTTedYyJSChQwBppt+U+FBdmF+pp1CdEOKMz
         88c8DlsSxri3snABbScNPru9PyCPMHDw/9doX+Rbp+kem8GiUGFIrvXe+nD9l4kekZgx
         iaY4Vylc1+6V47kK24EUvkL9yMVcAMNz7nN3KcN/b8QIgCTUEFWPjgnFkJ86AfA/82D7
         bRiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf8PgvCT7VDJzB8mUmAMxrktsamos4+ufeohZTYyrzrB+ynXV7d5JXDAstJCM8xNQaIcJQT1p4KrnK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy6hH+a2aqignZgxR2RFYj6i2MGD+jLDx/ZoAzqq1QdxiBdOTn
	z/KpatreQKi86pBPUkKeJkV0Bz1hL3zqHmrjTIyLlWvXiUqp/S8jFCVY
X-Gm-Gg: ASbGncsc0kMLP7kxWghNaaAt/reoAdxNouewXVH/dlZ2aSD+TQGNOiq0MT1zWlxeaIi
	DqKwgW+SgrYb9A/U2aOanBJP4cvbWckzW/3+jHuoJ5Yv25vDkIiKKA+Cr8IUydSPwJx7y4HBbjf
	KRq4TLR2F2Qin49nuODXKHbHCKc5R5pt+VYeVTgN/7qj5JRXKwhLqY7TVy4uS/CnxvpVs84SFka
	h0+M5lRhQ0rLN6JxPbaDgsGjdjoHe8CWE3odrUDkXsvVwLbYKXC2bcL2ZCYi7VJGZ4NW9s+UyA5
	SdsL3pbiFZWZjEBRT6U+cdtDwCSJNKErz7ChHXa/IXYWi/JG+SBTeCy2PSSWhxi2nJ5ygGvwTG9
	3zm0Q+EsZvXJTAqiXh6J5+p3LDdf1O8JRgY0n5Wbj2iI2ji6kBd9GT9Gx95XejxA6IGkZEOqaNz
	S44yugiqTUxVqpWAhKe9nB2wQ3oYJqujlLGeDgLcLIq2S0YZHZpLUDpDKlG0ubFZmgkdBLzZjyf
	54IfhqcLnbDdQLFfJvSij1C98PdBMxyvQ9/tGZTf4/F/b0yJ4gM1w==
X-Google-Smtp-Source: AGHT+IFk7dWmaGE9WDxnUoXGPQ/MaTOVi43Jwup+53sRtb28ew+/Wwb+XiqmvooubqMbrhcWmLx9dA==
X-Received: by 2002:a05:6000:645:b0:429:8b94:b8d6 with SMTP id ffacd0b85a97d-4298b94bd76mr6021211f8f.57.1761417806671;
        Sat, 25 Oct 2025 11:43:26 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm5006487f8f.38.2025.10.25.11.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:43:25 -0700 (PDT)
Message-ID: <7eb1a046-aa14-4874-b03c-361ac6f8ffa7@gmail.com>
Date: Sat, 25 Oct 2025 20:43:24 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 0/4] net: phy: add iterator
 mdiobus_for_each_phy
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
References: <9c6aeec5-f651-4cf0-8cca-d2455048e89e@gmail.com>
Content-Language: en-US
In-Reply-To: <9c6aeec5-f651-4cf0-8cca-d2455048e89e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/24/2025 10:20 PM, Heiner Kallweit wrote:
> Add and use an iterator for all PHY's on a MII bus, and phy_find_next()
> as a prerequisite.
> 
> v2:
> - rename iterator to mdiobus_for_each_phy
> 
> Heiner Kallweit (4):
>   net: phy: add iterator mdiobus_for_each_phy
>   net: fec: use new iterator mdiobus_for_each_phy
>   net: davinci_mdio: use new iterator mdiobus_for_each_phy
>   net: phy: use new iterator mdiobus_for_each_phy in
>     mdiobus_prevent_c45_scan
> 
>  drivers/net/ethernet/freescale/fec_main.c |  8 ++------
>  drivers/net/ethernet/ti/davinci_mdio.c    | 14 +++++---------
>  drivers/net/phy/mdio_bus_provider.c       | 13 ++++---------
>  drivers/net/phy/phy_device.c              | 14 +++++++-------
>  include/linux/phy.h                       | 11 ++++++++++-
>  5 files changed, 28 insertions(+), 32 deletions(-)
> 
CI complains about a missing return value description in kdoc.
I'll send a v3.

