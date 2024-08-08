Return-Path: <linux-omap+bounces-1880-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAAD94C70C
	for <lists+linux-omap@lfdr.de>; Fri,  9 Aug 2024 00:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 440FDB2359B
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2024 22:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FF315EFAE;
	Thu,  8 Aug 2024 22:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1L0ZSaVt"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE1A156887
	for <linux-omap@vger.kernel.org>; Thu,  8 Aug 2024 22:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723156832; cv=none; b=eOnpTCeVS6DPnl3qMhRD/hCM6kEUOzGFoKhRIQSav4fB3NqvB0s2nH4XCOm0vhwOs2PtWq/YdI72l5DlFpQ2oZZto2lbjoeCMV6TvCtlSrrENtuF07s03cVWR3F9M2IjyjS9tzkHn/5y+6WEiTYOhKxHamzUNMwpDMGkTuNjWgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723156832; c=relaxed/simple;
	bh=7/Yd8Now2RzaC2ZgU+e9VQMlAhXQP/Qjwowv4hiEQSU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uj5/qjiIHJYLOf668f+/RWf4c4TgVCf2NuO9zGpPiAURDfty0UlGa2Y7JYxagC62pZrpPTMGwVGSqGdxMWibxTuN2hCyyEgC75xFrzv0QL1lRbNSfdSmlx1IVY2mqE9ZET64JDJcDwnq0VYIeo4a7MJyLlTUrWRv8OJvIi28YKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1L0ZSaVt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc4fcbb131so11590405ad.3
        for <linux-omap@vger.kernel.org>; Thu, 08 Aug 2024 15:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723156829; x=1723761629; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnFFKslAyQCvTlzcAGgFXS35aWJRluBhjxEK1S5MBPE=;
        b=1L0ZSaVtrhfAxqmgFoX/SaX84/InIEcAQbcWyRhvvzxvQYyQHyx7ccst501jnMEjt/
         nUtfmSxqHPc4j7FQyygEzZ1vhTwOBsnT7kbzz3DGZQRyaLrNgZXZnNAbKj72jwOyGMaS
         q9+o3atrqE1RcUy+k1pl++gsDnKIuOUomT7NRLflsWjLLN626OvABh/zb01UsOGSmAf2
         uk9JTxTp/5qCBYivpJAKiT1gdKdUGQTxjxliGAMx8WxI5l8NzfYhCtuqj37FecTSuHXa
         tU85TrFJaXou51bFrRUl00BX47IQG1i1hFl0oBfofD9ZCfSjYIvW84ozdu8A880PoR8Q
         UJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723156829; x=1723761629;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnFFKslAyQCvTlzcAGgFXS35aWJRluBhjxEK1S5MBPE=;
        b=F8ReUwN0w9VFaEVhdNpjGqsAxdcjmXsxS34dKCC1KU071lc3F1vU7O0ypeV+ShPobx
         1QgL08rS8j9o0Nphu+PuXSQf89MCQh9eK3dV2yi9rKjPa8C51fkV4tJ42hX9Hp7hV/44
         u0R2611tZbLGHE/pPD5FoG9YLcwt/xFP3hBSvbMBcQ85jkJtJSMLiFIKE+G43fzfDDkT
         wsnpRVqODB5cy9CX8sF+QP5o/vMYJGm/8WHiOZaMmBbFd1nVl/e8AvsWpOthBsjpib0T
         3wuXmh+aEnq5oRgY6hu6aRik8Mgp0zNXyaMNo/AlN+P5k3QA/0pyGdSQuwlM9C25eWe1
         0q6g==
X-Forwarded-Encrypted: i=1; AJvYcCVFxKdWt9sNiPikOyybUgfhsVxBReL1Kmh26NJj8yq71fTVmbC8rS3UgfmFHs94hxr1tn7Ae/2JYaiKUTFQwkNqM8e4/9a8ilPn4A==
X-Gm-Message-State: AOJu0YxHNg2U0hlpJStEtHHuawGo8DcWL2c7UaM1qE6ff8ZOjgQ6uMTl
	x8qkIydhg94s1p0iAY9HrPJnbOMWE7XLHya8A4dD/Wu1m9W7P0dyQJpUEv4GDy0=
X-Google-Smtp-Source: AGHT+IFuozGVpD2S8JcbyZGe128XhqnFMQbDl0tXLzyrxRy3snyF4waOTyuxeRGS6PqrGLYA3KLmIg==
X-Received: by 2002:a17:903:228c:b0:1ff:4d4f:d819 with SMTP id d9443c01a7336-200952633e7mr47633515ad.34.1723156829035;
        Thu, 08 Aug 2024 15:40:29 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200668fc398sm85768725ad.207.2024.08.08.15.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 15:40:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, soc@kernel.org, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Dinh Nguyen <dinguyen@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Mark Jackson <mpfj@newflow.co.uk>, Tony Lindgren
 <tony@atomide.com>, Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, imx@lists.linux.dev, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Fix undocumented LM75 compatible nodes
In-Reply-To: <20240808164941.1407327-1-robh@kernel.org>
References: <20240808164941.1407327-1-robh@kernel.org>
Date: Thu, 08 Aug 2024 15:40:27 -0700
Message-ID: <7hcymir63o.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Rob Herring (Arm)" <robh@kernel.org> writes:

> "lm75" without any vendor is undocumented. It works with the Linux
> kernel since the I2C subsystem will do matches of the compatible string
> without a vendor prefix to the i2c_device_id and/or driver name.
>
> Mostly replace "lm75" with "national,lm75" as that's the original part
> vendor and the compatible which matches what "lm75" matched with. In a
> couple of cases the node name or compatible gives a clue to the actual
> part and vendor and a more specific compatible can be used. In these
> cases, it does change the variant the kernel picks.
>
> "nct75" is an OnSemi part which is compatible with TI TMP75C based on
> a comparison of the OnSemi NCT75 datasheet and configuration the Linux
> driver uses. Adding an OnSemi compatible would be an ABI change.
>
> "nxp,lm75" is most likely an NXP part. NXP makes a LM75A and LM75B.
> Both are 11-bit resolution and 100ms sample time, so "national,lm75b" is
> the closest match.
>
> While we're here, fix the node names to use the generic name
> "temperature-sensor".
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> SoC maintainers, Please take this directly.

[...]

>  arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  2 +-

For this one...

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

