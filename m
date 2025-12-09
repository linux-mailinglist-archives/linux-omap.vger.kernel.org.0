Return-Path: <linux-omap+bounces-5132-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AC5CAEC6B
	for <lists+linux-omap@lfdr.de>; Tue, 09 Dec 2025 04:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECB1B3027CF3
	for <lists+linux-omap@lfdr.de>; Tue,  9 Dec 2025 03:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD872DF6E3;
	Tue,  9 Dec 2025 03:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HgCGdRc2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB9318D658
	for <linux-omap@vger.kernel.org>; Tue,  9 Dec 2025 03:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765249789; cv=none; b=RCppP7FUNKqBnE7rjSDLTyBgTQ3252RXfXXlIR7v9+tj85/ym6PVAxaqY3G1Lf3b4LvZ31vfLex1VlEz/193wknuqL3EVo3cfXeVc7JgDDy1Sg+FXtGDMMaPD2snPWiuMf3v9tq5cTmvq5Oh9E/GuZ8kWW8HWHatB52FP2jNvfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765249789; c=relaxed/simple;
	bh=j9T9qc8kv4Wu2R0NYry0ZY+FxQqLZIT+LQK8My5CDoE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MNZQ3XCGU78tEvHkzs6Or2ZPG1YRlBJdP2+f/KEIlUGGzjJ+xGY1weI64a7xDf0Arkpa597JH1hpDmVrVFMkJeBKcr3s3bQ9VFZ96nCvdij02YjPpvXTH2SGi9gk9tEd6w8SlovNKuVTl9mGaMOKonFaz0aDCjeT6uRwEQvgBr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HgCGdRc2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29555b384acso52725345ad.1
        for <linux-omap@vger.kernel.org>; Mon, 08 Dec 2025 19:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765249787; x=1765854587; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MTpghPmOCPM19OYgMgbGT5qXtYNK79xgvXC2Ue5PK3k=;
        b=HgCGdRc2d0z39IbfwMvEcrxUWaw5AjkywRLoDO90tRJHPO8zgmyUQ03AnYYYQ6FjHr
         Yc9O5k58cd3qARgGT+0Vtwc6FAsNZYJuZcOCS2sgJ8I3X2/OtnpayyXW7JS6tTaKMfRa
         2ZeUyd1/hsyM3tg7pfdwjM66F6Q9CAjPPUTKl8kq0rmEyAOAUhC/ruQqCs9K4rCsk7Ju
         b+O9sI0NMIMdkIN/eVF5OzcS+i5luyV95IzMYzU5sfW3eTIQDwkysBragsuImEmAAs4d
         f+/PJhGPay/miO2A5IFMOzBSzV5p7Wjw7zSTCeHCJraRREje+2SJmoYyCDeVUX1ZIIym
         c3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765249787; x=1765854587;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTpghPmOCPM19OYgMgbGT5qXtYNK79xgvXC2Ue5PK3k=;
        b=suN+pkcaJj3L4p6arJGHTK1X7g7rxVma1UV0+Hea3ZmxA32HFCPGNmvKnBftI19RrG
         UkxNqZdV/oMakwPQujWdpZNIAG8ZzeucPcq6HQ66Vl3u9nPK9Aa2xUmTIzejhfleBXw9
         YBdk+W/TMIxNNu2jyAyeyrUEFayxEPQhMA1uNe43HT6kVSoiJNCHcvN4XJCwNNF3fykK
         Ka7JSHSGabRcMBz8cEBt5Mz6sPPdUr4VwmQoWcyKvH7C1PPaonrbctcwjG02T5IXQqNs
         xyFD/CMJIH8RLwEwFrzXMawlcUwlLz5hzSPV7D9H2sNSZzC9AT0mbOeWtx2F50SSJIoh
         iSjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXADUT7yqlNU5nRSwQNU+J5agufInEkv6sWLIl5GP9VHvHxkPWG+oyDSekIYdOLdEWuIgrnKrs05dJt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4HYzp5aag5cozXOEQFjLX349xnqlPvnHZS89Hx8hW2u2/vsRu
	yDN3/Nltjo7+7BOa0e0qHUml5I6q9D3MA8LM9H5H0TdYzmEFOq4qhmOpEt7YZIygTAk=
X-Gm-Gg: ASbGncsiWphqI+66Bv0Mi5GJoapKPR6ljgCeka6Yi1X2FiWTrxNHrTETLhVPbMQBa+H
	whOmkNm9CgrJ6y6Lz2Wesrz6q7x661+OZGD4+31IYEihj8Es3oQj7c+dQjkW/XEItvcZgr58lud
	4TCAteqye15237QsV8fCTUjZF7lINTbQ5+gzPs/52hDmkucmU+FCzWBht9TaoQ+Tly6WzxeSEpK
	qLIw8X/GlhCpM93GGDDd4dPSTK3TslaMDqEm+Y7ZzSdaJ//yW0v6F/IjYLyobKZOxGnPBaZ5vZJ
	g4N8mdujOL+gNfVjC+xWHBEl5qsxNoBDwlaUwU4MfDIlpEUYA/PZuTPqTw2GZcX+VN9gICkU7E3
	XGGD/L/PkQAQnQB4+vhFp8lWovKO9r5WcAmc0oZZZmqOX9SDHxv+ahIyYIvgk+krPFfMcoiKvg3
	3f6mdV5iSvR7+5LBXx2kk=
X-Google-Smtp-Source: AGHT+IH2WHVFwA78UMJtgEIT3W0hF7oDSenZgK9PqDDhWa2l7fUr6FMBMW4Hhj3UAdOKbbG/n2COrg==
X-Received: by 2002:a17:902:cf0e:b0:295:96bc:868c with SMTP id d9443c01a7336-29df546f962mr89029595ad.5.1765249786761;
        Mon, 08 Dec 2025 19:09:46 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29e4f15accfsm40755175ad.35.2025.12.08.19.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 19:09:46 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Kory Maincent <kory.maincent@bootlin.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Lee Jones
 <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Enable 1GHz OPP am335x-bonegreen-eco
In-Reply-To: <20251127144138.400d1dcd@kmaincent-XPS-13-7390>
References: <20251112-fix_tps65219-v4-0-696a0f55d5d8@bootlin.com>
 <20251127144138.400d1dcd@kmaincent-XPS-13-7390>
Date: Mon, 08 Dec 2025 19:09:45 -0800
Message-ID: <7hsedk73ly.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kory Maincent <kory.maincent@bootlin.com> writes:

> On Wed, 12 Nov 2025 16:14:19 +0100
> "Kory Maincent (TI.com)" <kory.maincent@bootlin.com> wrote:
>
>> The vdd_mpu regulator maximum voltage was previously limited to 1.2985V,
>> which prevented the CPU from reaching the 1GHz operating point. This
>> limitation was put in place because voltage changes were not working
>> correctly, causing the board to stall when attempting higher frequencies.
>> Increase the maximum voltage to 1.3515V to allow the full 1GHz OPP to be
>> used.
>> 
>> Add a TPS65219 PMIC driver fixes that properly implement the LOCK register
>> handling, to make voltage transitions work reliably.
>
> Hello,
>
> What is the status on this series?
> Is there anything that could prevent it from being merged?

Nothing technical.  I'll start queuing things up after the merge window
closes and -rc1 (or maybe -rc2) is out.

Kevin

