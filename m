Return-Path: <linux-omap+bounces-5332-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C425CF57DB
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 21:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 331E330E4690
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 20:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6154C33AD87;
	Mon,  5 Jan 2026 20:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ocZDw/Ng"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9B8241139
	for <linux-omap@vger.kernel.org>; Mon,  5 Jan 2026 20:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767644162; cv=none; b=Qoxkwi1VOYOvM/aA2UuGDXUMIcr3UHEcZUiNjg2X1NK7Cu78M7ZFdLmSjwAlavaAEj+m/tvG9VxADM4aUUt3tgJ/aPonwpkuFXtp7A+e5O05VadSXqI+5Bh4IQn23fx/P7GvcfYGfonBSmBcFVh4mHIgdvJrOz0fvgY0pJSI92c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767644162; c=relaxed/simple;
	bh=isx8tZ/KgDsBW8GX1w0daR0bqpms0d4lc8DbbBBJ5xg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KHlpyW2avnt9gU9xdVjtJa2zd6XcT8u4FH03PqtXqCEc/Q1DG3hBqzaqHD34pPJ9uDW/arYU63DyItJY6qD2QPrnkE0+twuInGu9zDklFucfWq3yn2v8CNXuA90jm8yWkhDvmJ/eGFvyLgHf4OCdc8qmhgcHzBOFSXvORchpwd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ocZDw/Ng; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a081c163b0so2818725ad.0
        for <linux-omap@vger.kernel.org>; Mon, 05 Jan 2026 12:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767644159; x=1768248959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNqPSklJFm7WommF1LrsVSvRrNDwiCgns7zSiqfr3I8=;
        b=ocZDw/NgxeZ+mwZXN9Zlk8d/RUNhNlQRi4MO7EC/4oiY4Sc2RXr2cDUje/Q9Vd0dpb
         qm+d+W22XFBJ4Zqck8/1wQ0CIL9VKkCi8eKGfsMJTA5YQDFYeu16i8H2xVfIcbxORIF1
         +6ikL3pCeP0Iv5rc+9RBaWISHXD9NvSzwVeOvDobgoYLqlNTrXldIZlfjzgV/56EssKv
         fQDPO6bmt5DI6sa94xxm7d9bNRbYhA3FPhn23AWqVhcT4NdbJjI4MVla76vp63dhXuOE
         WV4apl7t56dgLcvV3LtqocGnsun2qmLh0JALjFazPkYG6zPmh01SLnHOWWt6VmmIlK9B
         g6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767644159; x=1768248959;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wNqPSklJFm7WommF1LrsVSvRrNDwiCgns7zSiqfr3I8=;
        b=ZWwms4kBbYme0XlBA/SbDv5sYQ7pguH3oKzV25ugRLaJ969DDs8Uz4azkcefFuwwUr
         ogqxTCNAuNzC5O/B0gmIbt3krzIJu6mCKOqx4rUgAw2pBuiAF+EVeBBxrLQQtth1Mg/p
         Nn5yQqTGzkJYLKfzVLenjsutB0gClOpRzUkKum2pNa2ACaugf1+lNxwXOdnXjSmDHmak
         bODUzi9bv9BukSlactC64HAbid7/RporWZzZkl/4xZ1I5vZ8kVwFutU6xJzQ45Wlsvl2
         PRrzfwTs1nUp9pEnYy7eQypKTBO6Iz3Ilja+jErl2XsmtHz7R1G8yADZ7yjdl2lXn9Dj
         3DAg==
X-Forwarded-Encrypted: i=1; AJvYcCXwfAqw8gxlyP5MxM/OHeOYlNJheLKcX8xK4hfGq1ObamPUfctS5KaNJLoXLtFKTCaOOhKlqIFxlxma@vger.kernel.org
X-Gm-Message-State: AOJu0YyLZ21ClUGSill2BN+nJxGpsib6YCYEWFTovz0miIyO/UMTOmLh
	CIuFrkU+maxKbe69RX6hD2foDyz2khphSR/6SeNCrwDb5le6lNg70TXF/bZ9slv49dkcNKpC6wK
	3ddlRzHI=
X-Gm-Gg: AY/fxX632UpfMZhmt8G5rfr1UoGrxKt1IhSG2EjPWIGTYu1YmZ7Ojk/eUqt+eO88xgW
	eHzXkOno+4lebLcp7nYQmGOhHf5KQxFVn0MUvFViI7aFfhZd0jxedon4BcNQt6FfriCmY34VGOD
	UQuWdAfa74AbIgVDNzkORG8Q5yqD5x4aWzoq5qVkzytAk/nYEgy84qLu9OQGrq5jb1h7rmLOCr0
	rT+QaBjrjArfLb3Ea9Jq4nNnEGq+xIVINkJ1x8+lsrcneBt+DWQUgE2f0whGMUUfcNNZV0P6ejz
	IXHPHkWUTaiSh3+AmmKn9HnaIsnExpkoOqsXWT8wDsQMI+aVPROuR1zmQLaeKlTmZirGIsJDM5N
	6s82usyy8F8zuBWj6RRXP5xinVf+jJAdaY6/l7EP+BTX8PEKtT4OCezW4SO8kiXFhpQw9rDMC5H
	0z53ZNXNCA
X-Google-Smtp-Source: AGHT+IHfr8XE6k+bGYDQot7AdQMy9OZfkG//q2v3AUg+8RsnBdbZ9rEFP0yZYdIdt/G68wKJ/++tRQ==
X-Received: by 2002:a17:902:e74b:b0:2a1:3cd8:d2dc with SMTP id d9443c01a7336-2a3e2d44154mr7368205ad.57.1767644159531;
        Mon, 05 Jan 2026 12:15:59 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a311sm1028145ad.19.2026.01.05.12.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:15:58 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20251212203226.458694-6-robh@kernel.org>
References: <20251212203226.458694-6-robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: ti: Drop unused .dtsi
Message-Id: <176764415854.2561401.11477878819275792210.b4-ty@baylibre.com>
Date: Mon, 05 Jan 2026 12:15:58 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3


On Fri, 12 Dec 2025 14:32:12 -0600, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.
> 
> 

Applied, thanks!

[1/1] ARM: dts: ti: Drop unused .dtsi
      commit: 9da91ec4a6b22238d9178cbc5679467ea4261df3

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


