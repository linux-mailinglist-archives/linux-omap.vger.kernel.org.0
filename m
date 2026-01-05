Return-Path: <linux-omap+bounces-5334-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A7DCF57ED
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 21:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E28031055D3
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 20:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4977C340DAB;
	Mon,  5 Jan 2026 20:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bmraLrRD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B24322B89
	for <linux-omap@vger.kernel.org>; Mon,  5 Jan 2026 20:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767644164; cv=none; b=N83rVHdVHj4h80U+x47eX89QJGiDqnzhbyEjngCWqStcDYqfPOfhq6P56FeyeFAmXCKLQNfCZWg13CGvV9/oMbGuH9e6p73SuObmfkyeQ+pz6QRP3IdMwDNQ9eZOGu4HycD6RwrjsLyHFCRNTIW/35Dyer4Cu0Gu1qQ5diVjnZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767644164; c=relaxed/simple;
	bh=fN/38i/U7MKvA4ILg1H1EEmSKEqmODO+AsGvaeJi97k=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DOLKitGPo+dDZgYGehl00ZsoyKKQFJTZoVnVSjbv8YBHBsH4R053UliM37EUTDar0/IXYHfS9MCy3qsjk+Mx1yz4zRg2OcdCGCEHbys+A70zmxn5+SWDDyrXmA1n3UYY/zbO30L/gYLqcn6Q0/zbxHEuo/0WEHqNl79IA9k7SOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bmraLrRD; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b80fed1505so352569b3a.3
        for <linux-omap@vger.kernel.org>; Mon, 05 Jan 2026 12:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767644162; x=1768248962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGWq0akpgTwkZdpylOTuuB9EQyJHEcdS3TvPje0PkwE=;
        b=bmraLrRDGpKVGNzL4NjnqL3kYupPKpYrMNfQdaZ6qGlqyhQ7cJS2R0xlNckzv2PLYt
         EJGu08sr9gQ794dQEMkoDF9AglyYNPSblmjvizg5nihEXzBnaxxgWnpHzSboFShR3kyU
         n+fGC8Fn4GzC56CHWJBlJ/9QBYnEwMOQMDpVqYe3ukzfM0bZ5HHe1MTvTm095xZDybuy
         PhyypNe35mOLTrjWdsf+lxhMUA5rsKQOrSiQGo0OCXVb3hOgjPjtQeqGaKYUUJtNqQmv
         PNAgkMuUm6Vm7fhdh1MX/i1rX9S55RDBiUg88imh77PBUgPKmNdk3UswbTf1DODqz4kF
         IQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767644162; x=1768248962;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NGWq0akpgTwkZdpylOTuuB9EQyJHEcdS3TvPje0PkwE=;
        b=IfWNSITOvawRGEgk23UWAbQgGHeRMEM4lvcHr00Tux/yNCK6nRfiNpKnaMvp8PGjZd
         FGDkOL+clzhKwpDrmYmuZMh4Ll/vqDfN6ly6I1cWWl4tOM2yqWxpbrEZCpyrVywil2wW
         sADYyrzwCuQVqLIfMVx047nRh9igJPzGxfdXIOU5tzwsajApxnVGgH5iCEDgxHGecxec
         9CwSDk/kkXG+UfB/zdZjaxBwsIABmnk5Wtnj/aFsym4V9fgYE42AImR8exVJvdtkxRIr
         BVko5zhu0bb2b9Lu2MLNBlXixBwWME0o5NW2a5YyenEbK+MacdLnJsFrddzGCISsWCZn
         sAVA==
X-Forwarded-Encrypted: i=1; AJvYcCWIRFFfKorqaBkIjdH4vddSH1s39L3tTq0UK7U9/1158nLfyt1M0qsTViOyFkdlN0m+XIW9bTPzSKSW@vger.kernel.org
X-Gm-Message-State: AOJu0YxVeZmgVjVZR7CEovvHL6nl70LxUn49GEIz4lvBvls/xa5ICf85
	JE9Dnf4Aur9pV3Y8PJcC6mUdULQGdOoY5mqXF9Eo8FCNgXdljSGeA8MHJZZpL7Q/yMs=
X-Gm-Gg: AY/fxX6p/vm7bG3k/TAnPDnZYmF78HSRVY7ExgkUrnw4ytFei5SNgPZ79AWLYKJ5Naf
	GB6YRCDyIAg0dY/aiEB0hGV5bbdge6ldICz/V9Z8p9lY9zluj2r7TJyU/os1ReBAODtLK0yT8gn
	GujaddwvIQbi0bl1Br25S+ujEhwXnxCm4R6Y0gGOQQOueF+VAbu73h1dmAN/ELgP7oJ8t2xyt8J
	vivMrVDMmDo0OlcFuE01jQjHIke7/oXsrsFBXRMxOJ3poEqo1d40R5HP98xnrWPTRyN47fJ80hj
	cozc3JIgYfEpTBLauotJsfuJ7CidO8j6ckwtK9ku55DlTqIvIoPOMYEN1OvSXpa8vUbxzjgiYmR
	Nas3e+a4gRw9hUqbqZI9jXI/TwSw32PFMnm8mm5KcnH3JNSzhg/QiTWvFc/NQZKtAuJw/dkO7I7
	PW1EHpDUOM
X-Google-Smtp-Source: AGHT+IHwY+GgjzEgS9tRrEOUQ0srOCi5ICQk1EGLYdjErJaRyO2Qcp6qMaW9MbzYyeAc2JGv30HnkA==
X-Received: by 2002:a05:6a00:4103:b0:7e8:4398:b34f with SMTP id d2e1a72fcca58-8187f4a1ae9mr782034b3a.34.1767644161686;
        Mon, 05 Jan 2026 12:16:01 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa19236sm33671b3a.2.2026.01.05.12.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:16:01 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: aaro.koskinen@iki.fi, rogerq@kernel.org, tony@atomide.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20251224093457.558477-1-andreas@kemnade.info>
References: <20251224093457.558477-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: dts: ti/omap: omap*: fix watchdog node names
Message-Id: <176764416076.2561401.17223781363486710439.b4-ty@baylibre.com>
Date: Mon, 05 Jan 2026 12:16:00 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3


On Wed, 24 Dec 2025 10:34:57 +0100, Andreas Kemnade wrote:
> Watchdog nodes should be named watchdog@ and not wdg@. Fix that.
> 
> 

Applied, thanks!

[1/1] ARM: dts: ti/omap: omap*: fix watchdog node names
      commit: 1e79c330713efba3f4200c80e4aa68d7393edfac

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


