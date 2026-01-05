Return-Path: <linux-omap+bounces-5335-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57922CF57F0
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 21:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBDBB3112D13
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 20:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04C0346E72;
	Mon,  5 Jan 2026 20:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iUOu0Ut2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B903C33859E
	for <linux-omap@vger.kernel.org>; Mon,  5 Jan 2026 20:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767644165; cv=none; b=u9D9cmY2UNihN4QyztEqNtqdiz5Nz2Qkc7Fj58yfhduC6fUIDCAEqzkoeEnTYcpRDORYs3Nd1u6Ov8ATJau63zLzzKSRPcnUrbIFfAXz4qvO7nXvxzsqnWi4zgGb9hZw8UdKNJ/wC3fx0NQI2E514gmn1HFX+M/kp1oiuG4LGuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767644165; c=relaxed/simple;
	bh=BAeVXoly+T03UaRlLJhybnCxSqNJu/SzPzB7ml7C5LU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DrTraxEcWcx1fRjLLnHasjc0RjIkNGde71G9npZqir0er7CaZeBFsTKyQFdkT9FAcKT2TI6HdmKq+wTFmPciALNgp/XGJ8Db1o9nJd11us9nzNV5H4SAoZuvpcyBlFgE+Nfm4E5wSS02ByG4sV49Tme5nCTsWXBOhZcd/1AuqsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iUOu0Ut2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a09757004cso3381375ad.3
        for <linux-omap@vger.kernel.org>; Mon, 05 Jan 2026 12:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767644163; x=1768248963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ifa3FgzMJhdcyEQYjXisaWYQtz/jhQwaq5a5wqcFCs=;
        b=iUOu0Ut25bj2eDK7g+QQSjJ169kZc8+kXryglbicLzRGm+1LQ9kJ83Cx0zUS3rgzZY
         O5GF+VgB5LXr7COi5b0cVhb3mw9WKht2xLoVvzIGTrUSE0hQFufMhd/HgNtqsdkx+YdA
         v1c7GPGKeODf+6U3A3ty794aOVnTySqTQFDva5ZJaDx1fiVE5MlvwPhoD6p0VhXp9ZCc
         iB9+yAQTcLOfFo7thoXn8WQyAHUY8hsjCaWPdXF7/+XzBfIfzPYxkMe15kWCzcDttiao
         lq3dAgHIvwk8g0EAgfjOXfV4Q5eV5tFzWn5arW3z2AD6XyVgRcBNDe7ji/XYPDHjloN+
         4yAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767644163; x=1768248963;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ifa3FgzMJhdcyEQYjXisaWYQtz/jhQwaq5a5wqcFCs=;
        b=ZJmOSDSlrKkzYLa38q/3Ir9BD3aiP8Ps4fqRK+KFiy7R78w42wIRB+9kvycyjTVDOd
         WVCRE4WxqP/A8PHqD+aJEVV+3IHtt4J+70rbj/cN4iLggTHbTN6M3jfEanMSq8VklC1w
         TixbEGRIgStor7xZe/B2OPFw3RG5cCTNNGaMqZg4Kp87ozCkilO1gOcVMHR/YJe3NIcw
         BFia/xf7DstunmtjRfTAWMjzteWtfVbg43rz41YPrhLgO5GfCAEMVgFQ/kW0trMQvxJX
         Wux8Wxz3laT2Sm+UKWlbwO/+dhKfJCaPcayMnfsXt1heIKnwdNwYlnKTXUt5WYtN4n1e
         kiQA==
X-Forwarded-Encrypted: i=1; AJvYcCUjwQGeQSgv/PyEpTUX5chFg0DEaI6nc3WtTpvDF/zjPgU5RXJbsnG2I+qkFGWEoTgEwueGCrljKhc7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1WZRwmsbd6yoP1TzHuvzm9u+QjqUnneTHqFM1j2ptz1eORlwz
	HosMgBlRP1P0eugCAUEPEKzEFSQkIII0DCahO0dAY4vIZ/N4QsB2YEwdSOyrT2KhOos=
X-Gm-Gg: AY/fxX73MS0ulU6j5SYnh8zupZGZJ/ZVjU8+yokZw+oQ3jf4rs8vNwg7Li27R2Og1Go
	pIdAZWRXhyfvP/JUFrD5jWqvlMIkAJJbXd7wW1jUO4ChBZd0zuPn9KZZWkr8paIfC3NT3A752l6
	wcs0LjUDfHOCu900xDlYzG9SAi5VODSvm7fFjQvSOIao0JRi5/kuurN84PYoDUe6NqpNUWrAPa6
	eUBLWv9hUyCnupfKSV0EtgPeNbE/DtPZCQr6CKe31GecScjBwNo+ORPpXj/HXmmmuBw1u3q8KEK
	PgXhJaWt4wSyh1Wu3fG/uz3CP4oWgKKrO4ZX63Ydp4Q0qKgY+8h8WnjH6Gx46Rk77IcJgQEyH5b
	oidtckKtdg5WCb/SihNTa35ejmGDFcOUBAgCmoRzfMOUagZmjNnhr3r63jE/Cjmfbx6CtU8Cfe9
	GUbtrJZfuw
X-Google-Smtp-Source: AGHT+IHdmIrEr4BVbZEQPNX3+GmY+SREBGPwkRDFt+Xql+oRg3wNX3X+Ikd9nNU24yxL3SJbGllaWw==
X-Received: by 2002:a17:903:32c7:b0:2a0:b4f6:5595 with SMTP id d9443c01a7336-2a3e2df0741mr6144155ad.50.1767644162704;
        Mon, 05 Jan 2026 12:16:02 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2b3asm873055ad.88.2026.01.05.12.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 12:16:02 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-arm-kernel@lists.infradead.org, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, patches@armlinux.org.uk, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>
In-Reply-To: <20251230055230.3212260-1-rdunlap@infradead.org>
References: <20251230055230.3212260-1-rdunlap@infradead.org>
Subject: Re: [PATCH] ARM: omap1: drop unused Kconfig symbol
Message-Id: <176764416184.2561401.16752078199800151881.b4-ty@baylibre.com>
Date: Mon, 05 Jan 2026 12:16:01 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3


On Mon, 29 Dec 2025 21:52:30 -0800, Randy Dunlap wrote:
> "select ARCH_HAS_HOLES_MEMORYMODEL" was mistakenly merged here
> due to a botched rebase (says Arnd [1]).
> 
> Drop that line since that symbol is not used anywhere else in the
> kernel source tree.
> 
> [1] https://lore.kernel.org/all/5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com/
> 
> [...]

Applied, thanks!

[1/1] ARM: omap1: drop unused Kconfig symbol
      commit: dc717e24deb4e626f4ad4896dd722815ef32311a

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


