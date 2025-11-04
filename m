Return-Path: <linux-omap+bounces-4838-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F414C33538
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 00:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 659E74EC83E
	for <lists+linux-omap@lfdr.de>; Tue,  4 Nov 2025 23:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7A02D878D;
	Tue,  4 Nov 2025 23:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZrTTXPbJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000B62609DC
	for <linux-omap@vger.kernel.org>; Tue,  4 Nov 2025 23:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762297615; cv=none; b=osNOrxy3iGWQpsnzExY029PXpjhdZEiaMZhw3XGXjJ0+UOWlIpjKYjS+MphDQ/4wmj5YPNcGPG9rMGeYHPRk/5XTuE6njbMPkwbsSnGOYNeu2ew68f4Bb1RozflY2ZLL3LGlnFKmiQYajSIej8bMP70CVvSCD9lB0oCb9VtgUTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762297615; c=relaxed/simple;
	bh=12vGFUcZemOMh5QBaAJfQHOdmFM8hY1UyGUKJ7JDXKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J2twhDkfz4mFN+kB6TvwsEksvitLpNJSFqLhquipxg222zxagTIUw4UH9W5FYcuiXkvDsadAP6KWOLZehlXPHUf1Gc4XxxEG201kSFYKw9W/2Sh6AnP1vNHqtUsuWAEBXKuiLOtDg1xtq0fhD0NCa8lWvIlTMho4bUfVJRNOikg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZrTTXPbJ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2953b321f99so44130425ad.1
        for <linux-omap@vger.kernel.org>; Tue, 04 Nov 2025 15:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297612; x=1762902412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rLeRaREaYFNIk98QRUcTfCmsFgqK+8yNycFcHOEqW8=;
        b=ZrTTXPbJ/uPRGAhHaD/bwiMG7sKuU0zhwATXvdgry+h6V0uJI75VDJbxn8St53ZfKi
         0nc2tSoHLXSV6Nffd7l+gMCEmtbgKrDml9aQJZZ/1tVaK7qrQOOTmAvEFqkWpwrHcSZF
         Ooso+7fwEkvyw60Icat7XGXDmhhJL9a1MhMG2Gcc0ATJw4Qfj5hW7tCxCv6vEP1/JjbU
         Szr23QIHqkVTDig+DAAIsEgoJMG3xRECwIUkqj/XgKmMrLmdI0sOTm7Pl7jNxGfmNa0X
         kA5wK1VgilHTgms6Pi+V++YKUEk5QIs4u9cFH11EGp9zAg6CDHhAzyibYA0HjVETQeIL
         17PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297612; x=1762902412;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rLeRaREaYFNIk98QRUcTfCmsFgqK+8yNycFcHOEqW8=;
        b=Sq/gnsaVJnNQu4XQ3bSQPyTY+i0Q69Pkl9UTAaUDoz3FYYshvYGNHqifSFYDgBZlMw
         2YxRq5m+H4E5EH8Pb/7ZC3qTUyp/RcfqTuISpTizxmJ7omXsreUeLJS444rcdeTnHAsm
         JAuOYJXwHsuGU9px+DmLGnE7VZO/+hAwL7SzFDu/GEr0BRP4ePZXNvz6lP//9J8aCdBX
         9p7nRVJN6iY6ZUqEBB3NRQXF/qkgI7YrN28blMxhfQG/3sCduh8YOC7ZF1TVok4pqTlE
         Wwb3Dv+p7TAtTSCaRj5HnKHLxx72KWrJfqYh6NLa90EorJs2rYKlKJJ7N2z80Ox9/AAC
         OG0w==
X-Gm-Message-State: AOJu0YzZbNhaNcKq9GzFMwmEO36A/jP7uNto1P9KURwL0YdS9xJRR7QP
	0C1/3ygzn5NxGWYK+RXKVNeUwhq7BRyYdAPgEuBRav70ytfjQ68P7Oy0vmQ4kJ3WTHc=
X-Gm-Gg: ASbGncuyVP8auC0bpZP3672LZHJWwlh3BMm0ugfWrMtKLgg/d2pGL0nrCEAT/o/3jD2
	lrYdtRScolQw+iocqVY/lhmjGlqiZ7Rw1694f2zzXuvphHDconhE9QIF4Xsg2x6yF8auftCOmel
	vXrHhKwkQC/L7/IyjVl54avmxpzxK5tItQbJTIjzbqNe/GYa9muwr2FIcsQbs0/KXLBvy8JKGNT
	PIh9AM6mhuobJOC/457p9TKKp/i81e3KkSeqjaoi0DHiabB1dAK1oFN9YaAAJnZsW/QrWZcrzqr
	/CeWK0O1+CO8TW9igaSg210VOhvhJsSK6+02O4xYpYFWckux3GGQ3uIB8x/Q7cuikwEL4N4TyFl
	fWJsg4LRmKGOGqvTVmrSNmesb0a989bX3GgB9Fu27aEL4Ylq78iRqkd8BrFTY+psYS4gBt4V5+f
	H0b4nqNSia
X-Google-Smtp-Source: AGHT+IEqAInSq7/OcKAz3KBjMGwdkltgrZQ5n2MVBtC0iSVzd8WVSTSxnKY4wAu8Z/1kBaGkPjKa7w==
X-Received: by 2002:a17:902:d2cf:b0:295:c2e8:dabd with SMTP id d9443c01a7336-2962ad3c9femr17882525ad.26.1762297612348;
        Tue, 04 Nov 2025 15:06:52 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a50e8fsm39573235ad.79.2025.11.04.15.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:06:51 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, 
 Bruno Thomsen <bruno.thomsen@gmail.com>, Judith Mendez <jm@ti.com>, 
 Arnd Bergmann <arnd@arndb.de>, Matti Vaittinen <mazziesaccount@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <63cef5c3643d359e8ec13366ca79377f12dd73b1.1759398641.git.geert+renesas@glider.be>
References: <63cef5c3643d359e8ec13366ca79377f12dd73b1.1759398641.git.geert+renesas@glider.be>
Subject: Re: [PATCH] ARM: dts: am33xx: Add missing serial console speed
Message-Id: <176229761135.2840692.14067519312360759831.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:06:51 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183


On Thu, 02 Oct 2025 11:53:05 +0200, Geert Uytterhoeven wrote:
> Without a serial console speed specified in chosen/stdout-path in the
> DTB, the serial console uses the default speed of the serial driver,
> unless explicitly overridden in a legacy console= kernel command-line
> parameter.
> 
> After dropping "ti,omap3-uart" from the list of compatible values in DT,
> AM33xx serial ports can no longer be used with the legacy OMAP serial
> driver, but only with the OMAP-flavored 8250 serial driver (which is
> mutually-exclusive with the former).  However, replacing
> CONFIG_SERIAL_OMAP=y by CONFIG_SERIAL_8250_OMAP=y (with/without enabling
> CONFIG_SERIAL_8250_OMAP_TTYO_FIXUP) may not be sufficient to restore
> serial console functionality: the legacy OMAP serial driver defaults to
> 115200 bps, while the 8250 serial driver defaults to 9600 bps, causing
> no visible output on the serial console when no appropriate console=
> kernel command-line parameter is specified.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: am33xx: Add missing serial console speed
      commit: 9c95fc710b0d05f797db9e26d56524efa74f8978

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


