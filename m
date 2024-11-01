Return-Path: <linux-omap+bounces-2558-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F26259B9359
	for <lists+linux-omap@lfdr.de>; Fri,  1 Nov 2024 15:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 780B01F21F76
	for <lists+linux-omap@lfdr.de>; Fri,  1 Nov 2024 14:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00C11A0721;
	Fri,  1 Nov 2024 14:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sXVFBJVd"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED4F1537C3
	for <linux-omap@vger.kernel.org>; Fri,  1 Nov 2024 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471705; cv=none; b=PSqh/IozE1JsToyd+m7YzD08rrauhIQVS6r7+6itClP4xcZOysY0FIF37fot+T1ITc2abHPsxJkWsJbMA9WV1+OaJvpu2fdCEWFgTHolBTiW3ISufmmrkd/WyahJiGk9JrFLi2pHbgbpxGDiSptcTdx6eC0t4gshFtOxYul9HIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471705; c=relaxed/simple;
	bh=5MkgnYa7nbyT09WkWRkcPszpg02pG9LGzFDdJr0Wv18=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uic8ii/ln9GB/CDuLqzGJSZypgoUaBrPkUKM9hRQBUIsi3lEvk1VDWA4dpvnE1BJU0L+M/X9fmFMZvqYxXt+w6yPKqqFw/BbzAM9wvNZIELrsfeLrwjuBpgqp3htKhdNWhuQpCHJq3ttzPvosCG4Uo0qGw66A61z6JgnWUXWFHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sXVFBJVd; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20cb47387ceso20879125ad.1
        for <linux-omap@vger.kernel.org>; Fri, 01 Nov 2024 07:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730471702; x=1731076502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pVFDp9Yc69yxhK1p5h/wUmlxxyNXM5NYYA7bPBW8vs=;
        b=sXVFBJVd2KXoa0Jh7xyQwzsBxikSpeYaYV4tdLf2O8gafN+vZcgFH6xAVT/ouUsmCb
         Z+AWuovxX6d5noJdeppxRwq1bhcEiUN8FhHNyLyWFRFnyrQpFMjSZ7eSg5L6ZB1yKFFN
         WuKBDKORj/oaYgCcC6O+u6fV76F8lH7/zi22Wc1HTf7DB4zjF4v84CLBJiRo/plKZMtv
         ZHbG1FuV193jrTNeJznnvsJ2Q9AiqGbjAUVqEzm0C4v4HhSTyhBX4bQGRvP7dDmM/RVi
         u+7Iiy7oYi9zBoj68Cm5JiHNPGLg24GwYy+BuD6JuHJ787h6V0G6u7Lqu/L+OgpmkrDm
         Dp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471702; x=1731076502;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pVFDp9Yc69yxhK1p5h/wUmlxxyNXM5NYYA7bPBW8vs=;
        b=krz8Oh40YO9+8/f7Fr8nnNjewvh3eMbtP2tCb3jvOusxZW5Vttncs9vtSCoy4780Ln
         EfMdsBeneBdJCaHyL4zeye43gk1cDbTnXYhAU/IQ43c+utX9cz4iqU3TSz/rfoiRLp4e
         IL99LKcO4FQRz7ExnToX3PE4KUjwfAz1bS7jDfMWNEq9javxdkyo4NCvdmzsJPrT75Dw
         scl+JX8WiB3J/D41J5E+UO6vjfNOTt+82O50ZRzfAWEsuTnUrTAloeAARaaegCEpL3Rg
         D9WVLpOG+7zxFmcUs75sjvqiMwNS5r5X1/5Q93dsBvuaAb4xp5kAx8I9NErXyiYWM4QO
         6r+A==
X-Gm-Message-State: AOJu0Yx1VCWNDkss6tiQ4YWxBmL+H5VNJ/Uzb+RGBBGY81rTqe1S4jrx
	hQVofX1PQ3QKwLsnFBY72S4tHa+nZzI0OM2YSubiLZ7m6ghcZcudt3f4Rt376e0=
X-Google-Smtp-Source: AGHT+IHuiSC+nJyf6UEsVwUesuZOzMUK/1h8I/9z0D1Xub/LgUG9eT3uVjO+sjDT1UDFpuBCq5x4/w==
X-Received: by 2002:a17:903:22c5:b0:20c:d18c:1704 with SMTP id d9443c01a7336-210c68c6f57mr306749745ad.23.1730471701962;
        Fri, 01 Nov 2024 07:35:01 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2110570a1dfsm22250725ad.108.2024.11.01.07.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:35:01 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Roger Quadros <rogerq@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>, Robert Nelson
 <robertcnelson@gmail.com>, Colin Foster <colin.foster@in-advantage.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: am335x-bone-common: Increase MDIO reset
 deassert delay to 50ms
In-Reply-To: <c3c60bcb-186e-462d-aedb-ab90d52a58bd@kernel.org>
References: <9002a58daa1b2983f39815b748ee9d2f8dcc4829.1730366936.git.geert+renesas@glider.be>
 <c3c60bcb-186e-462d-aedb-ab90d52a58bd@kernel.org>
Date: Fri, 01 Nov 2024 07:35:01 -0700
Message-ID: <7h34kbowdm.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Roger Quadros <rogerq@kernel.org> writes:

> On 31/10/2024 11:29, Geert Uytterhoeven wrote:
>> Commit b9bf5612610aa7e3 ("ARM: dts: am335x-bone-common: Increase MDIO
>> reset deassert time") already increased the MDIO reset deassert delay
>> from 6.5 to 13 ms, but this may still cause Ethernet PHY probe failures:
>>=20
>>     SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC LAN871=
0/LAN8720 failed with error -5
>>=20
>> On BeagleBone Black Rev. C3, ETH_RESETn is controlled by an open-drain
>> AND gate.  It is pulled high by a 10K resistor, and has a 4.7=C2=B5F
>> capacitor to ground, giving an RC time constant of 47ms.  As it takes
>> 0.7RC to charge the capacitor above the threshold voltage of a CMOS
>> input (VDD/2), the delay should be at least 33ms.  Considering the
>> typical tolerance of 20% on capacitors, 40ms would be safer.  Add an
>> additional safety margin and settle for 50ms.
>>=20
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

